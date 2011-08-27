import VerilogParser
import DataTypes
import qualified Data.Set as Set
import qualified Data.Map as Map
import Data.List
import Data.Maybe
import Text.Regex

getInstWires mod = Set.difference (foldl instWires Set.empty insts) inOuts
 where
  insts = [x | x@Instance{} <- moduleStmts mod]
  inputs = Set.fromList [x | Input _ x <- moduleStmts mod]
  outputs = Set.fromList [x | Output _ x <- moduleStmts mod]
  inOuts = Set.union inputs outputs
  instWires wiresSet (Instance _ _ _ ports) = foldl (\wSet (_, w) -> Set.insert w wSet) wiresSet ports

getWidths mod = foldl addWidth Map.empty (moduleStmts mod)
 where
  addWidth widthMap (Wires width names) = foldl (\map n -> Map.insert n width map) widthMap names
  addWidth widthMap (Regs width names) = foldl (\map n -> Map.insert n width map) widthMap names
  addWidth widthMap _ = widthMap

getInstWireWidths mod = Set.fold mapWireWidth Map.empty $ getInstWires mod
 where
  mapWireWidth wire map = Map.insert wire (isWrite wire, (fromJust $ Map.lookup wire (getWidths mod))) map
  isWrite wire = (isJust $ matchRegex (mkRegex ".*READ$") wire) ||
                 (isJust $ matchRegex (mkRegex ".*READ_VALID$") wire) ||
                 (isJust $ matchRegex (mkRegex ".*WRITE_CONSUMED$") wire)

getLogic _ mod@(Module name ports stmts) = Module
  { moduleName = name ++ "_logic_"
  , modulePorts = ports ++ (Map.keys $ getInstWireWidths mod)
  , moduleStmts = (map getDefn (Map.toList (getInstWireWidths mod))) ++ filter isInst stmts
  }
 where
  getDefn (wire, (True, width)) = Output width wire
  getDefn (wire, (False, width)) = Input width wire
  isInst (Instance{}) = False
  isInst _            = True

getOuter _ mod@(Module name ports stmts) = mod
  { moduleStmts = [x| x@Input{} <- stmts] ++
                  [x| x@Output{} <- stmts] ++
                  (map getDefn (Map.toList (getInstWireWidths mod))) ++
                  [x| x@Instance{} <- stmts] ++
                  [logicInst]
  }
 where
  getDefn (wire, (_, width)) = Wires width [wire]
  logicInst = Instance
    { instanceType = name ++ "_logic_"
    , instanceParam = " "
    , instanceName = name ++ "_logic_inst_"
    , instancePorts = map (\x -> (x, x)) (Map.keys $ getInstWireWidths mod)
    }

main = verilogParser [("_logic.v", getLogic), ("_outer_.v", getOuter)]
