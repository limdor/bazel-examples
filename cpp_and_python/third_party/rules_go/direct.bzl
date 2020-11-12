"""
Dependency to bazel rules for Go language
"""

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_go():
    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "b725e6497741d7fc2d55fcc29a276627d10e43fa5d0bb692692890ae30d98d00",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.24.3/rules_go-v0.24.3.tar.gz",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.24.3/rules_go-v0.24.3.tar.gz",
        ],
    )
