# Bazel examples

| AppVeyor | Bazel CI |
| :------: | :------: |
| [![ci status](https://ci.appveyor.com/api/projects/status/7mr1q92rev7h02ca/branch/master?svg=true)](https://ci.appveyor.com/project/limdor/bazel-examples/branch/master) | [![ci status](https://badge.buildkite.com/3787c2c8d9e240573e30b06b5bfa5bd071110fd5fde45a8dd4.svg?branch=master)](https://buildkite.com/bazel/limdor-bazel-examples) |

Bazel examples that extend use cases present in the [official bazel examples](https://github.com/bazelbuild/examples).
Some of these examples are explained also in the presentation [Introduction to Bazel to build C++ and Python](https://www.youtube.com/watch?v=vEQQ9QOVpdU).

List of examples:

* [Bazel with third party dependencies](./third_party_dependencies/)
* [Basic C++ example](./cpp/)
* [Basic code coverage computation for C++](./cpp_coverage/)
* [Basic Python example](./python/)
* [Bazel Macros: Generate cpp files using Python](./cpp_and_python/)
* [Explicitly declare autodetected C++ toolchain when compiling on Linux](./linux_toolchain/)
* [Explicitly declare autodetected C++ toolchain when compiling on Windows](./windows_toolchain/)
