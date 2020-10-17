"""
File with all 3rd party dependencies needed for the project
"""

load("//third_party/bazel_skylib:direct.bzl", "load_bazel_skylib")
load("//third_party/buildtools:direct.bzl", "load_buildtools")
load("//third_party/protobuf:direct.bzl", "load_protobuf")
load("//third_party/rules_go:direct.bzl", "load_rules_go")
load("//third_party/rules_python:direct.bzl", "load_rules_python")

def load_third_party_libraries():
    """Load all third party dependencies"""
    load_bazel_skylib()
    load_buildtools()
    load_protobuf()
    load_rules_go()
    load_rules_python()
