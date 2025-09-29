# Data Obfuscation
- Cryptography-based
  - K-clique problem[^tiellaAutomaticGenerationOpaque2017][^ExperimentalAssessmentXORMasking2020]
- Program-based

## Implementations
- [Shelter: ROP-based sleep obfuscation to evade memory scanners](https://github.com/Kudaes/Shelter)
- [bananapeel: A pretty good obfuscation library that makes attackers slip and hit their heads.](https://github.com/arctic-hen7/bananapeel)

## Pointers
- [→Control-flow obfuscation](../Security/Obfuscation/Control/README.md)

## [→String obfusaction](Strings/Obfuscation/README.md)

## Structs
### Randomizing structure layout
C++:
- GCC
  
  [Randomizing structure layout \[LWN.net\]](https://lwn.net/Articles/722293/)
  
  [Add the randstruct gcc plugin - Patchwork](https://patchwork.kernel.org/project/linux-hardening/patch/1477071466-19256-1-git-send-email-michael.leibowitz@intel.com/)

- Clang
  
  [Clang 15 Lands Support To Randomize Structure Layout, Linux Prepares To Use It - Phoronix](https://www.phoronix.com/news/Clang-Linux-RandStruct)
  
  [⚙ D123544 \[randstruct\] Automatically randomize a structure of function pointers](https://reviews.llvm.org/D123544)
  
  [connorkuehl/clang-randstruct: A compile-time hardening feature for the Clang compiler that randomizes structure field layouts in memory.](https://github.com/connorkuehl/clang-randstruct)

Rust:
- [Iwancof/random\_struct\_layout](https://github.com/Iwancof/random_struct_layout/)


[^ExperimentalAssessmentXORMasking2020]: Experimental assessment of XOR-Masking data obfuscation based on K-Clique opaque constants. (2020). Journal of Systems and Software, 162, 110492. https://doi.org/10.1016/j.jss.2019.110492
[^tiellaAutomaticGenerationOpaque2017]: Tiella, R., & Ceccato, M. (2017). Automatic generation of opaque constants based on the k-clique problem for resilient data obfuscation. 2017 IEEE 24th International Conference on Software Analysis, Evolution and Reengineering (SANER), 182–192. https://doi.org/10.1109/SANER.2017.7884620
