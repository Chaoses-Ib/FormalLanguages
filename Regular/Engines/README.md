# Regex Engines
A **regex engine** is an implementations of regex functionality.[^wiki]

## Implementations
### C++
- [Hyperscan: High-performance regular expression matching library](https://github.com/intel/hyperscan/)

  [Introduction to Hyperscan](https://www.intel.com/content/www/us/en/developer/articles/technical/introduction-to-hyperscan.html)

  《深入浅出 Hyperscan：高性能正则表达式算法原理与设计》

  - Rust: [rust-hyperscan: Hyperscan bindings for Rust with Multiple Pattern and Streaming Scan](https://github.com/flier/rust-hyperscan)

- [Perl Compatible Regular Expressions](https://www.pcre.org/) ([Wikipedia](https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions))
  - [PCRE2](https://github.com/PCRE2Project/pcre2)
    - Rust: [pcre2: High level Rust bindings to PCRE2.](https://github.com/BurntSushi/rust-pcre2)

- [RE2: A fast, safe, thread-friendly alternative to backtracking regular expression engines](https://github.com/google/re2)

- [Oniguruma](https://github.com/kkos/oniguruma)
  - Rust: [Rust Onig: Rust bindings for the Oniguruma regex library](https://github.com/rust-onig/rust-onig)

### Rust
- [regex: An implementation of regular expressions for Rust. This implementation uses finite automata and guarantees linear time matching on all inputs.](https://github.com/rust-lang/regex)
  - [string-patterns](https://github.com/neilg63/string-patterns)
  - [stringmatch: Allow the use of regular expressions or strings wherever you need string comparison](https://github.com/stevepryde/stringmatch)
  - Web
    - [Redux regex playground](https://rregex.dev/)
    - [Rustexp](https://rustexp.lpil.uk/)
- [fancy-regex: Rust library for regular expressions using "fancy" features like look-around and backreferences](https://github.com/fancy-regex/fancy-regex)
  > If your regex or parts of it does not use any special features, the matching is delegated to the regex crate. That means it has linear runtime. But if you use “fancy” features such as backreferences or look-around, an engine with backtracking needs to be used. In that case, the regex can be slow and take exponential time to run because of what is called “catastrophic backtracking”. This depends on the regex and the input.

  - Web: [Rustexp](https://rustexp.lpil.uk/)
- [matchers](https://github.com/hawkw/matchers)
  - Stream

- [lightningscanner-rs: A lightning-fast memory pattern scanner, capable of scanning gigabytes of data per second](https://github.com/localcc/lightningscanner-rs)
- [patternscan: Searches for a contiguous array of bytes determined by a wild-carded pattern](https://github.com/lewisclark/patternscan)
  - Lightweight
- [aobscan: AOBscan is a library for multi-threaded AOB memory scanning](https://github.com/sonodima/aobscan)
  - Data/Program
  - Parallel
- [aob-rs](https://github.com/Ryan-rsm-McKenzie/aob-rs)
- [pelite::pattern](https://docs.rs/pelite/latest/pelite/pattern/index.html)
  - PE
  - Powerful but [the syntax](https://docs.rs/pelite/latest/pelite/pattern/fn.parse.html) is weird. Writing [`[Atom]`](https://docs.rs/pelite/latest/pelite/pattern/enum.Atom.html) directly may be better and also more powerful.
  - [pelite/src/bin/findsig.rs](https://github.com/CasualX/pelite/blob/master/src/bin/findsig.rs)
  - [Pattern scanner not searching all code regions - Issue #283](https://github.com/CasualX/pelite/issues/283)

  Used by many game security tools.
- [scanner-rs: Binary signature scanner in Rust.](https://github.com/pombredanne/scanner-rs) (discontinued)
  - pelite

### .NET
- [System.Text.RegularExpressions](https://learn.microsoft.com/en-us/dotnet/api/system.text.regularexpressions)
  
  [.NET Regular Expressions - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expressions)
  - Web: [.NET Regex Tester - Regex Storm](http://regexstorm.net/tester)
- [Symbolic Regex Matcher: High-performance .NET regex engine with predictable performance](https://github.com/AutomataDotNet/srm)

## Performance
Benchmarks:
- [rebar: A biased barometer for gauging the relative speed of some regex engines on a curated set of tasks.](https://github.com/BurntSushi/rebar)
- [rust-leipzig/regex-performance: Performance comparison of regular expression engines.](https://github.com/rust-leipzig/regex-performance)

  [A comparison of regex engines -- Rust Leipzig](https://rust-leipzig.github.io/regex/2017/03/28/comparison-of-regex-engines/)

- [mariomka/regex-benchmark: It's just a simple regex benchmark of different programming languages.](https://github.com/mariomka/regex-benchmark)


[^wiki]: [Regular expression - Wikipedia](https://en.wikipedia.org/wiki/Regular_expression#History)