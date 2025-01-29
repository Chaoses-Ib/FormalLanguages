# Reversible Computing
[Wikipedia](https://en.wikipedia.org/wiki/Reversible_computing)

[Reverse computation - Wikipedia](https://en.wikipedia.org/wiki/Reverse_computation)

[Reversible computation :: Strange Paths](https://strangepaths.com/reversible-computation/2008/01/20/en/)
- Reversible embedding of irreversible computations

  > Landauer further noticed that any irreversible computation may be transformed into a reversible one by embedding it into a larger computation where no information is lost, eg. by replicating every output in the input (’sources’) and every input in the output (’sinks’).

Applications:
- Crypto ciphers: Every symmetric/asymmetric crypto cipher is reversible.
- Serialization

Is there a way to automatically reverse a reversible algorithm? [Reversible programming languages](#reversible-programming-languages).

## Reversible circuits
[Reversible Computing --- Quantum Computing using Python](https://learnquantum.io/chapters/01_classical_computing/01_02_reversible_computing.html)

[Reversible computing escapes the lab | Hacker News](https://news.ycombinator.com/item?id=42660606)
> Reversibility isn't actually necessary for most of the energy savings. It saves you an extra maybe 20% beyond what adiabatic techniques can do on their own. Reason being, the energy of the information itself pales in comparison to the resistive losses which dominate the losses in adiabatic circuits, and it's actually a (device-dependent) portion of these resistive losses which the reversible aspect helps to recover, not the energy of information itself.

> Calling the addition of an energy storage device into a transistor "reverse computing" is like calling a hybrid car using regenerative braking "reverse driving".
> 
> It's a very interesting concept - best discussed over pints at the pub on a Sunday afternoon along with over unity devices and the sad lack of adoption of bubble memory.

- [landauer: Python toolkit to support fundamental energy limits and reversible computing research](https://github.com/mtdsousa/landauer)

## Reversible programming languages
[^gluckReversibleComputingProgramming2023]

- Mainstream languages
  - C++[^AutomaticGenerationReversible2016]
  - [ ] Python?

- Janus ([Wikipedia](https://en.wikipedia.org/wiki/Janus_(time-reversible_computing_programming_language)))
  - [Program Inversion and Reversible Computation](https://topps.diku.dk/pirc/?id=janusB)
  - [Program Inversion and Reversible Computation](https://topps.diku.dk/pirc/?id=janusP)
    - Compile to C++
    - Examples: TEA, Speck, ChaCha20

  [Janus - Esolang](https://esolangs.org/wiki/Janus)

- [Railway: A time-and-memory-linearly reversible imperative programming language, featuring multi-threading and mono-directional data. 🚂](https://github.com/jndean/Railway)

- ~~Logic languages~~


[^AutomaticGenerationReversible2016]: Automatic Generation of Reversible C++ Code and Its Performance in a Scalable Kinetic Monte-Carlo Application | Request PDF. (2016, May). ResearchGate. https://doi.org/10.1145/2901378.2901394
[^gluckReversibleComputingProgramming2023]: Glück, R., & Yokoyama, T. (2023). Reversible computing from a programming language perspective. Theoretical Computer Science, 953, 113429. https://doi.org/10.1016/j.tcs.2022.06.010
