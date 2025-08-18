"""
Macro to generate a hello world cpp file
"""

def _hello_world_impl(name, visibility, **kwargs):
    native.genrule(
        name = name,
        srcs = [name + ".txt"],
        outs = [name + ".cpp"],
        cmd = "$(location //hello_world:generator) $< $@",
        tools = ["//hello_world:generator"],
        visibility = visibility,
        **kwargs
    )

hello_world = macro(
    implementation = _hello_world_impl,
)
