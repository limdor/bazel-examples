"""
Transitive dependencies for buildtools
"""

load("//third_party/bazel_skylib:transitive.bzl", "load_bazel_skylib_transitive_dependencies")
load("//third_party/rules_go:transitive.bzl", "load_rules_go_transitive_dependencies")

def load_buildtools_transitive_dependencies():
    # Make sure that the direct dependencies are fully loaded
    load_bazel_skylib_transitive_dependencies()
    load_rules_go_transitive_dependencies()
