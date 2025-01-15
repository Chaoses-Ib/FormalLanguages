# IDA
[IbIDA](https://github.com/Chaoses-Ib/BinaryAnalysis)

## Versions
[IDA updates and releases](https://hex-rays.com/products/ida/news/).

[fckilfkscwusoopguhi7i6yg3l6tknaz7lrumvlhg5mvtxzxbbxlimid.onion](http://fckilfkscwusoopguhi7i6yg3l6tknaz7lrumvlhg5mvtxzxbbxlimid.onion/)
- [\[分享\]IDA 版本历代记-资源下载-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-277984.htm)

### v8
v8.3:
- [IDA Pro 8.3 (x86, x86\_64) - 『逆向资源区』 - 吾爱破解 - LCG - LSG |安卓破解|病毒分析|www.52pojie.cn](https://www.52pojie.cn/thread-1861384-1-1.html)

### v9
[Welcome to IDA 9.0 Beta](https://web.archive.org/web/20240811074303/https://out5.hex-rays.com/beta90_6ba923/) (240807)
- Headless processing with IDAlib
- WASM Disassembler and File Format Loader
  - 不能反编译
  - 不支持部分特性：`mutable-globals`、`sign-ext`
- nanoMIPS Disassembler and Decompiler + md1rom Loader
- New RISC-V Decompiler and Disassembler Extensions
- C++ Exceptions Support in the Decompiler
  - MSVC x64 only
- IDAPython Improvements
- FLIRT Updates
- Metadata Descriptors for Plugins
- No more IDA32
- UI Improvements
- 仍然只能单线程分析
- [IDA 9.0 BETA-资源下载-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-282834.htm)
- [\[分享\]IDA BETA 9.0 crack-资源下载-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-282835.htm)

v9.0-RC1+240925:
- magnet:?xt=urn:btih:920c1a578e815e9d0e4b843179306cdcb5e8e00d&dn=idapro90rc1
- [\[下载\] IDA Pro 9.0 RC1-资源下载-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-283752.htm)

[IDA 9.0 | Hex-Rays Docs](https://docs.hex-rays.com/release-notes/9_0)
- BUGFIX: debugger: win32: IDA's debugger could be detected by a file lock on the modules being loaded into the process

2024-12-17 [IDA 9.0sp1 | Hex-Rays Docs](https://docs.hex-rays.com/release-notes/9_0sp1)
- https://t.me/c1670316433/27760

## API
Rust: [binarly-io/idalib: Idiomatic Rust bindings for the IDA SDK, enabling the development of standalone analysis tools using IDA v9.0's idalib](https://github.com/binarly-io/idalib)
- No doc comments
- [rhabdomancer: Vulnerability research assistant that locates all calls to potentially insecure API functions in a binary file.](https://github.com/0xdea/rhabdomancer)

## CLI
[Command line switches | Hex-Rays Docs](https://docs.hex-rays.com/user-guide/configuration/command-line-switches)

- Simply open a file in IDA
- `-T`: Open a file and auto-select a loader
- `-A`: Auto-accept any prompts, informational messages or warnings
- `-B`: Batch disassembly (`-A -Sanalysis.idc`)

  [Igor's tip of the week #08: Batch mode under the hood -- Hex Rays](https://hex-rays.com/blog/igor-tip-of-the-week-08-batch-mode-under-the-hood)
  ```c
  #include <idc.idc>

  static main()
  {
    // turn on coagulation of data in the final pass of analysis
    set_inf_attr(INF_AF, get_inf_attr(INF_AF) | AF_DODATA | AF_FINAL);
    // .. and plan the entire address space for the final pass
    auto_mark_range(0, BADADDR, AU_FINAL);

    msg("Waiting for the end of the auto analysis...\n");
    auto_wait();

    msg("\n\n------ Creating the output file.... --------\n");
    auto file = get_idb_path()[0:-4] + ".asm";

    auto fhandle = fopen(file, "w");
    gen_file(OFILE_ASM, fhandle, 0, BADADDR, 0); // create the assembler file
    msg("All done, exiting...\n");

    // the following line instructs IDA to quit without saving the database
    // process_config_directive("ABANDON_DATABASE=YES");

    qexit(0); // exit to OS, error code 0 - success
  }
  ```

  > Even though the UI is not actually displayed in batch mode, it still has to load and initialize all the dependent UI libraries which can take non-negligible time. This is why it is often better to use the text-mode executable (`idat`) which uses lightweight text-mode UI.

- `-p`: Binary file options
- `-L`: Logging

`ida64` is async, `idat64` is sync.

[Igor's tip of the week #07: IDA command-line options cheatsheet -- Hex Rays](https://hex-rays.com/blog/igor-tip-of-the-week-07-ida-command-line-options-cheatsheet)

## Plugins
[Interactive IDA Plugin List](https://vmallet.github.io/ida-plugins/)

## AI
- [Gepetto: IDA plugin which queries uses language models to speed up reverse-engineering](https://github.com/JusticeRage/Gepetto)
  - Explain function
  - Rename variables
  - Models: OpenAI, Ollama, Groq, Together, Novita AI
    - Not support Gemini
  - GPL3

  [Hex-Rays: Plugin repository](https://plugins.hex-rays.com/gepetto)

- [aidapal: aiDAPal is an IDA Pro plugin that uses a locally running LLM that has been fine-tuned for Hex-Rays pseudocode to assist with code analysis.](https://github.com/atredispartners/aidapal)
  - Models: Ollama only

- [Binoculars: Binoculars is an IDA PRO plugin with an integrated AI interface](https://github.com/Vis-Wing/Binoculars)

- [ida\_copilot: ChatGPT Agent analyses your IDA pseudocode](https://github.com/Antelcat/ida_copilot) (discontinued)

- [IDA-Assistant: IDA plugin to support automatic reverse engineering](https://github.com/stuxnet147/IDA-Assistant) (discontinued)
  - Models: Claude

- ~~[lbl4/idallama](https://github.com/lbl4/idallama)~~

Proprietary:
- [reai-ida: RevEng.AI IDA Pro Plugin](https://github.com/RevEngAI/reai-ida)
  - Waitlist

## Security
- CVE-2024-44083: Aggressively convert jumps to thunks (v7.7~9.0-beta)

  If `Aggressively convert jumps to thunks` is on, massive chained JMPs at the entry point will result in stack overflow and high peak memory usage.
  - 8k → 4M (default `SizeOfStackReserve`), 2.5G
  - 20k → <40M, 5G

  Also work on Ghidra's Auto Analysis, though it won't crash.
  - 20k → ?, >2.2G

  Binary Ninja:
  - 320k, >3.8G?

  Tools:
  - [IdaMeme: Crashes ida on static analyses.](https://github.com/Azvanzed/IdaMeme)

    [\[Source\] IdaMeme](https://www.unknowncheats.me/forum/anti-cheat-bypass/578797-idameme.html)

  - [CVE-2024-44083: Makes IDA (most versions) to crash upon opening it.](https://github.com/Azvanzed/CVE-2024-44083)

- [The Dukes R&D Finds a New Anti-Analysis Technique](https://unit42.paloaltonetworks.com/unit42-the-dukes-rd-finds-a-new-anti-analysis-technique/)

  > The less obvious reason is that it takes advantage of a bug in the popular IDA disassembler that was recently fixed in the latest version of IDA. Figure 2 shows the DLL opened in a recent (but not the latest) version of IDA, specifically version 6.9.160222. The exports tab shows the only exported function is DllEntryPoint and does not display any of the other functions with blank names.

  > The release notes for this version of IDA were posted on August 8, 2016, which was two days before the attack delivered the payload leveraging the technique. We believe this threat group either found this bug in IDA that caused the bug fix or the group monitors IDA release notes for bug fixes to figure out how to make analysis difficult. While we cannot know for certain, we believe the latter to be the more plausible explanation due to the sequential order of the IDA release notes and the attack date. Also, the latter would suggest that the group is able to quickly find anti-analysis opportunities and deploy the techniques within their toolset.