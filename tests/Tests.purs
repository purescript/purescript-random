module Main where

import Data.Array
import Data.Maybe
import Debug.Trace
import Test.QuickCheck
import Control.Monad.Eff
import Control.Monad.Eff.Random
import Control.Monad.Eff.Random.Extras
import Control.Monad.Eff.Unsafe

main = do

  trace "Generated random numbers should be 0 <= n < 1"
  let testRange :: Number -> Boolean
      testRange _ = runRandom $ do
        n <- random
        return $ (n >= 0) && (n < 1)
  quickCheck' 10000 testRange
  
  trace "choice on an empty list should be Nothing"
  quickCheck' 1 $ (runRandom $ choice nil) == Nothing
  
  trace "choice on a non-empty list should be a Just"
  let testChoice :: [Number] -> Boolean
      testChoice xs | isEmpty xs = true
      testChoice xs = isJust (runRandom $ choice xs)
  quickCheck testChoice
  
  where 
  
  nil :: [Number]
  nil = []
  
  runRandom :: forall eff a. Eff eff a -> a
  runRandom = runPure <<< unsafeInterleaveEff
