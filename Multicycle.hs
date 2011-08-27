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
import Text.Regex

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

getPorts allPorts = [x| x <- allPorts, x /= "CLK" && x /= "RST_N"]
getInputs stmts = [x| Input _ x <- stmts, x /= "CLK" && x /= "RST_N"]
getOutputs stmts = [x| Output _ x <- stmts]
dup x = (x, x)

fifoOuterNotExposed _ mod@(Module name allPorts stmts) = Module (name ++ "_FIFO_OUTER_NOT_EXPOSED") newPorts
                                                                (newInputs ++ newOutputs ++ newEnqs ++ newNotFulls ++ newConsumedBefores ++ newConsumeds ++ newNotEmptys ++
                                                                assignEnqs ++ assignDone ++ newInst)
 where
  ports = getPorts allPorts
  inputs = getInputs stmts
  outputs = getOutputs stmts
  newPorts = allPorts ++ [x ++ "_VALID"| x <- ports] ++ ["DONE", "RESET"]
  newInputs = [x| x@Input{} <- stmts] ++ [Input "" (x ++ "_VALID")| x <- inputs] ++ [Input "" "RESET"]
  newOutputs = [x| x@Output{} <- stmts] ++ [Output "" (x ++ "_VALID")| x <- outputs] ++ [Output "" "DONE"]
  newEnqs = [Wires "" [x ++ "_ENQ"]| x <- inputs]
  newNotFulls = [Wires "" [x ++ "_NOT_FULL"]| x <- inputs]
  newConsumedBefores = [Wires "" [x ++ "_CONSUMED_BEFORE"]| x <- inputs]
  newConsumeds = [Wires "" [x ++ "_CONSUMED"]| x <- inputs]
  newNotEmptys = [Wires "" [x ++ "_NOT_EMPTY"]| x <- outputs]
  assignEnqs = [Assign $ x ++ "_ENQ = !" ++ x ++ "_CONSUMED_BEFORE && !" ++ x ++ "_NOT_FULL && " ++ x ++ "_VALID"| x <- inputs]
  assignDone = [Assign $ "DONE = 1'b1" ++ concatMap (\x -> " && " ++ x ++ "_CONSUMED") inputs ++ concatMap (\x -> " && " ++ x ++ "_NOT_EMPTY") outputs]
  newInst = [Instance name "" "INST"
                      ([dup x| x <- allPorts] ++
                       [dup $ x ++ "_ENQ"| x <- inputs] ++
                       [dup $ x ++ "_NOT_FULL"| x <- inputs] ++
                       [dup $ x ++ "_CONSUMED_BEFORE"| x <- inputs] ++
                       [dup $ x ++ "_CONSUMED"| x <- inputs] ++
                       [(x ++ "_RESET", "RESET")| x <- inputs] ++
                       [dup $ x ++ "_NOT_EMPTY"| x <- outputs] ++
                       [(x ++ "_DEQ", "RESET")| x <- outputs])]

fifoAllExposed _ (Module name allPorts stmts) = Module name newPorts (newInputs ++ newOutputs ++ newInputFifoWires ++ newOutputFifoWires ++ newInputFifos ++ newOutputFifos ++ newInst)
 where
  ports = getPorts allPorts
  inputs = getInputs stmts
  outputs = getOutputs stmts
  newPorts = allPorts ++
             [x ++ "_ENQ"| x <- inputs] ++ [x ++ "_NOT_FULL"| x <- inputs] ++ [x ++ "_CONSUMED_BEFORE"| x <- inputs] ++ [x ++ "_RESET"| x <- inputs] ++ [x ++ "_CONSUMED"| x <- inputs] ++
             [x ++ "_NOT_EMPTY"| x <- outputs] ++ [x ++ "_DEQ"| x <- outputs]
  newInputs = [x| x@Input{} <- stmts] ++ [Input "" (x ++ "_ENQ")| x <- inputs] ++ [Input "" (x ++ "_RESET")| x <- inputs] ++ [Input "" (x ++ "_DEQ")| x <- outputs]
  newOutputs = [x| x@Output{} <- stmts] ++ [Output "" (x ++ "_NOT_FULL")| x <- inputs] ++ [Output "" (x ++ "_CONSUMED_BEFORE")| x <- inputs] ++ [Output "" (x ++ "_CONSUMED")| x <- inputs] ++
               [Output "" (x ++ "_NOT_EMPTY")| x <- outputs]
  newInputFifoBoolWires = [Wires "" [x ++ "_NOT_EMPTY", x ++ "_DEQ"]| x <- inputs]
  newInputFifoValWires = [Wires width [x ++ "_VALUE"]| Input width x <- stmts, x /= "CLK", x /= "RST_N"]
  newInputFifoWires = newInputFifoBoolWires ++ newInputFifoValWires;
  newOutputFifoBoolWires = [Wires "" [x ++ "_ENQ", x ++ "_NOT_FULL", x ++ "_CONSUMED_BEFORE", x ++ "_RESET", x ++ "_CONSUMED"]| x <- outputs]
  newOutputFifoValWires = [Wires width [x ++ "_VALUE"]| Output width x <- stmts]
  newOutputFifoWires = newOutputFifoBoolWires ++ newOutputFifoValWires
  newInputFifos = [Instance "BYPASS_FIFO" ("#(" ++ getWidth width ++ ")") (x ++ "_FIFO")
                            [dup "CLK", dup "RST_N",
                             ("ENQ", x ++ "_ENQ"), ("ENQ_VALUE", x), ("NOT_FULL", x ++ "_NOT_FULL"), ("CONSUMED_BEFORE", x ++ "_CONSUMED_BEFORE"),
                             ("RESET", x ++ "_RESET"), ("CONSUMED", x ++ "_CONSUMED"),
                             ("NOT_EMPTY", x ++ "_NOT_EMPTY"), ("DEQ_VALUE", x ++ "_VALUE"), ("DEQ", x ++ "_DEQ")]| Input width x <- stmts, x /= "CLK", x /= "RST_N"]
  newOutputFifos = [Instance "BYPASS_FIFO" ("#(" ++ getWidth width ++ ")") (x ++ "_FIFO")
                             [dup "CLK", dup "RST_N",
                              ("ENQ", x ++ "_ENQ"), ("ENQ_VALUE", x ++ "_VALUE"), ("NOT_FULL", x ++ "_NOT_FULL"), ("CONSUMED_BEFORE", x ++ "_CONSUMED_BEFORE"),
                              ("RESET", x ++ "_RESET"), ("CONSUMED", x ++ "_CONSUMED"),
                              ("NOT_EMPTY", x ++ "_NOT_EMPTY"), ("DEQ_VALUE", x), ("DEQ", x ++ "_DEQ")]| Output width x <- stmts]
  newInst = [Instance (name ++ "_FIFO_INNER_NOT_EXPOSED") "" "INST"
                      ([dup "CLK", dup "RST_N"] ++
                       [dup $ x ++ "_ENQ"| x <- outputs] ++
                       [(x, x ++ "_VALUE")| x <- outputs] ++
                       [dup $ x ++ "_NOT_FULL"| x <- outputs] ++
                       [dup $ x ++ "_CONSUMED_BEFORE"| x <- outputs] ++
                       [dup $ x ++ "_RESET"| x <- outputs] ++
                       [dup $ x ++ "_CONSUMED"| x <- outputs] ++
                       [dup $ x ++ "_NOT_EMPTY"| x <- inputs] ++
                       [(x, x ++ "_VALUE")| x <- inputs] ++
                       [dup $ x ++ "_DEQ"| x <- inputs])]
  getWidth width = if width == "" then "0" else (tail . head) $ splitRegex (mkRegex ":") width

fifoInnerNotExposed _ (Module name allPorts stmts) = Module (name ++ "_FIFO_INNER_NOT_EXPOSED") newPorts
                                                            (newInputs ++ newOutputs ++ newValids ++ newWires ++ newEnqs ++ assignEnqs ++
                                                             assignReset ++ assignOutputResets ++ assignInputDeqs ++ newInst)
 where
  ports = getPorts allPorts
  inputs = getInputs stmts
  outputs = getOutputs stmts
  newPorts = allPorts ++
             [x ++ "_NOT_EMPTY"| x <- inputs] ++ [x ++ "_DEQ"| x <- inputs] ++
             [x ++ "_ENQ"| x <- outputs] ++ [x ++ "_NOT_FULL"| x <- outputs] ++ [x ++ "_CONSUMED_BEFORE"| x <- outputs] ++ [x ++ "_RESET"| x <- outputs] ++ [x ++ "_CONSUMED"| x <- outputs]
  newInputs = [x| x@Input{} <- stmts] ++ [Input "" (x ++ "_NOT_EMPTY")| x <- inputs] ++
              [Input "" (x ++ "_NOT_FULL")| x <- outputs] ++ [Input "" (x ++ "_CONSUMED_BEFORE")| x <- outputs] ++ [Input "" (x ++ "_CONSUMED")| x <- outputs]
  newOutputs = [x| x@Output{} <- stmts] ++ [Output "" (x ++ "_DEQ")| x <- inputs] ++
               [Output "" (x ++ "_ENQ")| x <- outputs] ++ [Output "" (x ++ "_RESET")| x <- outputs]
  newValids = [Wires "" [x ++ "_VALID"]| x <- ports]
  newWires = [Wires "" ["DONE", "RESET"]]
  newEnqs = [Wires "" [x ++ "_ENQ"]| x <- outputs]
  assignEnqs = [Assign $ x ++ "_ENQ = !" ++ x ++ "_NOT_FULL && !" ++ x ++ "_CONSUMED_BEFORE && " ++ x ++ "_VALID"| x <- outputs]
  assignReset = [Assign $ "RESET = DONE" ++ concatMap (\x -> " && " ++ x ++ "_CONSUMED") outputs ++ concatMap (\x -> " && " ++ x ++ "_NOT_EMPTY") inputs]
  assignOutputResets = [Assign $ x ++ "_RESET = RESET"| x <- outputs]
  assignInputDeqs = [Assign $ x ++ "_DEQ = RESET"| x <- inputs]
  newInst = [Instance (name ++ "_NO_FIFO") "" "INST"
                      ([dup x| x <- allPorts] ++
                       [(x ++ "_VALID", x ++ "_NOT_EMPTY")| x <- inputs] ++
                       [(x ++ "_VALID", x ++ "_VALID")| x <- outputs] ++
                       [dup "DONE", dup "RESET"])]

noFifoStmts refineds inst@(Instance t _ name ports) = inst { instanceType  = t ++ if elem t refineds then "_FIFO_OUTER_NOT_EXPOSED" else "_NO_FIFO"
                                                           , instancePorts = ports ++
                                                                             map printPort nonClkRstPorts ++
                                                                             [("DONE", name ++ "_DONE"), ("RESET", "RESET")]}
 where
  printPort (f, r) = (f ++ "_VALID", if r == "" then "" else r ++ "_VALID")
  nonClkRstPorts = delete ("CLK", "CLK") $ delete ("RST_N", "RST_N") ports

noFifoStmts _ (TaskStmt xs) = TaskStmt $ map (\(Task mayExpr stmt) -> Task (Just $ "RESET && (" ++ fromMaybe "1'b1" mayExpr ++ ")") stmt) xs

noFifoStmts _ x@_ = x

noFifo refineds (Module name allPorts stmts) = Module (name ++ "_NO_FIFO") newPorts (map (noFifoStmts refineds) stmts ++ newInputs ++ newOutputs ++ newValids ++ newDones ++ assignValids ++ assignDone)
 where
  ports = getPorts allPorts
  inputs = getInputs stmts
  outputs = getOutputs stmts
  terminalSet = foldl addTerminal Set.empty stmts
  dependsMap = foldl addDepends Map.empty stmts
  termDeps = terminalDepends terminalSet dependsMap
  newPorts = allPorts ++ [x ++ "_VALID"| x <- ports] ++ ["DONE", "RESET"]
  newInputs = [Input "" (x ++ "_VALID")| x <- inputs] ++ [Input "" "RESET"]
  newOutputs = [Output "" (x ++ "_VALID")| x <- outputs] ++ [Output "" "DONE"]
  newValids = [Wires "" [x ++ "_VALID"]| x <- Set.elems terminalSet]
  newDones = [Wires "" [x ++ "_DONE"] | Instance{instanceName = x} <- stmts]
  assignValids = [Assign $ write ++ "_VALID = 1'b1" ++ concatMap (\x -> " && " ++ x ++ "_VALID") deps| (write, deps) <- Map.toList termDeps]
  assignDone = [Assign $ "DONE = 1'b1" ++ concatMap (\x -> " && " ++ x ++ "_DONE") [x|Instance{instanceName = x} <- stmts]]

main = verilogParser [("_FIFO_OUTER_NOT_EXPOSED.v", fifoOuterNotExposed),
                      ("_FIFO_ALL_EXPOSED.v", fifoAllExposed),
                      ("_FIFO_INNER_NOT_EXPOSED.v", fifoInnerNotExposed),
                      ("_NO_FIFO.v", noFifo)]
