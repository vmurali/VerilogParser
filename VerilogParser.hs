module VerilogParser where

import ParseFile
import DataTypes
import Options
import Text.Parsec
import System.IO
import System.Environment
import System.Exit
import Text.Regex

verilogParser suffixFns = do
  args <- getArgs
  Options file outDir <- getOpts args
  contents <- readFile file
  parsed <- runParserT parseFile () file contents
  case (parsed) of
    Left err -> do
      hPutStrLn stderr $ show err
      exitFailure
    Right contents -> foldl (>>) (return ()) writeFiles
     where
      prefix = outDir ++ "/" ++ (subRegex (mkRegex "\\.v$") file "")
      writeFiles = map (\(suffix, fn) -> writeFile (prefix ++ suffix) $ show (fn contents)) suffixFns
