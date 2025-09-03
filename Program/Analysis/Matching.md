# Binary Code Matching
[Awesome Binary Similarity](https://github.com/SystemSecurityStorm/Awesome-Binary-Similarity)

## Algorithms
- 2023-06 [Asteria-Pro: Enhancing Deep-Learning Based Binary Code Similarity Detection by Incorporating Domain Knowledge](https://dl.acm.org/doi/10.1145/3604611) ([GitHub](https://github.com/Asteria-BCSD/Asteria-Pro))
- 2021-08 [Asteria: Deep Learning-based AST-Encoding for Cross-platform Binary Code Similarity Detection](https://arxiv.org/abs/2108.06082) ([GitHub](https://github.com/Asteria-BCSD/Asteria))

  [Asteria: Deep Learning-based AST-Encoding for Cross-platform Binary Code Similarity Detection : ReverseEngineering](https://www.reddit.com/r/ReverseEngineering/comments/pf1bth/asteria_deep_learningbased_astencoding_for/)

## Tools
- [Binary Diffing](Diffing.md)

IDA:
- [SigMaker](https://github.com/ajkhoury/SigMaker-x64)
  
  ![](images/SigMaker.png)

  - Does not output multiple signatures for one function.
  - Does not output matching results when generating signatures.

- [A200K/IDA Pro SigMaker: Signature maker plugin for IDA 8.x](https://github.com/A200K/IDA-Pro-SigMaker)

  ![](https://camo.githubusercontent.com/2b5d257f59685b1a148d62d5c2eda378f64a681a7479802c7462a009b4b4ccce/68747470733a2f2f692e696d6775722e636f6d2f4b6565556154472e706e67)

- [SigMakerEx](https://github.com/kweatherman/sigmakerex)
  
  ![](https://github.com/kweatherman/sigmakerex/blob/ad4182201abff782faa2be3b8a47af1e36b2c20b/images/main.png?raw=true)

Binary Ninja:
- [SigKit: Function signature matching and signature generation plugin for Binary Ninja](https://github.com/Vector35/sigkit)
- [WARP: Common format for transferring and applying function information across binary analysis tools](https://github.com/Vector35/warp) (v4.2)
  - Rust

  [Applying Annotations - Binary Ninja User Documentation](https://docs.binary.ninja/dev/annotation.html?h=warp#warp-signature-libraries)
  > The benefit to using WARP over SigKit is that WARP signatures are more comprehensive and as such will have fewer false positives. Alongside fewer false positives WARP will match more functions with less information due to the matching algorithm taking into account function locality (i.e. functions next to each other). After matching has completed WARP functions will be tagged and the types for those functions will be transferred, this means less work for those looking to transfer analysis information from one version of a binary to another version.

## Library signatures
Full:
- [Library Signatures](https://github.com/Chaoses-Ib/library-signatures)