module Lexer where

import Text.Parsec
import Text.Parsec.Language
import qualified Text.Parsec.Token as P
import Control.Monad.Trans

lexer:: Monad m => P.GenTokenParser String u m
lexer = P.makeTokenParser P.LanguageDef{
  P.commentStart    = "/*",
  P.commentEnd      = "*/",
  P.commentLine     = "//",
  P.nestedComments  = False,
  P.identLetter     = alphaNum <|> oneOf "_$",
  P.identStart      = letter <|> oneOf "@#",
  P.opLetter        = oneOf "@#",
  P.opStart         = oneOf "@#",
  P.caseSensitive   = True,
  P.reservedOpNames = ["@", "#"],
  P.reservedNames   = 
    [ "module"
    , "endmodule"
    , "input"
    , "output"
    , "wire"
    , "reg"
    , "always"
    , "assign"
    , "negedge"
    , "or"
    , "if"
    , "else"
    , "case"
    , "endcase"
    , "begin"
    , "end"
    ]
}

lexeme:: Monad m => ParsecT String u m a -> ParsecT String u m a
lexeme = P.lexeme lexer

whiteSpace:: Monad m => ParsecT String u m ()
whiteSpace = P.whiteSpace lexer

semi:: Monad m => ParsecT String u m String
semi = P.semi lexer

comma:: Monad m => ParsecT String u m String
comma = P.comma lexer

dot:: Monad m => ParsecT String u m String
dot = P.dot lexer

colon:: Monad m => ParsecT String u m String
colon = P.colon lexer

identifier:: Monad m => ParsecT String u m String
identifier = P.identifier lexer

parens:: Monad m => ParsecT String u m a -> ParsecT String u m a
parens = P.parens lexer

brackets:: Monad m => ParsecT String u m a -> ParsecT String u m a
brackets = P.brackets lexer

reserved:: Monad m => String -> ParsecT String u m ()
reserved = P.reserved lexer    

reservedOp:: Monad m => String -> ParsecT String u m ()
reservedOp = P.reservedOp lexer

manyTill1 p e = do
  xs <- manyTill p e
  case xs of
    [] -> parserZero
    _  -> return xs
