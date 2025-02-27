# Intermediate Representations
[Wikipedia](https://en.wikipedia.org/wiki/Intermediate_representation)

> An intermediate representation (IR) is the data structure or code used internally by a compiler or virtual machine to represent source code. An IR is designed to be conducive to further processing, such as optimization and translation.

> A canonical example is found in most modern compilers. For example, the CPython interpreter transforms the linear human-readable text representing a program into an intermediate graph structure that allows flow analysis and re-arrangement before execution. Use of an intermediate representation such as this allows compiler systems like the GNU Compiler Collection and LLVM to be used by many different source languages to generate code for many different target architectures.

## Compiler
- LLVM IR
  - [McSema: Framework for lifting x86, amd64, aarch64, sparc32, and sparc64 program binaries to LLVM bitcode](https://github.com/lifting-bits/mcsema) (discontinued)
  - [r3bb1t/bin\_lift: Rust library for lifting raw binary data to LLVM IR](https://github.com/r3bb1t/bin_lift) (Zydis2llvmIr)

- [pliron: Programming Languages Intermediate Representation](https://github.com/vaivaswatha/pliron)

## Binary analysis
[Modern Binary Analysis with ILs](https://binary.ninja/presentations/Modern%20Binary%20Analysis%20with%20ILs%20with%20notes.pdf) (2019)

[^kimTestingIntermediateRepresentations2017]

IRs:
- IDA: microcode, ctree
  - Lifting is verbose
  - Later optimizations
  - Not designed for reading

  [Decompiler internals: microcode](https://i.blackhat.com/us-18/Thu-August-9/us-18-Guilfanov-Decompiler-Internals-Microcode.pdf)
  - No processor specific stuff
  - One microinstruction does one thing
  - Small number of instructions (only 45 in 1999, now 72)
  - Simple instruction operands (register, number, memory)
    - The microcode engine provides unlimited (in theory) number of microregisters
  - Consider only compiler generated code

  [Some notes about the IDA Microcode (intermediate language).](https://gist.github.com/icecr4ck/6c744d489efbb07a32bb22e8a3c748e3)
  - Obfuscator-LLVM
  - [RolfRolles/HexRaysDeob: Hex-Rays microcode API plugin for breaking an obfuscating compiler](https://github.com/RolfRolles/HexRaysDeob/tree/master)

  [Hex-Rays Microcode API vs. Obfuscating Compiler -- Hex Rays](https://hex-rays.com/blog/hex-rays-microcode-api-vs-obfuscating-compiler)

  [Tiny microcode optimizer -- Hex Rays](https://hex-rays.com/blog/tiny-microcode-optimizer)

  Tools:
  - [patois/genmc: Display Hex-Rays Microcode](https://github.com/patois/genmc)
  - [gaasedelen/lucid: An Interactive Hex-Rays Microcode Explorer](https://github.com/gaasedelen/lucid)

    [Lucid: An Interactive Hex-Rays Microcode Explorer | RET2 Systems Blog](https://blog.ret2.io/2020/09/11/lucid-hexrays-microcode-explorer/)

  - [HexRaysCodeXplorer: Hex-Rays Decompiler plugin for better code navigation](https://github.com/REhints/HexRaysCodeXplorer)

- Ghidra: P-code
  - Sleigh definations

  [P-Code Reference Manual](https://spinsel.dev/assets/2020-06-17-ghidra-brainfuck-processor-1/ghidra_docs/language_spec/html/pcoderef.html)

  [PcodeOp](https://ghidra.re/ghidra_docs/api/ghidra/program/model/pcode/PcodeOp.html)

  [kohnakagawa/PracticalPCode: Practical P-Code examples](https://github.com/kohnakagawa/PracticalPCode)

  Libraries:
  - [sleigh-rs: Ghidra Sleight (PCode) parsing library in Rust.](https://github.com/rbran/sleigh-rs)

- Binary Ninja: BNIL

  [Modern Binary Analysis with ILs](https://binary.ninja/presentations/Modern%20Binary%20Analysis%20with%20ILs%20with%20notes.pdf)

  [BNIL Guide: Overview - Binary Ninja User Documentation](https://docs.binary.ninja/dev/bnil-overview.html)
  - [LLIL](https://docs.binary.ninja/dev/bnil-llil.html)
    - [Vector35/llil\_transpiler: transpile llil to c++ for execution and testing](https://github.com/Vector35/llil_transpiler)

  [Breaking Down Binary Ninja's Low Level IL | Trail of Bits Blog](https://blog.trailofbits.com/2017/01/31/breaking-down-binary-ninjas-low-level-il/)

- Valgrind: VEX IR

  [angr/pyvex: Python bindings for Valgrind's VEX IR.](https://github.com/angr/pyvex)

  Used by Angr.

- BinNavi: REIL
  - Extremely verbose

  [zynamics BinNavi 5.0 Manual - REIL Specification](https://www.zynamics.com/binnavi/manual/html/reil_language.htm)

  [Cr4sh/openreil: Open source library that implements translator and tools for REIL (Reverse Engineering Intermediate Language)](https://github.com/Cr4sh/openreil) (discontinued)
  > Because libasmir uses VEX (production-quality library, part of Valgrind), full code translation sequence inside of OpenREIL is looks as binary → VEX IR → BAP IR → REIL. It's kinda ugly from engineering point of view, but it allows us to have a pretty robust and reliable support of all general instructions of x86.

  [REIL (Reverse Engineering Intermediate Language) - Issue #2292 - x64dbg/x64dbg](https://github.com/x64dbg/x64dbg/issues/2292)

- BAP: BIL

- RetDec

- [GTIRB: Intermediate Representation for Binary analysis and transformation](https://github.com/GrammaTech/gtirb)[^schulteGTIRBIntermediateRepresentation2020]
  - [Ddisasm](../../Rewriting/README.md#reassemblable-disassemblers)

  > The GrammaTech Intermediate Representation for Binaries (GTIRB) is a machine code analysis and rewriting data structure. It is intended to facilitate the communication of binary IR between programs performing binary disassembly, analysis, transformation, and pretty printing. GTIRB is modeled on LLVM-IR, and seeks to serve a similar functionality of encouraging communication and interoperability between tools.

- Falcon IR
- Fugue IR

- [x64dbg/InterObfu: Intermediate x86 instruction representation for use in obfuscation/deobfuscation.](https://github.com/x64dbg/InterObfu)


[^schulteGTIRBIntermediateRepresentation2020]: Schulte, E., Dorn, J., Flores-Montoya, A., Ballman, A., & Johnson, T. (2020). GTIRB: Intermediate Representation for Binaries (No. arXiv:1907.02859). arXiv. https://doi.org/10.48550/arXiv.1907.02859
[^kimTestingIntermediateRepresentations2017]: Kim, S., Faerevaag, M., Jung, M., Jung, S., Oh, D., Lee, J., & Cha, S. K. (2017). Testing intermediate representations for binary analysis. 2017 32nd IEEE/ACM International Conference on Automated Software Engineering (ASE), 353–364. https://doi.org/10.1109/ASE.2017.8115648
