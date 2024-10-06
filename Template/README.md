# Template Languages
A template language is a language used by the template processor to combine templates with a data model to produce result documents.[^wiki]

## Rerenderable template languages
Rerenderable, reprocessable, fixed-point, embedded template languages; template languages in comments

The result document is both a valid document and a template, which can then be combined with a data point again.
- Template elements must be kept in the result, usually as comments.

  This makes it also a markup language.

- For every data point, there is a fixed template point that keeps unchanged after combining.

- The hard part is how to recover the template from the result document.
  - Just storing the original template in the comment can work for all cases, but is verbose.
  - String/token/AST pattern search
    - A regex replace function can work for many cases.
    - `#!sed 's/Abc/Def/g'`

## Implementations
Rust:
- [askama: Type-safe, compiled Jinja-like templates for Rust](https://github.com/djc/askama)
  - Template code is compiled into your crate for optimal performance
  - IDE support available in JetBrains products

  Forks:
  - [rinja: A template rendering engine based on Jinja, generating type-safe Rust code at compile time.](https://github.com/rinja-rs/rinja)

- [Tera: A template engine for Rust based on Jinja2/Django](https://github.com/Keats/tera)
- [handlebars-rust: Rust templating with Handlebars](https://github.com/sunng87/handlebars-rust)
  - Template inheritance
- [sailfish: Simple, small, and extremely fast template engine for Rust](https://github.com/rust-sailfish/sailfish)
- [liquid-rust: Liquid templating for Rust](https://github.com/cobalt-org/liquid-rust)
- [markup.rs: A blazing fast, type-safe template engine for Rust.](https://github.com/utkarshkukreti/markup.rs)
- [TinyTemplate: A small, lightweight template engine](https://github.com/bheisler/TinyTemplate) (discontinued)
- [fizyr/subst](https://github.com/fizyr/subst)
- [ModProg/interpolator: runtime format strings, fully compatible with std's macros](https://github.com/ModProg/interpolator)

[rosetta-rs/template-benchmarks-rs: Collected benchmarks for templating crates written in Rust](https://github.com/rosetta-rs/template-benchmarks-rs)

Python:
- [Jinja: A very fast and expressive template engine.](https://github.com/pallets/jinja)
  
  [Documentation](https://jinja.palletsprojects.com/)

  [Jinja Templating in Python | Guide (With Examples)](https://ioflood.com/blog/jinja/)

- [Cog](https://cog.readthedocs.io/) ([GitHub](https://github.com/nedbat/cog/tree/main))


[^wiki]: [Template processor - Wikipedia](https://en.wikipedia.org/wiki/Template_processor)