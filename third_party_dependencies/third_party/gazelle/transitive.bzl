"""
Transitive dependencies for gazelle
"""

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("//third_party/rules_go:transitive.bzl", "load_rules_go_transitive_dependencies")

def load_gazelle_transitive_dependencies():
    # gazelle depends on rules_go, we need to load its transitive dependencies before loading
    # the transitive dependencies of gazelle
    load_rules_go_transitive_dependencies()

    gazelle_dependencies()
