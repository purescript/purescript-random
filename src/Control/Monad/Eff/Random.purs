module Control.Monad.Eff.Random where

import Control.Monad.Eff
import Math(floor)

foreign import data Random :: !

foreign import random
  "function random() {\
  \  return Math.random();\
  \}" :: forall e. Eff (random :: Random | e) Number

-- Takes a range _low_ _high_ and returns a random int uniformly distributed in the
-- closed interval [lo,hi]. It is unspecified what happens if lo>hi.
randomInt :: forall e . Number -> Number -> Eff (random :: Random | e) Number
randomInt low high = do
    rand <- random
    return (floor (rand * (high - low + 1)) + low)

-- Returns a random number between min (inclusive) and max (exclusive)
randomRange :: forall e . Number -> Number -> Eff (random :: Random | e) Number
randomRange min max = do
    r <- random
    return (r * (max - min) + min)
