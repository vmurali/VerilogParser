module Combinational(combinational) where

import Data.List
import qualified Data.Map as M
import qualified Data.Set as S
import Data.Maybe

singleDep depsMap terminals []                  = []
singleDep depsMap terminals (immDep:immDepRest) 
                    | S.member immDep terminals = immDep:singleDep depsMap terminals immDepRest
                    | otherwise                 = singleDep depsMap terminals (nub $ immDepRest ++ (fromJust $ M.lookup immDep depsMap))

singleInfluence influences (inPort, deps) = foldl (\influenceMap dep -> M.insertWith (++) dep [inPort] influenceMap) influences deps

combinational depsMap terminals = (allDeps, M.assocs allInfluences)
 where
  terminalDeps = [(written, depList) | (written, depList) <- M.assocs depsMap, S.member written terminals]
  allDeps = map (\(w, d) -> (w, singleDep depsMap terminals d)) terminalDeps
  allInfluences = foldl singleInfluence M.empty allDeps
