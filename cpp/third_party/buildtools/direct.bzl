"""
Dependency to bazel buildtools where buildifier is located
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_buildtools():
    maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        url = "https://github.com/bazelbuild/buildtools/archive/refs/tags/v8.0.1.tar.gz",
        sha256 = "91727456f1338f511442c50a8d827ae245552642d63de2bc832e6d27632ec300",
        strip_prefix = "buildtools-8.0.1",
    )
