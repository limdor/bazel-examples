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
    name = "my_test",
    srcs = ["test.cpp"],
    deps = [":my_lib"],
)
