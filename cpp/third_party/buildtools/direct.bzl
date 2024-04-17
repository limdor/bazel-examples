"""
Dependency to bazel buildtools where buildifier is located
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_buildtools():
    maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        url = "https://github.com/bazelbuild/buildtools/archive/refs/tags/v7.1.1.tar.gz",
        sha256 = "60a9025072ae237f325d0e7b661e1685f34922c29883888c2d06f5789462b939",
        strip_prefix = "buildtools-7.1.1",
    )
