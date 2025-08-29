# Regular Expression Derivatives
Regular-expression derivatives re-examined[^owensRegularexpressionDerivativesReexamined2009]

- Derivative Based Nonbacktracking Real-World Regex Matching with Backtracking Semantics[^moseleyDerivativeBasedNonbacktracking2023]
  - .NET 7
- RE#: High Performance Derivative-Based Regex Matching with Intersection, Complement, and Restricted Lookarounds[^varataluDerivativeBasedExtended2023][^varataluREHighPerformance2025] ([Hacker News](https://news.ycombinator.com/item?id=44633024))
  - Lazy DFA
  - .NET 9

  [ieviev/sbre](https://github.com/ieviev/sbre/)

  [ieviev/resharp-webapp](https://github.com/ieviev/resharp-webapp): [resharp](https://ieviev.github.io/resharp-webapp/)

  [NonBacktracking Regex optimizations by ieviev - Pull Request #102655 - dotnet/runtime](https://github.com/dotnet/runtime/pull/102655)

## Implementations
### Rust
- [guidance-ai/derivre: Derivative-based regular expression engine for Rust](https://github.com/guidance-ai/derivre)
- [rzozowski: A regex crate using Brzozowski derivatives.](https://github.com/rockysnow7/rzozowski)

  [rzozowski: a Brzozowski derivative-based regex crate for the real world : r/rust](https://www.reddit.com/r/rust/comments/1k0sems/rzozowski_a_brzozowski_derivativebased_regex/)


[^owensRegularexpressionDerivativesReexamined2009]: Owens, S., Reppy, J., & Turon, A. (2009). Regular-expression derivatives re-examined. Journal of Functional Programming, 19(2), 173–190. https://doi.org/10.1017/S0956796808007090
[^varataluREHighPerformance2025]: Varatalu, I. E., Veanes, M., & Ernits, J. (2025). RE#: High Performance Derivative-Based Regex Matching with Intersection, Complement, and Restricted Lookarounds. Artifact for “RE#: High Performance Derivative-Based Regex Matching with Intersection, Complement and Restricted Lookarounds,” 9(POPL), 1:1-1:32. https://doi.org/10.1145/3704837
[^moseleyDerivativeBasedNonbacktracking2023]: Moseley, D., Nishio, M., Perez Rodriguez, J., Saarikivi, O., Toub, S., Veanes, M., Wan, T., & Xu, E. (2023). Derivative Based Nonbacktracking Real-World Regex Matching with Backtracking Semantics. Artifact for “Derivative Based Nonbacktracking Real-World Regex Matching with Backtracking Semantics,” 7(PLDI), 148:1026-148:1049. https://doi.org/10.1145/3591262
[^varataluDerivativeBasedExtended2023]: Varatalu, I. E., Veanes, M., & Ernits, J.-P. (2023). Derivative Based Extended Regular Expression Matching Supporting Intersection, Complement and Lookarounds (No. arXiv:2309.14401). arXiv. https://doi.org/10.48550/arXiv.2309.14401
