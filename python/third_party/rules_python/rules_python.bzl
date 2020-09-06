"""
Dependency to bazel rules for Python language
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_python():
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
    if "rules_python" not in native.existing_rules():
        http_archive(
            name = "rules_python",
            sha256 = "b5668cde8bb6e3515057ef465a35ad712214962f0b3a314e551204266c7be90c",
            strip_prefix = "rules_python-0.0.2",
            url = "https://github.com/bazelbuild/rules_python/releases/download/0.0.2/rules_python-0.0.2.tar.gz",
        )
