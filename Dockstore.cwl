cwlVersion: v1.0
class: Workflow
inputs:
  inp: File
  ex: string

outputs:
  classout:
    type: File
    outputSource: compile/classfile

steps:
  untar:
    run: {include: tar-param.cwl}
    in:
      tarfile: inp
      extractfile: ex
    out: [example_out]

  compile:
    run: {import: arguments.cwl}
    in:
      src: untar/example_out
    out: [classfile]
