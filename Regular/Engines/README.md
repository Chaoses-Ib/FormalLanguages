# Regex Engines
A **regex engine** is an implementations of regex functionality.[^wiki]

## Kinds
- Regex-directed: Nondeterministic Finite Automaton (NFA)
  
  Backtracking

  Implementations:
  - Traditional

    e.g. GNU Emacs, Java, grep (most versions), less, more, .NET languages, PCRE library, Perl, PHP (all three regex suites), Python, Ruby, sed (most versions), vi
  - POSIX

    e.g. mawk, Mortice Kern Systems’ utilities, GNU Emacs (when requested)

- Text-directed: Deterministic Finite Automaton (DFA)

  > The DFA engine spends extra time and memory when it first sees the regular expression, before any match attempts are made, to analyze the regular expression more thoroughly (and in a different way) from an NFA. Once it starts actually attempting a match, it has an internal map describing “If I read such-and-such a character now, it will be part of this-and-that possible match.” As each character of the string is checked, the engine simply follows the map.
  > 
  > An NFA also builds an internal representation of the regex, but an NFA’s representation is like a mini program that the engine then executes.

  e.g. awk (most versions), egrep (most versions), flex, lex, MySQL, Procmail

- Hybrid

  e.g. GNU awk, GNU grep /egrep, Tcl

The control benefits of an NFA engine:
> In essence, each subexpression of a regex in a regex-directed match is checked independently of the others. Other than backreferences, there’s no interrelation among subexpressions, except for the relation implied by virtue of being thrown together to make a larger expression. The layout of the subexpressions and regex control structures (e.g., alternation, parentheses, and quantifiers) controls an engine’s overall movement through a match.
> 
> Since the regex directs the NFA engine, the driver (the writer of the regular expression) has considerable opportunity to craft just what he or she wants to happen.

An NFA engine can support many things that a DFA cannot. Among them are:[^friedlMasteringRegularExpressions2006]
- Capturing text matched by a parenthesized subexpression. Related features are backreferences and after-match information saying where in the matched text each parenthesized subexpression matched.
- Lookaround, and other complex zero-width assertions†.
- Non-greedy quantifiers and ordered alternation. A DFA could easily support a guaranteed shortest overall match (although for whatever reason, this option never seems to be made available to the user), but it cannot implement the local laziness and ordered alternation that we’ve talked about.
- Possessive quantifiers and atomic grouping.

The performance benefits of an DFA engine:
> During the course of an NFA match, the same character of the target might be checked by many different parts of the regex (or even by the same part, over and over). Even if a subexpression can match, it might have to be applied again (and again and again) as it works in concert with the rest of the regex to find a match. A local subexpression can fail or match, but you just never know about the overall match until you eventually work your way to the end of the regex. (If I could find a way to include “It’s not over until the fat lady sings.” in this paragraph, I would.) On the other hand, a DFA engine is *deterministic* — each character in the target is checked once (at most). When a character matches, you don’t know yet if it will be part of the final match (it could be part of a possible match that doesn’t pan out), but since the engine keeps track of all possible matches in parallel, it needs to be checked only once, period.

Implementations:
> Both engine types have been around for a long time, but like its gasoline counterpart, the NFA type seems to be used more often. Tools that use an NFA engine include the .NET languages, PHP, Ruby, Perl, Python, GNU Emacs, ed, sed, vi, most versions of grep, and even a few versions of egrep and awk. On the other hand, a DFA engine is found in almost all versions of egrep and awk, as well as lex and flex. Some systems have a multi-engine hybrid system, using the most appropriate engine for the job (or even one that swaps between engines for different parts of the same regex, as needed to get the best combination of features and speed).[^friedlMasteringRegularExpressions2006]

## Implementations
### C++
- [Hyperscan: High-performance regular expression matching library](https://github.com/intel/hyperscan/)

  [Introduction to Hyperscan](https://www.intel.com/content/www/us/en/developer/articles/technical/introduction-to-hyperscan.html)

  《深入浅出 Hyperscan：高性能正则表达式算法原理与设计》[^ShenRuQianChuHyperscanGaoXingNengZhengZeBiaoDaShiSuanFaYuanLiYuSheJi2021]

  - Rust: [rust-hyperscan: Hyperscan bindings for Rust with Multiple Pattern and Streaming Scan](https://github.com/flier/rust-hyperscan)

- [Perl Compatible Regular Expressions](https://www.pcre.org/) ([Wikipedia](https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions))
  - [PCRE2](https://github.com/PCRE2Project/pcre2)
    - Rust: [pcre2: High level Rust bindings to PCRE2.](https://github.com/BurntSushi/rust-pcre2)

- [RE2: A fast, safe, thread-friendly alternative to backtracking regular expression engines](https://github.com/google/re2)

  [How to use RE2 in a C++ entry of a regexp implementations comparison benchmark - Issue #314](https://github.com/google/re2/issues/314)

- [Oniguruma](https://github.com/kkos/oniguruma)
  - Rust: [Rust Onig: Rust bindings for the Oniguruma regex library](https://github.com/rust-onig/rust-onig)

### Rust
[`regex-automata`](https://docs.rs/regex-automata/) based:
- [regex: An implementation of regular expressions for Rust. This implementation uses finite automata and guarantees linear time matching on all inputs.](https://github.com/rust-lang/regex)
  - Akin to RE2
  - NFA: Thompson's construction
    - `Literal` will be compiled to a sequence of byte `Transition`s
  - DFA
    - [Building a lexer programatically - rust-lang/regex - Discussion #1100](https://github.com/rust-lang/regex/discussions/1100)
  - `meta`: OnePass DFA, Backtrack NFA, PikeVM NFA
  - Unicode
    - [UnicodeSetsMode support (`v` flag mode, `\q`) - Issue #1142](https://github.com/rust-lang/regex/issues/1142)
  - [automata: `Input::haystack` return with original lifetime by Chaoses-Ib - Pull Request #1277](https://github.com/rust-lang/regex/pull/1277)
  - [regex-lite](https://github.com/rust-lang/regex/tree/master/regex-lite) ([Docs.rs](https://docs.rs/regex-lite/latest/regex_lite/))
    - NFA: Thompson's construction
      - Every literal `char` will be compiled to `Hir::Char` or `hir::Class` (`Vec<hir::ClassRange>`) if case insensitive
    - No Unicode support
    - Binary size: 94 KB, much smaller than `regex`'s 565+ KB.
      - Wasm: +53 KiB
    - [Ironing out `regex-lite` - Issue #961](https://github.com/rust-lang/regex/issues/961)
    - [Compile-time regex for smaller WASM binary size - Issue #913](https://github.com/rust-lang/regex/issues/913)
  - [string-patterns](https://github.com/neilg63/string-patterns)
  - [stringmatch: Allow the use of regular expressions or strings wherever you need string comparison](https://github.com/stevepryde/stringmatch)
  - Web
    - [Redux regex playground](https://rregex.dev/)
    - [Rustexp](https://rustexp.lpil.uk/)
- [fancy-regex: Rust library for regular expressions using "fancy" features like look-around and backreferences](https://github.com/fancy-regex/fancy-regex)
  > If your regex or parts of it does not use any special features, the matching is delegated to the regex crate. That means it has linear runtime. But if you use “fancy” features such as backreferences or look-around, an engine with backtracking needs to be used. In that case, the regex can be slow and take exponential time to run because of what is called “catastrophic backtracking”. This depends on the regex and the input.

  - [Exposing an automaton - Issue #142](https://github.com/fancy-regex/fancy-regex/issues/142)
  - [Update parser to support parsing subroutine call syntax by keith-hall - Pull Request #151](https://github.com/fancy-regex/fancy-regex/pull/151)
  - Web: [Rustexp](https://rustexp.lpil.uk/)
- [regex-cursor: Port of the regex crate for use with ropes](https://github.com/pascalkuthe/regex-cursor)
  - Stream
- [matchers](https://github.com/hawkw/matchers)
  - Stream

Others:
- [ib-matcher: A multilingual, flexible and fast string, glob and regex matcher. Support 拼音匹配 and ローマ字検索.](https://github.com/Chaoses-Ib/ib-matcher)
- [→Logos](../../Grammar/Parsing/Lexing.md#rust)
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
  - Backtracking NFA
  - [→Derivatives](../Derivatives.md)
  
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
[^friedlMasteringRegularExpressions2006]: Friedl, J. E. F. (2006). Mastering regular expressions (3rd ed). O’Reilly.
[^ShenRuQianChuHyperscanGaoXingNengZhengZeBiaoDaShiSuanFaYuanLiYuSheJi2021]: 深入浅出 Hyperscan：高性能正则表达式算法原理与设计. (2021). 人民邮电出版社. https://book.douban.com/subject/35576640/
