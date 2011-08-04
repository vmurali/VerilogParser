module ParseFile(parseFile) where

import Lexer
import DataTypes
import ParseModule
import Text.Parsec
import Control.Monad.Trans

parseFile:: MonadIO m => ParsecT String u m Module
parseFile = whiteSpace >> parseIfdef >> parseModule

parseIfdef:: MonadIO m => ParsecT String u m String
parseIfdef = lexeme $ string "`ifdef BSV_ASSIGNMENT_DELAY\n`else\n`define BSV_ASSIGNMENT_DELAY\n`endif\n"
