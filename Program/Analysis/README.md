# Program Analysis
Program analysis is the process of automatically analyzing the behavior of computer programs regarding a property such as correctness, robustness, safety and liveness. Program analysis focuses on two major areas:
- Program optimization
- Program correctness

Program analysis can be performed without executing the program ([static program analysis](https://en.wikipedia.org/wiki/Static_program_analysis)), during runtime ([dynamic program analysis](https://en.wikipedia.org/wiki/Dynamic_program_analysis)) or in a combination of both.[^wiki]

## Statis program analysis
- Abstract interpretation
- Control-flow analysis
- Data-flow analysis
  - Live variable analysis
  - Ponter analysis
  - Escape analysis
  - Taint analysis
- Shape analysis
- Symbolic execution
- Type system
- Effect system
- Model checking

## Dynamic program analysis
- Testing
  - Fuzzing
- Monitoring
- Code coverage
- Memory error detection
- Fault localization
- Invariant inference
- Security analysis
- Concurrency errors
- Program slicing
- Performance analysis

## Binary code analysis
[Introduction - Introduction to the Dark Arts](https://one2bla.me/the-dark-arts/introduction.html)

Libraries:
- [Triton: A dynamic binary analysis library. Build your own program analysis tools, automate your reverse engineering, perform software verification or just emulate code.](https://github.com/JonathanSalwan/Triton)

Rust:
- [Falcon: Binary Analysis Framework in Rust](https://github.com/falconre/falcon) (inactive)
- [Fugue: A binary analysis framework written in Rust.](https://github.com/fugue-re/fugue-core/tree/crates-io) (inactive)
- [lancelot: intel x86(-64) code analysis library that reconstructs control flow](https://github.com/williballenthin/lancelot) ([Docs.rs](https://docs.rs/lancelot/latest/lancelot/))
  - Almost zero docs...

  九年的项目，九万行代码，但却基本没有文档，why open source then?

  Python: [python-lancelot - PyPI](https://pypi.org/project/python-lancelot/)

  [williballenthin: "I reimplemented the #Ghidra ma..." - Mastodon](https://mastodon.social/@williballenthin/111633995924760195)

Reddit:
- [r/ReverseEngineering](https://www.reddit.com/r/ReverseEngineering/)
- [r/REGames](https://www.reddit.com/r/REGames/)
- [r/ExploitDev](https://www.reddit.com/r/ExploitDev/)
- [r/Malware](https://www.reddit.com/r/Malware/)


[^wiki]: [Program analysis - Wikipedia](https://en.wikipedia.org/wiki/Program_analysis)