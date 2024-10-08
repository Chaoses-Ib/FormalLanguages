# Linkers
[Wikipedia](https://en.wikipedia.org/wiki/Linker_(computing))

## Function orders
- MSVC
  - [/ORDER (Put Functions in Order) | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/reference/order-put-functions-in-order)
    - COMDAT by `/Gy`

    > The linker *automatically* prepends an underscore (`_`) to function names in the response file unless the name starts with a question mark (`?`) or at sign (`@`).

    "automatically" means cdecl?

  - `.text$X`

    [Shuffling function addresses in C/C++ with MSVC -- lallous' lab](http://lallouslab.net/2018/03/26/shuffling-function-addresses-in-c-c-with-msvc/)

    [visual c++ - How to control the order of sections in MSVC x86 compiled binaries? - Stack Overflow](https://stackoverflow.com/questions/47704336/how-to-control-the-order-of-sections-in-msvc-x86-compiled-binaries)

- GCC/Clang `-ffunction-sections`
  - LLD `--symbol-ordering-file`
  - GOLD `--section-ordering-file`
  - BFD linker scripts
  - MOLD: N/A

  [A practical guide to linker section ordering | Red Hat Developer](https://developers.redhat.com/articles/2024/06/13/practical-guide-linker-section-ordering#linker_section_ordering)

[linker - How can I force the order of functions in a binary with the gcc toolchain? - Stack Overflow](https://stackoverflow.com/questions/6614209/how-can-i-force-the-order-of-functions-in-a-binary-with-the-gcc-toolchain)

## Linker scripts
[Everything You Never Wanted To Know About Linker Script - mcyoung](https://mcyoung.xyz/2021/06/01/linker-script/)

[Scripts - Untitled](https://sourceware.org/binutils/docs-2.21/ld/Scripts.html#Scripts)
> The main purpose of the linker script is to describe how the sections in the input files should be mapped into the output file, and to control the memory layout of the output file. Most linker scripts do nothing more than this. However, when necessary, the linker script can also direct the linker to perform many other operations, using the commands described below.