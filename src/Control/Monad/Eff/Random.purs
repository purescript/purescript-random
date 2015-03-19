module Control.Monad.Eff.Random where

import Control.Monad.Eff
import Math (floor)

-- | The `Random` effect indicates that an Eff action may access or modify the
-- | JavaScript global random number generator, i.e. `Math.random()`.
foreign import data Random :: !

-- | Returns a random number between 0 (inclusive) and 1 (exclusive). This is
-- | a direct wrapper around JavaScript's `Math.random()`.
foreign import random
  """
  function random() {
    return Math.random();
  }
  """ :: forall e. Eff (random :: Random | e) Number

-- | Takes a range `low` `high` and returns a random integer uniformly
-- | distributed in the closed interval `[low, high]`. It is unspecified what
-- | happens if `low > high`.
-- |
-- | For example:
-- |
-- | * `randomInt 1 10 >>= Debug.Trace.print`
-- |
-- | will print a random integer between 1 and 10.
randomInt :: forall e . Number -> Number -> Eff (random :: Random | e) Number
randomInt low high = do
  rand <- random
  return (floor (rand * (high - low + 1)) + low)

-- | Returns a random number between min (inclusive) and max (exclusive).
-- |
-- | For example:
-- |
-- | * `randomRange 1 2 >>= Debug.Trace.print`
-- |
-- | will print a random number between 1 and 2.
randomRange :: forall e . Number -> Number -> Eff (random :: Random | e) Number
randomRange min max = do
  r <- random
  return (r * (max - min) + min)
