# Executable Formats
## Debugging information
### PDB
- [sonyps5201314/pdb: ida pdb plugin with enhance and bugfix](https://github.com/sonyps5201314/pdb)
  
  [PDB 插件修复增强](https://bbs.pediy.com/thread-266189.htm)

## Overlay
An **overlay (附加数据段)** is the auxiliary data attached after the logical end of an executable, and it often contains application specific data (this is a common practice to avoid an extra data file, though it would be better to use resource sections).[^overlay-upx]

> The overlay options are mostly for Win32. None of the Linux ELF formats support such piggybacked data.[^overlay-upx-linux]

[PE File Overlay Extraction - AutoIt Example Scripts - AutoIt Forums](https://www.autoitscript.com/forum/topic/153277-pe-file-overlay-extraction/)

[如何才能在不修改文件，不修改注册表、不联网的情况下判断是否首次打开软件？ - 问题求助❓ - 小众软件官方论坛](https://meta.appinn.net/t/topic/50462?u=chaoses_ib)


[^upx]: [upx(1): compress/expand executable files - Linux man page](https://linux.die.net/man/1/upx)
[^overlay-upx-linux]: [UPX - a powerful executable packer / Discussion / Help: Overlay data problem in linux/elf386 binaries](https://sourceforge.net/p/upx/discussion/6806/thread/79e2a6b8/)