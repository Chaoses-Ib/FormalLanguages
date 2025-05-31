# IR
[LLVM Language Reference Manual --- LLVM documentation](https://llvm.org/docs/LangRef.html)

- SSA
  - > Only *reachable* IR has to be *well-formed*, e.g., wrt. SSA properties

[A Gentle Introduction to LLVM IR - mcyoung](https://mcyoung.xyz/2023/08/01/llvm-ir/)

[Mapping High Level Constructs to LLVM IR --- Mapping High Level Constructs to LLVM IR documentation](https://mapping-high-level-constructs-to-llvm-ir.readthedocs.io/en/latest/index.html)

- LLVM 1.0
  - Pascal-style syntax
  - C-style integer types
  - First-class malloc/free
- LLVM 2.0
  - Sign-less integers
- LLVM 2.7
  - No first-class malloc/free
- LLVM 15
  - Opaque pointers

De-type-ification: Remove redundant type information
- `int, uint` -> `i32`
- `i32*, %struct*` -> `ptr`
- `getelementptr` -> `ptradd`
- `alloca`
- `byval`

Instruction flags:
- Undo canonicalization
- Manifest analysis results
- Convey frontend guarantees

Reducing pointer provenance exposure:
- `capture`
- `ptrtoint` side effect
- `ptrsub`

Constrained FP

Unifying MLIR?

[2025 EuroLLVM - LLVM IR -- Past, Present and Future](https://www.youtube.com/watch?v=gIQEZ3QJz1w)

## Syntax
- `@`: global symbols
- `%`: local symbols / basic block names
- `:`: basic block name suffix in definition

## Manifest constraints and analysis results
- Attributes, metadata
  - Precise
  - Only at call/load boundaries
  - Often get lost (SROA, inlining)
- Instruction flags
  - Imprecise
  - Only certain instructions
- Assumes
  - Precise
  - Undefined behavior rather than poison semantics
  - Often negative optimization impact
- At-use flags (value flags)?
  - Memory overhead

## Libraries
### Rust
- [llvm-ir: LLVM IR in natural Rust data structures](https://github.com/cdisselkoen/llvm-ir)
- [mlir-sys: Rust bindings to the MLIR C API.](https://github.com/mlir-rs/mlir-sys)
  - [Melior: The rustic MLIR bindings in Rust](https://github.com/mlir-rs/melior)
- [Vicis: Manipulate LLVM-IR in Pure Rust](https://github.com/maekawatoshiki/vicis) (discontinued)
- [mollusc: Pure-Rust libraries for parsing, interpreting, and analyzing LLVM](https://github.com/woodruffw/mollusc) (discontinued)
- [cargo-llvm-lines: Count lines of LLVM IR per generic function](https://github.com/dtolnay/cargo-llvm-lines)

[Best LLVM crate for producing LLVM-IR bitcode? : r/rust](https://www.reddit.com/r/rust/comments/1g6zenu/best_llvm_crate_for_producing_llvmir_bitcode/)

[MLIR/LLVM-IR bindings in Rust : r/rust](https://www.reddit.com/r/rust/comments/1h0duiu/mlirllvmir_bindings_in_rust/)
