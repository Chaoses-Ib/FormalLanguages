# Packers
[Wikipedia](https://en.wikipedia.org/wiki/Executable_compression)

[List of executable packers - Wikipedia](https://en.wikipedia.org/wiki/Executable_compression#List_of_executable_packers)

[packing-box/awesome-executable-packing: A curated list of awesome resources related to executable packing](https://github.com/packing-box/awesome-executable-packing)

[ProtectMyTooling: Multi-Packer wrapper letting us daisy-chain various packers, obfuscators and other Red Team oriented weaponry. Featured with artifacts watermarking, IOCs collection & PE Backdooring. You feed it with your implant, it does a lot of sneaky things and spits out obfuscated executable.](https://github.com/mgeeky/ProtectMyTooling)

## Compressors
- [UPX](UPX/README.md)
- [runestubbe/Crinkler](https://github.com/runestubbe/Crinkler)

## Protecters
[保护壳简介 - CTF Wiki](https://ctf-wiki.org/reverse/windows/unpack/packer-introduction/)

- Differential cryptanalysis

  所有公开可用的 protecter 都会面临差分攻击的问题，限制 protect 选项和频次以及增大随机性能够缓解这一问题，SaaS 能进一步缓解。

  e.g. [Vmprotect3.5.1 壹之型 — 暗月·宵之宫 - 看雪学苑](https://mp.weixin.qq.com/s/El1P_Cq-ZIlFXLEwIvp0JA)

[What in you opinion, is the strongest exe protection solution? : ReverseEngineering](https://www.reddit.com/r/ReverseEngineering/comments/h26cm/what_in_you_opinion_is_the_strongest_exe/)

- [czs108/Windows-PE-Packer: 🗜️ A packer for Windows x86 executable files written in C and Intel x86 Assembly. The new file after packing can obstruct reverse engineering.](https://github.com/czs108/Windows-PE-Packer)
- [hid3rx/PEPacker](https://github.com/hid3rx/PEPacker)

Rust:
- [guardian-rs: x86-64 code/pe virtualizer](https://github.com/felix-rs/guardian-rs)

[\[Discuss\] vmprotect, themida, enigma](https://www.unknowncheats.me/forum/anti-cheat-bypass/504979-vmprotect-themida-enigma.html)

[\[Question\] VMProtect + Nuitka](https://www.unknowncheats.me/forum/anti-cheat-bypass/668906-vmprotect-nuitka.html)

## Signatures
- [Detect-It-Easy/db/PE/\_\_GenericHeuristicAnalysis\_By\_DosX.7.sg at a5cf18cc9814211fe868a20cac447ec491cb5d90 - horsicq/Detect-It-Easy](https://github.com/horsicq/Detect-It-Easy/blob/a5cf18cc9814211fe868a20cac447ec491cb5d90/db/PE/__GenericHeuristicAnalysis_By_DosX.7.sg#L310)
  - Strange sections
    - `PE.getNumberOfSections() > (!isClrNET() ? 6 : 10) || !PE.section[".text"]`
    - `sectionName[0] !== "." && sectionName.length < 3`
    - ``const badChars = '_-=+~!@#$%^&*()"№;%:?*():;,/\\|\'`<>.0123456789';``
    - [Except MinGW](https://github.com/horsicq/Detect-It-Easy/blob/a5cf18cc9814211fe868a20cac447ec491cb5d90/db/PE/__GenericHeuristicAnalysis_By_DosX.7.sg#L2670-L2682)

## Unpacking
### Original entry point
- 单步跟踪法
  
  跟踪，直到 OEP。

- ESP 定律法
  
  如果壳在入口点将上下文保存到了栈上，就可以通过对栈上的上下文内存下断，定位到恢复上下文信息的地址，通常之后就是 OEP 了。

- 出口标志法（一步到达 OEP 法）

  通过查找特征指令（popad），定位到恢复上下文信息的地址。

### Dump
由 dump 得到的程序会缺少原 IAT 和重定位表。重定位表对于 EXE 并不必需，只要关掉 ASLR 的话没有也无妨；IAT 就需要进行恢复了。