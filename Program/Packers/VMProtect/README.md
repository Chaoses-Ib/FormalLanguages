# [VMProtect](https://vmpsoft.com/)
## Versions
- v3.5.1
  - 2022-09 [\[调查\]VMProtect Source Code Leak-资源下载-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-274475.htm)
  - 2023-12 [\[原创\]VMP完整源码大放送-编程技术-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-279796-1.htm)
  - 2023-12 [jmpoep/vmprotect-3.5.1](https://github.com/jmpoep/vmprotect-3.5.1)

  [\[原创\]VMP源码之我见-编程技术-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-279792.htm)

  [\[原创\]VMP源码泄露后的一些分析和用途-编程技术-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-279763.htm)

  [\[原创\]VMP泄露编译的一些注意事项-编程技术-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-279803.htm)

- v3.6.0
  ```
  [*] .NET: Improved renaming of virtual methods
  [*] .NET: Fixed a bug that occurred inside finally blocks of virtualized methods
  [*] Mach-O: Improved support of macOS 12 Monterey
  [*] PE: Improved antidebug
  [+] .NET: Added support of volatile and calli
  [+] PE: Added support of Windows for ARM (for Intel binaries only)
  [+] PE: Improved support of WINE
  [+] PE: Added support of MAP files for Free Pascal and MinGW
  [+] Added the ability to create segments with random symbols using mask ‘?’
  ```

- v3.8.1
  ```
  [!] PE: Fixed small bugs
  [*] Updated documentation of Virtual Machine options
  [*] PE: Improved VMProtectGetCurrentHWID to get HDD serial number
  ```

- v3.8.4.1754
  ```
  FIXES
  Mach-O: Improved support of Rosetta 2 on M1/M2 NET: Improved support of WPF applications ELF: Improved support of binaries without sections
  NEW FEATURES
  Intel: Added disassembling BZHI, ANDN, VFMADDSUB132PD, VFMADDSUB213PD, VFMADDSUB231PD, VFMADDSUB132PS, VFMADDSUB213PS and VFMADDSUB231PS
  ```
  - `LiuMing [1900001339@qq.com], Personal License`: `a56bbd58dfe63bfdfc9b6518561eae4c8025d0f5`

- v3.8.5.1879

  - [VMProtect Ultimate 3.8.5.1879 - 吾爱破解 - 52pojie.cn](https://www.52pojie.cn/thread-1863212-1-1.html)
    ```
    PasswordHash=b32bff6893a89963d1b08aa381726f61488ff19d
    PasswordSalt=a420d8ea9365a50f
    ```

- v3.8.6.1926
  - [VMProtect Ultimate Retail Licensed 3.8.6.1926 | HvH?](https://hackvshack.net/threads/vmprotect-ultimate-retail-licensed-3-8-6-1926.4649/)

- v3.8.7.2001 Lite
  ```
  IMPROVEMENTS
  PE: Improved anti debug
  .NET: Improved code mutation
  NEW FEATURES
  .NET: Added support of self contained applications
  .NET: Added Stack Trace Decoder
  ```

[VMProtect 3.8.7 скачать бесплатно](https://softoroom.org/topic92378.html)

闲鱼

## Packer
[\[讨论\]VMP全保护带VM脱壳演示-加壳脱壳-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-283102.htm)

## Lock to serial number
```cpp
void IntelVirtualMachine::CompileCommand(IntelVMCommand &vm_command)
{
  ...
  uint32_t crypted_value[4];
  size_t i;
  for (i = 0; i < _countof(crypted_value); i++) {
    crypted_value[i] = rand32();
  }
  switch (vm_command.crypt_size()) {
  case osDWord:
    crypted_value[3] = static_cast<uint32_t>(value);
    break;
  case osQWord:
    *reinterpret_cast<uint64_t*>(&crypted_value[2]) = value;
    break;
  }
  uint32_t dw = 0;
  for (i = 1; i < 4; i++) {
    dw += crypted_value[i];
  }
  crypted_value[0] = 0 - dw;
  EncryptBuffer(crypted_value, vm_command.crypt_key());
  ...
}
```
- `crypted_value = { -sum(others), rand(), rand() or value >> 32, value }`, so that `sum(crypted_value) == 0`

```cpp
static void EncryptBuffer(uint32_t *buffer, uint64_t key)
{
	uint32_t key0 = static_cast<uint32_t>(key >> 32);
	uint32_t key1 = static_cast<uint32_t>(key);
	buffer[0] = _rotr32(buffer[0] - key0, 7) ^ key1;
	buffer[1] = _rotr32(buffer[1] - key0, 11) ^ key1;
	buffer[2] = _rotr32(buffer[2] - key0, 17) ^ key1;
	buffer[3] = _rotr32(buffer[3] - key0, 23) ^ key1;
}
```
- Ciphertext pattern?

```cpp
void LicensingManager::DecryptBuffer(uint8_t *buffer)
{
  // session_key_ = 0 - static_cast<uint32_t>(loader_data->session_key());
	uint32_t key0 = static_cast<uint32_t>(product_code_);
	uint32_t key1 = static_cast<uint32_t>(product_code_ >> 32) + session_key_;
	uint32_t *p = reinterpret_cast<uint32_t*>(buffer);

	p[0] = _rotl32((p[0] + session_key_) ^ key0,  7) + key1;
	p[1] = _rotl32((p[1] + session_key_) ^ key0, 11) + key1;
	p[2] = _rotl32((p[2] + session_key_) ^ key0, 17) + key1;
	p[3] = _rotl32((p[3] + session_key_) ^ key0, 23) + key1;

	if (p[0] + p[1] + p[2] + p[3] != session_key_ * 4) {
		const VMP_CHAR *message;
#ifdef VMP_GNU
		message = VMProtectDecryptStringA(MESSAGE_SERIAL_NUMBER_REQUIRED_STR);
#else
		message = VMProtectDecryptStringW(MESSAGE_SERIAL_NUMBER_REQUIRED_STR);
#endif
		if (message[0]) 
			ShowMessage(message);

#if defined(VMP_GNU)
		exit(0xDEADC0DE);
#elif defined(WIN_DRIVER)
		DbgBreakPointWithStatus(0xDEADC0DE);
#else
		TerminateProcess(GetCurrentProcess(), 0xDEADC0DE);
#endif
	}
}
```
- The key has only 64 bits in total, and `session_key` is derived from `rdtsc` (or `Random().Next()` in .NET), even the algorithm is also very simple. These make it prone to brute force attacks.
- 进函数锁会给代码加上 session key，而解密用的 session key 是负的，解密算法就相当于 `decrypt(v - session_key_) - session_key_`，后面的 `- session_key_` 会导致解密后的值都负 `session_key` 个值，但是再次进函数锁又会加上 session key，就变成正确代码了
- 四个 u32 不是直接的代码，而是 `crypted_value = { -sum(others), rand(), rand() or value >> 32, value }`，这样四个加起来就等于 0，所以才会校验 `p[0] + p[1] + p[2] + p[3] != session_key_ * 4`
- 这样相当于加解密分散了好几处，还带了校验，防逆向确实不错，不过膨胀也很厉害，而且有校验爆破起来也更快了

## Anti-debugging
[VMP源码分析：反调试与绕过方法-加壳脱壳-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-282244.htm)
- `wine_get_version`

## Analysis
[x64Unpack: Hybrid Emulation Unpacker for 64-bit Windows Environments and Detailed Analysis Results on VMProtect 3.4](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=9139515)

[\[原创\]利用机器学习分析vmp的思路 - 看雪论坛](https://bbs.pediy.com/thread-268964.htm)

[VMP 核心原理 - So who are you](https://kms.app/archives/247/)

[vmp初级逆向 findFlag - So who are you](https://kms.app/archives/159/)

[vmp 相关的问题-软件逆向-看雪论坛-安全社区|安全招聘|bbs.pediy.com](https://bbs.pediy.com/thread-269976.htm)

[看雪精品新课，重磅上线！《VMProtect分析与还原》 - 看雪学苑](https://mp.weixin.qq.com/s/dZzGyU-HVADSzloMKEHpKg)

~~[VMProtect 2 - Detailed Analysis of the Virtual Machine Architecture - 看雪论坛](https://bbs.pediy.com/thread-267731.htm)~~

[mike1k/VMPImportFixer: Fix VMProtect Import Protection](https://github.com/mike1k/VMPImportFixer)

[重磅新课！《VMProtect分析与还原》 - 看雪学苑](https://mp.weixin.qq.com/s/IWbt85Q_hIOUZ5n7VV0nng)

[archercreat/vmpfix: Universal x86/x64 VMProtect 2.0-3.X Import fixer](https://github.com/archercreat/vmpfix)

[JonathanSalwan/VMProtect-devirtualization: Playing with the VMProtect software protection. Automatic deobfuscation of pure functions using symbolic execution and LLVM.](https://github.com/JonathanSalwan/VMProtect-devirtualization)

[Vmprotect3.5.1 壹之型 — 暗月·宵之宫 - 看雪学苑](https://mp.weixin.qq.com/s/El1P_Cq-ZIlFXLEwIvp0JA)

## \_xeroxz
[Back Engineering](https://back.engineering/)

[IDontCode -  Githacks: Private Group Of Back Engineers](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/_xeroxz)

[IDontCode (@_xeroxz) / Twitter](https://twitter.com/_xeroxz)

- VMProtect 2
  - [VMProtect 2 - Detailed Analysis of the Virtual Machine Architecture // Back Engineering](https://back.engineering/17/05/2021/)
  - [VMProtect 2 - Part Two, Complete Static Analysis // Back Engineering](https://back.engineering/21/06/2021/)
  - [vmp2/vmprofiler](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/vmp2/vmprofiler)

    [VMProfiler](https://docs.back.engineering/vmprofiler/)
  - [vmp2/vmdevirt](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/vmp2/vmdevirt)
  - [vmp2/vmeum](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/vmp2/vmemu)
  - [vmp2/vmassembler](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/vmp2/vmassembler)

    [VMAssembler](https://docs.back.engineering/vmassembler/)

- VMProtect 3
  - [vmp3/vmprofiler](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/vmp3/vmprofiler)
  - [vmp3/vmemu](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/vmp3/vmemu)

    [vmp3/vmemu: VMProtect 3 Virtual Machine Handler Emulation - vmemu - Private Group Of Back Engineers](https://git.back.engineering/vmp3/vmemu)
  - [vmp3/vmdevirt](http://rexw3wrz5pldtadf3hy4vqnuzokhco4l32kyntj36fcgpjuy3nvxidid.onion/vmp3/vmdevirt)

    [vmp3/vmdevirt: VMProtect 3 Static Devirtualization - vmdevirt - Private Group Of Back Engineers](https://git.back.engineering/vmp3/vmdevirt)

- [Theodosius - Jit linker, Mapper, Mutator, and Obfuscator](https://docs.back.engineering/theo/)

### vmdevirt
```sh
git clone https://git.back.engineering/vmp3/vmdevirt.git --recurse-submodules --shallow-submodules
cd vmdevirt
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
mkdir include
cmake -B build
cd build
make
```
需要编译 LLVM。