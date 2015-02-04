# Module Documentation

## Module Control.Monad.Eff.Random

### Types


    data Random :: !


### Values


    random :: forall e. Eff (random :: Random | e) Number

     Takes a range _low_ _high_ and returns a random int uniformly distributed in the
     closed interval [lo,hi]. It is unspecified what happens if lo>hi.

    randomInt :: forall e. Number -> Number -> Eff (random :: Random | e) Number

     Returns a random number between min (inclusive) and max (exclusive)

    randomRange :: forall e. Number -> Number -> Eff (random :: Random | e) Number