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

cc_toolchain_config(
    name = "msvc_x64",
    abi_libc_version = "local",
    abi_version = "local",
    archiver_flags = ["/MACHINE:X64"],
    compiler = "msvc-cl",
    cpu = "x64_windows",
    cxx_builtin_include_directories = [
        "C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Tools\\MSVC\\14.44.35207\\include",
        "C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Auxiliary\\VS\\include",
        "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\ucrt",
        "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\um",
        "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\shared",
        "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\winrt",
        "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\cppwinrt",
    ],
    dbg_mode_debug_flag = "/DEBUG:FULL",
    default_link_flags = ["/MACHINE:X64"],
    fastbuild_mode_debug_flag = "/DEBUG:FASTLINK",
    host_system_name = "local",
    msvc_cl_path = "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/cl.exe",
    msvc_env_include = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Tools\\MSVC\\14.44.35207\\include;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Auxiliary\\VS\\include;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\um;C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\winrt;C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.22621.0\\\\cppwinrt",
    msvc_env_lib = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Tools\\MSVC\\14.44.35207\\lib\\x64;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.22621.0\\ucrt\\x64;C:\\Program Files (x86)\\Windows Kits\\10\\\\lib\\10.0.22621.0\\\\um\\x64",
    msvc_env_path = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Tools\\MSVC\\14.44.35207\\bin\\HostX64\\x64;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\IDE\\VC\\VCPackages;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TestWindow;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\MSBuild\\Current\\bin\\Roslyn;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Team Tools\\DiagnosticsHub\\Collector;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\IDE\\Extensions\\Microsoft\\CodeCoverage.Console;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.22621.0\\\\x64;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\\\x64;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\\\MSBuild\\Current\\Bin\\amd64;C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\Tools\\;;C:\\WINDOWS\\system32;C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\IDE\\VC\\Linux\\bin\\ConnectionManagerExe",
    msvc_env_tmp = "C:\\Users\\xavib\\AppData\\Local\\Temp",
    msvc_lib_path = "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/lib.exe",
    msvc_link_path = "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/link.exe",
    msvc_ml_path = "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/ml64.exe",
    supports_parse_showincludes = True,
    target_libc = "msvcrt",
    target_system_name = "local",
    tool_paths = {
        "ar": "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/lib.exe",
        "ml": "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/ml64.exe",
        "cpp": "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/cl.exe",
        "gcc": "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/cl.exe",
        "gcov": "wrapper/bin/msvc_nop.bat",
        "ld": "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/link.exe",
        "nm": "wrapper/bin/msvc_nop.bat",
        "objcopy": "wrapper/bin/msvc_nop.bat",
        "objdump": "wrapper/bin/msvc_nop.bat",
        "strip": "wrapper/bin/msvc_nop.bat",
        "dumpbin": "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/dumpbin.exe",
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
