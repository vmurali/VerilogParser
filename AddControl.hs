module AddControl(addControl) where

import DataTypes
import Text.Parsec
import Lexer
import Data.List
import Data.Maybe
import qualified Data.Set as Set
import qualified Data.Map as Map

addTerminal terminalSet (Input _ name) = if name /= "CLK" && name /= "RST_N" then Set.insert name terminalSet else terminalSet
addTerminal terminalSet (Output _ name) = Set.insert name terminalSet
addTerminal terminalSet (Instance _ _ _ ports) = foldl (\tSet (f, r) -> if r /= "" && r /= "CLK" && r /= "RST_N" then Set.insert r tSet else tSet) terminalSet ports
addTerminal terminalSet _ = terminalSet

addDepends dependsMap (Case str) =
  Map.insert written depList dependsMap
 where
  Right (written, depList) = runParser parseCaseHeader () "" str
  parseCaseHeader = do
    depList <- sepBy identifier (reserved "or")
    reserved "begin"
    reserved "case"
    switch <- parens $ many (noneOf ")")
    label1 <- manyTill anyChar colon
    written <- identifier
    return (written, depList)

addDepends dependsMap (Assign str) =
  Map.insert written depList dependsMap
 where
  nonId = manyTill ((char '\''>>anyChar) <|> anyChar) $ lookAhead ((try identifier>>return ()) <|> eof)
  Right (written:depList) = runParser (sepEndBy identifier nonId) () "" str
    
addDepends dependsMap _ = dependsMap

writeTerminalDepends terminalSet dependsMap (write, immDeps) =
  (write, getTerminalDepends immDeps)
 where
  getTerminalDepends [] = []
  getTerminalDepends (immDep:immDeps)
    | Set.member immDep terminalSet = immDep:(getTerminalDepends immDeps)
    | otherwise                     = getTerminalDepends $ nub ((fromJust $ Map.lookup immDep dependsMap) ++ immDeps)

terminalDepends terminalSet dependsMap = map (writeTerminalDepends terminalSet dependsMap) writeImmDepends
 where
  writeImmDepends = [(write, deps)| (write, deps) <- Map.assocs dependsMap, Set.member write terminalSet]

terminalInfluences terminalSet dependsMap termDeps = foldl getInfluences Map.empty termDeps
 where
  getInfluences influencesMap (write, deps) = foldl (\infMap dep -> Map.insertWith (++) dep [write] infMap) influencesMap deps

mapInstances inst@Instance{instancePorts = ports} = inst {instancePorts = ports ++
                                                                          (map (\(r, f) -> (r ++ "_VALID", if f == "" then "" else f ++ "_VALID")) ports) ++
                                                                          (map (\(r, f) -> (r ++ "_CONSUMED", if f == "" then "1" else f ++ "_CONSUMED")) ports)}
mapInstances x@_                                  = x

addControl (Module name ports stmts) = Module name newPorts (newInputs ++ newOutputs ++ newValids ++ newConsumeds ++ map mapInstances stmts)
 where
   terminalSet = foldl addTerminal Set.empty stmts
   dependsMap = foldl addDepends Map.empty stmts
   termDepsPartial = terminalDepends terminalSet dependsMap
   termDeps = termDepsPartial ++ [(write, [])| Output _ write <- stmts, Map.notMember write dependsMap]
   termInfsPartialMap = terminalInfluences terminalSet dependsMap termDepsPartial
   termInfs = (Map.assocs termInfsPartialMap) ++ [(read, [])| Input _ read <- stmts, Map.notMember read termInfsPartialMap]
   newPorts = ports ++ [x ++ "_VALID"| x <- ports] ++ [x ++ "_CONSUMED" | x <- ports]
   newInputs = [Input "" (x ++ "_VALID")| (Input _ x) <- stmts, x /= "CLK" && x /= "RST_N"] ++ [Output "" (x ++ "_CONSUMED")| (Input _ x) <- stmts, x /= "CLK" && x /= "RST_N"]
   newOutputs = [Output "" (x ++ "_VALID")| (Output _ x) <- stmts] ++ [Input "" (x ++ "_CONSUMED")| (Output _ x) <- stmts]
   mapControl ctrl list = map (\(ctrlHead, ctrlTail) -> Assign (ctrlHead ++ ctrl ++ " = 1" ++ (concatMap (\x -> " && " ++ x ++ ctrl) ctrlTail))) list
   newValids = mapControl "_VALID" termDeps
   newConsumeds = mapControl "_CONSUMED" termInfs
