# Parser Combinators
[Wikipedia](https://en.wikipedia.org/wiki/Parser_combinator)

> Ambiguities are not known until run-time if and until the input triggers them. In such cases, the recursive descent parser may default (perhaps unknown to the grammar designer) to one of the possible ambiguous paths, resulting in semantic confusion (aliasing) in the use of the language. This leads to bugs by users of ambiguous programming languages, which are not reported at compile-time, and which are introduced not by human error, but by ambiguous grammar. The only solution that eliminates these bugs is to remove the ambiguities and use a context-free grammar.

## Rust
- [nom: Rust parser combinator framework](https://github.com/rust-bakery/nom)
  - Designed to properly parse binary formats from the beginning
  - While nom was made for binary format at first, it soon grew to work just as well with text formats. From line based formats like CSV, to more complex, nested formats such as JSON, nom can manage it, and provides you with useful tools.
  - While programming language parsers are usually written manually for more flexibility and performance, nom can be (and has been successfully) used as a prototyping parser for a language.

  [4x speed-up by switching from regex to Nom for parsing : r/rust](https://www.reddit.com/r/rust/comments/1gg3eom/4x_speedup_by_switching_from_regex_to_nom_for/)
  > Many performance optimizations take the same general shape: you replace something very general (regex) with something more purpose built to your specific task (dedicated parsing frameworks) through coupling.

  [nom parser combinators now released in version 8, with a new architecture! : r/rust](https://www.reddit.com/r/rust/comments/1ibyzaw/nom_parser_combinators_now_released_in_version_8/)

- [winnow: Making parsing a breeze](https://github.com/winnow-rs/winnow)
  - [Why winnow? How does it compare to ...?](https://docs.rs/winnow/latest/winnow/_topic/why/index.html)

  > winnow is a fork of the venerable nom. The difference between them is largely in priorities. nom prioritizes:
  > - Lower churn for existing users while winnow is trying to find ways to make things better for the parsers yet to be written.
  > - Having a small core, relying on external crates like nom-locate and nom-supreme, encouraging flexibility among users and to not block users on new features being merged while winnow aims to include all the fundamentals for parsing to ensure the experience is cohesive and high quality.

- [Chumsky: Write expressive, high-performance parsers with ease.](https://github.com/zesterer/chumsky)
  - High-performance

  > Chumsky's parsers are recursive descent parsers and are capable of parsing parsing expression grammars (PEGs), which includes all known context-free languages. However, chumsky doesn't stop there: it also supports context-sensitive grammars via a set of dedicated combinators that integrate cleanly with the rest of the library. This allows it to additionally parse a number of context-sensitive syntaxes like Rust-style raw strings, Python-style semantic indentation, and much more.

  > #踩坑 这两天写玩具，因为不愿意面对 lalrpop 解决冲突，选了 chumsky 当 parser ，没想到 parser combinator 真是痛苦的根源。
  > - 由于缺乏 haskell 舒适的符号，只能 chain method ，结构有时正写有时反写。需要递归基本就不可能拆函数了，必须全写一个函数里用专门的构造子弄，用一次 clone 一次。
  > - 类型巨复杂 r-a 推起来很吃力甚至还有错误。动不动就是上 KB 大小的类型（不论是名字长度还是运行时大小）拷贝来拷贝去。需要手动在合适的地方 box 
  > - 类型检查过不了错误信息堪比 C++ ， rustc 都得把类型名字输出到文件给你看
  > - 跑起来效果不尽人意，错误信息即使在 Rich 下也经常报莫名其妙的 "found end of input at 53..54 expected something else" 
  > - 仍然没解决 parser combinatior 特有的内层不报错非要 recover 到 choice 的最后一个 subparser 报个完全无关错误的问题。
  > 
  > 结论：
  > 1. 远离 parser combinator ，会变得不幸。在 haskell 里它可能还有写得快的优势， rust 里仅有的优势也没了。更别说运行时性能了，它初始化的时间别人 parser 都结束了。
  > 2. 能有编译时判断和报错就烧高香吧， lalrpop 至少会在写出 conflict 的时候提前告诉你哪写错了...
  > 3. 广告一个字都不要信，问就是摘樱桃。

  [Chumsky 0.10, a library for writing user-friendly and maintainable parsers, has been released : r/rust](https://www.reddit.com/r/rust/comments/1jyfs8v/chumsky_010_a_library_for_writing_userfriendly/)

[Should I revisit my choice to use nom? : r/rust](https://www.reddit.com/r/rust/comments/129qohw/should_i_revisit_my_choice_to_use_nom/)
> I've written a lot of compilers (and many of those in Rust), and I've consistently found that parser generators are only good for proofs of concept or experiments. When I write a serious parser/compiler, I almost always end up doing so by hand.

> I second this notion! I think parser generators are nice when they work, but if you need more flexibility (for example when parsing indentation-sensitive grammars), handwritten is the way to go. It's also the only choice for performance, or special needs such as an incremental lossless parser.
>
> In my experience, a handwritten solution is also more maintainable than using a parser combinator library, and I don't understand the obsession with them in the Rust community. I guess getting up and running quickly is nice, but that only happens when you're already very familiar with whichever specific library you usually use, and that's too much investment for me.

> TL;DR: consider writing the parser by hand, saving yourself from future rewrites due to library constraints
>
> I recently had to (re)write the parser for my language for the third time. I started innocently with a parser generator (`pest`). It was great, the grammar was easy to write and to read which served as documentation for the syntax. There was this downside that it produced an untyped parse tree forcing you to essentially implement a parser on top of the parse tree to cast it into some typed AST. This gave me zero flexibility in parsing, and I quickly realized I want some control over it (for error handling for example).
>
> Me being absolutely opposed and disgusted by the idea of a hand written parser I turned to a parser combinator: `nom`. I felt this was really nice, since they are **just** functions, if they don't work the way I want them to, I can just write my own! The resulting parser was declarative, making it easy to read and still somewhat self-documenting. Some error handling was possible to integrate, but all my requirements started pilling up making the `nom` parser very cumbersome to use: error recovery, lossless parsing, homogeneous nodes, error reporting, performance. The way `alt` worked also did not sit well with me at all, trying branches until one succeeds? Manually deciding when a failed branch should mean a hard parsing failure? Welcome grammar ambiguity and goodbye good error recovery. I had also read the article you have linked but was not satisfied with the result.
>
> That is when I just gave up and decided to write the parser by hand. This is also when I introduced a lexer, but those are boring and can be easily handled by a library (I use `logos` which has all that I need: fast, lossless, tracks spans). The resulting parser is an imperative predictive recursive descent parser which gives me full flexibility over every aspect and makes sure all ambiguity is handled. The resulting parser reads ok-ish, but I would no longer consider it good for documentation of the grammar, a separately maintained spec is needed. To be frank, I preferred the way the `nom` parser looked much better. Writing new combinators for some new language syntax was a breeze and I felt much more confident about its correctness compared to the handwritten parser. But the benefits of a hand written parser are clear and is what I will use in the future if such amount of control is needed.

> 我最后发现我碰到的语言项目最后都回归了手动 parser  
> 五花八门的 parser combinator，最后都放弃了
>
> combinator 唯一的好处应该是写起来容易，但这个只在 haskell 成立。 rust 里这个唯一优点也没了，估计就剩下缺点了。下次不上当了。
