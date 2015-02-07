# Module Documentation

## Module Control.Monad.Eff.Random

### Types


    data Random :: !


### Values

     | Returns a random number between 0 (inclusive) and 1 (exclusive).

    random :: forall e. Eff (random :: Random | e) Number

     | Takes a range `low` `high` and returns a random int uniformly distributed
     | in the closed interval `[low, high]`. It is unspecified what happens if
     | `low > high`.

    randomInt :: forall e. Number -> Number -> Eff (random :: Random | e) Number

     | Returns a random number between min (inclusive) and max (exclusive).

    randomRange :: forall e. Number -> Number -> Eff (random :: Random | e) Number