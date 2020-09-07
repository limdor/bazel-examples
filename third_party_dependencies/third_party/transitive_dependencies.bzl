"""
File to load the dependencies of the dependencies

This could be done when loading the specific dependency, the problem with that approach would
be that we would not have control over the dependency version.
In this way if a third party library depends on some package that we also depend on, first we
load the package with the version that we want, and then the third party library has already the
package.
"""

load("//third_party/catch2:transitive.bzl", "load_catch2_transitive_dependencies")
load("//third_party/gtest:transitive.bzl", "load_gtest_transitive_dependencies")
load("//third_party/rules_go:transitive.bzl", "load_rules_go_transitive_dependencies")
load("//third_party/gazelle:transitive.bzl", "load_gazelle_transitive_dependencies")
load("//third_party/protobuf:transitive.bzl", "load_protobuf_transitive_dependencies")
load("//third_party/buildtools:transitive.bzl", "load_buildtools_transitive_dependencies")

def load_transitive_dependencies():
    """Load all third party transitive dependencies"""
    load_buildtools_transitive_dependencies()
    load_catch2_transitive_dependencies()
    load_gazelle_transitive_dependencies()
    load_gtest_transitive_dependencies()
    load_protobuf_transitive_dependencies()

    # rules_go transitive dependencies have been already load when loading gazell
    # transitive dependencies but we should be able to load them again because we cannot
    # know that
    load_rules_go_transitive_dependencies()
