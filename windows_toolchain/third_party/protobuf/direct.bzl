"""
Dependency to protobuf, Google's data interchange format
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_protobuf():
    maybe(
        http_archive,
        name = "com_google_protobuf",
        url = "https://github.com/protocolbuffers/protobuf/archive/v3.13.0.tar.gz",
        sha256 = "9b4ee22c250fe31b16f1a24d61467e40780a3fbb9b91c3b65be2a376ed913a1a",
        strip_prefix = "protobuf-3.13.0",
    )
