"""
Dependency to protobuf, Google's data interchange format
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_protobuf():
    maybe(
        http_archive,
        name = "com_google_protobuf",
        url = "https://github.com/protocolbuffers/protobuf/archive/v3.19.5.tar.gz",
        sha256 = "b9df93c30f096e2ec39e04b923e74efb59d6835c0569d3e15c3c1ac3dbf17855",
        strip_prefix = "protobuf-3.19.5",
    )
