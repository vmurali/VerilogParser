import VerilogParser
import DataTypes
import Text.Parsec
import qualified Text.ParserCombinators.Parsec.Token as P
import Text.ParserCombinators.Parsec.Language
import Lexer
import Data.List
import Data.Maybe
import qualified Data.Set as Set
import qualified Data.Map as Map

getIds = do{sep; sepEndBy identifier sep}
 where
  sep = manyTill ((char '\''>>anyChar) <|> anyChar) $ lookAhead ((try identifier>>return ()) <|> eof)

addTerminal terminalSet (Input _ name) = if name /= "CLK" && name /= "RST_N" then Set.insert name terminalSet else terminalSet
addTerminal terminalSet (Output _ name) = Set.insert name terminalSet
addTerminal terminalSet (Instance _ _ _ ports) = foldl (\tSet (f, r) -> if r /= "" && r /= "CLK" && r /= "RST_N" then Set.insert r tSet else tSet) terminalSet ports
addTerminal terminalSet _ = terminalSet

parseCaseHeader = do
  depList <- parens $ sepBy identifier (reserved "or")
  reserved "begin"
  reserved "case"
  switch <- parens $ many (noneOf ")")
  label1 <- manyTill anyChar colon
  written <- identifier
  return (written, depList)

addDepends dependsMap (Case str) =
  Map.insert written depList dependsMap
 where
  Right (written, depList) = runParser parseCaseHeader () "" str

addDepends dependsMap (Assign str) =
  Map.insert written depList dependsMap
 where
  Right (written:depList) = runParser getIds () "" str

addDepends dependsMap _ = dependsMap

getTerminalDepends terminalSet dependsMap [] = []
getTerminalDepends terminalSet dependsMap (immDep:immDeps)
  | Set.member immDep terminalSet = nub $ immDep:(getTerminalDepends terminalSet dependsMap immDeps)
  | otherwise                     = getTerminalDepends terminalSet dependsMap $ nub ((fromMaybe [] $ Map.lookup immDep dependsMap) ++ immDeps)

writeTerminalDepends terminalSet dependsMap immDeps =
  getTerminalDepends terminalSet dependsMap immDeps

terminalDepends terminalSet dependsMap = Map.map (writeTerminalDepends terminalSet dependsMap) writeImmDepends
 where
  writeImmDepends = Map.fromList [(write, nub deps)| (write, deps) <- Map.toList dependsMap, Set.member write terminalSet]

terminalInfluences terminalSet dependsMap termDeps = foldl getInfluences Map.empty termDeps
 where
  getInfluences influencesMap (write, deps) = foldl (\infMap dep -> Map.insertWith (++) dep [write] infMap) influencesMap deps

mapInstances inst@Instance{instancePorts = ports} = inst {instancePorts = ports ++
                                                                          (map (printPort "_VALID" "")  nonClkRstPorts) ++
                                                                          (map (printPort "_CONSUMED" "1'b1") nonClkRstPorts)}
 where
  printPort suffix dflt (f, r) = (f ++ suffix, if r == "" then dflt else r ++ suffix)
  nonClkRstPorts = delete ("CLK", "CLK") $ delete ("RST_N", "RST_N") ports
mapInstances x@_ = x

parseTaskStmtDepends = do
  lexeme $ char '$'
  identifier
  lexeme $ char '('
  optional $ lexeme (do{char '\"'; manyTill anyChar (char '\"')})
  option "" $ do{comma; many anyChar}

taskImmDepends (Task mayExpr stmt) = nub deps
 where
  ifExpr = fromMaybe "" mayExpr
  Right stmtDeps = runParser parseTaskStmtDepends () "" stmt
  Right deps = runParser getIds () "" $ stmtDeps ++ "|" ++ ifExpr

addControl (Module name allPorts stmts) = Module name newPorts (map mapInstances stmtsNonTask ++ newInputs ++ newOutputs ++ newValids ++ newConsumeds ++ assignValids ++ assignConsumeds ++ newDoneWrites  ++ newDoneEnWrites ++ newDoneReads ++ newPiConsumeds ++ assignPiConsumeds ++ assignDoneWrites ++ assignDoneEnWrites ++ instDones ++ assignTasks ++ [TaskStmt newTaskStmts])
 where
  terminalSetPartial = foldl addTerminal Set.empty stmts
  dependsMapPartial = foldl addDepends Map.empty stmts
  taskStmts = concat [x| TaskStmt x <- stmts]
  taskNames = ["TASK" ++ show n| n <- [1..(length taskStmts)]]
  terminalSet = foldl (\set t -> Set.insert t set) terminalSetPartial taskNames
  dependsMap = snd $ foldl (\(idx, map) t -> (idx + 1, Map.insert ("TASK" ++ show idx) (taskImmDepends t) map))  (1, dependsMapPartial) taskStmts
  termDepsPartial = terminalDepends terminalSet dependsMap
  termDeps = foldl (\map x -> Map.insertWith (++) x [] map) termDepsPartial [write| Output _ write <- stmts]
  termInfsPartial = terminalInfluences terminalSet dependsMap $ Map.toList termDeps
  termInfs = foldl (\map x -> Map.insertWith (++) x [] map) termInfsPartial [read| Input _ read <- stmts, read /= "CLK" && read /= "RST_N"]
  ports = [x| x <- allPorts, x /= "CLK" && x /= "RST_N"]
  newPorts = allPorts ++ [x ++ "_VALID"| x <- ports] ++ [x ++ "_CONSUMED" | x <- ports]
  newInputs = [Input "" (x ++ "_VALID")| Input _ x <- stmts, x /= "CLK" && x /= "RST_N"] ++ [Output "" (x ++ "_CONSUMED")| Input _ x <- stmts, x /= "CLK" && x /= "RST_N"]
  newOutputs = [Output "" (x ++ "_VALID")| (Output _ x) <- stmts] ++ [Input "" (x ++ "_CONSUMED")| (Output _ x) <- stmts]
  newValids = [Wires "" [x ++ "_VALID"]| x <- Set.elems terminalSet]
  newConsumeds = [Wires "" [x ++ "_CONSUMED"]| x <- Set.elems terminalSet]
  assignValids = [Assign $ write ++ "_VALID = " ++ (if outputDepsHasFanout deps then "!" ++ write ++ "_DONE_READ" else "1'b1") ++ concatMap (\x -> " && " ++ x ++ "_VALID") deps| (write, deps) <- Map.toList termDeps]
  assignConsumeds = [Assign $ input ++ "_CONSUMED = 1'b1" ++ (concatMap (\x -> " && (" ++ (if outputHasFanout x then x ++ "_DONE_READ || " else "") ++ x ++ "_CONSUMED)") infs)| (input, infs) <- Map.toList termInfs]
  terminalOutputFanouts = [x| (x,y) <- Map.toList termDeps, outputDepsHasFanout y]
  inputHasFanout inp = length (Map.findWithDefault [] inp termInfs) > 1
  outputDepsHasFanout outDeps = foldl (\prev inp -> prev == True || inputHasFanout inp) False outDeps
  outputHasFanout out = outputDepsHasFanout $ Map.findWithDefault [] out termDeps
  newDoneWrites = [Wires "" [x ++ "_DONE_WRITE"]| x <- terminalOutputFanouts]
  newDoneEnWrites = [Wires "" [x ++ "_DONE_EN_WRITE"]| x <- terminalOutputFanouts]
  newDoneReads = [Wires "" [x ++ "_DONE_READ"]| x <- terminalOutputFanouts]
  newPiConsumeds = [Wires "" [x ++ "_PI_CONSUMED"]| x <- terminalOutputFanouts]
  assignPiConsumeds = [Assign $ x ++ "_PI_CONSUMED = 1'b1" ++ concatMap (\d -> " && " ++ d ++ "_CONSUMED") y| (x,y) <- Map.toList termDeps, outputDepsHasFanout y]
  assignDoneWrites = [Assign $ x ++ "_DONE_WRITE = !" ++ x ++ "_PI_CONSUMED"| x <- terminalOutputFanouts]
  assignDoneEnWrites = [Assign $ x ++ "_DONE_EN_WRITE = " ++ x ++ "_PI_CONSUMED || " ++ x ++ "_CONSUMED"| x <- terminalOutputFanouts]
  instDones = [Instance "mkRegNormal" "#(1'b1, 1'b0)" (x ++ "_DONE") [("CLK", "CLK"), ("RST_N", "RST_N"), ("IN_WRITE", x ++ "_DONE_WRITE"), ("IN_EN_WRITE", x ++ "_DONE_EN_WRITE"), ("OUT_READ", x ++ "_DONE_READ")]| x <- terminalOutputFanouts]
  isNonTask TaskStmt{} = False
  isNonTask _          = True
  stmtsNonTask = [x| x <- stmts, isNonTask x]
  assignTasks = [Assign $ t ++ "_CONSUMED = " ++ t ++ "_VALID"| t <- taskNames]
  newTaskStmts = zipWith (\(Task mayExpr stmt) tName -> Task (Just $ fromMaybe "1'b1" mayExpr ++ " && " ++ tName ++ "_VALID") stmt) taskStmts taskNames

main = verilogParser [("_multi.v", addControl)]
