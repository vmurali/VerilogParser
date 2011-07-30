import ParseFile
import DataTypes
import Options
import Text.Parsec
import System.IO
import System.Environment
import System.Exit
import Text.Regex
import Partition

removeV str = subRegex (mkRegex "\\.v$") str ""

main = do
  args <- getArgs
  Options file outDir <- getOpts args
  contents <- readFile file
  let parsed = runParser parseFile () file contents
  case (parsed) of
    Left err -> do
      hPutStrLn stderr $ show err
      exitFailure
    Right contents ->  do
      writeFile (outDir ++ "/" ++ (removeV file) ++ "_logic_.v") $ show (getLogic contents)
      writeFile (outDir ++ "/" ++ (removeV file) ++ "_outer_.v") $ show (getOuter contents)
