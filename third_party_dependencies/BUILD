load("@buildifier_prebuilt//:rules.bzl", "buildifier")
load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

buildifier(
    name = "buildifier",
    lint_mode = "warn",
    mode = "check",
    verbose = True,
)

cc_binary(
    name = "hello_world",
    srcs = ["hello_world.cpp"],
    deps = [":my_lib"],
)

cc_library(
    name = "my_lib",
    srcs = ["my_lib.cpp"],
    hdrs = ["my_lib.h"],
)

cc_test(
    name = "catch2_test",
    srcs = ["catch2_test.cpp"],
    deps = [
        ":my_lib",
        "@catch2",
        "@catch2//:catch2_main",
    ],
)

cc_test(
    name = "gtest_test",
    srcs = ["gtest_test.cpp"],
    deps = [
        ":my_lib",
        "@googletest//:gtest",
        "@googletest//:gtest_main",
    ],
)
