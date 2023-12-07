# VMProtect
[\[原创\]利用机器学习分析vmp的思路 - 看雪论坛](https://bbs.pediy.com/thread-268964.htm)

[VMP 核心原理 - So who are you](https://kms.app/archives/247/)

[vmp初级逆向 findFlag - So who are you](https://kms.app/archives/159/)

[vmp 相关的问题-软件逆向-看雪论坛-安全社区|安全招聘|bbs.pediy.com](https://bbs.pediy.com/thread-269976.htm)

[看雪精品新课，重磅上线！《VMProtect分析与还原》 - 看雪学苑](https://mp.weixin.qq.com/s/dZzGyU-HVADSzloMKEHpKg)

[VMProtect Software Protection](https://vmpsoft.com/)

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