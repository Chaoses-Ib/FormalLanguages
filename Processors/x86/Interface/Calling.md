# Calling Conventions
## x86-64
### Microsoft x64 calling convention
The Microsoft x64 calling convention is followed on Windows and pre-boot UEFI (for long mode on x86-64).[^wiki]

```cpp
RAX func(RCX, RDX, R8, R9, qword shadow_space[4], qword... args)
XMM0 func(XMM0, XMM1, XMM2, XMM3, qword shadow_space[4], qword... args)
```

Registers:
- Volatile (7): RAX, {RCX, RDX, R8, R9}, R10, R11
- Nonvolatile (9): RBX, *RDI, RSI,* RSP, RBP, R12~R15

Stack:
- Return address
- (Caller clean-up)
- Addtional arguments
- Shadow space  
  > 保留 shadow space 主要是为了方便保留参数的原值，以及使得参数能够在栈上保持连续，方便遍历栈（va_list）。[^shadow-space-raymond-1]
  > 
  > 另外，即使参数不到4个，微软的 x64 调用约定也要求保留 shadow space。这条规则的主要原因是C允许 unprototyped function，一个函数在被调用时传入了几个参数是不确定的，如果不统一 shadow space 大小，编译器实际上就没法利用 shadow space 了。[^shadow-space-raymond-2]
  [^shadow-space-v2ex]

Arguments:
- First four integer, struct or pointer arguments: RCX, RDC, R8, R9
- First four floating point arguments: XMM0~XMM3
- Additional arguments: stack (right-to-left)
- No zero extension

Return value:
- Integer or struct up to 64 bits: RAX (zero-extended)
- Floating point: XMM0
- Oversized struct: a pointer to a caller-provided space is prepended as the first argument

[^shadow-space-raymond-1]: [Can an x64 function repurpose parameter home space as general scratch space? - The Old New Thing](https://devblogs.microsoft.com/oldnewthing/20130830-00/?p=3363)
[^shadow-space-raymond-2]: [Why does the x64 calling convention reserve four home spaces for parameters even for functions that take fewer than four parameters? - The Old New Thing](https://devblogs.microsoft.com/oldnewthing/20160623-00/?p=93735)
[^shadow-space-v2ex]: [64 位汇编 4 位以上的参数入栈为什么从 32\[rsp\]开始？ - V2EX](https://www.v2ex.com/t/836362?p=1#r_11406196)

### System V AMD64 ABI
The calling convention of the System V AMD64 ABI is followed on Solaris, Linux, FreeBSD, macOS, and is the de facto standard among Unix and Unix-like operating systems. The OpenVMS Calling Standard on x86-64 is based on the System V ABI with some extensions needed for backwards compatibility.[^wiki]

```cpp
RAX func(RDI, RSI, RDX, RCX, R8, R9, qword... args)
XMM0 func(XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7, qword... args)
```

Registers:
- Volatile (9): RAX, {*RDI, RSI,* RDX, RCX, R8, R9}, R10, R11
- Nonvolatile (7): RBX, RSP, RBP, R12~R15

Stack:
- Red zone  
  > For leaf-node functions (functions which do not call any other functions), a 128-byte space is stored just beneath the stack pointer of the function. The space is called the red zone. This zone will not be clobbered by any signal or interrupt handlers. Compilers can thus use this zone to save local variables. Compilers may omit some instructions at the starting of the function (adjustment of RSP, RBP) by using this zone. However, other functions may clobber this zone. Therefore, this zone should only be used for leaf-node functions. GCC and Clang offer the `-mno-red-zone` flag to disable red-zone optimizations.[^wiki]
- Return address
- (Caller clean-up)
- Addtional arguments

Arguments: 
- First six integer or pointer arguments: RDI, RSI, RDX, RCX, R8, R9
- First eight floating point arguments: XMM0~XMM7  
  If the callee is a variadic function, then the number of floating point arguments passed to the function in vector registers must be provided by the caller in the AL register.
- Additional arguments: stack (right-to-left)
- Static chain pointer[^static-chain-pointer]: R10

Return value:
- Integer up to 128 bits: RAX, \[RDX\]
- Floating point: XMM0, XMM1 (or YMM, ZMM)

[^static-chain-pointer]: [assembly - Acceptability of regular usage of r10 and r11 - Stack Overflow](https://stackoverflow.com/questions/49928950/acceptability-of-regular-usage-of-r10-and-r11)

[^wiki]: [x86 calling conventions - Wikipedia](https://en.wikipedia.org/wiki/X86_calling_conventions#x86-64_calling_conventions)