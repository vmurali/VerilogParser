module ParseAssign(parseAssign) where

import Text.Parsec
import Lexer
import DataTypes
import Data.Char

opers c = not (isAlphaNum c || c == '$' || c == '_')

sep = many $     brackets $ many (noneOf "]")
             <|> do{satisfy opers; return ""}

parseAssign = do
  try $ reserved "assign"
  expr <- manyTill anyChar semi
  let Right (lhs:rhs) = runParser (sepBy identifier sep) () "" expr
  mod <- getState
  putState mod{moduleAssigns = moduleAssigns mod ++ [Assign{assignExpr = expr, assignLhs = lhs, assignRhs = rhs}]}
