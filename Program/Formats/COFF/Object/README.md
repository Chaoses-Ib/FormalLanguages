# Object Files
[Wikipedia](https://en.wikipedia.org/wiki/Object_file)

[Object code - Wikipedia](https://en.wikipedia.org/wiki/Object_code)

[The Microsoft OBJ File Format](https://www.fileformat.info/format/ms-obj/corion.htm)

> The metadata that object files may include can be used for linking or debugging; it includes information to resolve symbolic cross-references between different modules, relocation information, stack unwinding information, comments, program symbols, and debugging or profiling information. Other metadata may include the date and time of compilation, the compiler name and version, and other identifying information.

Content:
- Header file paths
- Symbols
- Data
- Code
- Compiler warnings/errors
- `/FAILIFMISMATCH` (`#pragma detect_mismatch`)
  ```
  /FAILIFMISMATCH:"_MSC_VER=1900"
  /FAILIFMISMATCH:"_ITERATOR_DEBUG_LEVEL=0"
  /FAILIFMISMATCH:"RuntimeLibrary=MT_StaticRelease" libcpmt
  /FAILIFMISMATCH:"_CRT_STDIO_ISO_WIDE_SPECIFIERS=0"
  /FAILIFMISMATCH:"annotate_string=0"
  /FAILIFMISMATCH:"annotate_vector=0"
  ```
  [⚙ D58910 \[LLD\]\[COFF\] More detailed information for /failifmismatch](https://reviews.llvm.org/D58910)

Is PDB generated from OBJ?

[.Obj Files as Linker Input | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/reference/dot-obj-files-as-linker-input)

[c - On Windows MSVC, is it possible to merge some .obj into one .obj? If yes, how should I do that? - Stack Overflow](https://stackoverflow.com/questions/63470320/on-windows-msvc-is-it-possible-to-merge-some-obj-into-one-obj-if-yes-how-sh)

[Reverse engineering .lib file into Visual studio C++ code : r/ghidra](https://www.reddit.com/r/ghidra/comments/14u5h6j/reverse_engineering_lib_file_into_visual_studio_c/)