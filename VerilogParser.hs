module VerilogParser where

import ParseFile
import Combinational
import PrettyPrint
import DataTypes
import Text.Parsec
import System.IO
import System.Environment
import System.Exit

main = do
  args <- getArgs
  let file = head args
  contents <- readFile file
  case (runParser parseFile undefined file contents) of
    Left err -> do
      hPutStrLn stderr $ show err
      exitFailure
    Right (IrAndConnection modIr terminals depends) -> do
      let (allDeps, allInfs) = combinational depends terminals
      let str = prettyPrint modIr terminals allDeps allInfs
      writeFile (file ++ ".multi") str
