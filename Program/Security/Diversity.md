# Program Diversity
> At the core of any approach to software diversity, whether performed manually by programmers or automatically by a compiler or binary rewriter, is a set of randomizing transformations that make functionally equivalent program copies diverge.
> 
> A second distinguishing factor among approaches is when diversity is introduced in the software life-cycle. These two choices—what to diversify and when to diversify—constitute the major axes of the design space and together determine the fundamental properties of any concrete approach.[^larsenSoKAutomatedSoftware2014]

Applications:
- Defense
  - ROP
- Anti pattern matching
- Steganography and watermark

## What to diversify
- Instruction Level ([Instruction Rewriting](../Rewriting/Instruction.md))
  - Equivalent Instruction Substitution
  - Equivalent Instruction Sequences
  - Instruction Reordering
  - Register Allocation Randomization
  - Garbage Code Insertion
    - NOP[^jacksonDiversifyingSoftwareStack2013]
- Basic Block Level
  - Basic Block Reordering
  - Opaque Predicate Insertion
  - Branch Function Insertion
- Loop Level
- Function Level
  - Stack Layout Randomization
  - Function Parameter Randomization
  - Inlining, Outlining, and Splitting
  - Control Flow Flattening
- Program Level
  - Function Reordering
  - Base Address Randomization, ASLR
  - Program Encoding Randomization
  - Data Randomization
    - Static Data Randomization
    - Constant Blinding
    - Structure Layout Randomization
    - Heap Layout Randomization
    - Library Entry Point Randomization
- System Level
  - System Call Mapping Randomization

## When to diversify
- Implementation
- Compilation & Linking
- Installation
- Loading
- Executing
- Updating

## Implementations
- [SigBreaker 1.0 --- CodeDefender](https://codedefender.io/blog/2025/04/13/)
  - > A binary diversification engine purpose built for breaking static signatures in code while maintaining performance and semantic correctness. 
  - x86-64
  - 加段前缀、打乱指令/指令块
  - [codedefender-io/sigbreaker: All LLVM binaries scrambled with SigBreaker and used to test against llvm-lit](https://github.com/codedefender-io/sigbreaker)


[^larsenSoKAutomatedSoftware2014]: Larsen, P., Homescu, A., Brunthaler, S., & Franz, M. (2014). SoK: Automated Software Diversity. 2014 IEEE Symposium on Security and Privacy, 276–291. https://doi.org/10.1109/SP.2014.25
[^jacksonDiversifyingSoftwareStack2013]: Jackson, T., Homescu, A., Crane, S., Larsen, P., Brunthaler, S., & Franz, M. (2013). Diversifying the Software Stack Using Randomized NOP Insertion. In S. Jajodia, A. K. Ghosh, V. S. Subrahmanian, V. Swarup, C. Wang, & X. S. Wang (Eds.), Moving Target Defense II (pp. 151–173). Springer. https://doi.org/10.1007/978-1-4614-5416-8_8
