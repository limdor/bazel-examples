load("@buildifier_prebuilt//:rules.bzl", "buildifier")
load("@rules_cc//cc:defs.bzl", "cc_binary")
load("//hello_world:generator.bzl", "hello_world")

buildifier(
    name = "buildifier",
    lint_mode = "warn",
    mode = "check",
    verbose = True,
)

hello_world(
    name = "code_dive",
)

hello_world(
    name = "ndc_techtown",
)

hello_world(
    name = "everyone",
)

cc_binary(
    name = "hello_world_code_dive",
    srcs = [":code_dive"],
)

cc_binary(
    name = "hello_world_ndc_techtown",
    srcs = [":everyone"],
)

cc_binary(
    name = "hello_world_everyone",
    srcs = [":everyone"],
)
