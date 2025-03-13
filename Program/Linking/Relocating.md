# Relocating
[Wikipedia](https://en.wikipedia.org/wiki/Relocation_(computing))

For:
- [Dynamic linking](Dynamic/README.md)

Applications:
- ASLR
- DLL base address conflict

## x86
- x64 不方便用绝对地址，很多都是 `lea [rip+xx]` 这样的相对寻址，就更少用到重定位了。
  - Rust: 1055 (174 imports) → 157 (171 imports)

[portable executable - Relocation of PE DLLs - Load-time or like ELF? - Stack Overflow](https://stackoverflow.com/questions/33443618/relocation-of-pe-dlls-load-time-or-like-elf)
> For WIN32 images where relocation information is present (non-EXEs, typically), all absolute addresses in the binary code each have a corresponding fixup record so that the address can be patched up by the loader in case the module's preferred load address has already been taken by something else.
>
> For WIN64 images, the situation is similar in principle, but in reality nearly all 64-bit instructions actually use a position-independent encoding where offsets are IP-relative and not absolute, so far fewer relocation fixups are necessary (if at all).

[windows - Relocation tables in PE is legacy? - Stack Overflow](https://stackoverflow.com/questions/76494223/relocation-tables-in-pe-is-legacy)
> Normally on x64, to refer to an address that is fixed relative to IMAGE BASE, RIP-relative `lea` (or RIP-relative addressing in general) is used, which adds a constant offset to the address of the byte directly after it (not to IMAGE BASE). x64 does not have many places where a 64-bit absolute address can be used directly in instructions (a 64-bit address can be loaded into a register the same as any 64-bit integer, or used as an address but only in `mov` to and from `rax/eax/ax/al`), making it inconvenient (though possible) to rely on relocations completely.
>
> On the other hand, relocations are useful to update addresses that are stored in data segments, which are usually absolute addresses (otherwise they would be inconvenient to use, making them RIP-relative doesn't really work at all (which RIP), and putting a raw RVA would work but requires adding IMAGE BASE manually at every use). For other architectures such as ARM, MIPS, RISC-V, relocations may be more important (and maybe more complicated).

## PE
```cpp
typedef struct _IMAGE_BASE_RELOCATION
{ DWORD     VirtualAddress;
  DWORD     SizeOfBlock;
} IMAGE_BASE_RELOCATION, *PIMAGE_BASE_RELOCATION;
```
> After this header are a list of word (2 bytes !), ending with the block (so we need to use `SizeOfBlock` to know when to stop). Each word is as follow:
> - 4 bits for the type of the relocation (only one is really used to make changes)
> - 12 bits for the offset, relative to the block's `VirtualAddress`
>
> This basically gives us an array of Virtual Addresses to patch. The patching consist of shifting the DWORD pointed to by as much as we shifted the "Image Base" of the module.
