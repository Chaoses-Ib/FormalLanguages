# Debugging Information
[Debug Information Files | Sentry for Minidumps](https://docs.sentry.io/platforms/native/guides/minidumps/data-management/debug-files/)
- [Debug Identifiers](https://docs.sentry.io/platforms/native/guides/minidumps/data-management/debug-files/identifiers/)

Libraries:
- [symbolic: Stack trace symbolication library written in Rust](https://github.com/getsentry/symbolic)

## Program database (PDB)
[Wikipedia](https://en.wikipedia.org/wiki/Program_database)

- PDB ID: `{GUID}-{age}`

  e.g. `3003763b-afcb-4a97-aae3-28de8f188d7c-2`

  [How can I get the GUID from a PDB file? - Stack Overflow](https://stackoverflow.com/questions/2517791/how-can-i-get-the-guid-from-a-pdb-file)

- Program ID: `{time}{image_size}`

  e.g. `662E4D28E82000`

  ```python
  file_id = f'{timestamp:08X}{virtual_size:x}'
  file_id = hex(timestamp).replace('0x', '').zfill(8).upper() + hex(virtual_size).replace('0x', '')
  ```

### Libraries
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

Rust:
- [pdb: A parser for Microsoft PDB (Program Database) debugging information](https://github.com/getsentry/pdb)
  - [Add support for small MSF file format - Issue #150 - getsentry/pdb](https://github.com/getsentry/pdb/issues/150)
  - [Support for .NET PDBs - Issue #145 - getsentry/pdb](https://github.com/getsentry/pdb/issues/145)
  - [Modifying PDBs - Issue #16 - getsentry/pdb](https://github.com/getsentry/pdb/issues/16)
  
  Forks:
  - [ergrelet/pdb at 0.8.0-resym](https://github.com/ergrelet/pdb/tree/0.8.0-resym)

    `pdb = { git = "https://github.com/ergrelet/pdb.git", branch = "0.8.0-resym"}`
  
  Libraries:
  - [pdb-addr2line: A rust crate to symbolicate addresses from PDBs, like addr2line. Uses the `pdb` crate.](https://github.com/mstange/pdb-addr2line)

- [Elderscroll: PDB Rewriting Rust Library](https://github.com/backengineering/elderscroll)

Servers:
- [Microsoft public symbol server](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/microsoft-public-symbols)
  - [SYMCN: Windows符号服务器镜像节点，用于国内加速](https://github.com/BlackINT3/symcn-site)

- [query-pdb: A server-side software for parsing PDB files. The software provides PDB online parsing service.](https://github.com/zouxianyu/query-pdb)

  PDB 符号查询服务端

### Tools
- [PDBRipper: A utility for extract an information from PDB-files.](https://github.com/horsicq/PDBRipper)

- [microsoft/pdblister: Faster version of `symchk /om` for generating PDB manifests of offline machines](https://github.com/microsoft/pdblister)

- [sonyps5201314/pdb: ida pdb plugin with enhance and bugfix](https://github.com/sonyps5201314/pdb)
  
  [PDB 插件修复增强](https://bbs.pediy.com/thread-266189.htm)

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

### Generation
- [PdbGen: Generate dummy debug symbols (PDB) with a specified list of public symbols.](https://github.com/gix/PdbGen)

## [DWARF](https://dwarfstd.org/)
- [gimli: A library for reading and writing the DWARF debugging format](https://github.com/gimli-rs/gimli)


[^dbghelp-ce]: [Cheat Engine :: View topic - How does Cheat Engine load debug symbols from a PDB?](https://forum.cheatengine.org/viewtopic.php?p=5775416/1000)