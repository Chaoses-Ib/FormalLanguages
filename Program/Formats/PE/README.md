# Portable Executable
[Wikipedia](https://en.wikipedia.org/wiki/Portable_Executable)

[PE Format - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format)

![](https://upload.wikimedia.org/wikipedia/commons/1/1b/Portable_Executable_32_bit_Structure_in_SVG_fixed.svg)

[Portable executable explained throught rust code](https://itehax.com/blog/portable-executable-explained-throught-rust-code) ([GitHub](https://github.com/itehax/pe_parser), [r/rust](https://www.reddit.com/r/rust/comments/182pwcc/rust_and_winapi_pe_explained_throught_rust_code/))

Samples:
- [Windows PE Artifact Library: Contains over 375 samples of Windows Portable Executable (PE) files ranging from the common to the completely esoteric with detailed origin information for each sample. Spans decades of computing in roughly 64MB of disk storage. Unique, ultra-rare PE file format artifacts. Any researcher's most delightful find!](https://github.com/cubiclesoft/windows-pe-artifact-library)
- [corkami/pocs/PE](https://github.com/corkami/pocs/tree/master/PE)

## Loaders
- Windows
- [aaaddress1/RunPE-In-Memory: Run a Exe File (PE Module) in memory (like an Application Loader)](https://github.com/aaaddress1/RunPE-In-Memory)

## Libraries
C/C++:
- LIEF
- [pe-parse: Principled, lightweight C/C++ PE parser](https://github.com/trailofbits/pe-parse)
- [readpe: The PE file analysis toolkit](https://github.com/mentebinaria/readpe)
- [linux-pe: COFF and Portable Executable format described using standard C++ with no dependencies.](https://github.com/can1357/linux-pe)
- [libexe: Library and tools to access the executable (EXE) format](https://github.com/libyal/libexe)
- [mgeeky/PE-library: Lightweight Portable Executable parsing library and a demo peParser application.](https://github.com/mgeeky/PE-library)

Rust:
- [PeLite: Lightweight, memory-safe, zero-allocation library for reading and navigating PE binaries.](https://github.com/CasualX/pelite)
- [exe-rs: The PE Executable Library, but for Rust!](https://github.com/frank2/exe-rs)
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