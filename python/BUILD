load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")
load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")

buildifier(
    name = "buildifier",
    lint_mode = "warn",
    mode = "check",
    verbose = True,
)

py_binary(
    name = "bin",
    srcs = ["bin.py"],
    deps = [":lib"],
)

py_library(
    name = "lib",
    srcs = [
        "__init__.py",
        "lib.py",
    ],
)

py_test(
    name = "test",
    srcs = ["test.py"],
    deps = [":lib"],
)
