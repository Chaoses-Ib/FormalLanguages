# Interprocedural Optimization
[Wikipedia](https://en.wikipedia.org/wiki/Interprocedural_optimization)

[Link-time optimisation (LTO) | J. Ryan Stinnett](https://convolv.es/guides/lto/) ([Hacker News](https://news.ycombinator.com/item?id=38215535))

[Is there a reason why not to use link-time optimization (LTO)? - Stack Overflow](https://stackoverflow.com/questions/23736507/is-there-a-reason-why-not-to-use-link-time-optimization-lto)

[What are the pros + cons of Link-Time Code Generation? (VS 2005) - Stack Overflow](https://stackoverflow.com/questions/288691/what-are-the-pros-cons-of-link-time-code-generation-vs-2005)

[LTO disabled by default | The FreeBSD Forums](https://forums.freebsd.org/threads/lto-disabled-by-default.83165/)

## Implementations
### MSVC
Whole program optimization: [`/GL`](https://learn.microsoft.com/en-us/cpp/build/reference/gl-whole-program-optimization?view=msvc-170)
- Default: enabled

Link-time code generation: [`/LTCG`](https://learn.microsoft.com/en-us/cpp/build/reference/ltcg-link-time-code-generation?view=msvc-170)
- `/LTCG:incremental` may have notable performance loss compared to `/LTCG`.

  [Link Time Code Generation - Issue #1183 - premake/premake-core](https://github.com/premake/premake-core/issues/1183)

- Default: `/LTCG:incremental`

[What is the difference between /GL and /LTCG in Visual Studio - Stack Overflow](https://stackoverflow.com/questions/35471658/what-is-the-difference-between-gl-and-ltcg-in-visual-studio)

### Rust
[Why is ThinLTO no longer enabled by default? : r/rust](https://www.reddit.com/r/rust/comments/b2lbi3/why_is_thinlto_no_longer_enabled_by_default/)