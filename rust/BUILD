load("@buildifier_prebuilt//:rules.bzl", "buildifier")
load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library", "rust_test")

package(default_visibility = ["//visibility:public"])

buildifier(
    name = "buildifier",
    lint_mode = "warn",
    mode = "check",
    verbose = True,
)

rust_binary(
    name = "hello_world",
    srcs = ["hello_world.rs"],
    deps = [":my_lib"],
)

rust_library(
    name = "my_lib",
    srcs = ["my_lib.rs"],
)

rust_test(
    name = "my_test",
    crate = ":my_lib",
)
