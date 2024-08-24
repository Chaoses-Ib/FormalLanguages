# Memory Dumps
[Wikipedia](https://en.wikipedia.org/wiki/Core_dump)

## Minidumps
Minidumps may cannot use:
- `!runaway`

## Tools
- WinDbg

  [Module versions in a crash dump - Stack Overflow](https://stackoverflow.com/questions/182365/module-versions-in-a-crash-dump)
  - `LM v`

- DebugDiag (Debug Diagnostic Tool)

  [Download Debug Diagnostic Tool v2 Update 3.2 from Official Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=103453)

- Visual Studio
  - Process command line

- IDA
- Cheat Engine
- 010 Editor

## Memory
- DebugDiag: Native/.NET 内存占用
- ~~`!memusage`~~
- `!dumpheap`
  - `!dumpheap -stat`

[c++ - Detailed memory usage analysis of windows crash dump file? - Stack Overflow](https://stackoverflow.com/questions/4735113/detailed-memory-usage-analysis-of-windows-crash-dump-file)

## .NET
[Dumping the managed heap in C#](https://minidump.net/dumping-the-managed-heap-in-csharp/)

[Analyzing Memory Dumps of .NET Applications | Microsoft Learn](https://learn.microsoft.com/en-us/shows/dotnetconf-2020/analyzing-memory-dumps-of-net-applications)

[c# - Large unexplained memory in the memory dump of a .NET process - Stack Overflow](https://stackoverflow.com/questions/53350298/large-unexplained-memory-in-the-memory-dump-of-a-net-process)

Tools:
- [dotnet-dump diagnostic tool - .NET CLI - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-dump)
  - `dotnet tool install --global dotnet-dump`

  ```
  analyzeoom, AnalyzeOOM                                   Displays the info of the last OOM that occurred on an allocation request to the GC heap.
  assemblies, clrmodules                                   Lists the managed assemblies in the process.
  clrstack <arguments>                                     Provides a stack trace of managed code only.
  clrthreads <arguments>                                   Lists the managed threads running.
  comstate <arguments>                                     Lists the COM apartment model for each thread.
  crashinfo                                                Displays the crash details that created the dump.
  d, readmemory <address>                                  Dumps memory contents.
  da <address>                                             Dumps memory as zero-terminated byte strings.
  db <address>                                             Dumps memory as bytes.
  dbgout <arguments>                                       Enables/disables (-off) internal SOS logging.
  dc <address>                                             Dumps memory as chars.
  dd <address>                                             Dumps memory as dwords (uint).
  dp <address>                                             Dumps memory as pointers.
  dq <address>                                             Dumps memory as qwords (ulong).
  du <address>                                             Dumps memory as zero-terminated char strings.
  dumpalc <arguments>                                      Displays details about a collectible AssemblyLoadContext into which the specified object is loaded.
  dumparray <arguments>                                    Displays details about a managed array.
  dumpassembly <arguments>                                 Displays details about an assembly.
  dumpasync, DumpAsync                                     Displays information about async "stacks" on the garbage-collected heap.
  dumpccw <arguments>                                      Displays information about a COM Callable Wrapper.
  dumpclass <arguments>                                    Displays information about a EE class structure at the specified address.
  dumpconcurrentdictionary, dcd <address>                  Displays concurrent dictionary content.
  dumpconcurrentqueue, dcq <address>                       Displays concurrent queue content.
  dumpdelegate <arguments>                                 Displays information about a delegate.
  dumpdomain <arguments>                                   Displays the Microsoft intermediate language (MSIL) that's associated with a managed method.
  dumpexceptions                                           Displays a list of all managed exceptions.
  dumpgcdata <arguments>                                   Displays information about the GC data.
  dumpgen, dg <generation>                                 Displays heap content for the specified generation.
  dumpheap, DumpHeap <memoryrange>                         Displays a list of all managed objects.
  dumphttp, DumpHttp                                       Displays information about HTTP requests.
  dumpil <arguments>                                       Displays the Microsoft intermediate language (MSIL) that is associated with a managed method.
  dumplog <arguments>                                      Writes the contents of an in-memory stress log to the specified file.
  dumpmd <arguments>                                       Displays information about a MethodDesc structure at the specified address.
  dumpmodule <arguments>                                   Displays information about a EE module structure at the specified address.
  dumpmt <arguments>                                       Displays information about a method table at the specified address. 
  dumpobj, do <arguments>                                  Displays info about an object at the specified address.
  dumpobjgcrefs <object>                                   A helper command to implement !dumpobj -refs
  dumppermissionset <arguments>                            Displays a PermissionSet object (debug build only).
  dumprcw <arguments>                                      Displays information about a Runtime Callable Wrapper.
  dumprequests, DumpRequests                               Displays all currently active incoming HTTP requests.
  dumpruntimetypes, DumpRuntimeTypes                       Finds all System.RuntimeType objects in the GC heap and prints the type name and MethodTable they refer too.
  dumpsig <arguments>                                      Dumps the signature of a method or field specified by <sigaddr> <moduleaddr>.
  dumpsigelem <arguments>                                  Dumps a single element of a signature object.
  dumpstackobjects, dso, DumpStackObjects <stackbounds>    Displays all managed objects found within the bounds of the current stack.
  dumpvc <arguments>                                       Displays info about the fields of a value class.
  dw <address>                                             Dumps memory as words (ushort).
  eeheap, EEHeap <memoryrange>                             Displays information about native memory that CLR has allocated.    
  eeversion <arguments>                                    Displays information about the runtime version.
  ehinfo <arguments>                                       Displays the exception handling blocks in a JIT-ed method.
  enummem <arguments>                                      ICLRDataEnumMemoryRegions.EnumMemoryRegions test command.
  ephrefs                                                  Finds older generation objects which reference objects in the ephemeral segment.
  ephtoloh                                                 Finds ephemeral objects which reference the large object heap.      
  exit, quit, q                                            Exits interactive mode.
  finalizequeue, fq, FinalizeQueue                         Displays all objects registered for finalization.
  findappdomain <arguments>                                Attempts to resolve the AppDomain of a GC object.
  gchandleleaks <arguments>                                Helps in tracking down GCHandle leaks.
  gchandles <arguments>                                    Provides statistics about GCHandles in the process.
  gcheapstat, GCHeapStat                                   Displays various GC heap stats.
  gcinfo <arguments>                                       Displays JIT GC encoding for a method.
  gcroot, GCRoot <target>                                  Displays info about references (or roots) to an object at the specified address.
  gcwhere, GCWhere <address>                               Displays the location in the GC heap of the specified address.      
  help, soshelp <command>                                  Displays help for a command.
  histclear <arguments>                                    Releases any resources used by the family of Hist commands.
  histinit <arguments>                                     Initializes the SOS structures from the stress log saved in the debuggee.
  histobj <arguments>                                      Examines all stress log relocation records and displays the chain of garbage collection relocations that may have led to  the address passed in as an argument.
  histobjfind <arguments>                                  Displays all the log entries that reference an object at the specified address.
  histroot <arguments>                                     Displays information related to both promotions and relocations of the specified root.
  histstats <arguments>                                    Displays stress log stats.
  ip2md <arguments>                                        Displays the MethodDesc structure at the specified address in code that has been JIT-compiled.
  listnearobj, lno, ListNearObj <address>                  Displays the object preceding and succeeding the specified address. 
  loadsymbols <url>                                        Loads symbols for all modules.
  logclose <path>                                          Disables console file logging.
  logging <path>                                           Enables/disables internal diagnostic logging.
  logopen <path>                                           Enables console file logging.
  modules, lm                                              Displays the native modules in the process.
  rallel Stacks' panel.
  pathto, PathTo <source> <target>                         Displays the GC path from <root> to <target>.
  printexception, pe <arguments>                           Displays and formats fields of any object derived from the Exception class at the specified address.
  registers, r                                             Displays the thread's registers.
  runtimes <id>                                            Lists the runtimes in the target or changes the default runtime.
  setclrpath <path>                                        Sets the path to load coreclr DAC/DBI files.
  setsymbolserver, SetSymbolServer <url>                   Enables and sets symbol server support for symbols and module download.
  sizestats                                                Size statistics for the GC heap.
  sos, ext <command_and_arguments>                         Executes various SOS debugging commands.
  sosflush                                                 Resets the internal cached state.
  sosstatus                                                Displays internal status.
  syncblk <arguments>                                      Displays the SyncBlock holder info.
  taskstate, tks <address>                                 Displays a Task state in a human readable format.
  threadpool, ThreadPool                                   Displays info about the runtime thread pool.
  threadpoolqueue, tpq                                     Displays queued ThreadPool work items.
  threads, setthread <thread>                              Lists the threads in the target or sets the current thread.
  threadstate <arguments>                                  Pretty prints the meaning of a threads state.
  timerinfo, ti                                            Displays information about running timers.
  traverseheap, TraverseHeap <filename>                    Writes out heap information to a file in a format understood by the CLR Profiler.
  verifyheap, VerifyHeap <memoryrange>                     Searches the managed heap for memory corruption..
  verifyobj, VerifyObj <objectaddress>                     Checks the given object for signs of corruption.
  watsonbuckets <arguments>                                Displays the Watson buckets.
  ```

- DebugDiag

- [MemoScope.Net: Dump and analyze .Net applications memory ( a gui for WinDbg and ClrMd )](https://github.com/fremag/MemoScope.Net)

- dotMemory: [Analyze Process Dumps | dotMemory Documentation](https://www.jetbrains.com/help/dotmemory/Importing_Process_Dumps.html#getting-a-process-memory-dump)
  - `scoop install dotmemory`
  - 不全？