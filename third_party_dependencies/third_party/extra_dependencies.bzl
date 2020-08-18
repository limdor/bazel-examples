"""
File to load the dependencies of the dependencies

This could be done when loading the specific dependency, the problem with that approach would
be that we would not have control over the dependency version.
In this way if a third party library depends on some package that we also depend on, first we
load the package with the version that we want, and then the third party library has already the
package.
"""

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

def load_extra_dependencies():
    go_rules_dependencies()
    go_register_toolchains()
    gazelle_dependencies()
    protobuf_deps()
