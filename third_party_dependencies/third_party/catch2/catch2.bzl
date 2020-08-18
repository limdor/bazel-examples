"""
Dependency to catch2, a unit test framework for C++
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_catch2():
    # It is not clear in Bazel what is the best practice for using http_archive.
    # If you call http_archive without any kind of check, you could call it two times
    # with the same name and different parameters and you would not get any warning/error.
    #
    # One option is to check if it is already available in the existing_rules and only
    # call http_archive if it is not present. In the else you could display a message in
    # case that was already present but in reality you would only want a warning/error if was
    # already called with different parameters (different library version for example).
    #
    # Another option would be to wrap the http_archive in a maybe call but as far as I am
    # aware this would also not display a warning in case that is present but behave like the
    # if check. (TODO: Try if maybe is better than "if check", if it is at least the same it
    # should be prefered because you don't have to repeat the name)
    if "catch2" not in native.existing_rules():
        http_archive(
            name = "catch2",
            url = "https://github.com/catchorg/Catch2/archive/v2.6.1.zip",
            sha256 = "cc21033c8085c83a867153982e90514c6b6072bed8cec0e688663cfcdaa8bb32",
            strip_prefix = "Catch2-2.6.1",
            build_file = "//third_party/catch2:catch2.BUILD",
        )
