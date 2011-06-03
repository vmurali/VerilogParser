module ParseInstance(parseInstance) where

import Text.Parsec
import Lexer
import DataTypes

parseInstance = do
  typ <- identifier
  name <- identifier
  allPorts <- parens $ sepBy parseMatch comma
  let ports = [ (f, r) | (f, r) <- allPorts, r /= ""]
  let realPorts = [r | (f, r) <- ports]
  mod <- getState
  let modifiedWires = addTerminal (moduleWires mod) realPorts
  let modifiedRegs = addTerminal (moduleRegs mod) realPorts
  putState mod{moduleWires = modifiedWires, moduleRegs = modifiedRegs}

addTerminal nets ports = [net{netTerminal = True} | net <- nets, elem (netName net) ports]

parseMatch = do
  dot
  formalName <- identifier
  realName <- parens $ option "" identifier
  return (formalName, realName)
