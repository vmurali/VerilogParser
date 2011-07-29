module ParseCase(parseCase) where

import Lexer
import DataTypes
import Text.Parsec

parseCase = do
  try (do
         reserved "always"
         reservedOp "@"
      )
  rest <- manyTill anyChar $ try (do{reserved "endcase"; reserved "end"})
  return $ Case rest
