"""
Dependency to bazel buildtools where buildifier is located
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_buildtools():
    maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        url = "https://github.com/bazelbuild/buildtools/archive/refs/tags/v7.1.0.tar.gz",
        sha256 = "061472b3e8b589fb42233f0b48798d00cf9dee203bd39502bd294e6b050bc6c2",
        strip_prefix = "buildtools-7.1.0",
    )
