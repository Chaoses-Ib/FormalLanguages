# Binary Rewriting
[SystemSecurityStorm/Awesome-Binary-Rewriting: An awesome & curated list of binary rewriting papers](https://github.com/SystemSecurityStorm/Awesome-Binary-Rewriting)

二进制重写大约可以分成四种类型：
- 把指令翻译成内部 IR
- 把程序反汇编成完整汇编项目，可以重新汇编成程序
- 把指令翻译成 LLVM IR
- 只进行 jmp 修改

e9patch 这种只进行 jmp 修改的兼容性最好，但是只能用来加代码；LLVM IR 因为不知道类型，用起来不太合适，可能要模拟堆栈，有些语义也会丢失；内部 IR 和完整反汇编兼容性都相对还行。

## Tests
- [backengineering/bintests: A large collection of 32bit and 64bit PE files useful for verifying the correctness of bin2bin transformations](https://github.com/backengineering/bintests)

## Direct rewriting
> Zipr lifts a binary into an Intermediate Representation Data Base (IRDB) upon which transformations may be applied. The IRDB can then be written directly to a binary executable. Similarly, Egalito lifts a binary into a low-level Intermediate Representation (IR), provides an API for transforming this IR, and supports lowering this IR back to a modified binary.[^schulteBroadComparativeEvaluation2022]

- [Zipr](https://git.zephyr-software.com/opensrc/zipr)

  > Zipr is a tool for static binary rewriting, first published in 2016. Zipr was engineered to support arbitrary program modification with an emphasis on low overhead, robustness, and flexibility to perform security enhancements and instrumentation. Originally targeted to Linux x86-32 binaries, Zipr now supports 32- and 64-bit binaries for X86, ARM, and MIPS architectures, as well as preliminary support for Windows programs.[^hiserZiprHighImpactRobust2023]

- Egalito

- multiverse

- [B.L.A.R.E. (Binary Lifting and Recompiler Engine)](https://back.engineering/blare) (paid)

  A Rust-based framework designed to be the ultimate Swiss Army knife for compiled binaries. The framework is currently focused on Windows executable files and x86.

  - Control flow recover

    [Technical Challenges of Indirect Control Flow --- CodeDefender](https://codedefender.io/blog/2024/07/02)
  - Full support for exception handling
  - Custom IR and compiler

    > We developed our own IR and compiler entirely from scratch using Rust. This approach enables us to work at a granular level, staying closely aligned with instructions, while ensuring continuous support for SEH across the entire framework.

  有可能就是用 Rust 把 Zipr 重写了下，把主要支持 x86-32 变成了主要支持 x86-64。

- VMProtect (paid)

What are the differences between IRs for binary rewriting and for [binary analysis](../Analysis/IR/README.md#binary-analysis)?

## Reassemblable disassemblers
Reassemblable disassemblers, reassemblers

> disassembly to assembly code that can be readily reassembled

用起来相对方便，缺点是链接出错就完全用不了了。

- [Datalog Disassembly (Ddisasm)](https://github.com/GrammaTech/ddisasm)[^flores-montoyaDatalogDisassembly2020]
  - Asm/GTIRB
  - Docker
- Retrowrite
- Uroboros
- Ramblr[^wangRamblrMakingReassembly2017a]
- angr
  - [angr/analyses/reassembler.py](https://github.com/angr/angr/blob/master/angr/analyses/reassembler.py)

  [Binary rewriting - Issue #1118 - angr/angr](https://github.com/angr/angr/issues/1118)

  [Reassembler example? - Issue #417 - angr/angr](https://github.com/angr/angr/issues/417)
- IDA?

## LLVM rewriting
> lift binaries to LLVM IR

> Although LLVM has a large user community and provides many analysis, optimization, and hardening passes, there are two properties of its IR that make it difficult for lifters to target:
> - First, it requires type information to represent data. This requires binary type analysis, which is prohibitively difficult at the scale required to rewrite large programs. Instead, many tools explicitly emulate the stack, stack maintenance around function calls, and memory as a large array of bytes. The lack of true types and stack/memory emulation limits the utility of most existing LLVM passes and results in baroque and inefficient rewritten binaries.
> - Second, LLVM represents code in static single assignment form resulting in a loss of specificity with respect to the original instructions.[^schulteBroadComparativeEvaluation2022]

- mctoll
- ReOpt
- revng

## Trampoline rewriting
> Trampoline rewriters such as e9patch minimally disturb the memory image of the original binary. New code is placed outside of the original image and the only changes within the image are jumps to this new code, which itself jumps back to the original code. Trampoline rewriting can be very robust as it requires minimal binary analysis (e.g., symbolization is not necessary), however it is only well-suited to additive transformation. The original code cannot be modified, moved, optimized, or removed easily or effectively.[^schulteBroadComparativeEvaluation2022]

- [e9patch: A powerful static binary rewriting tool](https://github.com/GJDuck/e9patch)

  [《Binary Rewriting without Control Flow Recovery》论文笔记 | Kiprey's Blog](https://kiprey.github.io/2022/02/e9patch/)

- [BNHook: binary ninja plugin for adding custom hooks to executables](https://github.com/jeffli678/bnhook)


[^schulteBroadComparativeEvaluation2022]: Schulte, E., Brown, M. D., & Folts, V. (2022). A Broad Comparative Evaluation of x86-64 Binary Rewriters. Proceedings of the 15th Workshop on Cyber Security Experimentation and Test, 129–144. https://doi.org/10.1145/3546096.3546112
[^hiserZiprHighImpactRobust2023]: Hiser, J. D., Nguyen-Tuong, A., & Davidson, J. W. (2023). Zipr: A High-Impact, Robust, Open-source, Multi-platform, Static Binary Rewriter (No. arXiv:2312.00714; Version 1). arXiv. https://doi.org/10.48550/arXiv.2312.00714
[^wangRamblrMakingReassembly2017a]: Wang, R., Shoshitaishvili, Y., Bianchi, A., Machiry, A., Grosen, J., Grosen, P., Kruegel, C., & Vigna, G. (2017). Ramblr: Making Reassembly Great Again. Proceedings 2017 Network and Distributed System Security Symposium. Network and Distributed System Security Symposium, San Diego, CA. https://doi.org/10.14722/ndss.2017.23225
[^flores-montoyaDatalogDisassembly2020]: Flores-Montoya, A., & Schulte, E. (2020). Datalog Disassembly. 1075–1092. https://www.usenix.org/conference/usenixsecurity20/presentation/flores-montoya
