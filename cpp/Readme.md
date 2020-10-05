# Basic C++ example with Bazel

## Goal

Show how to build and execute a binary, how to build a library, and how to build and run a test.

## About the example

In this example we have declared 3 targets. A library, an executable and a test. The binary and the test depends on the library.

* `//:my_lib`: A library with a public header and a single cpp file. It can be defined in Bazel as follows:

   ```python
   cc_library(
       name = "my_lib",
       srcs = ["my_lib.cpp"],
       hdrs = ["my_lib.h"],
   )
   ```

  `name` is the name for the target, it will also be used to create the library file in the form of `lib<name>.a` or `lib<name>.so` depending on whether is a dynamic or a static library.

  `hdrs` is the list of public headers of the library, your interface to the rest of the world.

  `srcs` is the list of source files needed to generate the library, including private headers and cpp files. The public header files should not be present in this parameter, they are defined in `hdrs`.

* `//:hello_world`: A binary that depends on the library mentioned above. It can be defined in Bazel as follows:

  ```python
  cc_binary(
      name = "hello_world",
      srcs = ["hello_world.cpp"],
      deps = [":my_lib"],
  )
  ```

  `name` is the name for the target, it will also be used to create the executable file in the form of `<name>` in Unix systems or `<name>.exe` in Windows systems.

  `srcs` is the list of source files needed to generate the executable.

  `deps` is the list of libraries that your binary depends on. In this case we specify the target `:my_lib` that is the library that we want to use in this binary.

* `//:my_test`: A test for `my_lib` target. In the end it is an executable also but Bazel will treat it different in several aspects. It can be defined in Bazel as follows:

  ```python
  cc_test(
      name = "my_test",
      srcs = ["test.cpp"],
      deps = [":my_lib"],
  )
  ```

  `name` is the name for the target, it will also be used to create the executable file for the test in the form of `<name>` in Unix systems or `<name>.exe` in Windows systems.

  `srcs` is the list of source files needed to generate the test executable. The requirement like a binary is that it has to contain a `main` function that returns an `int`. If it returns an 0 it is considered like the test passed, otherwise is considered as failure.

  `deps` like for the binary, is the list of libraries that your test depends on.

## How to try it out

To run the executable you call:

```bash
bazel run //:hello_world
```

It will run the executable and display the output on the terminal.

To run the test you call:

```bash
bazel test //:my_test
```

It will run the test without showing any output from the test but a Bazel output indicating if the test succeeded or failed.

```bash
//:my_test                    PASSED in 0.0s
```

A test, compared to a binary executed with `bazel run` will not be allways executed. If Bazel detects that nothing changed it will cache the result of th test and show it in the report.

```bash
//:my_test           (cached) PASSED in 0.0s
```
