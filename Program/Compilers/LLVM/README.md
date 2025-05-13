# [LLVM](https://www.llvm.org/)
[Wikipedia](https://en.wikipedia.org/wiki/LLVM), [GitHub](https://github.com/llvm/llvm-project)

[A Gentle Introduction to LLVM IR - mcyoung](https://mcyoung.xyz/2023/08/01/llvm-ir/)

[How bad is LLVM really? | Handmade Network](https://c3.handmade.network/blog/p/8852-how_bad_is_llvm_really) ([r/ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/comments/19ae8jb/how_bad_is_llvm_really/))

[awesome-llvm-security: awesome llvm security](https://github.com/gmh5225/awesome-llvm-security)

[rust-lang/llvm-project: Rust-specific fork of LLVM.](https://github.com/rust-lang/llvm-project)

## Bindings
Rust:
- [llvm-sys](https://gitlab.com/taricorp/llvm-sys.rs)
  - [Inkwell: It's a New Kind of Wrapper for Exposing LLVM (Safely)](https://github.com/TheDan64/inkwell)
  - [UnionCompilerDesign/safe\_llvm: Toochain for interacting safely with llvm\_sys. Built for the SICC project.](https://github.com/UnionCompilerDesign/safe_llvm) (discontinued)
    - ~~[UnionCompilerDesign/compiler_core](https://github.com/UnionCompilerDesign/compiler_core)~~

## IR
Rust:
- [llvm-ir: LLVM IR in natural Rust data structures](https://github.com/cdisselkoen/llvm-ir)
- [mlir-sys: Rust bindings to the MLIR C API.](https://github.com/mlir-rs/mlir-sys)
  - [Melior: The rustic MLIR bindings in Rust](https://github.com/mlir-rs/melior)
- [Vicis: Manipulate LLVM-IR in Pure Rust](https://github.com/maekawatoshiki/vicis) (discontinued)
- [mollusc: Pure-Rust libraries for parsing, interpreting, and analyzing LLVM](https://github.com/woodruffw/mollusc) (discontinued)
- [cargo-llvm-lines: Count lines of LLVM IR per generic function](https://github.com/dtolnay/cargo-llvm-lines)

[Best LLVM crate for producing LLVM-IR bitcode? : r/rust](https://www.reddit.com/r/rust/comments/1g6zenu/best_llvm_crate_for_producing_llvmir_bitcode/)

[MLIR/LLVM-IR bindings in Rust : r/rust](https://www.reddit.com/r/rust/comments/1h0duiu/mlirllvmir_bindings_in_rust/)

## Backends
- C++
  - [LLIL Transpiler: transpile llil to c++ for execution and testing](https://github.com/Vector35/llil_transpiler)
