"""
Transitive dependencies for bazel rules for Python language
"""

load("@rules_python//python:repositories.bzl", "py_repositories")

def load_rules_python_transitive_dependencies():
    py_repositories()
