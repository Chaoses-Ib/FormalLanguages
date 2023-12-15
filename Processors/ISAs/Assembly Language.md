# Assembly Language
[Wikipedia](https://en.wikipedia.org/wiki/Assembly_language)

## Syntax
[^syntax-wiki]
- Intel syntax
- AT&T syntax

> intel语法更简洁，看起来顺眼，但是AT&T语法也有其优点，典型如宏参数[^att-csdn]

### Intel syntax
Configuration:
- GCC/Clang[^syntax-gcc-so-1][^syntax-gcc-so-2]
  - `.intel_syntax noprefix`
  - `-masm=intel -mnaked-reg`
- GDB: [set disassembly-flavor intel](https://visualgdb.com/gdbreference/commands/set_disassembly-flavor)  
  Permanent:
  ```sh
  echo "set disassembly-flavor intel" >> ~/.gdbinit
  ```
- objdump[^syntax-objdump]: `objdump -M intel`
  - llvm-objdump: `-x86-asm-syntax=intel`

### AT&T syntax
[AT&T汇编_移动开发_weixin_34245749的博客 - CSDN 博客](https://blog.csdn.net/weixin_34245749/article/details/93182186)

[^syntax-wiki]: [x86 assembly language - Wikipedia](https://en.wikipedia.org/wiki/X86_assembly_language#Syntax)
[^att-csdn]: [AT&T 和 Intel汇编学哪种比较好？？？-CSDN社区](https://bbs.csdn.net/topics/392505424)
[^syntax-gcc-so-1]: [c - Can I use Intel syntax of x86 assembly with GCC? - Stack Overflow](https://stackoverflow.com/questions/9347909/can-i-use-intel-syntax-of-x86-assembly-with-gcc)
[^syntax-gcc-so-2]: [assembly - How to set gcc or clang to use Intel syntax permanently for inline asm() statements? - Stack Overflow](https://stackoverflow.com/questions/38953951/how-to-set-gcc-or-clang-to-use-intel-syntax-permanently-for-inline-asm-stateme)
[^syntax-objdump]: [linux - How can objdump emit intel syntax - Stack Overflow](https://stackoverflow.com/questions/10362630/how-can-objdump-emit-intel-syntax)

## Assemblers
[Wikipedia](https://en.wikipedia.org/wiki/Assembly_language#Assembler)

- [iced: Blazing fast and correct x86/x64 disassembler, assembler, decoder, encoder for Rust, .NET, Java, Python, Lua](https://github.com/icedland/iced)
- [Keystone assembler framework: Core (Arm, Arm64, Hexagon, Mips, PowerPC, Sparc, SystemZ & X86) + bindings](https://github.com/keystone-engine/keystone)
- [Zydis: Fast and lightweight x86/x86-64 disassembler and code generation library](https://github.com/zyantific/zydis)
- [AsmJit: Low-latency machine code generation](https://github.com/asmjit/asmjit)
- [Xbyak: a JIT assembler for x86(IA-32)/x64(AMD64, x86-64) MMX/SSE/SSE2/SSE3/SSSE3/SSE4/FPU/AVX/AVX2/AVX-512 by C++ header](https://github.com/herumi/xbyak)
- [lend: Tiny x86 Length Disassembler](https://github.com/greenbender/lend)

## IDEs
- Visual Studio
  - [AsmDude2: Visual Studio extension for assembly syntax highlighting and code completion in assembly files and the disassembly window](https://github.com/HJLebbink/asm-dude)