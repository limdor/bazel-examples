# Bazel with third party dependencies using Bzlmod

## Goal

This is a small Bazel example that uses third party dependencies ([also called external dependencies](https://docs.bazel.build/versions/master/external.html))
with Bzlmod.
Bzlmod was introduced in Bazel 6 as opt-in, enabled by default in Bazel 7 and 8, and it is planned to be the only way to deal with external dependencies in Bazel 9.

This is an update of [the original example that was showing go to dealing with external dependencies before Bzlmod](https://github.com/limdor/bazel-examples/tree/v1.7.0/third_party_dependencies/). If you are familiar with the original example, you will see that now it is extreamly simplified how to deal with external dependencies.

## About the example

When Bzlmod is enabled, the main workspace file is `MODULE.bazel`. In this file is where you have to put the third party dependency that you want to use.

```py
bazel_dep(name = "buildifier_prebuilt", version = "8.2.0.2", dev_dependency = True)
bazel_dep(name = "catch2", version = "3.8.1", dev_dependency = True)
bazel_dep(name = "googletest", version = "1.16.0.bcr.1", dev_dependency = True)

bazel_dep(name = "rules_cc", version = "0.1.2")
```

The `bazel_dep` parameters have the following purpose:

- `name` defines the name of the Bazel module to be used. You can search for modules in the [Bazel central registry](https://registry.bazel.build/)
- `version` is the version of the module to be used.
- `dev_dependency` is set to `False` by default and defines whether the dependency is needed only during the development of the module. This dependency will not propagate transitively. This means that if you depend on a module that has dev dependencies, you will not get these dependencies.

And this is all you have to do an external dependency. You do not have to care of the transitive dependencies. Bazel will take care of the dependency resolution and if it cannot resolve it, it will show an error.

Once you build the first time, a `MODULE.bazel.lock` file gets created. This is the mechanism to pin the version of all dependencies (direct and transitive) that will be used. By default, this file will get updated every time to that you run a Bazel command.

## How to try it out

In this example you can find a C++ binary, a C++ library and two C++ tests, one using [Catch2](https://github.com/catchorg/Catch2) and the other one using [Google Test](https://github.com/google/googletest).

You can run the C++ binary with the following command:

```bash
bazel run //:hello_world
```

You can run the tests with the following command:

```bash
bazel test //:all --test_output=streamed
```

For the Catch2 test, you can add additinal parameters for a nicer output:

```bash
bazel test //:catch2_test --test_arg "--reporter compact" --test_arg --success --test_output=streamed
```

If you want to know more about the parameters of the bazel command, you can check [the command line reference](https://docs.bazel.build/versions/master/command-line-reference.html).
