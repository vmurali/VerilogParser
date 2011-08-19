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
    Right contents -> do
      foldl (>>) (return ()) writeFiles
     where
      removeSlash = subRegex (mkRegex "^.*\\/") file ""
      removeDotV = subRegex (mkRegex ".v$") removeSlash ""
      prefix = outDir ++ "/" ++ removeDotV
      writeFiles = map (\(suffix, fn) -> writeFile (prefix ++ suffix) $ show (fn contents)) suffixFns
