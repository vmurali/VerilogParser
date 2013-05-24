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
  parensBalanced False
 where
  allChar = manyTill anyChar $ (try . lookAhead . oneOf) "()"
  parensBalanced inner = do
    lexeme $ char '('
    firsts <- allChar
    mids <- many $ do{x <- parensBalanced True; y <- allChar; return $ x ++ y;}
    lexeme $ char ')'
    return $ (if inner then "(" else "") ++ firsts ++ concat mids ++ (if inner then ")" else "")

parseRealTask:: MonadIO m => ParsecT String u m Task
parseRealTask = do
  expr <- parseIf
  (optional . try) $ reserved "begin"
  str <- lexeme $ manyTill1 anyChar (try $ string ";\n")
  (optional . try) $ (do {reservedOp "#"; lexeme $ char '0'; semi; reserved "end"})
  return $ Task expr str
