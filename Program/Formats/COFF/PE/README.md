# Portable Executable
[Wikipedia](https://en.wikipedia.org/wiki/Portable_Executable)

[PE Format - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format)

![](https://upload.wikimedia.org/wikipedia/commons/1/1b/Portable_Executable_32_bit_Structure_in_SVG_fixed.svg)

[PE File Format :: TheDoom](https://k0deless.github.io/posts/pe-file-format/)

[A dive into the PE file format - Introduction - 0xRick's Blog](https://0xrick.github.io/win-internals/pe1/)
- [part 1: Overview](https://0xrick.github.io/win-internals/pe2/)
- [part 2: DOS Header, DOS Stub and Rich Header](https://0xrick.github.io/win-internals/pe3/)
- [part 3: NT Headers](https://0xrick.github.io/win-internals/pe4/)
- [part 4: Data Directories, Section Headers and Sections](https://0xrick.github.io/win-internals/pe5/)
- [part 5: PE Imports (Import Directory Table, ILT, IAT)](https://0xrick.github.io/win-internals/pe6/)
- [part 6: PE Base Relocations](https://0xrick.github.io/win-internals/pe7/)
- [lab1: Writing a PE Parser](https://0xrick.github.io/win-internals/pe8/)

[Portable executable explained throught rust code](https://itehax.com/blog/portable-executable-explained-throught-rust-code) ([GitHub](https://github.com/itehax/pe_parser), [r/rust](https://www.reddit.com/r/rust/comments/182pwcc/rust_and_winapi_pe_explained_throught_rust_code/))

Samples:
- [Windows PE Artifact Library: Contains over 375 samples of Windows Portable Executable (PE) files ranging from the common to the completely esoteric with detailed origin information for each sample. Spans decades of computing in roughly 64MB of disk storage. Unique, ultra-rare PE file format artifacts. Any researcher's most delightful find!](https://github.com/cubiclesoft/windows-pe-artifact-library)
- [corkami/pocs/PE](https://github.com/corkami/pocs/tree/master/PE)

## Architectures
- PeLite
  ```rust
  let pe = pelite::PeFile::from_bytes(bytes)?;
  let is_32_bit = match pe {
      pelite::Wrap::T32(_) => true,
      pelite::Wrap::T64(_) => false,
  };
  let image_base = match pe.optional_header() {
      pelite::Wrap::T32(pe) => pe.ImageBase as u64,
      pelite::Wrap::T64(pe) => pe.ImageBase,
  };
  ```
  ```rust
  pub enum ImageBase {
      X32(u32),
      X64(u64),
  }

  match pe.optional_header() {
      pelite::Wrap::T32(pe) => ImageBase::X32(pe.ImageBase),
      pelite::Wrap::T64(pe) => ImageBase::X64(pe.ImageBase),
  }
  ```
- goblin
  ```rust
  fn is_executable_32_bit<P: AsRef<Path>>(path: P) -> Result<bool, anyhow::Error> {
      Ok(!goblin::pe::PE::parse(&std::fs::read(path)?)?.is_64)
  }
  ```

## Addresses
- Image base (base address)

  > When our binary is loaded in memory, the loader will load the file at a specific memory (virtual memory) location, this must be multiple of 64k, depending of architecture (32 bits or 64 bits) this value will have a size of 4 or 8 bytes (size for a pointer), and it can be any value in the user memory space but usually it will have the next values: 0x10000000 for a DLL, 0x00010000 for a Windows CE EXE, and 0x00400000 default for Windows NT EXEs.

  - [/BASE (Base address)](https://learn.microsoft.com/en-us/cpp/build/reference/base-base-address?view=msvc-170)
    ```c
    #pragma comment(linker,"/BASE:0x15000000")
    ```
  - [/FIXED (Fixed Base Address)](https://learn.microsoft.com/en-us/cpp/build/reference/fixed-fixed-base-address?view=msvc-170)

- Virtual address (VA, linear address)

  > This is the address used in the binary to reference data or code in an absolute way, this value is dependent on the base address value.

- Relative virtual address (RVA): Relative address to the image base.

  > This value is widely used on PE Header to avoid the dependency of the base address. This value is added to the base address to get the virtual address, so in this way it will be easy to get values from the binary.

  $$\text{RVA} = \text{VA} - \text{ImageBase}$$

  - ≤ `u32::MAX`

    What if a section's RVA + size is greater than `u32::MAX`?

  - `IMAGE_SECTION_HEADER.VirtualAddress`

    > The documentation states that for executable images this field holds the address of the first byte of the section relative to the image base when loaded in memory, and for object files it holds the address of the first byte of the section before relocation is applied.

- File offset

  > Value which tells us the physical place of something in the binary.

[Understanding Concepts of VA, RVA and File Offsets](https://tech-zealots.com/malware-analysis/understanding-concepts-of-va-rva-and-offset/)

[VA (Virtual Address) & RVA (Relative Virtual Address) - Stack Overflow](https://stackoverflow.com/questions/2170843/va-virtual-address-rva-relative-virtual-address)

## Sections
- [/SECTION (Specify Section Attributes)](https://learn.microsoft.com/en-us/cpp/build/reference/section-specify-section-attributes?view=msvc-170)
- [/ALIGN (Section alignment)](https://learn.microsoft.com/en-us/cpp/build/reference/align-section-alignment?view=msvc-170)

## Loaders
- Windows
- [aaaddress1/RunPE-In-Memory: Run a Exe File (PE Module) in memory (like an Application Loader)](https://github.com/aaaddress1/RunPE-In-Memory)

## Libraries
[→Executable formats libraries](../../README.md#libraries)

C/C++:
- LIEF
- [pe-parse: Principled, lightweight C/C++ PE parser](https://github.com/trailofbits/pe-parse)
- [readpe: The PE file analysis toolkit](https://github.com/mentebinaria/readpe)
- [linux-pe: COFF and Portable Executable format described using standard C++ with no dependencies.](https://github.com/can1357/linux-pe)
- [libexe: Library and tools to access the executable (EXE) format](https://github.com/libyal/libexe)
- [mgeeky/PE-library: Lightweight Portable Executable parsing library and a demo peParser application.](https://github.com/mgeeky/PE-library)

Rust:
- [PeLite: Lightweight, memory-safe, zero-allocation library for reading and navigating PE binaries.](https://github.com/CasualX/pelite) (inactive)
  - Usable, but the API is fucked up.
  - Wasm: 6 KiB
  - PE32 and PE64 are different types, but there is a [Wrap](https://docs.rs/pelite/latest/pelite/enum.Wrap.html).

    [Add pelite::Wrap to the top level crate documentation - Issue #250 - CasualX/pelite](https://github.com/CasualX/pelite/issues/250)
  - What's the difference between `PeFile<'a>` and `PeView<'a>`?

    `PeFile` is unmapped (on disk), `PeView` is mapped (loaded in memory).
  - Unaligned: [backengineering/pelite](https://github.com/backengineering/pelite)

- [exe-rs: The PE Executable Library, but for Rust!](https://github.com/frank2/exe-rs) (inactive)
  - Modifying: `add_section()`, `fix_image_size()`...
  - No `CV_INFO_PDB70`
  - Wasm: 13 KiB

- [pe-parser: PE Parsing, but blazing fast](https://github.com/IsaacMarovitz/pe-parser)

  > Goblin is probably going to be more useful for an actual production project. I did notice a couple of differences in design choices.
  > 
  > Goblin stays true to MS' naming scheme when it comes to constants, while I've chosen to alter the names as needed to fit a more 'rusty' style. They also present these to you in their raw `u32` form, whereas I've opted to parse these values for you using enums rather than constants.
  > 
  > They also don't seem to parse the bitflag characteristics or time stamps for you, either.
  > 
  > Really it comes down to a manner of preference and whether you prefer to stay more true to the original 'C' style or adapt it to be Rustier

.NET:
- [AsmResolver: A library for creating, reading and editing PE files and .NET modules.](https://github.com/Washi1337/AsmResolver)
- [PeNet: Portable Executable (PE) library written in .Net](https://github.com/secana/PeNet)

## Tools
- [Detect It Easy: Program for determining types of files for Windows, Linux and MacOS.](https://github.com/horsicq/Detect-It-Easy)

  `scoop install detect-it-easy`

  识别编译器版本效果不错

- [XPEViewer: PE file viewer/editor for Windows, Linux and MacOS.](https://github.com/horsicq/XPEViewer)

- PEiD