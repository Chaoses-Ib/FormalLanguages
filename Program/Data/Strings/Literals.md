# String Literals
[Wikipedia](https://en.wikipedia.org/wiki/String_literal)

## Raw string literals
Language | Syntax
--- | ---
Python | `r''`, `r""`, `r''''''`, `r""""""`
Rust | [`r""`, `r#""#`, `r##""##`](https://doc.rust-lang.org/beta/reference/tokens.html#raw-string-literals)
C# | [`@""`](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/verbatim), [`""""""`, `""""""""`](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/raw-string)
C++ | [`R"()"`, `R"DEL()DEL"`](https://en.cppreference.com/w/cpp/language/string_literal)
JS | [<code>String.raw``</code>](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/raw)
Java | [-](https://stackoverflow.com/questions/1256667/raw-strings-in-java-for-regex-in-particular-multiline-strings)

[How does your language represent a raw string literal? : ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/comments/16n3uxx/how_does_your_language_represent_a_raw_string/)

## Concatenation
Support: C/C++, Python

Not: Rust

```python
[
    'a',
    'c',
    'b'
] == ['a', 'c', 'b']
```
```python
[
    'a',
    'b'
    'c',
] == ['a', 'bc']
```

## String interpolation
[Wikipedia](https://en.wikipedia.org/wiki/String_interpolation)

> **String interpolation (or variable interpolation, variable substitution, or variable expansion)** is the process of evaluating a string literal containing one or more placeholders, yielding a result in which the placeholders are replaced with their corresponding values. It is a form of simple template processing or, in formal terms, a form of quasi-quotation (or logic substitution interpretation). The placeholder may be a variable name, or in some languages an arbitrary expression, in either case evaluated in the current context.

Languages:
- `$id`/`${id}`
  - Bash: `"$id or ${id}"`
  - Kotlin: `"$id or ${id}"`
  - PHP: `"$id or {$id}"`
  - Perl: `"$id or @{[$id]}"`
  - Swift: `"\(id)"`
  - MSBuild: `$(id)`

  Compared to `()`, `{}` can be directly typed with Chinese IME, though not with Japanese IME.
- Special literal
  - JS: `` `${id}` ``
  - [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-string-substitutions?view=powershell-7.5): `"$id or $(id)"` (not `'$id or $(id)'`)
- Literal prefix
  - C#: `$"{id}"`
  - VB.NET: `$"{id}"`
  - [Python](https://peps.python.org/pep-0498/): `f'{id}'` / `f"{id}"`
  - Scala: `s"$id or ${id}"` / `f"$id%d"`
  - Java: ~~`STR."Installing \{deploy.image()} on Stage \{deploy.stage()} ..."`~~ (21~22)
- Rust: `format!("{id}")`
- Dart
- Go

  > As of 2022, Go does not have string interpolation. There have been some proposals for string interpolation in the next version of the language, Go 2. Instead, Go uses printf format strings in the fmt.Sprintf function, string concatenation, or template libraries like text/template.
