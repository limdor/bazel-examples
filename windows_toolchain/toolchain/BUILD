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
load("@rules_cc//cc:defs.bzl", "cc_toolchain")
load(":windows_cc_toolchain_config.bzl", "cc_toolchain_config")
load(":utils.bzl", "semicolon_separated")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "empty",
    srcs = [],
)

toolchain(
    name = "my_windows_toolchain",
    exec_compatible_with = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":cc-compiler-x64_windows",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

cc_toolchain(
    name = "cc-compiler-x64_windows",
    all_files = ":empty",
    ar_files = ":empty",
    as_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 1,
    toolchain_config = ":msvc_x64",
    toolchain_identifier = "msvc_x64",
)

_BUILD_TOOLS_INSTALL_PATH = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\"
_MSVC_VERSION = "14.29.30037"
_WINDOWS_10_SDK_VERSION = "10.0.19041.0"
_MSVC_INSTALL_PATH = "{}VC\\Tools\\MSVC\\{}\\".format(_BUILD_TOOLS_INSTALL_PATH, _MSVC_VERSION)

_BUILTIN_INCLUDE_DIRECTORIES = [
    "{}include".format(_MSVC_INSTALL_PATH),
    "C:\\Program Files (x86)\\Windows Kits\\10\\include\\{}\\ucrt".format(_WINDOWS_10_SDK_VERSION),
    "C:\\Program Files (x86)\\Windows Kits\\10\\include\\{}\\shared".format(_WINDOWS_10_SDK_VERSION),
    "C:\\Program Files (x86)\\Windows Kits\\10\\include\\{}\\um".format(_WINDOWS_10_SDK_VERSION),
    "C:\\Program Files (x86)\\Windows Kits\\10\\include\\{}\\winrt".format(_WINDOWS_10_SDK_VERSION),
    "C:\\Program Files (x86)\\Windows Kits\\10\\include\\{}\\cppwinrt".format(_WINDOWS_10_SDK_VERSION),
]

cc_toolchain_config(
    name = "msvc_x64",
    abi_libc_version = "local",
    abi_version = "local",
    archiver_flags = ["/MACHINE:X64"],
    compiler = "msvc-cl",
    cpu = "x64_windows",
    cxx_builtin_include_directories = _BUILTIN_INCLUDE_DIRECTORIES,
    dbg_mode_debug_flag = "/DEBUG:FULL",
    default_link_flags = ["/MACHINE:X64"],
    fastbuild_mode_debug_flag = "/DEBUG:FASTLINK",
    host_system_name = "local",
    msvc_cl_path = "{}bin/HostX64/x64/cl.exe".format(_MSVC_INSTALL_PATH),
    msvc_env_include = semicolon_separated(_BUILTIN_INCLUDE_DIRECTORIES),
    msvc_env_lib = semicolon_separated([
        "{}lib\\x64".format(_MSVC_INSTALL_PATH),
        "C:\\Program Files (x86)\\Windows Kits\\10\\lib\\{}\\ucrt\\x64".format(_WINDOWS_10_SDK_VERSION),
        "C:\\Program Files (x86)\\Windows Kits\\10\\lib\\{}\\um\\x64".format(_WINDOWS_10_SDK_VERSION),
    ]),
    msvc_env_path = semicolon_separated([
        "{}MSBuild\\Current\\bin\\Roslyn".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}bin\\HostX64\\x64".format(_MSVC_INSTALL_PATH),
        "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\{}\\x64".format(_WINDOWS_10_SDK_VERSION),
        "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x64",
        "{}MSBuild\\Current\\Bin".format(_BUILD_TOOLS_INSTALL_PATH),
        "C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319",
        "{}Common7\\IDE\\".format(_BUILD_TOOLS_INSTALL_PATH),
        "{}Common7\\Tools\\".format(_BUILD_TOOLS_INSTALL_PATH),
        "C:\\WINDOWS\\system32",
    ]),
    msvc_env_tmp = "C:\\Users\\xavib\\AppData\\Local\\Temp",
    msvc_lib_path = "{}bin/HostX64/x64/lib.exe".format(_MSVC_INSTALL_PATH),
    msvc_link_path = "{}bin/HostX64/x64/link.exe".format(_MSVC_INSTALL_PATH),
    msvc_ml_path = "{}bin/HostX64/x64/ml64.exe".format(_MSVC_INSTALL_PATH),
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
    },
    toolchain_identifier = "msvc_x64",
)
