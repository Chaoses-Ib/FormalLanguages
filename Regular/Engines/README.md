# Regex Engines
A **regex engine** is an implementations of regex functionality.[^wiki]

## Implementations
C++:
- [Perl Compatible Regular Expressions](https://www.pcre.org/) ([Wikipedia](https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions))
  - [PCRE2](https://github.com/PCRE2Project/pcre2)
    - Rust: [pcre2: High level Rust bindings to PCRE2.](https://github.com/BurntSushi/rust-pcre2)
- [RE2: A fast, safe, thread-friendly alternative to backtracking regular expression engines](https://github.com/google/re2)
- [Oniguruma](https://github.com/kkos/oniguruma)
  - Rust: [Rust Onig: Rust bindings for the Oniguruma regex library](https://github.com/rust-onig/rust-onig)

Rust:
- [regex: An implementation of regular expressions for Rust. This implementation uses finite automata and guarantees linear time matching on all inputs.](https://github.com/rust-lang/regex)
  - Web
    - [Redux regex playground](https://rregex.dev/)
    - [Rustexp](https://rustexp.lpil.uk/)
- [fancy-regex: Rust library for regular expressions using "fancy" features like look-around and backreferences](https://github.com/fancy-regex/fancy-regex)
  > If your regex or parts of it does not use any special features, the matching is delegated to the regex crate. That means it has linear runtime. But if you use “fancy” features such as backreferences or look-around, an engine with backtracking needs to be used. In that case, the regex can be slow and take exponential time to run because of what is called “catastrophic backtracking”. This depends on the regex and the input.

  - Web: [Rustexp](https://rustexp.lpil.uk/)

.NET:
- [System.Text.RegularExpressions](https://learn.microsoft.com/en-us/dotnet/api/system.text.regularexpressions)
  
  [.NET Regular Expressions - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expressions)
  - Web: [.NET Regex Tester - Regex Storm](http://regexstorm.net/tester)
- [Symbolic Regex Matcher: High-performance .NET regex engine with predictable performance](https://github.com/AutomataDotNet/srm)

## Performance
Benchmarks:
- [rebar: A biased barometer for gauging the relative speed of some regex engines on a curated set of tasks.](https://github.com/BurntSushi/rebar)
- [rust-leipzig/regex-performance: Performance comparison of regular expression engines.](https://github.com/rust-leipzig/regex-performance)
- [mariomka/regex-benchmark: It's just a simple regex benchmark of different programming languages.](https://github.com/mariomka/regex-benchmark)


[^wiki]: [Regular expression - Wikipedia](https://en.wikipedia.org/wiki/Regular_expression#History)