module Control.Monad.Eff.Random where

import Control.Monad.Eff

foreign import data Random :: !

-- | Returns a random number between 0 (inclusive) and 1 (exclusive).
foreign import random
  """
  function random() {
    return Math.random();
  }
  """ :: forall e. Eff (random :: Random | e) Number

-- | Takes a range `low` `high` and returns a random int uniformly distributed
-- | in the closed interval `[low, high]`. It is unspecified what happens if
-- | `low > high`.
randomInt :: forall e . Number -> Number -> Eff (random :: Random | e) Number
randomInt low high = do
  r <- randomRange low (high+1)
  return $ floor r
  where floor x = let ix = 0.|. x in ix - if ix > x then 1 else 0
           
-- | Returns a random number between min (inclusive) and max (exclusive).
randomRange :: forall e . Number -> Number -> Eff (random :: Random | e) Number
randomRange min max = do
  r <- random
  return (r * (max - min) + min)
