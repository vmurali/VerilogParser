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
  parseFirstIf
  parseRealTask

parseFirstIf = optional $ do
  try $ reserved "if"
  parens $ lexeme (string "RST_N")

parseIf = optionMaybe $ do
  try $ reserved "if"
  parens $ many (noneOf ")")

parseRealTask = do
  expr <- parseIf
  str <- lexeme $ manyTill anyChar (try $ string ";\n")
  return $ Task expr str
