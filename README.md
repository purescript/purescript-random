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

Takes a range specified by `low` (the first argument) and `high` (the
second), and returns a random integer uniformly distributed in the closed
interval `[low, high]`. It is unspecified what happens if `low > high`,
or if either of `low` or `high` is not an integer.

For example:

* `randomInt 1 10 >>= Debug.Trace.print`

will print a random integer between 1 and 10.

#### `randomRange`

``` purescript
randomRange :: forall e. Number -> Number -> Eff (random :: Random | e) Number
```

Returns a random number between a minimum value (inclusive) and a maximum
value (exclusive). It is unspecified what happens if `maximum < minimum`.

For example:

* `randomRange 1 2 >>= Debug.Trace.print`

will print a random number between 1 and 2.