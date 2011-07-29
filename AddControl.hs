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
addTerminal terminalSet (Instance _ _ _ ports) = foldl (\tSet (f, r) -> if r /= "CLK" && r /= "RST_N" then Set.insert r tSet else tSet) terminalSet ports
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

addControl mod = (termDeps, termInfs, inputTerminals, outputTerminals)
 where
   stmts = moduleStmts mod
   terminalSet = foldl addTerminal Set.empty stmts
   dependsMap = foldl addDepends Map.empty stmts
   termDeps = terminalDepends terminalSet dependsMap
   termInfs = Map.assocs $ terminalInfluences terminalSet dependsMap termDeps
   inputTerminals = [x| (Input _ x) <- stmts, Set.member x terminalSet]
   outputTerminals = [x| (Output _ x) <- stmts, Set.member x terminalSet]

writeTerminalDepends terminalSet dependsMap (write, immDeps) =
  (write, getTerminalDepends immDeps)
 where
  getTerminalDepends [] = []
  getTerminalDepends (immDep:immDeps)
    | Set.member immDep terminalSet = immDep:(getTerminalDepends immDeps)
    | otherwise                     = getTerminalDepends $ nub ((fromJust $ Map.lookup immDep dependsMap) ++ immDeps)

terminalDepends terminalSet dependsMap = map (writeTerminalDepends terminalSet dependsMap) writeImmDepends
 where
  writeImmDepends = [(write, deps) | (write, deps) <- Map.assocs dependsMap, Set.member write terminalSet]

terminalInfluences terminalSet dependsMap termDeps = foldl getInfluences Map.empty termDeps
 where
  getInfluences influencesMap (write, deps) = foldl (\infMap dep -> Map.insertWith (++) dep [write] infMap) influencesMap deps
