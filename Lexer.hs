module Lexer where

import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Language
import qualified Text.ParserCombinators.Parsec.Token as P

lexer = P.makeTokenParser emptyDef{
  commentStart   = "/*",
  commentEnd     = "*/",
  commentLine    = "//",
  nestedComments = False,
  identLetter    = alphaNum <|> oneOf "_$",
  identStart     = letter   <|> oneOf "_$",
  reservedNames  = 
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
    ],
  reservedOpNames = ["@", "#"]
}

lexeme     = P.lexeme lexer
whiteSpace = P.whiteSpace lexer
semi       = P.semi lexer
comma      = P.comma lexer
dot        = P.dot lexer
colon      = P.colon lexer
identifier = P.identifier lexer
parens     = P.parens lexer
brackets   = P.brackets lexer
reserved   = P.reserved lexer    
reservedOp = P.reservedOp lexer

nonId      = manyTill ((char '\''>>anyChar) <|> anyChar) $ lookAhead ((try identifier>>return ()) <|> eof)
