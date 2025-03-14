# Dynamic
[Linker (computing) - Wikipedia](https://en.wikipedia.org/wiki/Linker_(computing)#Dynamic_linking)

[Dynamic linker - Wikipedia](https://en.wikipedia.org/wiki/Dynamic_linker)

Approaches:
- [PE](#pe): IDT + ILT + IAT
  - [Relocating](../Relocating.md)

- `LoadLibrary()` + `GetProcAddress()`
  - .NET
  - 易语言: `.rdata` `EAPP_INFO`

  [Hidden in PEB Sight: Hiding Windows API Imports With a Custom Loader](https://blog.christophetd.fr/hiding-windows-api-imports-with-a-customer-loader/)

  [Hiding & Obfuscating IAT | Rotta](https://www.rotta.rocks/offensive-tool-development/bypassing-av/hiding-and-obfuscating-iat)

  [Hiding PE Imports :: Robleh Esa --- Red Ops](https://roblehesa.com/posts/hiding-pe-imports/)

  [Import Rebuilding Without Import Table - Exetools](https://forum.exetools.com/showthread.php?t=6351)

- Custom loaders

## PE
- Import Directory Table (IDT)
  ```cpp
  typedef struct _IMAGE_IMPORT_DESCRIPTOR {
      union {
          DWORD   Characteristics;
          /// RVA of the ILT
          DWORD   OriginalFirstThunk;
      } DUMMYUNIONNAME;
      DWORD   TimeDateStamp;
      /// The index of the first forwarder chain reference
      DWORD   ForwarderChain;
      /// An RVA of an ASCII string that contains the name of the imported DLL
      DWORD   Name;
      /// RVA of the IAT
      DWORD   FirstThunk;
  } IMAGE_IMPORT_DESCRIPTOR;
  typedef IMAGE_IMPORT_DESCRIPTOR UNALIGNED *PIMAGE_IMPORT_DESCRIPTOR;
  ```
- Bound Import Data Directory

  ```cpp
  typedef struct _IMAGE_BOUND_IMPORT_DESCRIPTOR {
      DWORD   TimeDateStamp;
      WORD    OffsetModuleName;
      WORD    NumberOfModuleForwarderRefs;
  // Array of zero or more IMAGE_BOUND_FORWARDER_REF follows
  } IMAGE_BOUND_IMPORT_DESCRIPTOR,  *PIMAGE_BOUND_IMPORT_DESCRIPTOR;
  ```
  > A bound import essentially means that the import table contains fixed addresses for the imported functions. These addresses are calculated and written during compile time by the linker.
  > 
  > Using bound imports is a speed optimization, it reduces the time needed by the loader to resolve function addresses and fill the IAT, however if at run-time the bound addresses do not match the real ones then the loader will have to resolve these addresses again and fix the IAT.

- Import Lookup Table (ILT) / Import Name Table (INT)

  Each u32/u64 in this array is either:
  > - A RVA to an `IMAGE_IMPORT_BY_NAME` struct, which in turn point to an ascii string: the function name.
  > - Or if the first bit is 1, this integer is the ordinal of the function to import.

- Import Address Table (IAT)

  > On disk, the IAT is identical to the ILT, however during bounding when the binary is being loaded into memory, the entries of the IAT get overwritten with the addresses of the functions that are being imported.

  What if IAT is not the same as ILT on disk?

> Normally you have 3 ways of calling an API:
```x86asm
; 1.
Call     DWORD PTR [IATEntry]
;
; 2.
Call     __imp__IATEntry
;
__imp__IATEntry:
Jmp      DWORD PTR [IATEntry]
;
; 3.
Mov      Reg32, [IATEntry]
Call     Reg32
```

[A dive into the PE file format - PE file structure - Part 5: PE Imports (Import Directory Table, ILT, IAT) - 0xRick's Blog](https://0xrick.github.io/win-internals/pe6/)

[Tutorial - Writing a PE packer - Part 2 : imports and relocationsWireDiver](https://wirediver.com/tutorial-writing-a-pe-packer-part-2/)

[How DLL Imports Work | Ruminations](https://blog.aaronballman.com/2011/10/how-dll-imports-work/)

[portable executable - What's the difference between "Import Table address" and "Import Address Table address" in Date Directories of PE? - Stack Overflow](https://stackoverflow.com/questions/3801571/whats-the-difference-between-import-table-address-and-import-address-table-a)

### Libraries
PeLite:
```rust
println!(
    "[(IAT, ILT)]: {:X?}",
    pe.iat().unwrap().iter().collect::<Vec<_>>()
);

println!(
    "[IDT{{DLL, IAT.len(), ILT.len()}}]: {:?}",
    pe.imports().unwrap().iter().collect::<Vec<_>>()
);

for idt in pe.imports().unwrap().iter() {
    println!("DLL: {:?}", idt.dll_name().unwrap());
    for ((ilt, iat_rva), iat) in idt
        .int()
        .unwrap()
        .zip((idt.image().FirstThunk..).step_by(match idt {
            pelite::Wrap::T32(_) => 4,
            pelite::Wrap::T64(_) => 8,
        }))
        .zip(idt.iat().unwrap())
    {
        println!("(ILT, &IAT, IAT): {:?} {iat_rva:X} {iat:X?}", ilt.unwrap());
    }
}
```

## C++
[DLL Import and Export Functions | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/c-language/dll-import-and-export-functions?view=msvc-170)
