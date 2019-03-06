package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "hello_world",
    srcs = ["hello_world.cpp"],
)

cc_test(
    name = "test",
    srcs = ["catch2_test.cpp"],
    deps = ["@catch2//:catch2"]
)
