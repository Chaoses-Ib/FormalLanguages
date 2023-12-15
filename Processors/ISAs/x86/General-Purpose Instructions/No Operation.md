# No Operation
Recommended Multi-Byte Sequence of NOP Instruction[^sdm]:

| Length | Assembly | Byte Sequence |
|--------|----------|---------------|
| 1 byte | `NOP` | 90 |
| 2 bytes | `66 NOP` | 66 90 |
| 3 bytes | `NOP DWORD ptr [EAX]` | 0F 1F 00 |
| 4 bytes | `NOP DWORD ptr [EAX + 00H]` | 0F 1F 40 00 |
| 5 bytes | `NOP DWORD ptr [EAX + EAX*1 + 00H]` | 0F 1F 44 00 00 |
| 6 bytes | `66 NOP DWORD ptr [EAX + EAX*1 + 00H]` | 66 0F 1F 44 00 00 |
| 7 bytes | `NOP DWORD ptr [EAX + 00000000H]` | 0F 1F 80 00 00 00 00 |
| 8 bytes | `NOP DWORD ptr [EAX + EAX*1 + 00000000H]` | 0F 1F 84 00 00 00 00 |
| 9 bytes | `66 NOP DWORD ptr [EAX + EAX*1 +00000000H]` | 66 0F 1F 84 00 00 00 00 00 |
| 10 bytes | `NOP DWORD ptr [AX + AX*1 + 00000000H]` | 66 66 0F 1F 84 00 00 00 00 00[^multi-so] |
| 11 bytes | `NOP DWORD ptr [AX + AX*1 + 00000000H]` | 66 66 66 0F 1F 84 00 00 00 00 00[^multi-so] |

The one-byte NOP instruction is an alias mnemonic for the `XCHG (E)AX, (E)AX` instruction.

The multi-byte NOP instruction performs no operation on supported processors and generates **undefined opcode exception** on processors that do not support the multi-byte NOP instruction. All Intel processors back to [Pentium Pro](https://en.wikipedia.org/wiki/Pentium_Pro) (except Pentium MMX) support multi-byte NOP.[^intel]

[assembly - Long multi-byte NOPs: commonly understood macros or other notation - Stack Overflow](https://stackoverflow.com/questions/25545470/long-multi-byte-nops-commonly-understood-macros-or-other-notation)


[^sdm]: Intel® 64 and IA-32 Architectures Software Developer Manuals
[^multi-so]: [assembly - x86 multi-byte NOP and instruction prefix - Stack Overflow](https://stackoverflow.com/questions/27714524/x86-multi-byte-nop-and-instruction-prefix)
[^intel]: [Multi-byte NOP opcode made official - Intel Community](https://community.intel.com/t5/Software-Archive/Multi-byte-NOP-opcode-made-official/td-p/932580)