# Module Documentation

## Module Control.Monad.Eff.Random

### Types

    data Random :: !


### Values

    random :: forall e. Eff (random :: Random | e) Prim.Number


## Module Control.Monad.Eff.Random.Unsafe

### Values

    unsafeChoice :: forall a e. [a] -> Eff (random :: Random | e) a