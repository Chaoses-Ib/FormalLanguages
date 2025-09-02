# DFA
## Lazy DFA
> The DFA based matching takes $O(n + 2^m)$, which is no better than backtracking if $m$ is not fixed. The power set construction simulates every transition possible in the NFA, but that is actually unnecessary: Instead we can intertwine the compilation and the matching to only expand new DFA states that are reached when parsing the string. At most one new DFA state is created after each character read and if necessary the whole DFA is constructed, after which the algorithm is no different from the eager DFA. The time complexity of the match is then $O(min(n m, n + 2^m))$. This is the best known result for matching [5, 6, 7].[^karperEfficientRegularExpressions2014]

### Implementations
- [re2/dfa.cc](https://github.com/google/re2/blob/main/re2/dfa.cc)
- [regex_automata::hybrid](https://docs.rs/regex-automata/latest/regex_automata/hybrid/index.html)
  - When exceeding `cache_capacity`, the `cache` is cleared and reused.
  - Optionally, when clear count exceeding `minimum_cache_clear_count`, an error is returned.

## Tagged DFA
- A closer look at TDFA[^borsottiCloserLookTDFA2022]

  [TDFA-based submatch extraction - rust-lang/regex - Discussion #1024](https://github.com/rust-lang/regex/discussions/1024)


[^karperEfficientRegularExpressions2014]: Karper, A. (2014). Efficient regular expressions that produce parse trees. epubli GmbH. https://scg.unibe.ch/assets/archive/masters/Karp14a.pdf
[^borsottiCloserLookTDFA2022]: Borsotti, A., & Trafimovich, U. (2022). A closer look at TDFA (No. arXiv:2206.01398). arXiv. https://doi.org/10.48550/arXiv.2206.01398
