# Basic Python example with Bazel

## Goal

Show how to declare and execute a binary, how to declare a library, and how to declare and run a test.

## About the example

In this example we have declared 3 targets. A library, an application and a test. The binary and the test depends on the library.

* `//:lib`: A Pyhton library. It can be defined in Bazel as follows:

  ```python
  py_library(
      name = "lib",
      srcs = [
          "__init__.py",
          "lib.py",
      ],
  )
  ```

  `name` is the name for the target.

  `srcs` is the list of Python files needed to generate the library.

* `//:bin`: A binary that depends on the library mentioned above. It can be defined in Bazel as follows:

  ```python
  py_binary(
      name = "bin",
      srcs = ["bin.py"],
      deps = [":lib"],
  )
  ```

  `name` is the name for the target, it will also be used to identify which of the `srcs` files is the entry point of the application.

  `srcs` is the list of source files needed to generate the target. The file that has the same name like the target is considered the entry point of the application. `py_binary` has also the option to specify the parameter `main` to specify which file is the entry point of the application.

  `deps` is the list of libraries that the binary depends on. In this case we specify the target `:lib` that is the library that we want to use in this binary.

* `//:test`: A test for `lib` target. In the end it is very similar to a `py_binary` but Bazel will treat it different in several aspects. It can be defined in Bazel as follows:

  ```python
  py_test(
      name = "test",
      srcs = ["test.py"],
      deps = [":lib"],
  )
  ```

  `name` is the name for the target, like `py_binary` it will also be used to identify which of the `srcs` files is the entry point of the application. `py_test` also allows to define `main` as a parameter.

  `srcs` is the list of source files needed to generate the test target. The requirement like a binary is that it has to contain a `__main__` function (`if __name__ == "__main__":`). If it exits with a 0 it is considered that the test passed, otherwise is considered as failure.

  `deps` like for the binary, is the list of libraries that your test depends on.

## How to try it out

To run the application you call:

```bash
bazel run //:bin
```

It will run the application and display the output on the terminal.

To run the test you call:

```bash
bazel test //:test
```

It will run the test without showing any output from the test but a Bazel output indicating if the test succeeded or failed.

```bash
//:test                       PASSED in 0.0s
```

A test, compared to an application executed with `bazel run` will not be allways executed. If Bazel detects that nothing changed it will cache the result of the test and show it in the report.

```bash
//:test              (cached) PASSED in 0.0s
```
