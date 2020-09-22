"""
Dependency to bazel buildtools where buildifier is located
"""

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_buildtools():
    maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        url = "https://github.com/bazelbuild/buildtools/archive/3.4.0.tar.gz",
        sha256 = "315dad13406928011b467ca7f2748a59ae817477f9129e1edaae75deb73e9b78",
        strip_prefix = "buildtools-3.4.0",
    )
