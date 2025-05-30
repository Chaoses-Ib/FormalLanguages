# Function Merging
- Identical code folding (ICF)
  - Modes: `safe`, `safe_thunks`, `all`
- Parameterization
  - Swift

[MergeFunctions pass, how it works --- LLVM 21.0.0git documentation](https://llvm.org/docs/MergeFunctions.html)

## Algorithms
- F3M: Fast Focused Function Merging[^stirlingF3MFastFocused2022]
  - Hash
  - [kateinoigakukun/llvm-next-function-merging: An experimental LLVM pass plugin that allows you to apply the State of the Art function merging techniques](https://github.com/kateinoigakukun/llvm-next-function-merging)x

- Global function merger: Optimistic and scalable global function merging[^leeOptimisticScalableGlobal2024]
  - Hash without constants
  - ICF
  - about -20%

  [2025 EuroLLVM - Advances in Function Merging and Symbolication](https://www.youtube.com/watch?v=Y-7arpmKfv4)

- [rcorcs/fmsa: Function Merging & Branch Fusion](https://github.com/rcorcs/fmsa)

## Debug information
- Only keep one
- Keep callsites + all symbols + resolve stack from bottom to top
  - `-emit-func-debug-line-table-offsets`
  - `--keep-icf-stabs`
  - gSYM (Mach-O)

  [2025 EuroLLVM - Advances in Function Merging and Symbolication](https://www.youtube.com/watch?v=Y-7arpmKfv4)


[^leeOptimisticScalableGlobal2024]: Lee, K., https://orcid.org/0000-0002-9127-7261, View Profile, Ren, M., https://orcid.org/0009-0006-7023-9449, View Profile, Hoag, E., https://orcid.org/0000-0003-3853-1889, & View Profile. (2024). Optimistic and Scalable Global Function Merging. Proceedings of the 25th ACM SIGPLAN/SIGBED International Conference on Languages, Compilers, and Tools for Embedded Systems, 46–57. https://doi.org/10.1145/3652032.3657575
[^stirlingF3MFastFocused2022]: Stirling, S., Rodrigo C. O., R., Hazelwood, K., Leather, H., O’Boyle, M., & Petoumenos, P. (2022). F3M: Fast Focused Function Merging. 2022 IEEE/ACM International Symposium on Code Generation and Optimization (CGO), 242–253. https://doi.org/10.1109/CGO53902.2022.9741269
