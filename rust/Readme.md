# Basic Rust example with Bazel

## Goal

Show how to build and execute a binary, how to build a crate, and how to build and run a test.

## About the example

In this example we have declared 3 targets. A library crate, an executable, and a test. The binary and the test depends on the library crate.

* `//:my_lib`: A library crate with a single rs file containing unit tests in the same file. It can be defined in Bazel as follows:

   ```python
   rust_library(
       name = "my_lib",
       srcs = ["my_lib.rs"],
   )
   ```

  `name` is the name for the target, it will also be used to create the library file in the form of `lib<name>-<hash>.rlib`.

  `srcs` is the list of source files needed to generate the create. If more than one file is provided, at least one must be called `lib.rs` or the parameter `crate_root` must be provided specifying the root of the crate.

* `//:hello_world`: A binary that depends on the library mentioned above. It can be defined in Bazel as follows:

  ```python
  rust_binary(
      name = "hello_world",
      srcs = ["hello_world.rs"],
      deps = [":my_lib"],
  )
  ```

  `name` is the name for the target, it will also be used to create the executable file in the form of `<name>` in Unix systems or `<name>.exe` in Windows systems.

  `srcs` is the list of source files needed to generate the executable.

  `deps` is the list of libraries that your binary depends on. In this case we specify the target `:my_lib` that is the library that we want to use in this binary.

* `//:my_test`: A test for target for the tests inside the `my_lib` target. In the end it is an executable also but Bazel will treat it different in several aspects. It can be defined in Bazel as follows:

  ```python
  rust_test(
      name = "my_test",
      crate = ":my_lib",
  )
  ```

  `name` is the name for the target, it will also be used to create the executable file for the test in the form of `<name>` in Unix systems or `<name>.exe` in Windows systems.

  `crate` is the name of the target crate that contains the tests. Typically the crate being tested.

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

If you want to build the executable without running it you call:

```bash
bazel build //:hello_world
```

And if you want to build only the library you can do the same with the target of the library:

```bash
bazel build //:my_lib
```
