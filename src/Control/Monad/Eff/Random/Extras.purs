module Control.Monad.Eff.Random.Extras where

import Control.Monad.Eff
import Control.Monad.Eff.Random
import Data.Array
import Data.Maybe

choice :: forall a e. [a] -> Eff (random :: Random | e) (Maybe a)
choice [] = return Nothing
choice xs = do
  n <- random
  return $ xs !! Math.floor (length xs * n)
