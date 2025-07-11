# Copyright 2018 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This becomes the BUILD file for @local_config_cc// under Windows.

load("@rules_cc//cc:cc_library.bzl", "cc_library")
load("@rules_cc//cc/toolchains:cc_toolchain.bzl", "cc_toolchain")
load(":utils.bzl", "semicolon_separated")
load(":windows_cc_toolchain_config.bzl", "cc_toolchain_config")

package(default_visibility = ["//visibility:public"])

cc_library(name = "empty_lib")

# Label flag for extra libraries to be linked into every binary.
# TODO(bazel-team): Support passing flag multiple times to build a list.
label_flag(
    name = "link_extra_libs",
    build_setting_default = ":empty_lib",
)

# The final extra library to be linked into every binary target. This collects
# the above flag, but may also include more libraries depending on config.
cc_library(
    name = "link_extra_lib",
    deps = [
        ":link_extra_libs",
    ],
)

cc_library(
    name = "malloc",
)

filegroup(
    name = "empty",
    srcs = [],
)

filegroup(
    name = "msvc_compiler_files",
    srcs = [
        "msvc_deps_scanner_wrapper_arm.bat",
        "msvc_deps_scanner_wrapper_arm64.bat",
        "msvc_deps_scanner_wrapper_x64.bat",
        "msvc_deps_scanner_wrapper_x86.bat",
        ":builtin_include_directory_paths_msvc",
    ],
)

cc_toolchain(
    name = "cc-compiler-x64_windows",
    all_files = ":empty",
    ar_files = ":empty",
    as_files = ":msvc_compiler_files",
    compiler_files = ":msvc_compiler_files",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 1,
    toolchain_config = ":msvc_x64",
    toolchain_identifier = "msvc_x64",
)

_BUILD_TOOLS_INSTALL_PATH = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\"

_MSVC_VERSION = "14.42.34433"

_WINDOWS_10_SDK_PATH = "C:\\Program Files (x86)\\Windows Kits\\10\\"

_WINDOWS_10_SDK_VERSION = "10.0.22621.0"

_WINDOWS_10_SDK_INCLUDES = "{}include\\{}\\".format(_WINDOWS_10_SDK_PATH, _WINDOWS_10_SDK_VERSION)

_WINDOWS_10_SDK_LIB = "{}lib\\{}\\".format(_WINDOWS_10_SDK_PATH, _WINDOWS_10_SDK_VERSION)

_MSVC_INSTALL_PATH = "{}VC\\Tools\\MSVC\\{}\\".format(_BUILD_TOOLS_INSTALL_PATH, _MSVC_VERSION)

_CPP_INCLUDE_DIRECTORIES = [
    "{}include".format(_MSVC_INSTALL_PATH),
    "{}VC\\Auxiliary\\VS\\include".format(_BUILD_TOOLS_INSTALL_PATH),
    "{}ucrt".format(_WINDOWS_10_SDK_INCLUDES),
    "{}um".format(_WINDOWS_10_SDK_INCLUDES),
    "{}shared".format(_WINDOWS_10_SDK_INCLUDES),
    "{}winrt".format(_WINDOWS_10_SDK_INCLUDES),
    "{}cppwinrt".format(_WINDOWS_10_SDK_INCLUDES),
]

cc_toolchain_config(
    name = "msvc_x64",
    abi_libc_version = "local",
    abi_version = "local",
    archiver_flags = ["/MACHINE:X64"],
    compiler = "msvc-cl",
    cpu = "x64_windows",
    cxx_builtin_include_directories = _CPP_INCLUDE_DIRECTORIES,
    dbg_mode_debug_flag = "/DEBUG:FULL",
    default_link_flags = ["/MACHINE:X64"],
    fastbuild_mode_debug_flag = "/DEBUG:FASTLINK",
    host_system_name = "local",
    msvc_cl_path = "{}bin/HostX64/x64/cl.exe".format(_MSVC_INSTALL_PATH),
    msvc_env_include = semicolon_separated(_CPP_INCLUDE_DIRECTORIES),
    msvc_env_lib = semicolon_separated([
        "{}lib\\x64".format(_MSVC_INSTALL_PATH),
        "{}ucrt\\x64".format(_WINDOWS_10_SDK_LIB),
        "{}um\\x64".format(_WINDOWS_10_SDK_LIB),
    ]),
    msvc_env_path = semicolon_separated([
        "{}bin\\HostX64\\x64".format(_MSVC_INSTALL_PATH),
        "{}Common7\\IDE\\VC\\VCPackages".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}Common7\\IDE\\CommonExtensions\\Microsoft\\TestWindow".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}MSBuild\\Current\\bin\\Roslyn".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}Team Tools\\DiagnosticsHub\\Collector".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}Common7\\IDE\\Extensions\\Microsoft\\CodeCoverage.Console".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}bin\\{}\\\\x64".format(_WINDOWS_10_SDK_PATH, _WINDOWS_10_SDK_VERSION),
        "{}bin\\\\x64".format(_WINDOWS_10_SDK_PATH),
        "{}\\MSBuild\\Current\\Bin\\amd64".format(_BUILD_TOOLS_INSTALL_PATH),
        "C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319",
        "{}Common7\\IDE\\".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}Common7\\Tools\\".format(_BUILD_TOOLS_INSTALL_PATH),
        "C:\\WINDOWS\\system32",
        "{}Common7\\IDE\\VC\\Linux\\bin\\ConnectionManagerExe".format(_BUILD_TOOLS_INSTALL_PATH),
    ]),
    msvc_env_tmp = "C:\\Users\\xavib\\AppData\\Local\\Temp",
    msvc_lib_path = "{}bin/HostX64/x64/lib.exe".format(_MSVC_INSTALL_PATH),
    msvc_link_path = "{}bin/HostX64/x64/link.exe".format(_MSVC_INSTALL_PATH),
    msvc_ml_path = "{}bin/HostX64/x64/ml64.exe".format(_MSVC_INSTALL_PATH),
    supports_parse_showincludes = True,
    target_libc = "msvcrt",
    target_system_name = "local",
    tool_paths = {
        "ar": "{}bin/HostX64/x64/lib.exe".format(_MSVC_INSTALL_PATH),
        "ml": "{}bin/HostX64/x64/ml64.exe".format(_MSVC_INSTALL_PATH),
        "cpp": "{}bin/HostX64/x64/cl.exe".format(_MSVC_INSTALL_PATH),
        "gcc": "{}bin/HostX64/x64/cl.exe".format(_MSVC_INSTALL_PATH),
        "gcov": "wrapper/bin/msvc_nop.bat",
        "ld": "{}bin/HostX64/x64/link.exe".format(_MSVC_INSTALL_PATH),
        "nm": "wrapper/bin/msvc_nop.bat",
        "objcopy": "wrapper/bin/msvc_nop.bat",
        "objdump": "wrapper/bin/msvc_nop.bat",
        "strip": "wrapper/bin/msvc_nop.bat",
        "dumpbin": "{}bin/HostX64/x64/dumpbin.exe".format(_MSVC_INSTALL_PATH),
        "cpp-module-deps-scanner": "msvc_deps_scanner_wrapper_x64.bat",
    },
    toolchain_identifier = "msvc_x64",
)

toolchain(
    name = "cc-toolchain-x64_windows",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
    ],
    toolchain = ":cc-compiler-x64_windows",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
