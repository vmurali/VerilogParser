module ParseTask(parseTask) where

import Lexer
import DataTypes
import Text.Parsec
import Text.Parsec.Prim
import Control.Monad.Trans

parseTask:: MonadIO m => ParsecT String u m Stmt
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
  str <- getInput
  tasks <- manyTill parseTaskStmt $ reserved "end"
  return $ TaskStmt tasks

parseTaskStmt:: MonadIO m => ParsecT String u m Task
parseTaskStmt = do
  parseFirstIf
  parseRealTask

parseFirstIf:: MonadIO m => ParsecT String u m ()
parseFirstIf = (optional . try) $ do
  reserved "if"
  parens $ lexeme (string "RST_N")

parseIf:: MonadIO m => ParsecT String u m (Maybe String)
parseIf = optionMaybe $ do
  try $ reserved "if"
  parens $ many (noneOf ")")

parseRealTask:: MonadIO m => ParsecT String u m Task
parseRealTask = do
  expr <- parseIf
  str <- lexeme $ manyTill1 anyChar (try $ string ";\n")
  return $ Task expr str
