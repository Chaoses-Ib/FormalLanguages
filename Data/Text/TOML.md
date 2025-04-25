# [TOML](https://toml.io/)
[Wikipedia](https://en.wikipedia.org/wiki/TOML), [GitHub](https://github.com/toml-lang/toml)

> Tom's Obvious, Minimal Language (originally Tom's Own Markup Language)

Not really a markup language, at least not a typical one.

[What is wrong with TOML? - HitchDev](https://hitchdev.com/strictyaml/why-not/toml/) ([Hacker News](https://news.ycombinator.com/item?id=37493964))

## [Inline Table](https://toml.io/en/v1.0.0#inline-table)
> Inline tables are intended to appear on a single line. A terminating comma (also called trailing comma) is not permitted after the last key/value pair in an inline table. No newlines are allowed between the curly braces unless they are valid within a value. Even so, it is strongly discouraged to break an inline table onto multiples lines. If you find yourself gripped with this desire, it means you should be using standard tables.

[Proposal: Allow newlines and trailing commas in inline tables - Issue #516 - toml-lang/toml](https://github.com/toml-lang/toml/issues/516)

## [Array of Tables](https://toml.io/en/v1.0.0#array-of-tables)
```toml
[[products]]
name = "Hammer"
sku = 738594937

[[products]]  # empty table within the array

[[products]]
name = "Nail"
sku = 284758393

color = "gray"
```
```json
{
  "products": [
    { "name": "Hammer", "sku": 738594937 },
    { },
    { "name": "Nail", "sku": 284758393, "color": "gray" }
  ]
}
```

Any reference to an array of tables points to the most recently defined table element of the array. This allows you to define sub-tables, and even sub-arrays of tables, inside the most recent table.

```toml
[[fruits]]
name = "apple"

[fruits.physical]  # subtable
color = "red"
shape = "round"

[[fruits.varieties]]  # nested array of tables
name = "red delicious"

[[fruits.varieties]]
name = "granny smith"


[[fruits]]
name = "banana"

[[fruits.varieties]]
name = "plantain"
```
```json
{
  "fruits": [
    {
      "name": "apple",
      "physical": {
        "color": "red",
        "shape": "round"
      },
      "varieties": [
        { "name": "red delicious" },
        { "name": "granny smith" }
      ]
    },
    {
      "name": "banana",
      "varieties": [
        { "name": "plantain" }
      ]
    }
  ]
}
```

## Libraries
.NET:
- [Tomlyn: Tomlyn is a TOML parser, validator and authoring library for .NET Framework and .NET Core](https://github.com/xoofx/Tomlyn)

Python:
- [tomli: A lil' TOML parser](https://github.com/hukkin/tomli)
  - [tomllib --- Parse TOML files --- Python 3 documentation](https://docs.python.org/3/library/tomllib.html) (3.11)
    - Read-only

    ```python
    import tomllib
    
    with open('pyproject.toml', 'rb') as f:
        toml = tomllib.load(f)
    ```
- [tomli-w: A lil' TOML writer (counterpart to https://github.com/hukkin/tomli)](https://github.com/hukkin/tomli-w)
- [python-poetry/tomlkit: Style-preserving TOML library for Python](https://github.com/python-poetry/tomlkit)
  - tomlq
    - yq
- [toml: Python lib for TOML](https://github.com/uiri/toml)

## Tools
[→Tools](README.md#tools)

- Python
  - [→Libraries](#libraries)
  - [yq](https://kislyuk.github.io/yq/)
  - [mrijken/toml-cli](https://github.com/mrijken/toml-cli)
- [taplo: A TOML toolkit written in Rust](https://github.com/tamasfe/taplo)
  - [Introduction | Taplo](https://taplo.tamasfe.dev/cli/introduction.html)
  - `scoop install taplo`
- [tomlq: A tool for getting data from TOML files on the command line](https://github.com/cryptaliagy/tomlq)
- [gnprice/toml-cli](https://github.com/gnprice/toml-cli) (discontinued)

PowerShell:
- [jborean93/PSToml: PowerShell TOML Parser and Writer](https://github.com/jborean93/PSToml)

[jq command line tool for manipulating toml files? - Issue #645 - toml-lang/toml](https://github.com/toml-lang/toml/issues/645)
