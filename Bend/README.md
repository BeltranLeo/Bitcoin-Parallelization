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

To run a program in parallel automatically, the `bend run-c <program>` command is used, which uses all available CPU cores.

## C/C++ integration

Bend allows you to compile the program to source code in C. However, this source code is designed as an intermediate step to be executed after being compiled with GCC.

This can be done by using the following command:

```
bend gen-c parallel.bend >> parallel.c
```

And then compile `parallel.c` naturally as a C program.

Testing showed that the result differed considerably from that obtained when using `bend run`, so it cannot be considered stable at this time for application in the project.

## I/O and CLI arguments

At the moment, Bend does not have a native interface to operate with Input and Output, but it can accept arguments from the command line. The expression that Bend receives must be any expression that can be included in a line of code, which will be passed as an argument to the `main` function.

The `bend.sh` and `run.sh` files are two tests to try to use a Bash expression and simplify the input of data to the program. However, in both cases errors are observed in the passing of arguments when these are variable, so for now it is considered unfeasible to use this tool to generate usable programs with variable arguments.

## Data types and variables

At the moment, Bend only has limited numeric types, which only support 24-bit integers and floats. While combinations of these can be used to generate more complex structures, it must be considered whether it makes sense at this stage of language development.

## Conclusion

Bend seems an attractive tool for exploring and facilitating the implementation of concurrent programming. However, its current usefulness is limited by several restrictions and shortcomings.

Although it can be used as a basic scripting language, the lack of simple input/output handling in its official implementation represents a significant obstacle.

Integration with C/C++ is possible (albeit limited) by generating source code in C, but the results obtained differ markedly from direct execution of Bend scripts, limiting its applicability in real projects.

In addition, the manipulation of data and command line arguments presents limitations and errors, making it difficult to create utility programs using Bend in its current state of development.
