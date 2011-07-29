import ParseFile
import DataTypes
import Options
import Text.Parsec
import System.IO
import System.Environment
import System.Exit
import Text.Regex
import AddControl

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
      putStrLn $ show (addControl contents)
      --writeFile (outDir ++ "/" ++ (removeV file) ++ ".multi.v") $ show (addControl contents)
