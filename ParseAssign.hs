module ParseAssign(parseAssign) where

import Lexer
import DataTypes
import Utils
import Text.Parsec
import Data.Char

opers c = not (isAlphaNum c || c == '$' || c == '_')

sep = do
  (optional . brackets . many) (noneOf "]")
  many $ satisfy opers

parseAssign = do
  try $ reserved "assign"
  expr <- manyTill anyChar semi
  let Right (written:depsList) = runParser (sepBy identifier sep) () "" expr
  state <- getState
  let modIr = ir state
  putState (addDepends state written depsList){ir = modIr{moduleAssigns = ("  assign " ++ expr ++ ";\n"):moduleAssigns modIr}}
