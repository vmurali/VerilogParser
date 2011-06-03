module ParseModule(parseModule) where

import Text.Parsec
import Lexer
import DataTypes
import ParseAssign
--import ParseCase
--import ParseTask
import ParseInstance

parseModule = do
  try $ reserved "module"
  name <- identifier
  ports <- parens $ sepBy identifier comma
  semi
  let emptyModule = undefined
  putState emptyModule{moduleName = name, modulePorts = ports}
  parseStmts
  getState

parseStmts = many $     parseInput
                    <|> parseOutput
                    <|> parseWire
                    <|> parseReg
                    <|> parseAssign
--                    <|> parseCase
--                    <|> parseTask
                    <|> (try $ reserved "endmodule")
                    <|> parseInstance

parseInput = do
  inputs <- parseDecls "input" True
  mod <- getState
  putState mod{moduleInputs = moduleInputs mod ++ inputs}

parseOutput = do
  outputs <- parseDecls "output" True
  mod <- getState
  putState mod{moduleOutputs = moduleOutputs mod ++ outputs}

parseWire = do
  wires <- parseDecls "wire" False
  mod <- getState
  putState mod{moduleWires = moduleWires mod ++ wires}

parseReg = do
  regs <- parseDecls "reg" False
  mod <- getState
  putState mod{moduleRegs = moduleRegs mod ++ regs}

parseDecls str terminal = do
  try $ reserved str
  annotate <- brackets $ many (noneOf "]")
  names <- sepBy1 identifier comma
  semi
  return $ map (\n -> Net {netName = n, netAnnotate = annotate, netTerminal = terminal}) names
