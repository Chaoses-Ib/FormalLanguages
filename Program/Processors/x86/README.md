# x86
[Crafting the Impossible: X86 Virtualization in the Browser with WebAssembly by Alessandro Pignotti](https://gitnation.com/contents/crafting-the-impossible-x86-virtualization-in-the-browser-with-webassembly)

- Size and complexity
  
  > The x86-64 ISA has a large number of instructions, partly because of a large number of complex instructions and partly because it keeps most of the legacy and deprecated instructions (∼ 336+) for the sake of backwards compatibility. It consists of 996 mnemonics, and each mnemonic admits several variants, depending on the types (i.e., register, memory, or constant) and the size (i.e., the bit-width) of operands.[^dasguptaCompleteFormalSemantics2019]

- Inconsistent instruction variants

  > Some variants have divergent behaviors more than the difference of their type and size. For example, `movsd`, one of the 128-bit SSE instructions, has very different behaviors depending on whether the type of the source operand is register or memory; it clears the higher 64 bits of the target register only when the source type is memory. Indeed, we revealed bugs in other semantics due to their incorrect generalization of the variants’ behavior.[^dasguptaCompleteFormalSemantics2019]

- Ambiguous documentation
  
  > The x86-64 reference manual informally explains the instruction behaviors, leaving certain details unspecified or ambiguous, which required us to consult with an actual processor implementation to clarify such details. Completely formalizing the vast number of instructions with carefully identifying all the corner cases from the informal document, thus, is highly non-trivial.[^dasguptaCompleteFormalSemantics2019]

- Undefined behaviors

  > The x86-64 standard also admits undefined behaviors that are implementation-dependent. Many instructions (32 out of 996 mnemonics) have undefined behaviors: their output values of the destination register or the `%rflags` register are undefined in certain cases. That is, the processor is free to choose any behavior in undefined cases.
  > 
  > For example, the parity flag `%pf` is undefined in the logical-and-not instruction `andn`, where the processor implementation is allowed to either update the flag value (to 0 or 1), or keep the previous value.[^dasguptaCompleteFormalSemantics2019]

[x86 instruction listings - Wikipedia](https://en.wikipedia.org/wiki/X86_instruction_listings)

[Alternate Instruction Set - Wikipedia](https://en.wikipedia.org/wiki/Alternate_Instruction_Set)

## Formal semantics
- 2014-10 ACL2[^goelSimulationFormalVerification2014]

  > Goel et al. use the ACL2 theorem prover to model the x86-64 ISA and they support 33% of all user-level instructions, plus some system-level instructions, paging, and segmentation. This list is far from a complete semantic definition of x86-64, but it is still the state-of-the-art in terms of formal analysis applied directly to x86-64 code. It is also an executable definition as demonstrated by its use for simulations.[^dasguptaCompleteFormalSemantics2019]

  - Sail: [sail-x86-from-acl2: Sail x86 model automatically translated from the ACL2 model](https://github.com/rems-project/sail-x86-from-acl2)

- 2019-06 [kframework/X86-64-semantics: Semantics of x86-64 in K](https://github.com/kframework/X86-64-semantics)[^dasguptaCompleteFormalSemantics2019]

  [Hacker News](https://news.ycombinator.com/item?id=19729286)
  > Like closely related previous work, we omit the relaxed memory model of x86-64 and thus the concurrency-related operations.

- 2024-10 [libLISA - Instruction Discovery and Analysis on x86-64](https://liblisa.nl/) ([GitHub](https://github.com/libLISA/liblisa))

  > We do not have support for synthesis of floating point operations, but we can analyze these instructions and generate encodings.

  [Hacker News](https://news.ycombinator.com/item?id=41932995)
  > This is interesting work but it totally misses the boat when it talks about the current state of the art. They cite a 2014 version of the Goel-Hunt-et al formal x86 model in ACL2, but they fail to talk about its modern version. The modern version (developed at Centaur and then Intel!) is an ACL2 x86 model that is so precise that it can boot Linux and run user-land programs. Let me say that again: it is a formal mathematical model of a processor that is so precise that it can boot Linux and run user-land programs! This is a monumental accomplishment and is not even mentioned in their paper.

## Implementations
### Intel
[Intel® 64 and IA-32 Architectures Software Developer Manuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html):
- Volume 1: Basic Architecture
- Volume 2: Instruction Set Reference, A- Z
- Volume 3: System Programming Guide
- Volume 4: Model-specific Registers

Intel® 64 and IA-32 Architectures Optimization Reference Manual
- [Code samples](https://github.com/intel/optimization-manual)

### AMD
AMD64 Architecture Programmer’s Manual:
- Volume 1: Application Programming
- Volume 2: System Programming
  - [24593 v3.41 2023-06](https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf)
- Volume 3: General-Purpose and System Instructions
  - [24594 v3.35 2023-06](https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24594.pdf)
- Volume 4: 128-Bit and 256-Bit Media Instructions
- Volume 5: 64-Bit Media and x87 Floating-point Instructions

## Tools
- [horsicq/XOpcodeCalc: Opcode calculator / ASM calculator](https://github.com/horsicq/XOpcodeCalc)


[^dasguptaCompleteFormalSemantics2019]: Dasgupta, S., Park, D., Kasampalis, T., Adve, V. S., & Roşu, G. (2019). A complete formal semantics of x86-64 user-level instruction set architecture. Proceedings of the 40th ACM SIGPLAN Conference on Programming Language Design and Implementation, 1133–1148. https://doi.org/10.1145/3314221.3314601
[^goelSimulationFormalVerification2014]: Goel, S., Hunt, W. A., Kaufmann, M., & Ghosh, S. (2014). Simulation and Formal Verification of x86 Machine-Code Programs that make System Calls. Proceedings of the 14th Conference on Formal Methods in Computer-Aided Design, 91–98.
