import ParseFile
import Combinational
import PrettyPrint
import DataTypes
import Options
import Text.ParserCombinators.Parsec
import System.IO
import System.Environment
import System.Exit
import Text.Regex

removeV str = subRegex (mkRegex "\\.v$") str ""

main = do
  args <- getArgs
  Options file outDir <- getOpts args
  contents <- readFile file
  let parsed = runParser parseFile emptyIr file contents
  case (parsed) of
    Left err -> do
      hPutStrLn stderr $ show err
      exitFailure
    Right (IrAndConnection modIr terminals depends) -> do
      let (allDeps, allInfs) = combinational depends terminals
      let str = prettyPrint modIr terminals allDeps allInfs
      writeFile (outDir ++ "/" ++ (removeV file) ++ ".multi.v") str
