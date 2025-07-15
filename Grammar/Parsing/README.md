# Parsing
[Wikipedia](https://en.wikipedia.org/wiki/Parsing)

[A Guide To Parsing: Algorithms And Terminology](https://tomassetti.me/guide-parsing-algorithms-terminology/)

[An Overview of Lexing and Parsing](https://www.perl.com/pub/2012/10/an-overview-of-lexing-and-parsing.html/)

## Algorithms
- Top-down
  - LL
  - Recursive descent
- Bottom-up
  - LR
    - LALR
  - Recursive ascent
- Mixed, other
  - Combinator
- PEG

[LL and LR in Context: Why Parsing Tools Are Hard](https://blog.reverberate.org/2013/09/ll-and-lr-in-context-why-parsing-tools.html)

[This is why you should never use parser combinators and PEG --- Askar Safin](https://safinaskar.writeas.com/this-is-why-you-should-never-use-parser-combinators-and-peg) ([Lobsters](https://lobste.rs/s/nybhsl/this_is_why_you_should_never_use_parser))
> So, if you program in Rust, don't use `nom`, `combine` and other parser combinator libraries. And don't use PEG parsers. Use CFG-based parsers, such as `lalrpop`. (Unfortunately, `lalrpop` is restricted to LR(1) grammars)
>
> That said, CFG is good for languages, which are "structured enough", "well enough designed". If you want to parse some ad hoc language, for example, some ad hoc logs, then PEG and parser combinators may be a better solution. CFG is good, when you know the language, which you want to parse, beforehand. Especially if it has specification. CFG parsing is good for "well designed languages", such as Pascal, Javascript, Rust. It is bad for less structured languages, such as Bash, TeX, C, C++.

[How do LR(1) parsers compare to PEG? | Hacker News](https://news.ycombinator.com/item?id=10297004)
> LR(1)-parseable context free grammars are more convenient to write than parsing expression grammars in my experience, partially because PEGs are completely unambiguous. PEG parsers often exist just because it's easier to implement them. Also, LR(1) parsers and LALRPOP generally operate on token streams and not plain strings, whereas PEG parsers need to encode lexing within the grammar, which is a pain. So if you were writing a compiler, I would recommend using an LR(1) parser over a PEG parser.

## Performance
[rust-bakery/parser\_benchmarks: Benchmarks for the nom, the Rust parser combinators library](https://github.com/rust-bakery/parser_benchmarks)
