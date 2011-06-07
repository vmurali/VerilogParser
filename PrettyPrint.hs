module PrettyPrint(prettyPrint) where

import DataTypes
import Data.List
import qualified Data.Set as S

printPorts ports = intercalate ",\n  " $ ports ++ validPorts ++ consumedPorts
 where
  realPorts = [port | port <- ports, port /= "CLK", port /= "RST_N"]
  validPorts = map (\p -> p ++ "_valid_") realPorts
  consumedPorts = map (\p -> p ++ "_consumed_") realPorts

printInputs nets = concatMap (\n -> "  input " ++ netWidth n ++ " " ++ netName n ++ ";\n" ++
                                    if netName n == "CLK" || netName n == "RST_N"
                                      then ""
                                      else "  input " ++ netName n ++ "_valid_;\n  output " ++ netName n ++ "_consumed_;\n") nets

printOutputs nets = concatMap (\n -> "  output " ++ netWidth n ++ " " ++ netName n ++ ";\n" ++
                                     if netName n == "CLK" || netName n == "RST_N"
                                       then ""
                                       else "  output " ++ netName n ++ "_valid_;\n  input " ++ netName n ++ "_consumed_;\n") nets

printWires nets = concatMap (\n -> "  wire " ++ netWidth n ++ " " ++ netName n ++ ";\n") nets

printRegs nets = concatMap (\n -> "  wire " ++ netWidth n ++ " " ++ netName n ++ ";\n") nets

printTerminals terminals = concatMap (\w -> "  wire " ++ w ++ "_valid_;\n  wire " ++ w ++ "_consumed_;\n") $ S.elems terminals

printConjunction conjus suffix = concatMap (\(w, d) -> "  assign " ++ w ++ suffix ++ " = " ++ intercalate " && " ("1'b1":d)) conjus

printInstance inst =
  "  " ++ instanceType inst ++ " " ++ param ++ instanceName inst ++ " (\n    " ++
  (intercalate ",\n    " $ normalConns ++ validConns ++ consumedConns) ++
  "\n    );\n\n"
 where
  param = case (instanceParam inst) of
            Just x  -> "#(" ++ x ++ ") "
            Nothing -> ""
  normalConns    = map (\(f,a) -> "." ++ f ++ "(" ++ a ++ ")") $ instancePorts inst
  validConns     = map (\(f,a) -> "." ++ f ++ "_valid_(" ++ a ++ "_valid_)") $ instancePorts inst
  consumedConns  = map (\(f,a) -> "." ++ f ++ "_consumed_(" ++ a ++ "_consumed_)") $ instancePorts inst

prettyPrint mod terminals allDeps allInfs =
  "`ifdef BSV_ASSIGNMENT_DELAY\n`else\n`define BSV_ASSIGNMENT_DELAY\n`endif\n\n" ++
  "module " ++ moduleName mod ++ "(\n  " ++ printPorts (modulePorts mod) ++ "\n);\n\n" ++
  printInputs (moduleInputs mod) ++ "\n" ++
  printOutputs (moduleOutputs mod) ++ "\n" ++
  printWires (moduleWires mod) ++ "\n" ++
  printRegs (moduleRegs mod) ++ "\n" ++
  printTerminals terminals ++ "\n" ++
  concatMap printInstance (moduleInstances mod) ++
  printConjunction allDeps "_valid_" ++ "\n" ++
  printConjunction allInfs "_consumed_" ++ "\n" ++
  concat (moduleAssigns mod) ++ "\n" ++
  concat (moduleCases mod) ++ "\n" ++
  "endmodule\n"
