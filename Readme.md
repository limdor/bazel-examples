# Bazel with third party dependencies

## Goal
This wants to be a small Bazel workspace example that uses third party dependencies but is well structured
following the principles of software development.
Because of this, we want to keep the following requirements:
* We don't want all the dependencies in the workspace.
* When we change the version of a dependency, only one file that contains exclusively this dependency is modified.
* One a new dependency is added, we want the minimum amount of changes in common files.

## How to try it out?
In this example you can find a C++ binary and a C++ test using [Catch2](https://github.com/catchorg/Catch2) Catch2.

You can run the C++ example with the following command:
```
bazel test //:hello_world
```

You can run the tests with the following command:
```
bazel test //:all --test_arg "--reporter compact" --test_arg --success --test_output=streamed
```

If you want to know more about the parameters of the bazel command, you can check [here](https://docs.bazel.build/versions/master/command-line-reference.html)
