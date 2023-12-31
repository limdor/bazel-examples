"""
Dependency to bazel rules for Go language
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_rules_go():
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
        name = "io_bazel_rules_go",
        sha256 = "b6828eb2d03bb5ef76f2077f8670b211fe792e77ddb83450ea9f887df04db9c7",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.44.1/rules_go-v0.44.1.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.44.1/rules_go-v0.44.1.zip",
        ],
    )
