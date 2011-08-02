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
  ports <- parens $ sepBy parseMatch comma
  semi
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
