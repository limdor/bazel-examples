"""
Transitive dependencies for gazelle
"""

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

def load_gazelle_transitive_dependencies():
    gazelle_dependencies()
