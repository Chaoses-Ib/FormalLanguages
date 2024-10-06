# Name Mangling
[Wikipedia](https://en.wikipedia.org/wiki/Name_mangling)

Tools:
- [Compiler Explorer](https://godbolt.org/)
- LLM

## Languages
- C
- C++
  - GCC: Start with `_Z`, `__Z`, `___Z` or `____Z`
  - Clang
  - MSVC: Start with `?` or `@?`
    - RTTI: Start with `.`

    [Visual C++ name mangling - Wikiversity](https://en.m.wikiversity.org/wiki/Visual_C%2B%2B_name_mangling)
    - No arguments in name-only names
    - Include the return type
    - 父函数有参数时 lambda 会变成全局的，但 method 不会
    - 函数内 method 和空参数函数内的 lambda 从属于 `` `func' ``

  GCC vs. Clang:
  - [Mangling difference between GCC and clang - Issue #55171 - llvm/llvm-project](https://github.com/llvm/llvm-project/issues/55171)
  - [Different mangled name for template specialization for clang and gcc - Issue #62765 - llvm/llvm-project](https://github.com/llvm/llvm-project/issues/62765)

  GCC, Clang vs. MSVC:
  - `func()`
    - GCC/Clang: `_Z4funcv`
      - `func()`
    - MSVC: `?func@@YAHXZ`
      - `int __cdecl func(void)`
        - `func`
  - `func(int)`
    - Clang: `_Z4funci`
      - `func(int)`
    - MSVC: `?func@@YAHH@Z`
      - `int __cdecl func(int)`
        - `func`
  - `func()` lambda
    - GCC: `_ZZ4funcvENKUlvE_clEv`
      - `func()::{lambda()#1}::operator()() const`
    - Clang: `_ZZ4funcvENK3$_0clEv`
      - `func()::$_0::operator()() const`
    - MSVC: `??R<lambda_1>@?1??func@@YAHXZ@QEBA@XZ`
      - ``public: __cdecl `int __cdecl func(void)'::`2'::<lambda_1>::operator()(void) const``
        - `` `func'::`2'::<lambda_1>::operator() ``
  - `func(int)` lambda
    - Clang: `_ZZ4funciENK3$_0clEv`
      - `func(int)::$_0::operator()() const`
    - MSVC: `??R<lambda_fab226a428f701539bd67a4d25ef65c8>@@QEBA@XZ`
      - ``public: __cdecl <lambda_fab226a428f701539bd67a4d25ef65c8>::operator()(void) const``
        - `<lambda_fab226a428f701539bd67a4d25ef65c8>::operator()`
  - `func()` method
    - GCC/Clang: `_ZZ4funcvEN5Class6methodEv`
      - `func()::Class::method()`
    - MSVC: `?method@Class@?1??func@@YAHXZ@QEAAHXZ`
      - ``public: int __cdecl `int __cdecl func(void)'::`2'::Class::method(void)``
        - `` `func'::`2'::Class::method ``
  - `func(int)` method
    - Clang: `_ZZ4funciEN5Class6methodEv`
      - `func(int)::Class::method()`
    - MSVC: `?method@Class@?1??func@@YAHH@Z@QEAAHXZ`
      - ``public: int __cdecl `int __cdecl func(int)'::`2'::Class::method(void)``
        - `` `func'::`2'::Class::method ``

  ```cpp
  #include <stdio.h>

  int func(int a) {
      auto lambda = [](){
          return 123;
      };
      struct Class {
          int method() {
              return 456;
          }
      } obj;
      printf("%d %d", lambda(), obj.method());
      return 456;
  }

  int main() {
      func(789);
  }
  ```
  [Convert GCC under Cygwin Name Mangling to VC++ Name Mangling](https://gcc-help.gcc.gnu.narkive.com/8ikYYHZN/convert-gcc-under-cygwin-name-mangling-to-vc-name-mangling)

  要是有天才混编 GCC/Clang 和 MSVC 的话就更乱了。

- Rust
  - `legacy`: Start with `_ZN`, and filename hashes are used for disambiguation
    ```regex
    ^_ZN(?:[1-9]\d*[[:alpha:]_][[:alnum:]_$.]*)+17h[0-9a-f]{16}E$
    ```
    [Is there any way to distinguish Rust legacy mangle name from C++ mangle name? - Stack Overflow](https://stackoverflow.com/questions/78309962/is-there-any-way-to-distinguish-rust-legacy-mangle-name-from-c-mangle-name)

    - Information about generic parameters and other things is lost in the mangling process. One cannot extract the type arguments of a monomorphized function from its symbol name.
    - The current scheme is inconsistent: most paths use Itanium ABI style encoding, but some don’t.
    - The symbol names it generates can contain `.` characters which is not generally supported on all platforms.
    - It depends on compiler internals and its results cannot be replicated by another compiler implementation or external tool.

  - `v0`: Start with `_R`

    [2603-rust-symbol-name-mangling-v0 - The Rust RFC Book](https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html)
    - [Tracking issue for RFC 2603, "Rust Symbol Mangling (v0)" - Issue #60705 - rust-lang/rust](https://github.com/rust-lang/rust/issues/60705)
    ```
    _RNvNtCs1234_7mycrate3foo3bar
    <>^^^^^<----><------><--><-->
    ||||||   |      |     |   |
    ||||||   |      |     |   +--- "bar" identifier
    ||||||   |      |     +------- "foo" identifier
    ||||||   |      +------------- "mycrate" identifier
    ||||||   +-------------------- disambiguator for "mycrate"
    |||||+------------------------ start-tag for "mycrate"
    ||||+------------------------- namespace tag for "foo"
    |||+-------------------------- start-tag for "foo"
    ||+--------------------------- namespace tag for "bar"
    |+---------------------------- start-tag for "bar"
    +----------------------------- common Rust symbol prefix
    ```

  [Symbol Mangling - The rustc book](https://doc.rust-lang.org/rustc/symbol-mangling/index.html)

- Objective-C: Start with `-[` or `+[`, end with `]`
- Swift
- Java
- Python
- Pascal
- Fortran

[Anyone use "pretty" name mangling in their language implementation? : r/ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/comments/12m738n/anyone_use_pretty_name_mangling_in_their_language/)

## Mangling
Rust:
- [What about manually mangling rust symbols (NOT demangling) : r/rust](https://www.reddit.com/r/rust/comments/1ay6bop/what_about_manually_mangling_rust_symbols_not/)

## Demangling
- [symbolic-demangle: Demangling support for various languages and compilers.](https://github.com/getsentry/symbolic/tree/master/symbolic-demangle)
  - C++ (GCC, clang and MSVC), Rust (legacy/v0), Objective C/C++, Swift (5.2)
  - `cpp_demangle`, `msvc-demangler`, `rustc-demangle`
- [rz-libdemangle: Rizin Library to demangle symbols](https://github.com/rizinorg/rz-libdemangle)
  - C++ (GCC, clang and MSVC), Rust, Objective C, Swift, Pascal
- [libiberty](https://github.com/gcc-mirror/gcc/tree/master/libiberty)
  - C++, Rust (legacy/v0)
  - Tools: binutils, gdb, perf
- [llvm-undname](https://github.com/llvm/llvm-project/blob/main/llvm/tools/llvm-undname/llvm-undname.cpp)
  - C++, Rust (legacy/v0)

C++:
- [pharos-demangle: Demangles C++ symbol names genarated by Microsoft Visual C++ in order to retrieve the original C++ declarations.](https://github.com/cmu-sei/pharos-demangle)
- Rust
  - [cpp\_demangle: A crate for demangling C++ symbols](https://github.com/gimli-rs/cpp_demangle)
    - AST
    - [MSVC demangling - Issue #36 ](https://github.com/gimli-rs/cpp_demangle/issues/36)
    - [Add Rust demangling mode - Issue #63](https://github.com/gimli-rs/cpp_demangle/issues/63)

  - [undname-rs: A purely Rust-based implementation of a Microsoft symbol demangler](https://github.com/Ryan-rsm-McKenzie/undname-rs) ([r/rust](https://www.reddit.com/r/rust/comments/1d7r0m1/undname_a_microsoft_symbol_demangler/))
    - Ported from llvm-undname
    - > My [benchmarks](https://github.com/Ryan-rsm-McKenzie/undname-rs/tree/main/benches) show `undname` performs slightly faster than `msvc-demangler`, while having a much greater level of support for the wide variety of mangled string formats available in wild. It also supports most of the flags you can pass to `UnDecorateSymbolName`, so it is a fairly frictionless drop-in replacement for existing applications wishing to migrate from Dbghelp.
    - Wasm: 90 KiB
    - [Larger build size than msvc-demangler - Issue #1](https://github.com/Ryan-rsm-McKenzie/undname-rs/issues/1)

  - [msvc-demangler-rust: A rust library that demangles / undecorates C++ symbols mangled by MSVC](https://github.com/mstange/msvc-demangler-rust) (inactive)
    - > `msvc-demangler` is missing support for a wide variety of mangled strings, and I legitimately need support for these things. Take the mangled name `.?AVtype_info@@` for example. Microsoft's `undname` can demangle it as follows: `undname 0x2000 ?AVtype_info@@` \=> `class type_info`. However `msvc-demangler` is completely incapable of demangling them. For those who are not in the know, Microsoft's implementation of [std::type\_info::name](https://en.cppreference.com/w/cpp/types/type_info/name) works by passing strings just like these directly to `UnDecorateSymbolName`, so they're very common to find in image files. It's startling to see a demangler *not* support these strings.
    - Wasm: 68 KiB

  There are no names only can be handled by msvc-demangler in my test:

  Case | Count
  --- | ---
  Only by undname | 11,445
  Only by msvc-demangler | 0
  Neither by both | 6,322
  By both | 49,931

  undname performs much better than msvc-demangler. I think it's worth the 13 KiB cost.

- Wine: [undname.c](https://gitlab.winehq.org/wine/wine/-/blob/HEAD/dlls/msvcrt/undname.c)
  - VMProtect

- Windows: [UnDecorateSymbolName()](https://learn.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-undecoratesymbolnamew)
  - > `UnDecorateSymbolName` is notoriously buggy. It does not play nicely with mangled strings from all sources (e.g. it behaves differently depending on whether the mangled string comes from an image file, or from a pdb), it often misses things that are encoded in the mangled string (e.g. Microsoft's `undname` demangles `?x@@3QEAHEA` as `int * __ptr64 __ptr64 x`, when the correct demangling is `int *const x`), and its flags sometimes do not play well with each other.
  - > Dbghelp is notoriously one of the remaining single-threaded Win32 apis, and it is very hard/impossible to synchronize access across crates.

  Tools: `undname`

- Web: [GCC and MSVC C++ Demangler](https://demangler.com/)

Rust:
- [rust-lang/rustc-demangle: Rust symbol demangling](https://github.com/rust-lang/rustc-demangle)
  - [demangle()](https://github.com/rust-lang/rustc-demangle/blob/f053741061bd1686873a467a7d9ef22d2f1fb876/src/lib.rs#L92-L146)
    - `.llvm.`, `_ZN`/`ZN`/`__ZN`, `_R`/`R`/`__R`
  - [rustfilt: Demangle Rust symbols](https://github.com/luser/rustfilt)
- [Demangle Rust symbols - Issue #371 - rui314/mold](https://github.com/rui314/mold/issues/371)