module ParseFile(parseFile) where

import Lexer
import ParseModule
import Text.Parsec

parseFile = whiteSpace >> parseIfdef >> parseModule

parseIfdef = lexeme $ string "`ifdef BSV_ASSIGNMENT_DELAY\n`else\n`define BSV_ASSIGNMENT_DELAY\n`endif\n"
