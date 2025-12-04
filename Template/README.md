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
### Rust
- ~~[askama: Type-safe, compiled Jinja-like templates for Rust](https://github.com/djc/askama)~~
  - Template code is compiled into your crate for optimal performance
    - Compile-time template only
  - > Has significant divergence from Jinja syntax in parts.
  - IDE support available in JetBrains products

  Forks:
  - ~~[rinja: A template rendering engine based on Jinja, generating type-safe Rust code at compile time.](https://github.com/rinja-rs/rinja)~~
    - [askama-rs/askama: A template rendering engine based on Jinja, generating type-safe Rust code at compile time.](https://github.com/askama-rs/askama)

- [MiniJinja: A powerful but minimal dependency template engine for Rust compatible with Jinja/Jinja2](https://github.com/mitsuhiko/minijinja)
  - Written by the same author as Jinja2
  - > It's not as type-safe as askama but it's flexible, and has call blocks for macros. Easy to extend with your own filters/functions as well.
  - Bindings for JS, Python, C
  - Used by HuggingFace
  - [Dynja: Jinja pseudo-engine focused on DevEx and Performance](https://github.com/rdbo/dynja) (inactive)

  [MiniJinja: Learnings from Building a Template Engine in Rust | Armin Ronacher's Thoughts and Writings](https://lucumr.pocoo.org/2024/8/27/minijinja/)

- [Tera: A template engine for Rust based on Jinja2/Django](https://github.com/Keats/tera)
  - > Jinja inspired, dynamic, has divergences from Jinja.
  - Inactive
  - [Tera2](https://github.com/Keats/tera2)
    - [A tera2 LSP to provide context-aware editor support? Request for comments - Issue #67](https://github.com/Keats/tera2/issues/67)
- [handlebars-rust: Rust templating with Handlebars](https://github.com/sunng87/handlebars-rust)
  - > Handlebars is largely compatible with Mustache templates.
  - Template inheritance
  - [zapper: speedy templating engine: 30x faster than Handlebars, half the features!](https://github.com/coder543/zapper) (discontinued)
- [sailfish: Simple, small, and extremely fast template engine for Rust](https://github.com/rust-sailfish/sailfish)
  - Inactive
  - EJS
  - Compile-time template only
  - Compile-time checking
- [liquid-rust: Liquid templating for Rust](https://github.com/cobalt-org/liquid-rust)
  - > An implementation of Liquid templates for Rust. Liquid was inspired by Django from which Jinja took it's inspiration.
- [boilerplate: A statically-checked Rust Template Engine](https://github.com/casey/boilerplate)
- [markup.rs: A blazing fast, type-safe template engine for Rust.](https://github.com/utkarshkukreti/markup.rs)
  - Discontinued
- [TinyTemplate: A small, lightweight template engine](https://github.com/bheisler/TinyTemplate) (discontinued)
  - > Minimal footprint template engine with syntax that takes lose inspiration from Jinja and handlebars.
- [fizyr/subst](https://github.com/fizyr/subst)
- [ModProg/interpolator: runtime format strings, fully compatible with std's macros](https://github.com/ModProg/interpolator)

[askama-rs/template-benchmark: Comparison of template engines written in and for Rust.](https://github.com/askama-rs/template-benchmark)

[rosetta-rs/template-benchmarks-rs: Collected benchmarks for templating crates written in Rust](https://github.com/rosetta-rs/template-benchmarks-rs)

2024-09 [Best templating engine for Rust : r/rust](https://www.reddit.com/r/rust/comments/1fc2mic/best_templating_engine_for_rust/)

2025-04 [What template engine I should use? : r/rust](https://www.reddit.com/r/rust/comments/1k7gu5a/what_template_engine_i_should_use/)

### Python
- [Jinja: A very fast and expressive template engine.](https://github.com/pallets/jinja)
  
  [Documentation](https://jinja.palletsprojects.com/)

  [Jinja Templating in Python | Guide (With Examples)](https://ioflood.com/blog/jinja/)

- [Cog](https://cog.readthedocs.io/) ([GitHub](https://github.com/nedbat/cog/tree/main))


[^wiki]: [Template processor - Wikipedia](https://en.wikipedia.org/wiki/Template_processor)