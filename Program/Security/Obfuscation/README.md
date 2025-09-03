# Obfuscation
**Code obfuscation** is the practice of making code unintelligible, or at the very least, hard to understand[^survey].

Applications:
- Software protection
  
  Though there are several methods for protecting software, such as encryption, server-side execution and native code, obfuscation has been found to be the cheapest and easiest solution to this problem[^protect].
- Malware mitigation

  Many viruses utilize obfuscation techniques to subvert virus scanners by continually changing their code signature with obfuscating transformations[^survey].

## Quality
The quality of an obfuscating transformation is evaluated according to four criteria[^survey]:
1. Potency: How much obscurity it adds to the program
2. Resilience: How diffiult is it to break for an automatic deobfuscator
3. Stealth: How well the obfuscated code blends with the rest of the program
4. Cost: How much computation overhead it adds to the obfuscated application

混淆性能、抗反混淆性能、透明性、开销

## Control-flow obfuscation
- Control-flow flattening

  The ﬁrst step involves decomposing high level control transfers into a series of if-then-goto statements. The second step is to then modify the goto statements such that the target addresses are determined dynamically. These transformations make direct branches dependent on data and results in the ﬂattening of the control ﬂow graph.
- Aggregation transformation

  Break up computations that are logically related and merges computations that are not.[^survey]
- Control ordering transformations

  Randomize the order in which the computations are carried out.[^survey]
- Computation transformations

  Insert new code or make algorithmic changes to source application.[^survey]
- Inline and outline methods
- Clone methods

The key to the success of control transformations is the resilience of opaque predicates and variables. **Opaque predicates and variables** are constructs whose values are known to the obfuscator, but are diﬃcult for the deobfuscator to deduce. An opaque predicate is trivial if a deobfuscator can deduce it by static local analysis, and weak if a deobfuscator can deduce it by static global analysis.[^survey]

## Data-flow obfuscation
- Convert static to procedural data
  
  将静态数据转化为动态计算结果，例如 [string obfuscation](Data/String.md)。
- Split variables
  
  将一个变量拆分为多个变量，对原有变量的操作转换为对拆分变量的操作。[^survey]
- Merge scalar variables
- Restructuring data arrays

  These transformations include[^survey]:
  - Splitting an array
  - Merging two or more arrays
  - Flattening an array (i.e. decrease
the dimensions of the array)
  - Folding the array (i.e. increase the dimensions of the array).
- Modifying inheritance relations

  The complexity of a program increases with greater depth of the inheritance tree. Along these lines, we can artiﬁcially increase the complexity of a program either by splitting up a class or by inserting a new bogus class.[^survey]

## ISA-level obfuscation
- Junk insertion
- Dead code insertion
- Instruction substitution
- Branch functions
- Call conversion obfuscation
- Virtual-machine-based code obfuscation

  The fundamental idea is to convert a portion of the code to a diﬀerent machine code. This new code is then executed by a new virtual machine interpreter included in the obfuscated code. There is usually one to two orders of magnitude slowdown for each level of interpretation, and so this transformation should only be used for those sections of code that consumes a small part of the total runtime.[^survey]

## Tools
- [EgeBalci/deoptimizer: Evasion by machine code de-optimization.](https://github.com/EgeBalci/deoptimizer)
- [xObf: Simple x86/x86\_64 instruction level obfuscator based on a basic SBI engine](https://github.com/d35ha/xObf)

LLVM:
- [Obfuscator-LLVM](https://github.com/obfuscator-llvm/obfuscator/wiki)
  
  > As we currently mostly work at the Intermediate Representation (IR) level, our tool is compatible with all programming languages (C, C++, Objective-C, Ada and Fortran) and target platforms (x86, x86-64, PowerPC, PowerPC-64, ARM, Thumb, SPARC, Alpha, CellSPU, MIPS, MSP430, SystemZ, and XCore) currently supported by LLVM.

- [Hikari: LLVM Obfuscator](https://github.com/HikariObfuscator/Hikari) (discontinued)
  - [Hikari-LLVM15: A fork of Hikari Obfuscator \[WIP\]](https://github.com/61bcdefg/Hikari-LLVM15)

- [eshard/obfuscator-llvm](https://github.com/eshard/obfuscator-llvm)

- [llvm-yx-callobfuscator: LLVM plugin to transparently apply stack spoofing and indirect syscalls to Windows x64 native calls at compile time.](https://github.com/janoglezcampos/llvm-yx-callobfuscator)

- [baby\_obfuscator: Using LLVM Pass to obfuscate program](https://github.com/chenx6/baby_obfuscator)

- [Obfvious: A LLVM & Clang (version 12) based compiler that allows for Windows binaries obfuscation](https://github.com/nimrodpar/Obfvious)

C++:
- [ADVobfuscator: Obfuscation library based on C++11/14 and metaprogramming](https://github.com/andrivet/ADVobfuscator) (discontinued)
- [obfy: A tiny C++ obfuscation framework](https://github.com/fritzone/obfy) (discontinued)
- [cpp-obfuscator: C++ implementation of compile time obfuscator](https://github.com/revsic/cpp-obfuscator) (discontinued)
- [C++11 metaprogramming applied to software obfuscation](https://www.blackhat.com/docs/eu-14/materials/eu-14-Andrivet-C-plus-plus11-Metaprogramming-Applied-To-software-Obfuscation-wp.pdf)

Rust:
- [goldberg: A Rust-based obfuscation macro library!](https://github.com/frank2/goldberg)
- [rust-obfuscator: Automatic Rust Obfuscator and Macro Library](https://github.com/dronavallipranav/rust-obfuscator)
- [debugoff: Linux anti-debugging and anti-analysis rust library](https://github.com/0xor0ne/debugoff)
- x86-64
  - [guardian-rs: x86-64 code/pe virtualizer](https://github.com/vmctx/guardian-rs)
  - [x64-virtualizer-rs: x86-64 virtualizing obfuscator written in Rust](https://github.com/cursey/x64-virtualizer-rs)

[Malware development part 6 - advanced obfuscation with LLVM and template metaprogramming -- 0xPat blog -- Red/purple teamer](https://0xpat.github.io/Malware_development_part_6/)


[^survey]: Balakrishnan, Arini, and Chloe Schulze. “Code Obfuscation Literature Survey,” n.d., 10.
[^protect]: Christian S. Collberg and Clark Thomborson. Watermarking, tamper-prooﬁng, and obfuscation - tools for software protection. In IEEE Transactions on Software Engineering, volume 28, pages 735–746, August 2002.