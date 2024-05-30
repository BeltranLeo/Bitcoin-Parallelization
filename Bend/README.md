## Bend: A highly parallelizable programming language

We seek to study whether it is possible to implement certain tools using Bend to facilitate the implementation of parallelism within the project.

We include some test scripts, where we try to see the possibility of running on certain commands using C/C++.

---

It is possible to use Bend as a limited scripting language. At the moment, there is no way to achieve I/O easily within the official implementation. This will be included in a future revision of the language.

## Installation

To install Bend, follow the steps described in the [official repository](https://github.com/HigherOrderCO/bend). It is necessary to have `cargo` and `rust` in nightly in order to get the latest version of the language.

Si todo sale bien, se puede ejecutar el primer comando usando:

```
bend run hello_world.bend
```

## Automatic parallelism

To run a program in parallel automatically, the `bend run-c` command is used, which uses all available CPU cores.
