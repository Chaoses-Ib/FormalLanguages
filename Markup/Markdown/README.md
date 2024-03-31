# Markdown
Markdown is a lightweight markup language for creating formatted text using a plain-text editor.[^wiki]

[^wiki]: [Markdown - Wikipedia](https://en.wikipedia.org/wiki/Markdown)

## Variants
- [CommonMark](https://commonmark.org/)

  A standard, unambiguous syntax specification for Markdown, along with a suite of comprehensive tests to validate Markdown implementations against this specification.

  - [GitHub Flavored Markdown](https://github.github.com/gfm/)

    Strict superset of CommonMark, following its specification exactly except for tables, strikethrough, autolinks and task lists, which GFM adds as extensions.

    - Alerts: [\[Markdown\] An option to highlight a "Note" and "Warning" using blockquote (Beta) - community - Discussion #16925](https://github.com/orgs/community/discussions/16925)

      > [!NOTE]
      > `[!NOTE]`
      
      > [!TIP]
      > `[!TIP]`

      > [!IMPORTANT]
      > `[!IMPORTANT]`

      > [!WARNING]
      > `[!WARNING]`

      > [!CAUTION]
      > `[!CAUTION]`

      [⚠️ GitHub is beta testing their own Admonition syntax. We should weigh in - Extensions - CommonMark Discussion](https://talk.commonmark.org/t/github-is-beta-testing-their-own-admonition-syntax-we-should-weigh-in/4173/5)

## HTML elements
[How can I wrap my markdown in an HTML div? - Stack Overflow](https://stackoverflow.com/questions/29368902/how-can-i-wrap-my-markdown-in-an-html-div)

## Parsers
JavaScript:
- [markdown-it: Markdown parser, done right. 100% CommonMark support, extensions, syntax plugins & high speed](https://github.com/markdown-it/markdown-it)
- [Showdown: A bidirectional Markdown to HTML to Markdown converter](https://github.com/showdownjs/showdown)
- [remark: remark is a popular tool that transforms markdown with plugins. These plugins can inspect and change your markup. You can use remark on the server, the client, CLIs, deno, etc.](https://github.com/remarkjs/remark)
- [remarkable: Markdown parser, done right. Commonmark support, extensions, syntax plugins, high speed - all in one. Gulp and metalsmith plugins available.](https://github.com/jonschlinkert/remarkable)

PHP:
- [Parsedown: Better Markdown Parser in PHP](https://github.com/erusev/parsedown)
- [league/commonmark: Highly-extensible PHP Markdown parser which fully supports the CommonMark and GFM specs.](https://github.com/thephpleague/commonmark)

.NET:
- [Markdig: A fast, powerful, CommonMark compliant, extensible Markdown processor](https://github.com/xoofx/markdig)

Python:
- [Python-Markdown: A Python implementation of John Gruber’s Markdown with Extension support.](https://github.com/Python-Markdown/markdown)
- [Mistune: A fast yet powerful Python Markdown parser with renderers and plugins.](https://github.com/lepture/mistune)
- [markdown-it-py: Markdown parser, done right. 100% CommonMark support, extensions, syntax plugins & high speed. Now in Python!](https://github.com/executablebooks/markdown-it-py)

Haskell:
- [Pandoc: Universal markup converter](https://github.com/jgm/pandoc)

Go:
- [goldmark: A markdown parser written in Go. Easy to extend, standard(CommonMark) compliant, well structured.](https://github.com/yuin/goldmark)

## HTML to Markdown
- [Turndown: 🛏 An HTML to Markdown converter](https://github.com/mixmark-io/turndown)
- [breakdance: It's time for your markup to get down! HTML to markdown converter. Breakdance is a highly pluggable, flexible and easy to use.](https://github.com/breakdance/breakdance)