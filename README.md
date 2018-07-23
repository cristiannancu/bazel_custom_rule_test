# bazel_custom_rule_test

Created a custom rule that compiles c files:
```shell
bazel build //src:cmpc
```

Made it work with a .h include and 2 .c files:
* helper.h, containing the definition of doubleParam (dummy function that just doubles an int --> its implementation is in helper.c)
* hello.c, prints the double of a number

Remarks:
* srcs and hdrs are considered lists of Target (ref: https://docs.bazel.build/versions/master/skylark/lib/Target.html)
* need to include the .h in the inputs of the command as well
* need to specify the paths when working with the command
* need to specify the path of the binary command itself (in this case gcc binary that can be found in root)

TODOs:
* make use of a dependency graph
* work with providers
* work with aspects
