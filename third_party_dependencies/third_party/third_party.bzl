load("//third_party/catch2:catch2.bzl", "load_catch2")
load("//third_party/gtest:gtest.bzl", "load_gtest")
load("//third_party/rules_go:rules_go.bzl", "load_rules_go")
load("//third_party/gazelle:gazelle.bzl", "load_gazelle")
load("//third_party/protobuf:protobuf.bzl", "load_protobuf")
load("//third_party/buildtools:buildtools.bzl", "load_buildtools")

def load_third_party_libraries():
    load_catch2()
    load_gtest()
    load_rules_go()
    load_gazelle()
    load_protobuf()
    load_buildtools()
