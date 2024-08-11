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