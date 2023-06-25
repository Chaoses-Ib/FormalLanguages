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

[^wiki]: [Program analysis - Wikipedia](https://en.wikipedia.org/wiki/Program_analysis)