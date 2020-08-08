load("//third_party/catch2:catch2.bzl", "load_catch2")
load("//third_party/gtest:gtest.bzl", "load_gtest")

def load_third_party_libraries():
    load_catch2()
    load_gtest()
