load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")
load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

buildifier(
    name = "buildifier",
    lint_mode = "warn",
    mode = "check",
    verbose = True,
)

cc_binary(
    name = "main",
    srcs = ["main.cpp"],
    deps = [
        ":bar",
        ":foo",
    ],
)

cc_library(
    name = "bar",
    srcs = ["bar.cpp"],
    hdrs = ["bar.h"],
)

cc_library(
    name = "foo",
    srcs = ["foo.cpp"],
    hdrs = ["foo.h"],
)

cc_test(
    name = "foo_test",
    srcs = ["foo_test.cpp"],
    deps = [
        ":foo",
        "@catch2",
    ],
)
