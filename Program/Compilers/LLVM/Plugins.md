# Plugins
- [IR pass plugins](#ir-pass-plugins)
- Machine pass plugins: N/A
- LTO plugins
  - `ld.lld -plugin`
- Clang frontend plugins
  - AST
  - `clang -fplugin`

## IR pass plugins
[2025 EuroLLVM - Pass Plugins: Past, Present and Future](https://www.youtube.com/watch?v=pHfYFGVFczs)
- Legacy pass plugins
  - `clang -load`
  - `StaticInitializer`
- Modern pass plugins
  - 2020
  - Still C++ ABI
  - `opt -load -passes`, `opt -load-pass-plugin`
  - `ld.lld --load-pass-plugin` (v15)
  - `clang -fpass-plugin`
  - `rustc -Zllvm-plugins` (`llvm.plugins = true`)
  - No Windows support yet (65K exported symbols limit)
- Extensions
  - Frontend attributes (or procedural macros) + IR pass + driver (runtime library)

Tools:
- [jamesmth/llvm-project: Fork of LLVM for LTO pass plugins support.](https://github.com/jamesmth/llvm-project)
- [llvm-passgen: A small tool for quickly generating LLVM passes](https://github.com/woodruffw/llvm-passgen)

Rust:
- [llvm-plugin-rs: Out-of-tree LLVM passes in Rust](https://github.com/jamesmth/llvm-plugin-rs)
  - Inkwell
  - [ ] `ECOSYSTEM.md`
- [Custom LLVM Pass : r/rust](https://www.reddit.com/r/rust/comments/tyfb2n/custom_llvm_pass/)

Python:
- [aneeshdurg/pyllvmpass: Implement LLVM passes in python](https://github.com/aneeshdurg/pyllvmpass)
- [weliveindetail/llvm-py-pass](https://github.com/weliveindetail/llvm-py-pass)

### Plugins
- Polly
  - No longer out-of-tree
- [open-obfuscator/o-mvll: :electron: O-MVLL is a code obfuscator based on LLVM for native code (Android & iOS)](https://github.com/open-obfuscator/o-mvll)
  - ARM only
