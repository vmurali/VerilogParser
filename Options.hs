module Options(Options(..), getOpts) where

import System.Console.GetOpt
import System.IO
import System.Directory
import System.Environment
import System.Exit

data Options = Options
  { optFile  ::String
  , optOutDir::String
  }

defaultOptions = Options
  { optOutDir = "."
  , optFile = ""
  }

options =
  [ Option ['o'] ["outdir"]
      (ReqArg (\out opts -> createDirectoryIfMissing True out >> return opts{optOutDir = out}) "")
      "Output Directory"
  , Option ['h'] ["help"]
      (NoArg (\_ -> do{prg <- getProgName; hPutStrLn stderr (usageInfo prg options); exitWith ExitSuccess}))
      "Show help"
  ]

getOpts args =
  foldl (>>=) (return defaultOptions{optFile = head  fileList}) optionList
 where
  (optionList, fileList, err) = getOpt RequireOrder options args 
