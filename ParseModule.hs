module ParseModule(parseModule) where

import Lexer
import DataTypes
import ParseTask
import ParseCase
import ParseInstance
import Text.Parsec
import Control.Monad.Trans

parseModule:: MonadIO m => ParsecT String u m Module
parseModule = do
  reserved "module"
  name <- identifier
  ports <- parens $ sepBy identifier comma
  semi
  stmts <- parseStmts
  return Module
    { moduleName = name
    , modulePorts = ports
    , moduleStmts = stmts
    }

-- Order of parseStmts matter
--   parseCase should be after parseTask and parseInstance must be in the end
parseStmts:: MonadIO m => ParsecT String u m [Stmt]
parseStmts = many $     parseInput
                    <|> parseOutput
                    <|> parseWires
                    <|> parseRegs
                    <|> parseAssign
                    <|> parseTask
                    <|> parseCase
                    <|> do{try (reserved "endmodule"); return End}
                    <|> parseInstance

parseInput:: MonadIO m => ParsecT String u m Stmt
parseInput = do
  width <- parseDeclHeader "input"
  name <- identifier
  semi
  return Input
    { inputWidth = width
    , inputName = name
    }

parseOutput:: MonadIO m => ParsecT String u m Stmt
parseOutput = do
  width <- parseDeclHeader "output"
  name <- identifier
  semi
  return Output
    { outputWidth = width
    , outputName = name
    }

parseWires:: MonadIO m => ParsecT String u m Stmt
parseWires = do
  width <- parseDeclHeader "wire"
  names <- sepBy identifier comma
  semi
  return Wires
    { wiresWidth = width
    , wiresNames = names
    }

parseRegs:: MonadIO m => ParsecT String u m Stmt
parseRegs = do
  width <- parseDeclHeader "reg"
  names <- sepBy identifier comma
  semi
  return Regs
    { regsWidth = width
    , regsNames = names
    }

parseDeclHeader:: MonadIO m => String -> ParsecT String u m String
parseDeclHeader str = do
  try $ reserved str
  widthMaybe <- optionMaybe $ brackets (many (noneOf "]"))
  return $ case widthMaybe of
             Just x  -> "[" ++ x ++ "]"
             Nothing -> ""

parseAssign:: MonadIO m => ParsecT String u m Stmt
parseAssign = do
  try $ reserved "assign"
  expr <- manyTill anyChar semi
  return $ Assign expr
