module Options(Options(..), getOpts) where

import System.Console.GetOpt
import System.IO
import System.Directory
import System.Environment
import System.Exit
import Text.Regex

data Options = Options
  { optFile     ::String
  , optOutDir   ::String
  , optRefineds :: [String]
  }

defaultOptions = Options
  { optOutDir = "."
  , optFile = ""
  , optRefineds = []
  }

splitColon str = splitRegex (mkRegex ":") str

options =
  [ Option ['o'] ["outdir"]
      (ReqArg (\out opts -> createDirectoryIfMissing True out >> return opts{optOutDir = out}) "")
      "Output Directory"
  , Option ['m'] ["multi"]
      (ReqArg (\refs opts -> return opts{optRefineds = splitColon refs}) "")
      "Refined modules"
  , Option ['h'] ["help"]
      (NoArg (\_ -> do{prg <- getProgName; hPutStrLn stderr (usageInfo prg options); exitWith ExitSuccess}))
      "Show help"
  ]

getOpts args =
  foldl (>>=) (return defaultOptions{optFile = head  fileList}) optionList
 where
  (optionList, fileList, err) = getOpt RequireOrder options args 
