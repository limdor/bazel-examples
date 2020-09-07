"""
Dependency to protobuf, Google's data interchange format
"""

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_protobuf():
    # It is not clear in Bazel what is the best practice for using http_archive.
    # If you call http_archive without any kind of check, you could call it two times
    # with the same name and different parameters and you would not get any warning/error.
    #
    # One option is to check if it is already available in the existing_rules and only
    # call http_archive if it is not present. In the else you could display a message in
    # case that was already present but in reality you would only want a warning/error if was
    # already called with different parameters (different library version for example).
    #
    # Another option is to wrap the http_archive in a maybe call but this will also not display
    # a warning. It behaves like the if check with the advantage that the name has not to be
    # repeated
    maybe(
        http_archive,
        name = "com_google_protobuf",
        url = "https://github.com/protocolbuffers/protobuf/archive/v3.12.4.tar.gz",
        sha256 = "512e5a674bf31f8b7928a64d8adf73ee67b8fe88339ad29adaa3b84dbaa570d8",
        strip_prefix = "protobuf-3.12.4",
    )
