module ParseCase(parseCase) where

import Lexer
import DataTypes
import Text.Parsec
import Data.List
import Data.Map

parseCase = do
  reserved "always"
  reservedOp "@"
  depsList <- parens $ sepBy identifier (reservedOp "@")
  reserved "begin"
  reserved "case"
  switch <- parens $ many (noneOf ")")
  label1 <- many (noneOf ":")
  written <- identifier
  rest <- manyTill anyChar $reserved "endcase"
  reserved "end"
  let caseStmt = "  always@" ++ (intercalate " or " depsList) ++ "\n" ++ "  begin\n" ++ "    case(" ++ switch ++ ")\n      " ++ label1 ++ ":\n" ++ "          " ++ written ++ " " ++ rest ++ "    endcase\n  end\n\n"
  state <- getState
  let modIr = ir state
  putState state{depends = insertWith (++) written depsList $ depends state, ir = modIr{moduleCases = caseStmt:moduleCases modIr}}
