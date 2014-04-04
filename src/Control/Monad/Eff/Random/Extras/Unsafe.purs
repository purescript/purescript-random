module Control.Monad.Eff.Random.Extras.Unsafe where

import Control.Monad.Eff
import Control.Monad.Eff.Random
import Data.Array
import Data.Maybe

choice :: forall a e. [a] -> Eff (random :: Random | e) a
choice xs = do
  n <- random
  return $ xs !! Math.floor (length xs * n)
