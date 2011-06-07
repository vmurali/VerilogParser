module ParseInstance(parseInstance) where

import Lexer
import Text.Parsec
import DataTypes
import Data.Set

parseInstance = do
  typ <- identifier
  param <- optionMaybe (do{reserved "#"; parens (many $ noneOf ")");})
  name <- identifier
  allPorts <- parens $ sepBy parseMatch comma
  semi
  let ports = [ (f, r) | (f, r) <- allPorts, r /= ""]
  state <- getState
  let modIr = ir state
  let inst = Instance {instanceType = typ, instanceParam = param, instanceName = name, instancePorts = ports}
  putState state{ir = modIr{moduleInstances = inst:moduleInstances modIr}}

parseMatch = do
  dot
  formalName <- identifier
  realName <- parens $ option "" identifier
  state <- getState
  if realName /= ""
    then putState state{terminals = insert realName $ terminals state}
    else return ()
  return (formalName, realName)
