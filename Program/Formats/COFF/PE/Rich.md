# Rich Header
- Start from at least VC++ 6 linker

[Microsoft's Rich Signature (undocumented)](https://www.ntcore.com/files/richsign.htm)

[BYTE\* / The Undocumented Microsoft "Rich" Header](https://web.archive.org/web/20240615133732/http://bytepointer.com/articles/the_microsoft_rich_header.htm) ([Hacker News](https://news.ycombinator.com/item?id=28899933))
> Rich Shupak

[PE File Rich Header - Offwhite Security](https://offwhitesecurity.dev/malware-development/portable-executable-pe/rich-header/)

[A dive into the PE file format - PE file structure - Part 2: DOS Header, DOS Stub and Rich Header - 0xRick's Blog](https://0xrick.github.io/win-internals/pe3/#rich-header)

[RichHeaderResearch/RichPE: Metadata hash incorporating the Rich Header for robustness against packing and other malware tricks](https://github.com/RichHeaderResearch/RichPE)

[The devil's in the Rich header | Securelist](https://securelist.com/the-devils-in-the-rich-header/84348/)

[So I asked Microsoft to add linker option to strip "Rich" stamp from EXE header. Not likely going to happen it seems. : r/programming](https://www.reddit.com/r/programming/comments/czzond/so_i_asked_microsoft_to_add_linker_option_to/)

## Libraries
- LIEF
- [PeLite](https://docs.rs/pelite/latest/pelite/rich_structure/index.html)
- bininfo-rs: [pe/rich\_headers.rs](https://github.com/marirs/bininfo-rs/blob/master/src/pe/rich_headers.rs)

## Tools
- Detect It Easy
- [PE-Analyzer.rs: Simple Project that Extracts PE Information.](https://github.com/Whitecat18/PE-Analyzer.rs)
- MSVC
  - [anonlink: Command line tool to automatically patch link.exe to remove Rich PE Header](https://github.com/StackOverflowExcept1on/anonlink)
  - Windhawk
- [rich-header-eraser: This is a simple tool to remove the "Rich" header from binaries (EXE or DLL files) created by M$ development tools.](https://github.com/lordmulder/rich-header-eraser)
- VMProtect: Strip Debug Information
