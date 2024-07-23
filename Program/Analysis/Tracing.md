# Tracing
[Wikipeida](https://en.wikipedia.org/wiki/Tracing_(software))

## Tools
Windows:
- [drstrace](https://drmemory.org/page_drstrace.html)
  - Syscalls
- [wintrace: simple tracing utility for windows](https://github.com/matthewgeorgy/wintrace)
  - APIs

## Branch trace
[Wikipedia](https://en.wikipedia.org/wiki/Branch_trace)

- Last Branch Record
- Branch Trace Store

## Hardware
- Intel Processor Trace
- AMD: ❌

### Intel Processor Trace
[Enhance performance analysis with Intel Processor Trace. | Easyperf](https://easyperf.net/blog/2019/08/23/Intel-Processor-Trace)
- ~5% cost

[Perf tools support for Intel® Processor Trace - Perf Wiki](https://perf.wiki.kernel.org/index.php/Perf_tools_support_for_Intel%C2%AE_Processor_Trace)

Libraries:
- [intel/libipt: An Intel(R) Processor Trace decoder library](https://github.com/intel/libipt)
- [winipt: The Windows Library for Intel Process Trace (WinIPT) is a project that leverages the new Intel Processor Trace functionality exposed by Windows 10 Redstone 5 (1809), through a set of libraries and a command-line tool.](https://github.com/ionescu007/winipt)
- [WindowsIntelPT: This driver implements the Intel Processor Trace functionality in Intel Skylake architecture for Microsoft Windows](https://github.com/intelpt/WindowsIntelPT)

Tools:
- Linux
  - perf

    [Perf tools support for Intel® Processor Trace - Perf Wiki](https://perf.wiki.kernel.org/index.php/Perf_tools_support_for_Intel%C2%AE_Processor_Trace)

    [A Practical Beginner's Guide to Intel Processor Trace - Carter Yagemann](https://carteryagemann.com/a-practical-beginners-guide-to-intel-processor-trace.html)

  - [magic-trace: magic-trace collects and displays high-resolution traces of what a process is doing](https://github.com/janestreet/magic-trace)

    [Jane Street Tech Blog - Magic-trace: Diagnosing tricky performance issues easily with Intel Processor Trace](https://blog.janestreet.com/magic-trace/) ([Hacker News](https://news.ycombinator.com/item?id=30107750))

  - [simple-pt: Simple Intel CPU processor tracing on Linux](https://github.com/andikleen/simple-pt)

  - LLDB: [Tracing with Intel Processor Trace - 🐛 LLDB](https://lldb.llvm.org/use/intel_pt.html)

- Windows
  - Cheat Engine: Ultimap 2

  - [winipt: The Windows Library for Intel Process Trace (WinIPT) is a project that leverages the new Intel Processor Trace functionality exposed by Windows 10 Redstone 5 (1809), through a set of libraries and a command-line tool.](https://github.com/ionescu007/winipt)

  - [WinIPTCollector: Intel Processor Trace package collector for Windows](https://github.com/BlackLuny/WinIPTCollector)

  - WinAFL: [Intel PT mode](https://github.com/googleprojectzero/winafl/blob/master/readme_pt.md)

Security:
- Ge, Xinyang, Weidong Cui, and Trent Jaeger. “GRIFFIN: Guarding Control Flows Using Intel Processor Trace.” In Proceedings of the Twenty-Second International Conference on Architectural Support for Programming Languages and Operating Systems, 585–98. Xi’an China: ACM, 2017. https://doi.org/10.1145/3037697.3037716.

## Reverse execution
- GDB: [rr: Record and Replay Framework](https://github.com/rr-debugger/rr)
  - Linux

- WinDbg
  - Time Travel Debug (TTD)

    [A new (and old) Reverse Debugger -- Microsoft WinDbg -- Observations from Uppsala](https://jakob.engbloms.se/archives/2649)

  - Intel Processor Trace: Reverse Execution with Processor Trace (REPT)

    [Microsoft REPT: You CAN Reverse from a Core Dump! -- Observations from Uppsala](https://jakob.engbloms.se/archives/2876)