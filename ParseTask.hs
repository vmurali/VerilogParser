module ParseTask(parseTask) where

import Lexer
import DataTypes
import Text.Parsec

parseTask = do
  try (do
         reserved "always"
         reservedOp "@"
         parens $ do{reserved "negedge"; lexeme $ string "CLK"}
      )
  reserved "begin"
  reservedOp "#"
  lexeme $ char '0'
  semi
  tasks <- many parseTaskStmt
  reserved "end"
  return $ TaskStmt tasks

parseTaskStmt = do
  reserved "if"
  parens $ lexeme $ string "RST_N"
  reserved "if"
  expr <- parens $ many (noneOf ")")
  stmt <- lexeme $ manyTill anyChar (try $ string ");\n")
  return Task{taskExpr = expr, taskStmt = stmt}
