module ParseAssign(parseAssign) where

import Lexer
import DataTypes
import Text.Parsec
import Data.Char
import Data.Map

opers c = not (isAlphaNum c || c == '$' || c == '_')

sep = do
  (optional . brackets . many) (noneOf "]")
  many $ satisfy opers

parseAssign = do
  try $ reserved "assign"
  expr <- manyTill anyChar semi
  --let Right (written:depsList) = runParser (sepBy identifier sep) () "" expr
  let (written:depsList) = "":[]
  state <- getState
  let modIr = ir state
  putState state{depends = insertWith (++) written depsList $ depends state, ir = modIr{moduleAssigns = ("  assign " ++ expr ++ ";\n"):moduleAssigns modIr}}
