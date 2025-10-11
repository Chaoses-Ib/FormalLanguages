# Common Object File Format (COFF)
[Wikipedia](https://en.wikipedia.org/wiki/COFF)

> The Common Object File Format (COFF) is a format for executable, object code, and shared library computer files used on Unix systems. It was introduced in Unix System V, replaced the previously used a.out format, and formed the basis for extended specifications such as XCOFF and ECOFF, before being largely replaced by ELF, introduced with SVR4. COFF and its variants continue to be used on some Unix-like systems, on Microsoft Windows (Portable Executable), in UEFI environments and in some embedded development systems.

[Linker notes on PE/COFF | MaskRay](https://maskray.me/blog/2023-12-03-linker-notes-on-pe-coff)

[(Windows) Difference between coff and PE](https://microsoft.public.masm.narkive.com/CM6R9Ixv/windows-difference-between-coff-and-pe)

## Tools
- [dumpbin](https://learn.microsoft.com/en-us/cpp/build/reference/dumpbin-reference)
  ```pwsh
  & "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.41.34120\bin\Hostx64\x64\dumpbin.exe" "main.obj" /ALL
  ```
  ```cmd
  "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
  dumpbin "main.obj" /ALL
  ```

- [yaml2obj --- LLVM documentation](https://llvm.org/docs/yaml2obj.html)
