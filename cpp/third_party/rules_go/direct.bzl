"""
Dependency to bazel rules for Go language
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_rules_go():
    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "b6828eb2d03bb5ef76f2077f8670b211fe792e77ddb83450ea9f887df04db9c7",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.44.1/rules_go-v0.44.1.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.44.1/rules_go-v0.44.1.zip",
        ],
    )
