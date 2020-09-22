"""
Dependency to bazel rules for Go language
"""

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_go():
    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "0310e837aed522875791750de44408ec91046c630374990edd51827cb169f616",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.23.7/rules_go-v0.23.7.tar.gz",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.23.7/rules_go-v0.23.7.tar.gz",
        ],
    )
