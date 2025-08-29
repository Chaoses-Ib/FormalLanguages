# glob()-style Pattern Matching
[Wikipedia](https://en.wikipedia.org/wiki/Glob_(programming))

> **glob()** (/ɡlɒb/) is a [libc](https://en.wikipedia.org/wiki/C_standard_library "C standard library") function for ***globbing***, which is the archetypal use of pattern matching against the [names in a filesystem directory](https://en.wikipedia.org/wiki/File_system#DENTRY "File system") such that a name pattern is expanded into a list of names matching that pattern. Although *globbing* may now refer to glob()-style pattern matching of any string, not just expansion into a list of filesystem names, the original meaning of the term is still widespread.

[Matching wildcards - Wikipedia](https://en.wikipedia.org/wiki/Matching_wildcards)

[Wildcard character - Wikipedia](https://en.wikipedia.org/wiki/Wildcard_character)

[→File Traversal](https://github.com/Chaoses-Ib/InformationSystems/blob/main/Files/Tarversal.md)

## Syntax
- `?` (any): Equivalent to `[^/]` on Unix and `[^\\]` on Windows.
- `*` (star): Equivalent to `[^/]*` on Unix and `[^\\]*` on Windows.
- `**` (globstar): Equivalent to `.*`.
- `[abc]`, `[a-z]`
- `[!...]`
- `()` (extglob)

## Libraries
### Rust
- [ib-matcher: A multilingual, flexible and fast string, glob and regex matcher. Support 拼音匹配 and ローマ字検索.](https://github.com/Chaoses-Ib/ib-matcher)
  - `?`, `*`, `[]`, `**`
  - Anchors
  - Two seperators (`//`) and complement separator (`\`)

- [glob: Support for matching file paths against Unix shell style patterns.](https://github.com/rust-lang/glob)
  - [`Pattern`](https://docs.rs/glob/latest/glob/struct.Pattern.html)
  - [`MatchOptions`](https://docs.rs/glob/latest/glob/struct.MatchOptions.html)
    - `case_sensitive` (ASCII)
    - `require_literal_separator`
    - `require_literal_leading_dot`
  - > `**` sequence **must** form a single path component, so both `**a` and `b**` are invalid and will result in an error. A sequence of more than two consecutive `*` characters is also invalid.
  - [`require_literal_separator == require_literal_leading_dot == false` by default](https://docs.rs/glob/latest/glob/struct.MatchOptions.html)

### Python
- [glob --- Unix style pathname pattern expansion - Python3 Docs](https://docs.python.org/3/library/glob.html)
  - > Note that files beginning with a dot (`.`) can only be matched by patterns that also start with a dot, unlike [`fnmatch.fnmatch()`](https://docs.python.org/3/library/fnmatch.html#fnmatch.fnmatch "fnmatch.fnmatch") or [`pathlib.Path.glob()`](https://docs.python.org/3/library/pathlib.html#pathlib.Path.glob "pathlib.Path.glob"). (For tilde and shell variable expansion, use [`os.path.expanduser()`](https://docs.python.org/3/library/os.path.html#os.path.expanduser "os.path.expanduser") and [`os.path.expandvars()`](https://docs.python.org/3/library/os.path.html#os.path.expandvars "os.path.expandvars").)
