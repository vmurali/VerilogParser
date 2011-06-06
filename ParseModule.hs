module ParseModule(parseModule, parseIfdef) where

import Lexer
import DataTypes
import ParseAssign
--import ParseTask
import ParseCase
import ParseInstance
import Text.Parsec
import qualified Data.Set as Set
import qualified Data.Map as Map

parseIfdef = lexeme $ string "`ifdef BSV_ASSIGNMENT_DELAY\n`else\n`define BSV_ASSIGNMENT_DELAY\n`endif\n"

parseModule = do
  reserved "module"
  name <- identifier
  ports <- parens $ sepBy comma identifier
  semi
  let emptyModule = undefined
  putState IrAndConnection{ir = emptyModule{moduleName = name, modulePorts = ports}, terminals = Set.empty, depends = Map.empty}
  parseStmts
  getState

-- Order of parseStmts matter, especially for parseCase and parseInstance
parseStmts = many $     parseInput
                    <|> parseOutput
                    <|> parseWire
                    <|> parseReg
                    <|> parseAssign
--                    <|> parseTask
                    <|> parseCase
                    <|> (try $ reserved "endmodule")
                    <|> parseInstance

parseInput = do
  inputs <- parseDecls "input" True
  state <- getState
  let modIr = ir state
  putState state{ir = modIr{moduleInputs = moduleInputs modIr ++ inputs}}

parseOutput = do
  outputs <- parseDecls "output" True
  state <- getState
  let modIr = ir state
  putState state{ir = modIr{moduleOutputs = moduleOutputs modIr ++ outputs}}

parseWire = do
  wires <- parseDecls "wire" True
  state <- getState
  let modIr = ir state
  putState state{ir = (ir state){moduleWires = moduleWires modIr ++ wires}}

parseReg = do
  regs <- parseDecls "reg" True
  state <- getState
  let modIr = ir state
  putState state{ir = modIr{moduleRegs = moduleRegs modIr ++ regs}}

parseDecls str terminal = do
  try $ reserved str
  width <- brackets $ many (noneOf "]")
  names@(terminal:_) <- sepBy identifier comma
  semi
  state <- getState
  if terminal /= "CLK" && terminal /= "RST_N"
    then putState state{terminals = Set.insert terminal (terminals state)} -- hack knowing that inputs/outputs will not be a list
    else return ()
  return $ map (\n -> Net {netName = n, netWidth = width}) names
