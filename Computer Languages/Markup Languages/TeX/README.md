# $\TeX$
**TeX** is a macro- and token-based language: many commands (commonly start with a backslash and are grouped with curly braces), including most user-defined ones, are expanded on the fly until only unexpandable tokens remain, which are then executed. Expansion itself is practically free from side effects. The system can be divided into four levels[^wiki]:
1. In the first, characters are read from the input file and assigned a category code (sometimes called "catcode", for short). Combinations of a backslash (actually, any character of category zero) followed by letters (characters of category 11) or a single other character are replaced by a control-sequence token.
2. In the next stage, expandable control sequences (such as conditionals or defined macros) are replaced by their replacement text.
3. The input for the third stage is then a stream of characters (including the ones with special meaning) and unexpandable control sequences (typically assignments and visual commands). Here, the characters get assembled into a paragraph, and TeX's paragraph breaking algorithm works by optimizing breakpoints over the whole paragraph.
4. The fourth stage breaks the vertical list of lines and other material into pages.

The base TeX system understands about 300 commands, called **primitives**. These low-level commands are rarely used directly by users, and most functionality is provided by **formats** (predumped memory images of TeX after large macro collections have been loaded).[^wiki]

## Engines
[^levels]

- TeX
- pdfTeX  
  pdfTeX implements direct PDF output, along with a variety of programming and other extensions.
- XeTeX  
  XeTeX does the above, and also supports Unicode natively, OpenType and TrueType fonts, access to system fonts, …
- LuaTeX  
  LuaTeX does all the above, and provides access to many internals via the embedded Lua language. Thus it is by far the most programmable engine.
- upTeX  
  upTeX provide full support for Japanese typesetting.

Extensions:
- ConTeXt  
  ConTeXt contains a format at the level of plain TeX and LaTeX, but unlike the other formats, it is invoked via a separate program (e.g., `context`) which then runs a TeX engine. This makes it possible to support a wide array of advanced features, such as integrated graphics and XML input, since the control program can determine the flow of processing.[^levels]
- BibTeX
- MakeIndex

## Packages
- [CTAN: Packages](https://ctan.org/pkg)

## Formats
[^wiki]

- The most widely used format is **[LaTeX](LaTeX.md)**, originally developed by Leslie Lamport, which incorporates document styles for books, letters, slides, etc., and adds support for referencing and automatic numbering of sections and equations.
- Another widely used format, **AMS-TeX**, is produced by the American Mathematical Society and provides many more user-friendly commands, which can be altered by journals to fit with their house style.

## Distributions
TeX is usually provided in the form of an easy-to-install bundle of TeX itself along with Metafont and all the necessary fonts, documents formats, and utilities needed to use the typesetting system.[^wiki]

Distributions:
- Unix-like
  - [TeX Live](https://www.tug.org/texlive/) ([GitHub](https://github.com/TeX-Live/texlive-source))
  - teTeX
- Windows
  - [MiKTeX](https://miktex.org/) ([GitHub](https://github.com/MiKTeX/miktex))
  - TeX Live
- Web
  - [MathJax](https://www.mathjax.org/) ([GitHub](https://github.com/mathjax/MathJax))
  - [KaTeX](https://katex.org/) ([GitHub](https://github.com/KaTeX/KaTeX))

## Editors
- [Texmaker](https://www.xm1math.net/texmaker/)
  - [TeXstudio](https://www.texstudio.org/)
- TeXworks
- Visual Studio Code
  - [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop)
- Emacs
- Vim

Online:
- [Overleaf](https://www.overleaf.com/)

## Tools
Visual recognition:
- [Mathpix: AI powered handwriting recognition, document conversion, and digital ink](https://mathpix.com/)
- [pix2tex: LaTeX OCR](https://github.com/lukas-blecher/LaTeX-OCR)
- [Detexify LaTeX handwritten symbol recognition](https://detexify.kirelabs.org/classify.html)


[^wiki]: [TeX - Wikipedia](https://en.wikipedia.org/wiki/TeX)
[^levels]: [Levels of TeX - TeX Users Group](https://tug.org/levels.html)