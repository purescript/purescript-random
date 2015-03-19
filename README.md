# Module Documentation

## Module Control.Monad.Eff.Random

#### `Random`

``` purescript
data Random :: !
```

The `Random` effect indicates that an Eff action may access or modify the
JavaScript global random number generator, i.e. `Math.random()`.

#### `random`

``` purescript
random :: forall e. Eff (random :: Random | e) Number
```

Returns a random number between 0 (inclusive) and 1 (exclusive). This is
a direct wrapper around JavaScript's `Math.random()`.

#### `randomInt`

``` purescript
randomInt :: forall e. Number -> Number -> Eff (random :: Random | e) Number
```

Takes a range `low` `high` and returns a random integer uniformly
distributed in the closed interval `[low, high]`. It is unspecified what
happens if `low > high`.

For example:

* `randomInt 1 10 >>= Debug.Trace.print`

will print a random integer between 1 and 10.

#### `randomRange`

``` purescript
randomRange :: forall e. Number -> Number -> Eff (random :: Random | e) Number
```

Returns a random number between min (inclusive) and max (exclusive).

For example:

* `randomRange 1 2 >>= Debug.Trace.print`

will print a random number between 1 and 2.