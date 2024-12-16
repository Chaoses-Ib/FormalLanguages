# [K](https://kframework.org/)
[GitHub](https://github.com/runtimeverification/k)

> K is a rewrite-based executable semantic framework in which programming languages, type systems and formal analysis tools can be defined using configurations and rules. Configurations organize the state in units called cells, which are labeled and can be nested. K rewrite rules make it explicit which parts of the term are read-only, write-only, read-write, or unused. This makes K suitable for defining truly concurrent languages even in the presence of sharing. Computations are represented as syntactic extensions of the original language abstract syntax, using a nested list structure which sequentializes computational tasks, such as program fragments. Computations are like any other terms in a rewriting environment: they can be matched, moved from one place to another, modified, or deleted. This makes K suitable for defining control-intensive features such as abrupt termination, exceptions, or call/cc.

[K Tutorial | Runtime Verification Inc](https://kframework.org/k-distribution/k-tutorial/)

- What is K? Just another programming language? But with some formal analysis features? Or is "a compiler" more appropriate?

  Like parser generators but includes semantics too.

[k-editor-support: Plugin files for editing K files](https://github.com/runtimeverification/k-editor-support)

## Backends
- [LLVM](https://github.com/runtimeverification/llvm-backend)

  > The LLVM Backend is a concrete execution engine, meaning that it is only capable of rewriting concrete configurations.

- [Haskell](https://github.com/runtimeverification/haskell-backend)

  > By contrast, the Haskell Backend performs symbolic execution, which is capable of rewriting any configuration, including those where parts of the configuration are symbolic, ie, contain variables or uninterpreted functions.

- Java (deprecated)

[Lesson 1.20: K Backends and the Haskell Backend | Runtime Verification Inc](https://kframework.org/k-distribution/k-tutorial/1_basic/20_backends/)

## Languages
- x86-64: [X86-64-semantics: Semantics of x86-64 in K](https://github.com/kframework/X86-64-semantics)
- Wasm: [wasm-semantics: A Formal Semantics of WebAssembly in K](https://github.com/runtimeverification/wasm-semantics)
- LLVM IR: [llvm-semantics: Formal semantics of LLVM IR in K](https://github.com/kframework/llvm-semantics) (discontinued)
- C: [c-semantics: Semantics of C in K](https://github.com/kframework/c-semantics)
- Rust: [MIR Semantics](https://github.com/runtimeverification/mir-semantics)
- Java: [java-semantics: The semantics of Java in K](https://github.com/kframework/java-semantics) (discontinued)
- Python: [python-semantics: The semantics of Python in K](https://github.com/runtimeverification/python-semantics) (discontinued)
- JS: [KJS: A Complete Formal Semantics of JavaScript](https://github.com/kframework/javascript-semantics) (discontinued)
- Haskell: [haskell-core-semantics: Haskell's Core in K.](https://github.com/kframework/haskell-core-semantics) (discontinued)