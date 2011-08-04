module ParseInstance(parseInstance) where

import Lexer
import Text.Parsec
import DataTypes
import Control.Monad.Trans

parseInstance:: MonadIO m => ParsecT String u m Stmt
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

parseMatch:: MonadIO m => ParsecT String u m (String, String)
parseMatch = do
  dot
  formalName <- identifier
  realName <- parens $ option "" identifier
  return (formalName, realName)
