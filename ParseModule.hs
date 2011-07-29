module ParseModule(parseModule) where

import Lexer
import DataTypes
import ParseTask
import ParseCase
import ParseInstance
import Text.Parsec
import Text.Parsec.Prim

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
parseStmts = many $     parseInput
                    <|> parseOutput
                    <|> parseWires
                    <|> parseRegs
                    <|> parseAssign
                    <|> parseTask
                    <|> parseCase
                    <|> do{try (reserved "endmodule"); return End}
                    <|> parseInstance

parseInput = do
  width <- parseDeclHeader "input"
  name <- identifier
  semi
  return Input
    { inputWidth = width
    , inputName = name
    }

parseOutput = do
  width <- parseDeclHeader "output"
  name <- identifier
  semi
  return Output
    { outputWidth = width
    , outputName = name
    }

parseWires = do
  width <- parseDeclHeader "wire"
  names <- sepBy identifier comma
  semi
  return Wires
    { wiresWidth = width
    , wiresNames = names
    }

parseRegs = do
  width <- parseDeclHeader "reg"
  names <- sepBy identifier comma
  semi
  return Regs
    { regsWidth = width
    , regsNames = names
    }

parseDeclHeader str = do
  try $ reserved str
  widthMaybe <- optionMaybe $ brackets (many (noneOf "]"))
  return $ case widthMaybe of
             Just x  -> "[" ++ x ++ "]"
             Nothing -> ""

parseAssign = do
  try $ reserved "assign"
  expr <- manyTill anyChar semi
  return $ Assign expr
