# Virtualization

## [Unicorn](https://github.com/unicorn-engine/unicorn)
> Unicorn CPU emulator framework (ARM, AArch64, M68K, Mips, Sparc, PowerPC, RiscV, S390x, TriCore, X86)

[Showcases -- Unicorn -- The Ultimate CPU emulator](https://www.unicorn-engine.org/showcase/)

- [Bindings](https://github.com/unicorn-engine/unicorn/tree/dev/bindings): Python, Rust, Zig, .NET, Java, Go, Haskell, Ruby, Pascal, VB6.

- `master` is buggy, use `dev`.

  [Incorrect Jitted Code For a SHL Instruction Resulting From a MEM\_WRITE - Issue #1717 - unicorn-engine/unicorn](https://github.com/unicorn-engine/unicorn/issues/1717)

- By default, all targets will be built.

- [Access violation Exception on Visual Studio Debugger - Issue #1841 - unicorn-engine/unicorn](https://github.com/unicorn-engine/unicorn/issues/1841)

### PE
[Unicorn PE: An unicorn based instrumentation project designed to emulate code execution for windows PE files.](https://github.com/hzqst/unicorn_pe)
- Shit for building.
  - No Pre-built binaries.
  - Occasional syntax errors and missing headers
  - Hard-coded `C:\Program Files\CMake\bin\cmake.exe`
  - Mixed CMake and MSBuild in a brute-force way
  - `unicorn_pe`'s CRT is `/MT`, different from all other projects and lead to link errors.

[UniTaint: PoC for a taint based attack on VMProtect](https://github.com/pgarba/UniTaint/tree/master)