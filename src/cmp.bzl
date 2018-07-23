def _compile_impl(ctx):
    # print(dir(ctx.attr.srcs[0].files))
    # print(ctx.attr.cmd.files.to_list()[0].path)

    srcs_files = []
    for target in ctx.attr.srcs:
        srcs_files += target.files.to_list()
    hdrs_files = []
    for target in ctx.attr.hdrs:
        hdrs_files += target.files.to_list()

    command = "%s %s -o %s" % (ctx.attr.cmd.files.to_list()[0].path, " ".join([src.path for src in srcs_files]), ctx.outputs.out.path)
    print(command)

    ctx.actions.run_shell(
        outputs = [ctx.outputs.out],
        inputs = srcs_files + hdrs_files,
        command = command,
    )

compile = rule(
    implementation = _compile_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "hdrs": attr.label_list(allow_files = True),
        "cmd": attr.label(allow_files = True)
    },
    outputs = {"out": "%{name}"},
)

# def compile(name, src,  cmd):
#     _compile(name = name, src = src,  cmd = cmd)
