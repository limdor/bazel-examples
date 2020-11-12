"""
Macro to generate a hello world cpp file
"""

def hello_world(name, visibility = None):
    native.genrule(
        name = name,
        srcs = [name + ".txt"],
        outs = [name + ".cpp"],
        cmd = "$(location //hello_world:generator) $< $@",
        tools = ["//hello_world:generator"],
        visibility = visibility,
    )
