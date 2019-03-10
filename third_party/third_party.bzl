load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_third_party_libraries():
    http_archive(
        name = "catch2",
        url = "https://github.com/catchorg/Catch2/archive/v2.6.1.zip",
        sha256 = "cc21033c8085c83a867153982e90514c6b6072bed8cec0e688663cfcdaa8bb32",
        strip_prefix = "Catch2-2.6.1",
        build_file = "//third_party:catch2.BUILD",
    )
    http_archive(
        name = "gtest",
        url = "https://github.com/google/googletest/archive/release-1.8.1.zip",
        sha256 = "927827c183d01734cc5cfef85e0ff3f5a92ffe6188e0d18e909c5efebf28a0c7",
        strip_prefix = "googletest-release-1.8.1",
    )
