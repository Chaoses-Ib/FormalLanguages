# UPX
[upx/upx: UPX - the Ultimate Packer for eXecutables](https://github.com/upx/upx)

[\[原创\] UPX源码学习和简单修改-加壳脱壳-看雪](https://bbs.kanxue.com/thread-275753.htm)

`scoop install upx`

适合用于 使用少且硬盘占用大 的软件

- 会增加内存占用
- 会降低启动速度（？）
  
  虽然解压增加了时间，但是压缩不也节省了硬盘时间？特别是对于 HDD。UPX 真的会降低启动速度？
- 可能导致被误报

UPX 可以看作是智能存储需求下的初代解决方案。

`upx: Mile.Aria2.exe: CantPackException: GUARD_CF enabled PE files are not supported (use --force to disable)`

[delphi - Why does my application use more memory after I compress it with UPX, and what can I do about it? - Stack Overflow](https://stackoverflow.com/questions/9219244/why-does-my-application-use-more-memory-after-i-compress-it-with-upx-and-what-c)

[You can compress with upx (at the cost of increased startup time in the order of... | Hacker News](https://news.ycombinator.com/item?id=21907511)

## Anti-unpacking
- [UPX-Patcher: Make "upx -d" unpacking impossible!](https://github.com/DosX-dev/UPX-Patcher)

Anti-anti-unpacking:
- Manual unpacking

- [DosX-dev/UPX-Patcher: Make "upx -d" unpacking impossible!](https://github.com/DosX-dev/UPX-Patcher)

- [JPCERTCC/upx-mod: Modified from UPX to allow unpacking of ELF binary using the UPX anti-unpacking technique.](https://github.com/JPCERTCC/upx-mod)

  [Anti-UPX Unpacking Technique - JPCERT/CC Eyes | JPCERT Coordination Center official Blog](https://blogs.jpcert.or.jp/en/2022/03/anti_upx_unpack.html)

- [ThomasThelen/upxUnpacker: Scripts for x64dbg to find the OEP of exe files packed with UPX](https://github.com/ThomasThelen/upxUnpacker)

- [unipacker: Automatic and platform-independent unpacker for Windows binaries based on emulation](https://github.com/unipacker/unipacker)