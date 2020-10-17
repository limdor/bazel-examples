"""
File with all 3rd party dependencies needed for the project
"""

load("//third_party/rules_python:direct.bzl", "load_rules_python")

def load_third_party_libraries():
    """Load all third party dependencies"""
    load_rules_python()
