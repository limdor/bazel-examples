"""
Dependency to bazel buildtools where buildifier is located
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_buildtools():
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
        name = "com_github_bazelbuild_buildtools",
        url = "https://github.com/bazelbuild/buildtools/archive/refs/tags/v7.1.1.tar.gz",
        sha256 = "60a9025072ae237f325d0e7b661e1685f34922c29883888c2d06f5789462b939",
        strip_prefix = "buildtools-7.1.1",
    )
