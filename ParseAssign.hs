module ParseAssign(parseAssign) where

import Lexer
import DataTypes
import Text.Parsec
import Data.Char
import Data.Map
import Data.List

parseAssign = do
  try $ reserved "assign"
  expr <- manyTill anyChar semi
  let Right (written:depsList) = runParser (sepEndBy identifier nonId) () "" expr
  state <- getState
  let modIr = ir state
  putState state{depends = insertWith (++) written (nub depsList) $ depends state, ir = modIr{moduleAssigns = ("  assign " ++ expr ++ ";\n"):moduleAssigns modIr}}
