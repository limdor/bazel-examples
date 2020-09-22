"""
Dependency to protobuf, Google's data interchange format
"""

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_protobuf():
    maybe(
        http_archive,
        name = "com_google_protobuf",
        url = "https://github.com/protocolbuffers/protobuf/archive/v3.12.4.tar.gz",
        sha256 = "512e5a674bf31f8b7928a64d8adf73ee67b8fe88339ad29adaa3b84dbaa570d8",
        strip_prefix = "protobuf-3.12.4",
    )
