#import "@local/ib:0.1.0": *
#title[Jinja]
#a-badge[https://en.wikipedia.org/wiki/Jinja_(template_engine)]

- Used by:
  - Web
    - Flask
    - Jupyter
      - Solara
  - Automation
    - Ansible
    - Home Assistant
  - PyTorch
  - NLP/LLM
    - HuggingFace
    - llama.cpp
    - ComfyUI

#a[Universal Jinja: a crazy idea for a Python-ready front end | Hacker News][https://news.ycombinator.com/item?id=14776780]
- #quote[Ugh, Jinja is not an "excellent" templating language. It's a terrible broken mix of pythonisms and arbitrary-feeling restrictions and oddly missing pieces. It becomes hard to read very quickly and some of the looping idioms are just nuts. Sorry I don't have anything constructive to say here but I'm genuinely taken aback that there are apparently big fans of Jinja.]
- #quote[I feel like Jinja was an especially bad fit for Ansible, but as a templating language I feel like it's main strength is it's better than D'jango templates... but that doesn't matter much outside the D'Jango world.]

= Jinja
#a-badge[https://github.com/pallets/jinja]
#a-badge(body: [Documentation])[https://jinja.palletsprojects.com/]

#quote[Jinja is a fast, expressive, extensible templating engine.]

#a[Template Designer Documentation --- Jinja Documentation][https://jinja.palletsprojects.com/en/stable/templates/]

#a[Jinja Templating in Python | Guide (With Examples)][https://ioflood.com/blog/jinja/]

== Logic
- `true`, `false`, `none`
- `not`, `and`, `or`
- `is`, `is not`
- `in`, `not in`

#a[Jinja2 template variable if None Object set a default value - Stack Overflow][https://stackoverflow.com/questions/19614027/jinja2-template-variable-if-none-object-set-a-default-value]

#a[Jinja templates inconsistencies with None/null value - Issue #65913 - home-assistant/core][https://github.com/home-assistant/core/issues/65913]

== Blocks
- ```jinja self.{block}()```
  ```jinja
  {% block test %}abc{% endblock %}
  {{ self.test() }}
  ```
  ```
  abc
  abc
  ```

- Block assignments (v2.8)
  ```jinja
  {% set test %}abc{% endset %}
  {{ test }}
  ```
  ```
  abc
  ```

- Macros
  ```jinja
  {% macro test() %}abc{% endmacro %}
  {{ test() }}
  ```
  ```
  abc
  ```

#a[flask - Reuse a block of code in several places in jinja2 - Stack Overflow][https://stackoverflow.com/questions/21275375/reuse-a-block-of-code-in-several-places-in-jinja2]

= #a[MiniJinja][https://github.com/mitsuhiko/minijinja]
#a-badge[https://docs.rs/minijinja]

#quote[A powerful but minimal dependency template engine for Rust compatible with Jinja/Jinja2]

- Written by the same author as Jinja2
- #quote[It's not as type-safe as askama but it's flexible, and has call blocks for macros. Easy to extend with your own filters/functions as well.]
- Binary size
  - Wasm: z 538 (618) KiB, s 634 (735) KiB, 3 841 (984) KiB
- Bindings for JS, Python, C
- Used by HuggingFace
- Hot reload
  - #a[`minijinja_autoreload`][https://github.com/mitsuhiko/minijinja/tree/main/minijinja-autoreload]
    - `notify`
  - #a[Dynja: Jinja pseudo-engine focused on DevEx and Performance][https://github.com/rdbo/dynja] (inactive)

#a[MiniJinja: Learnings from Building a Template Engine in Rust | Armin Ronacher's Thoughts and Writings][https://lucumr.pocoo.org/2024/8/27/minijinja/]

== APIs
- #a[```rs Environment```][https://docs.rs/minijinja/latest/minijinja/struct.Environment.html]
- #a[```rs Template```][https://docs.rs/minijinja/latest/minijinja/struct.Template.html]
  - #a[`syntax`][https://docs.rs/minijinja/latest/minijinja/syntax/index.html]
  - #a[```rs fn render<S: Serialize>(&self, ctx: S) -> Result<String, Error>```][https://docs.rs/minijinja/latest/minijinja/struct.Template.html#method.render]
    - #quote[The ```rs Value``` type implements ```rs Serialize``` and can be efficiently passed to `render`. It does not undergo actual serialization.]
    - Although `render` is actually done with ```rs Value``` (via ```rs from_serialize()```), there is no interface to pass ```rs Value``` directly (but ```rs Value``` implements ```rs Serialize```).
- #a[`value`][https://docs.rs/minijinja/latest/minijinja/value/index.html]
  - #a[```rs fn from_serialize<T: Serialize>(value: T) -> Value```][https://docs.rs/minijinja/latest/minijinja/value/struct.Value.html#method.from_serialize]
    - Can be directly used with #a[```rs figment::value::Dict```][https://docs.rs/figment/latest/figment/value/type.Dict.html].
  - #a[```rs Object```][https://docs.rs/minijinja/latest/minijinja/value/trait.Object.html#map-as-context]
    - ```rs impl<V> Object for HashMap<String, V>
      where V: Into<Value> + Clone + Send + Sync + Debug + 'static
      ```

== Tools
- #a[`minijinja-cli`][https://github.com/mitsuhiko/minijinja/tree/main/minijinja-cli]
  - ```sh cargo install minijinja-cli```
  - Scoop: ```pwsh scoop install hoilc_scoop-lemon/minijinja-cli```
  - ```cmd powershell -ExecutionPolicy ByPass -c "irm https://github.com/mitsuhiko/minijinja/releases/latest/download/minijinja-cli-installer.ps1 | iex"```
- #a[MiniJinja Playground][https://mitsuhiko.github.io/minijinja-playground/]

= Rust
== Askama
#a-badge[https://github.com/askama-rs/askama]
#a-badge[https://docs.rs/askama/]

Template is compiled into code:
```rs
#[derive(askama::Template)]
#[template(path = "hello.html")]  // Relative to `crate/templates`
struct HelloTemplate<'a> {
    name: &'a str,
}
HelloTemplate { name: "world" }.render().unwrap()
```
```rs
impl<'a> askama::Template for HelloTemplate<'a> {
    fn render_into_with_values<AskamaW: askama::helpers::core::fmt::Write + ?Sized>(
        &self,
        __askama_writer: &mut AskamaW,
        __askama_values: &dyn askama::Values,
    ) -> askama::Result<()> {
        __askama_writer.write_str("Hello, ")?;
        match (
            &((&&askama::filters::AutoEscaper::new(&(self.name), askama::filters::Html))
                .askama_auto_escape()?),
        ) {
            (__askama_expr2,) => {
                (&&&askama::filters::Writable(__askama_expr2))
                    .askama_write(__askama_writer, __askama_values)?;
            }
        }
        Ok(())
    }
    const SIZE_HINT: usize = 10;
}
```
- Compile-time template only.
- Binary size can be much smaller than MiniJinja.
- #a[Template syntax][https://askama.readthedocs.io/en/stable/template_syntax.html]
  - #q[Has significant divergence from Jinja syntax in parts.]
- Escape
  - #q[error: no escaper defined for extension 'mytxt'.
    You can define an escaper in the config file (named `askama.toml` by default).
    The available extensions are: "", "askama", "htm", "html", "j2", "jinja", "jinja2", "md", "none", "rinja", "svg", "txt", "xml", "yml"]
- Templates must be valid UTF-8 and produce UTF-8 when rendered.
  - #q[error: unable to open template file 'hello': stream did not contain valid UTF-8]
- #a[Performance][https://askama.readthedocs.io/en/stable/performance.html]

= C++
== minja.hpp
#a-badge[https://github.com/ochafik/minja]

#q[A minimalistic C++ Jinja templating engine for LLM chat templates.]
- Used by:
  - llama.cpp
  - Jan (through cortex.cpp)
  - GPT4All
  - Docker Model Runner

#a[chat: replace Jinja2Cpp with minja by cebtenzzre - Pull Request \#3433 - nomic-ai/gpt4all][https://github.com/nomic-ai/gpt4all/pull/3433]

= File extensions
- `.jinja` (official)
- `.j2`
  - MiniJinja official
- `.jinja2`

Or `templates/*` (official).

#a[Update recommendation re file extensions - Issue #547 - pallets/jinja][https://github.com/pallets/jinja/issues/547]

#a[python - Is there an idiomatic file extension for Jinja templates? - Stack Overflow][https://stackoverflow.com/questions/29590931/is-there-an-idiomatic-file-extension-for-jinja-templates]
#quote(block: true)[
I wanted to add an additional answer in 2020, as recently the Jinja2 project decided to drop the '2' from the name... meaning it's now just "Jinja".

Ansible still uses `.j2` in a lot of documentation, but seeing as the official Jinja template engine documentation now recommends `.jinja` if you want to use something other than non-Jinja-specific file extensions (see #a[docs here][https://jinja.palletsprojects.com/en/2.11.x/templates/#template-file-extension], or #a[when the change was added][https://github.com/pallets/jinja/pull/1083/files#diff-0f54a58b39617a700a0b750e7a8bf07eR60-R71]), I think people will start moving that way (and dropping the use of `.j2` or `.jinja2`).
]

#a[Ignore `.jinja` as final extension in `default_auto_escape_callback` - Issue #826 - mitsuhiko/minijinja][https://github.com/mitsuhiko/minijinja/issues/826]

= Editors
- GitHub
  - If ends with `.jinja`/`.j2`, only Jinja self's syntax will be highlighted.

VS Code:
- #a[Better Jinja: Syntax highlighting for jinja(2) including HTML, Markdown, YAML, Ruby and LaTeX templates][https://github.com/samuelcolvin/jinjahtml-vscode]
  - #a[hongquan/Dragon Jinja][https://github.com/hongquan/jinjahtml-vscode]
- #a[jinja-lsp: Language Server for jinja][https://github.com/uros-5/jinja-lsp]
- #a[noamzaks/jinja-ls: Feature-rich language server for Jinja.][https://github.com/noamzaks/jinja-ls]
