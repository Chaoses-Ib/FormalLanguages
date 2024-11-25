# Binary Diffing
[Binary diffing - Introduction to the Dark Arts](https://one2bla.me/the-dark-arts/reverse-engineering/binary-diffing.html)

[Binary Diffing – Part 2](https://www.orangecyberdefense.com/se/blogg/cybersakerhet/introduction-to-binary-diffing-part-2)

[Awesome Binary Similarity](https://github.com/SystemSecurityStorm/Awesome-Binary-Similarity)

## Algorithms
- 2021-07 [BinDiffNN: Learning Distributed Representation of Assembly for Robust Binary Diffing Against Semantic Differences](https://ieeexplore.ieee.org/document/9470904) ([GitHub](https://github.com/sami2316/bindiff_NN))

## Tools
- [BinDiff](https://www.zynamics.com/software.html)
  
  ![](images/BinDiff-MatchedFunctions.png)

  - 在差异较大时匹配率会很低，效果不如人工匹配。
  - Does not support IDB paths with non-ASCII characters.

- [Diaphora: The most advanced Free and Open Source program diffing tool](https://github.com/joxeankoret/diaphora)

  - 导出速度非常慢，10000 个函数需要约 18 min。
  - 尽管支持 pseudo-code based heuristics，但最终匹配效果似乎不如 BinDiff。