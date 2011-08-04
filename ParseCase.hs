module ParseCase(parseCase) where

import Lexer
import DataTypes
import Text.Parsec
import Control.Monad.Trans

parseCase:: MonadIO m => ParsecT String u m Stmt
parseCase = do
  try (do
         reserved "always"
         reservedOp "@"
      )
  rest <- manyTill anyChar $ try (do{reserved "endcase"; reserved "end"})
  return $ Case rest
