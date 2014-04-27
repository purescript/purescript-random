module Control.Monad.Eff.Random.Unsafe where

import Control.Monad.Eff
import Control.Monad.Eff.Random

foreign import unsafeChoice 
  "function unsafeChoice(arr) {\
  \  return function() {\
  \    return arr[Math.floor(Math.random() * arr.length)];\
  \  };\
  \}" :: forall a e. [a] -> Eff (random :: Random | e) a
