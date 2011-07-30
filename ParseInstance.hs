module ParseInstance(parseInstance) where

import Lexer
import Text.Parsec
import DataTypes

parseInstance = do
  typ <- identifier
  paramMaybe <- optionMaybe (do{reserved "#"; parens (many $ noneOf ")");})
  let param = case paramMaybe of
                Just x  -> "#(" ++ x ++ ") "
                Nothing -> " "
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
