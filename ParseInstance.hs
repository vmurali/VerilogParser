module ParseInstance(parseInstance) where

import Lexer
import Text.Parsec
import DataTypes

parseInstance = do
  typ <- identifier
  param <- option "" (do{reserved "#"; parens (many $ noneOf ")");})
  name <- identifier
  allPorts <- parens $ sepBy parseMatch comma
  semi
  let ports = [ (f, r) | (f, r) <- allPorts, r /= ""]
  return Instance
    { instanceType = typ
    , instanceParam = param
    , instanceName = name
    , instancePorts = ports
    }

parseMatch = do
  dot
  formalName <- identifier
  realName <- parens $ option "" identifier
  return (formalName, realName)
