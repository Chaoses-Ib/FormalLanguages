# Program Database (PDB)
[Wikipedia](https://en.wikipedia.org/wiki/Program_database)

[The PDB File Format --- LLVM documentation](https://llvm.org/docs/PDB/index.html)

[microsoft-pdb: Information from Microsoft about the PDB format. We'll try to keep this up to date. Just trying to help the CLANG/LLVM community get onto Windows.](https://github.com/Microsoft/microsoft-pdb) (discontinued)

- Vesions
  - Version 2: `Microsoft C/C++ program database 2.00\r\n\032JG\0\0` (JG)
  - Version 7: `Microsoft C/C++ MSF 7.00\r\n\x1ADS\0\0\0` (DS)
    - BigMsf: `BlockSize == 4096`

- `PDBInformation`
  - `signature`: A 32-bit timestamp
  - `age`: The number of times this PDB file has been written. It is bumped by the linker and other tools every time the PDB is modified. It does not necessarily correspond to the age declared in the image. Consider using `DBIHeader::age` for a better match.
  - `guid`

- `DBIHeader` (optional, e.g. `vc140.pdb`)
  - `signature`
  - `age`

- PDB ID: `{PDBInformation.guid}-{DBIHeader.age}`

  e.g. `3003763b-afcb-4a97-aae3-28de8f188d7c-2`

  [How can I get the GUID from a PDB file? - Stack Overflow](https://stackoverflow.com/questions/2517791/how-can-i-get-the-guid-from-a-pdb-file)

- Program ID: `{time}{image_size}`

  e.g. `662E4D28E82000`

  ```python
  file_id = f'{timestamp:08X}{virtual_size:x}'
  file_id = hex(timestamp).replace('0x', '').zfill(8).upper() + hex(virtual_size).replace('0x', '')
  ```

- PDB does not include ImageBase, but include sections.

Symbols:
- Public: Functions with mangled function names (with arguments)
  - Occur before procedures
  - > Static function names are not public symbol names

  ```rust
  /// A public symbol with a mangled name.
  ///
  /// Symbol kind `S_PUB32`, or `S_PUB32_ST`.
  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
  pub struct PublicSymbol<'t> {
      /// The public symbol refers to executable code.
      pub code: bool,
      /// The public symbol is a function.
      pub function: bool,
      /// The symbol is in managed code (native or IL).
      pub managed: bool,
      /// The symbol is managed IL code.
      pub msil: bool,
      /// Start offset of the symbol.
      pub offset: PdbInternalSectionOffset,
      /// Mangled name of the symbol.
      pub name: RawString<'t>,
  }
  ```
- Procedures: Functions with unmangled names (no arguments)

  ```rust
  /// A procedure, such as a function or method.
  ///
  /// Symbol kinds:
  ///  - `S_GPROC32`, `S_GPROC32_ST` for global procedures
  ///  - `S_LPROC32`, `S_LPROC32_ST` for local procedures
  ///  - `S_LPROC32_DPC` for DPC procedures
  ///  - `S_GPROC32_ID`, `S_LPROC32_ID`, `S_LPROC32_DPC_ID` for procedures referencing types from the
  ///    ID stream rather than the Type stream.
  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
  pub struct ProcedureSymbol<'t> {
      /// Whether this is a global or local procedure.
      pub global: bool,
      /// Indicates Deferred Procedure Calls (DPC).
      pub dpc: bool,
      /// The parent scope that this procedure is nested in.
      pub parent: Option<SymbolIndex>,
      /// The end symbol of this procedure.
      pub end: SymbolIndex,
      /// The next procedure symbol.
      pub next: Option<SymbolIndex>,
      /// The length of the code block covered by this procedure.
      pub len: u32,
      /// Start offset of the procedure's body code, which marks the end of the prologue.
      pub dbg_start_offset: u32,
      /// End offset of the procedure's body code, which marks the start of the epilogue.
      pub dbg_end_offset: u32,
      /// Identifier of the procedure type.
      ///
      /// The type contains the complete signature, including parameters, modifiers and the return
      /// type.
      pub type_index: TypeIndex,
      /// Code offset of the start of this procedure.
      pub offset: PdbInternalSectionOffset,
      /// Detailed flags of this procedure.
      pub flags: ProcedureFlags,
      /// The full, demangled name of the procedure.
      pub name: RawString<'t>,
  }
  ```
  `dbg_start_offset` and `dbg_end_offset` are 0 for Rust functions.

[MSVC PDBs Are Filled With Stale Debug Info](https://www.computerenhance.com/p/msvc-pdbs-are-filled-with-stale-debug)

.NET: [What Every Developer Should Know About PDBs - Ken Muse](https://www.kenmuse.com/blog/what-every-developer-should-know-about-pdbs/)

Samples:
- [getsentry/pdb/fixtures/self](https://github.com/getsentry/pdb/tree/master/fixtures/self)

  `git submodule add -b 0.8.0-resym "https://github.com/ergrelet/pdb.git" tests/pdb`

- Windows

## PE
- [`IMAGE_DEBUG_DIRECTORY`](https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-image_debug_directory)
  - `TimeDateStamp`

- `CV_INFO_PDB70` ([`PDB70DebugInfo`](https://llvm.org/doxygen/CVDebugRecord_8h_source.html))
  - `CVSignature`
  - `Signature` (GUID)
  - `Age`
  - `PDBFileName`

  Libraries:
  - PeLite: Only `pdb_file_name()`, no `signature()`
    ```rust
    let pe = pelite::PeFile::from_bytes(bytes)?;
    let debug = pe.debug().ok();
    let pdb_id = debug.and_then(|d| {
            d.iter().find_map(|dir| {
                dir.entry()
                    .ok()
                    .and_then(|e| e.as_code_view())
                    .and_then(|cv| match cv {
                        pelite::pe64::debug::CodeView::Cv20 { .. } => None,
                        pelite::pe64::debug::CodeView::Cv70 { image, .. } => Some((
                            Uuid::from_fields(
                                image.Signature.Data1,
                                image.Signature.Data2,
                                image.Signature.Data3,
                                &image.Signature.Data4,
                            ),
                            image.Age,
                        )),
                    })
            })
        });
    let debug_info_path: debug.and_then(|d| d.pdb_file_name()).map(|s| s.to_string());
    ```
    `pelite::wrap::debug` is private, but `pelite::{pe32, pe64}::debug` is public.
  - goblin:
    ```rust
    let pe = goblin::pe::PE::parse(bytes)?;
    let pdb_info = pe.debug_data.and_then(|debug_data| {
        // info!("debug_data: {:?}", debug_data);
        debug_data.codeview_pdb70_debug_info
    });
    let pdb_id = pdb_info
        .map(|pdb_info| (Uuid::from_bytes_le(pdb_info.signature), pdb_info.age));
    let debug_info_path = pdb_info.map(|pdb_info| {
        String::from_utf8_lossy(
            pdb_info
                .filename
                .strip_suffix(&[0])
                .unwrap_or(pdb_info.filename),
        )
        .to_string()
    });
    ```

## Libraries
- [Debug Interface Access SDK](https://learn.microsoft.com/en-us/visualstudio/debugger/debug-interface-access/debug-interface-access-sdk?view=vs-2022)
  - `IDiaSymbol::findChildren()` is much slower than `IDiaSession::getSymbolsByAddr()` for enumerating symbols (tens of seconds vs 50ms).
    - [Iterating through Symbols in DIA SDK with getSymbolsByAddr - Stack Overflow](https://stackoverflow.com/questions/32145072/iterating-through-symbols-in-dia-sdk-with-getsymbolsbyaddr)
  - `C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit\msdia140.dll`

  Bindings:
  - C++: [pdbex: pdbex is a utility for reconstructing structures and unions from the PDB into compilable C headers](https://github.com/wbenny/pdbex) (discontinued)
    - [Does this support PDB Version 2.0? - Issue #5 - wbenny/pdbex](https://github.com/wbenny/pdbex/issues/5)
  - Rust: [microsoft/dia-rs: Rust for Debug Interface Access (DIA) SDK](https://github.com/microsoft/dia-rs)

    [windows-rs support for Microsoft DIA SDK (Debug Interface Access) - Issue #1327 - microsoft/windows-rs](https://github.com/microsoft/windows-rs/issues/1327)

- [Debug Help Library](https://learn.microsoft.com/en-us/windows/win32/debug/debug-help-library) (Dbghelp, Imagehlp, Sym)

  [Writing a Primitive Debugger: Part 4 (Symbols) « RCE Endeavors](https://www.codereversing.com/archives/176)

  Issues:
  - [DbgHelp Versions - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/debug/dbghelp-versions)

    > Although this DLL is included in all supported versions of Windows, it is rarely the most current version of DbgHelp available. Furthermore, the version of DbgHelp that ships in Windows has reduced functionality from the other releases-- specifically, it lacks support for Symbol Server and Source Server.

    [Enumerating symbols with SymEnumSymbols() doesn't always work](https://groups.google.com/g/microsoft.public.windbg/c/awQF03Fwr58)

  - ≥ 10.0.15007.1000: `/DEBUG:FASTLINK`
  
    [`SymEnumSymbols` returns `ERROR_SUCCESS` but gives no results - Stack Overflow](https://stackoverflow.com/questions/44842328/symenumsymbols-returns-error-success-but-gives-no-results)

  - [\[DBGHELP\] question about SymEnumSymbols to retrieve all exported function of a module](https://microsoft.public.vsnet.debugging.narkive.com/1DW9PX0G/dbghelp-question-about-symenumsymbols-to-retrieve-all-exported-function-of-a-module)

  Bindings:
  - [TinyPDBParser: Windows PDB Parser using Imagehlp library.](https://github.com/Coldzer0/TinyPDBParser)

  Tools:
  - [DBH](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/dbh)
  - Cheat Engine[^dbghelp-ce]

C++:
- [RawPDB: A C++11 library for reading Microsoft Program DataBase PDB files](https://github.com/MolecularMatters/raw_pdb)
- [libpdb: Parser for Microsoft Program Database (PDB) files](https://github.com/shareef12/libpdb)
- [libmspdb: Parsing library for the Microsoft Program Database files](https://github.com/IntroVirt/libmspdb)
- [LIEF::pdb](https://lief.re/doc/stable/extended/pdb/index.html)
- [horsicq/XWinPDB](https://github.com/horsicq/XWinPDB)

Rust:
- [pdb: A parser for Microsoft PDB (Program Database) debugging information](https://github.com/getsentry/pdb)
  - Version 2: [Add support for small MSF file format - Issue #150 - getsentry/pdb](https://github.com/getsentry/pdb/issues/150)
  - [Support for .NET PDBs - Issue #145 - getsentry/pdb](https://github.com/getsentry/pdb/issues/145)
  - [Modifying PDBs - Issue #16 - getsentry/pdb](https://github.com/getsentry/pdb/issues/16)
  - [`#![no_std]` support - Issue #112 - getsentry/pdb](https://github.com/getsentry/pdb/issues/112)
  
  Forks:
  - [Vector35/pdb-rs](https://github.com/Vector35/pdb-rs) ([#141](https://github.com/getsentry/pdb/pull/141))
    - [ergrelet/pdb at 0.8.0-resym](https://github.com/ergrelet/pdb/tree/0.8.0-resym)
  
      [CHANGELOG_RESYM.md](https://github.com/ergrelet/pdb/blob/0.8.0-resym/CHANGELOG_RESYM.md):
      - Add support for VirtualFunctionTable and VirtualTableShape (@CouleeApps)
      - Add support for DefRange, DefRangeSubField and DefRangeRegister (@CouleeApps)
      - Add support for DefRangeFramePointerRelative, DefRangeFramePointerRelativeFullScope, DefRangeSubFieldRegister and DefRangeRegisterRelative (@CouleeApps)
      - Add support for BasePointerRelative, FrameProcedure (@CouleeApps)
      - Add support for CallSiteInfo (@CouleeApps)
      - Add support for pdb register list (@CouleeApps)
      - Add support for LF_CLASS19, LF_INTERFACE19, LF_UNION19 (@CouleeApps)
      - Add support for S_STATICLOCAL, S_BPREL32_INDIR, S_REGREL32_INDIR, S_GPROC32EX, S_LPROC32EX, S_GPROC32EX_ID and S_LPROC32EX_ID (@CouleeApps)
      - Add support for S_HOTPATCHFUNC, S_DEFRANGE_REGISTER_REL_INDIR, S_RECTYPE_MAX and S_RECTYPE_PAD (@CouleeApps)
      - Add support for char8_t (@ergrelet)
      - Add support for small MSF (2.0) file format (@jon-zu)

      `pdb = { git = "https://github.com/ergrelet/pdb.git", branch = "0.8.0-resym"}`
    - [Ryan-rsm-McKenzie](https://github.com/Ryan-rsm-McKenzie/pdb-rs)
      - Add support for `S_COFFGROUP`, `S_SECTION`, `S_ENVBLOCK`, `S_HEAPALLOCSITE`, `S_CALLEES`, `S_CALLERS`, and `S_INLINEES`
  - [michal-kapala/pdb](https://github.com/michal-kapala/pdb) ([#146](https://github.com/getsentry/pdb/pull/146))
    - Add support for managed procedures
    - Add OEM symbols
    - Add support for managed local variable slots
    - Add support for `S_COFFGROUP`, `S_SECTION`, `S_ENVBLOCK`
  - [afranchuk/pdb2](https://github.com/afranchuk/pdb)
    - Allow `PDB` to impl `Send`. ([#148](https://github.com/getsentry/pdb/pull/148))
  - [evanrichter/pdb](https://github.com/evanrichter/pdb) / [mayhemheroes/pdb](https://github.com/mayhemheroes/pdb)
    - pdb fuzz harness
  - [suttonbradley/pdb](https://github.com/suttonbradley/pdb)
    - Retain u64 size for class and union sizes
  - [fkloiber/pdb](https://github.com/fkloiber/pdb)
  
  Libraries:
  - [pdb-addr2line: A rust crate to symbolicate addresses from PDBs, like addr2line. Uses the `pdb` crate.](https://github.com/mstange/pdb-addr2line)
  
  Tools:
  - [pdbview: dump all available information from PDBs](https://github.com/landaire/pdbview)
  - [symbolizer-rs: A fast execution trace symbolizer for Windows that runs on all major platforms and doesn't depend on any Microsoft libraries.](https://github.com/0vercl0k/symbolizer-rs)

- [lief::pdb](https://lief.re/doc/stable/extended/pdb/index.html)

- ~~[legolas](https://crates.io/crates/legolas)~~

- [pdb\_wrapper: Rust library to create fake PDBs](https://github.com/not-wlan/pdb_wrapper)
  - [bao: the PDB compiler](https://github.com/not-wlan/bao)

- [Elderscroll: PDB Rewriting Rust Library](https://github.com/backengineering/elderscroll)

- [fts\_pdbsrc: Embed and extract source code into .pdb files on the Windows platform](https://github.com/forrestthewoods/fts_pdbsrc)

- [natvis-pdbs: A metabuild / build.rs compatible crate to embed .natvis debug visualizer files into your executable's .pdbs, for ease of debugging.](https://github.com/MaulingMonkey/natvis-pdbs)

.NET:
- [SharpPdb: Library for reading PDB files, both Windows and PortablePDBs.](https://github.com/southpolenator/SharpPdb)
  - [EatPdb: Export all symbol from PDB!](https://github.com/codehz/EatPdb)
- [PDBSharp: Fast and cross-platform parser for Microsoft PDB files](https://github.com/smx-smx/PDBSharp)

Python:
- [pdbparse: Python code to parse Microsoft PDB files](https://github.com/moyix/pdbparse)

JS:
- [pdb-guid: 💻🪟👀 Peek into Windows symbol files to read their unique identifiers](https://github.com/BugSplat-Git/pdb-guid)

Servers:
- [Microsoft public symbol server](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/microsoft-public-symbols)
  - [SYMCN: Windows符号服务器镜像节点，用于国内加速](https://github.com/BlackINT3/symcn-site)

- [symsrv: Download pdbs from symbol servers and cache locally, parse symbol paths from env vars](https://github.com/mstange/symsrv/)

- [query-pdb: A server-side software for parsing PDB files. The software provides PDB online parsing service.](https://github.com/zouxianyu/query-pdb)

  PDB 符号查询服务端

## Tools
- [PDBRipper: A utility for extract an information from PDB-files.](https://github.com/horsicq/PDBRipper)
  - Only structs.

- [microsoft/pdblister: Faster version of `symchk /om` for generating PDB manifests of offline machines](https://github.com/microsoft/pdblister)

- WinDbg

  [Get .pdb file path from windbg - Stack Overflow](https://stackoverflow.com/questions/18756009/get-pdb-file-path-from-windbg)
  - `!chksym` / `!itoldyouso`

    ```
    0:030> !itoldyouso ntdll

    C:\Windows\SYSTEM32\ntdll.dll
        Timestamp: 51FB164A
      SizeOfImage: 1A9000
              pdb: ntdll.pdb
          pdb sig: 400F215C-54DA-4047-88F8-4F5C50491495
              age: 2

    Loaded pdb is C:\Program Files\Windows Kits\8.0\Debuggers\x64\sym\ntdll.pdb\400F215C54DA404788F84F5C504914952\ntdll.pdb

    ntdll.pdb
          pdb sig: 400F215C-54DA-4047-88F8-4F5C50491495
              age: 2

    MATCH: ntdll.pdb and C:\Windows\SYSTEM32\ntdll.dll
    ```
  - `!sym noisy; .reload /f ntdll.dll`

  [Load dbg symbol file into WinDbg - Stack Overflow](https://stackoverflow.com/questions/27562203/load-dbg-symbol-file-into-windbg)
  - `!sym noisy; .reload /f ntdll.dll`

- IDA
  - [sonyps5201314/pdb: ida pdb plugin with enhance and bugfix](https://github.com/sonyps5201314/pdb)
  
    [PDB 插件修复增强](https://bbs.pediy.com/thread-266189.htm)

  - [Determina PDB plugin for IDA Pro](http://www.phreedom.org/software/detpdb/)

  `\n`, `\t` and even emojis (UTF-8) are displayed.

  Windows:
  ```rust
  GetFileAttributesW(r"{path}")
  GetFileAttributesW(r"{pwd}\{lastpart}")
  GetFileAttributesW(r"{$env:TEMP}\ida\{lastpart}")
  GetFileAttributesW(r"{$env:TEMP}\ida\index2.txt")
  GetFileAttributesW(r"{$env:TEMP}\ida\{lastpart}\BA518DB3AC6742D1888E3CB6309550EEE\{lastpart}")
  GetFileAttributesW(r"{$env:TEMP}\ida\{lastpart}.pdb")
  GetFileAttributesW(r"{$env:TEMP}\ida\{lastpart}.pdb\BA518DB3AC6742D1888E3CB6309550EEE")
  InternetOpenUrlA(hInternet, "http://msdl.microsoft.com/download/symbols/{lastpart}.pdb/BA518DB3AC6742D1888E3CB6309550EEE/{lastpart}.pdb", NULL, 0, INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP | INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS | INTERNET_FLAG_NO_AUTH | INTERNET_FLAG_NO_CACHE_WRITE | INTERNET_FLAG_NO_COOKIES | INTERNET_FLAG_NO_UI | INTERNET_FLAG_RELOAD, 0)
  ```
  Create empty file at `{$env:TEMP}\ida\{lastpart}.pdb\BA518DB3AC6742D1888E3CB6309550EEE\{lastpart}.$$$`.

- Cheat Engine

- Intel VTune profiler
- AMD μProf profiler

## Generation
- LLVM
  - [FakePDB: Tool for PDB generation from IDA Pro database](https://github.com/Mixaill/FakePDB)
  - pdb_wrapper
    - [bao: the PDB compiler](https://github.com/not-wlan/bao)
  - [PdbGen: Generate dummy debug symbols (PDB) with a specified list of public symbols.](https://github.com/gix/PdbGen)

- [SourceSync: Set of plugins and library for dynamic pdb generation and synchronisation](https://github.com/Air14/SourceSync)

  [SourceSync - Dynamic pdb generation and synchronisation between decompiler and debugger : r/ReverseEngineering](https://www.reddit.com/r/ReverseEngineering/comments/1cjhlr4/sourcesync_dynamic_pdb_generation_and/)

- [MAP](MAP.md) to PDB
  - [map2pdb: Generating Microsoft PDB files from Delphi and C++ Builder MAP files](https://bitbucket.org/anders_melander/map2pdb)

    [MAP2PDB - Profiling with VTune - Page 2 - Delphi Third-Party - Delphi-PRAXiS \[en\]](https://en.delphipraxis.net/topic/4853-map2pdb-profiling-with-vtune/)
    > As should be evident I decided not to go the DWARF route after all. After using a few days to read the DWARF specification and examine the FPC source I decided that it would be easier to leverage the PDB knowledge I had already acquired. Not that this has been easy. Even though I've been able to use the LLVM PDB implementation and Microsoft's PDB source as a reference LLVM's implementation is incomplete and buggy and the LLVM source  is "modern C++" which means that it's close to unreadable in places. Microsoft's source, while written in clean C and guaranteed to be correct, doesn't compile and is poorly commented. Luckily it was nothing a few all-nighters with a disassembler and a hex editor couldn't solve.


[^dbghelp-ce]: [Cheat Engine :: View topic - How does Cheat Engine load debug symbols from a PDB?](https://forum.cheatengine.org/viewtopic.php?p=5775416/1000)