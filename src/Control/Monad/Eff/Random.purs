module Control.Monad.Eff.Random where

import Control.Monad.Eff

foreign import data Random :: !

foreign import random
  "function random() {\
  \  return Math.random();\
  \}" :: forall e. Eff (random :: Random | e) Number

