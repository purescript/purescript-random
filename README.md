# Module Documentation

## Module Control.Monad.Eff.Random

### Types

    data Random :: !


### Values

    random :: forall e. Eff (random :: Random | e) Prim.Number