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

getIds = sepEndBy identifier $ manyTill ((char '\''>>anyChar) <|> anyChar) $ lookAhead ((try identifier>>return ()) <|> eof)

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
  | Set.member immDep terminalSet = immDep:(getTerminalDepends terminalSet dependsMap immDeps)
  | otherwise                     = getTerminalDepends terminalSet dependsMap $ nub ((fromMaybe [] $ Map.lookup immDep dependsMap) ++ immDeps)

writeTerminalDepends terminalSet dependsMap (write, immDeps) =
  (write, getTerminalDepends terminalSet dependsMap immDeps)

terminalDepends terminalSet dependsMap = map (writeTerminalDepends terminalSet dependsMap) writeImmDepends
 where
  writeImmDepends = [(write, deps)| (write, deps) <- Map.assocs dependsMap, Set.member write terminalSet]

terminalInfluences terminalSet dependsMap termDeps = foldl getInfluences Map.empty termDeps
 where
  getInfluences influencesMap (write, deps) = foldl (\infMap dep -> Map.insertWith (++) dep [write] infMap) influencesMap deps

mapInstances inst@Instance{instancePorts = ports} = inst {instancePorts = ports ++
                                                                          (map (printPort "_VALID" "")  nonClkRstPorts) ++
                                                                          (map (printPort "_CONSUMED" "1") nonClkRstPorts)}
 where
  printPort suffix dflt (r, f) = (r ++ suffix, if f == "" then "" else f ++ suffix)
  nonClkRstPorts = delete ("CLK", "CLK") $ delete ("RST_N", "RST_N") ports
mapInstances x@_ = x

parseTaskStmtDepends = do
  lexeme $ char '$'
  identifier
  lexeme $ char '('
  optional $ lexeme (do{char '\"'; manyTill anyChar (char '\"')})
  option "" $ do{comma; many anyChar}

getTaskDepends terminalSet dependsMap (Task mayExpr stmt) = getTerminalDepends terminalSet dependsMap deps
 where
  ifExpr = fromMaybe "" mayExpr
  Right stmtDeps = runParser parseTaskStmtDepends () "" stmt
  Right deps = runParser getIds () "" $ stmtDeps ++ " " ++ ifExpr

mapTaskStmt terminalSet dependsMap x@(Task mayExpr stmt) = Task (Just (fromMaybe "1" mayExpr ++ concatMap (\x -> " && " ++ x ++ "_CONSUMED") (getTaskDepends terminalSet dependsMap x))) stmt

mapTasks terminalSet dependsMap (TaskStmt xs) = TaskStmt $ map (mapTaskStmt terminalSet dependsMap) xs
mapTasks _           _          x@_           = x

addTaskDependsInfs terminalSet dependsMap infMap tasks = foldl (\newMap d -> Map.insertWith (++) d [] newMap) infMap $ concatMap (getTaskDepends terminalSet dependsMap) tasks

addControl (Module name allPorts stmts) = Module name newPorts (newInputs ++ newOutputs ++ map (mapInstances . mapTasks terminalSet dependsMap) stmts ++ newValids ++ newConsumeds ++ validAssigns ++ consumedAssigns)
 where
   terminalSet = foldl addTerminal Set.empty stmts
   dependsMap = foldl addDepends Map.empty stmts
   termDepsPartial = terminalDepends terminalSet dependsMap
   termDeps = termDepsPartial ++ [(write, [])| Output _ write <- stmts, Map.notMember write dependsMap]
   termInfsPartialMap1 = terminalInfluences terminalSet dependsMap termDepsPartial
   termInfsPartialMap2 = foldl (addTaskDependsInfs terminalSet dependsMap) termInfsPartialMap1 [tasks| TaskStmt tasks <- stmts]
   termInfs = (Map.assocs termInfsPartialMap2) ++ [(read, [])| Input _ read <- stmts, Map.notMember read termInfsPartialMap2, read /= "CLK" && read /= "RST_N"]
   ports = delete "CLK" $ delete "RST_N" allPorts
   newPorts = allPorts ++ [x ++ "_VALID"| x <- ports] ++ [x ++ "_CONSUMED" | x <- ports]
   newInputs = [Input "" (x ++ "_VALID")| Input _ x <- stmts, x /= "CLK" && x /= "RST_N"] ++ [Output "" (x ++ "_CONSUMED")| Input _ x <- stmts, x /= "CLK" && x /= "RST_N"]
   newOutputs = [Output "" (x ++ "_VALID")| (Output _ x) <- stmts] ++ [Input "" (x ++ "_CONSUMED")| (Output _ x) <- stmts]
   mapControl ctrl list = map (\(ctrlHead, ctrlTail) -> Assign (ctrlHead ++ ctrl ++ " = 1" ++ (concatMap (\x -> " && " ++ x ++ ctrl) ctrlTail))) list
   newValids = map (\x -> Wires "" [x ++ "_VALID"]) (Set.elems terminalSet)
   newConsumeds = map (\x -> Wires "" [x ++ "_CONSUMED"]) (Set.elems terminalSet)
   validAssigns = mapControl "_VALID" termDeps
   consumedAssigns = mapControl "_CONSUMED" termInfs

main = verilogParser [("_multi.v", addControl)]
