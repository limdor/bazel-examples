package(default_visibility = ["//visibility:public"])

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
        "@catch2//:catch2",
        ":my_lib",
    ],
)

cc_test(
    name = "gtest_test",
    srcs = ["gtest_test.cpp"],
    deps = [
        "@gtest//:gtest",
        "@gtest//:gtest_main",
        ":my_lib",
    ],
)
