module Combinational(combinational) where

import Data.List
import Data.Maybe
import qualified Data.Map as M
import qualified Data.Set as S

singleDep depsMap terminals []                  = []
singleDep depsMap terminals (immDep:immDepRest) 
                    | S.member immDep terminals = immDep:singleDep depsMap terminals immDepRest
                    | otherwise                 = singleDep depsMap terminals (nub $ (fromJust $ M.lookup immDep depsMap) ++ immDepRest)

singleInfluence influences (inPort, deps) = foldl (\influenceMap dep -> M.insertWith (++) dep [inPort] influenceMap) influences deps

combinational depsMap terminals = (allDeps, M.assocs allInfluences)
 where
  terminalDeps = [(written, depList) | (written, depList) <- M.assocs depsMap, S.member written terminals]
  allDeps = map (\(w, d) -> (w, singleDep depsMap terminals d)) terminalDeps
  allInfluences = foldl singleInfluence M.empty allDeps
