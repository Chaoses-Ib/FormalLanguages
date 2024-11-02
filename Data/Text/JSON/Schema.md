# [JSON Schema](https://json-schema.org/)
> JSON Schema specifies a JSON-based format to define the structure of JSON data for validation, documentation, and interaction control. It provides a contract for the JSON data required by a given application and how that data can be modified. JSON Schema is based on the concepts from XML Schema (XSD) but is JSON-based. As in XSD, the same serialization/deserialization tools can be used both for the schema and data, and it is self-describing. It is specified in an Internet Draft at the IETF, with the latest version as of 2024 being "Draft 2020-12". There are several validators available for different programming languages, each with varying levels of conformance. The standard filename extension is `.json`.

The JSON standard does not support object references, but an IETF draft standard for JSON-based object references exists.

[Tools](https://json-schema.org/tools)

[Descriptions for each enum value - Issue #47 - json-schema-org/json-schema-vocabularies](https://github.com/json-schema-org/json-schema-vocabularies/issues/47)
- Workarounds
  - `anyOf`
  - `meta:enum`
  - `enumDescriptions`
- 讨论了几年也没搞
- [In json schema, how to define an enum with description of each elements in the enum? - Stack Overflow](https://stackoverflow.com/questions/64233370/in-json-schema-how-to-define-an-enum-with-description-of-each-elements-in-the-e)

[swagger - How do I incorporate JSON schema into my OpenAPI file? - Stack Overflow](https://stackoverflow.com/questions/71121399/how-do-i-incorporate-json-schema-into-my-openapi-file)

## Multiple schemas
[node.js - How to manage multiple JSON schema files? - Stack Overflow](https://stackoverflow.com/questions/8179137/how-to-manage-multiple-json-schema-files)

[jsonschema - Are there recommended ways to structure multiple JSON schemas? - Stack Overflow](https://stackoverflow.com/questions/70807993/are-there-recommended-ways-to-structure-multiple-json-schemas)
> If you are going to reuse a particular schema in a number of different environments, putting it in a separate file can make sense. But if you're only going to use it in one place, it may be more convenient to put it under a `$defs` in the same file. You could even give that schema a nicer name to reference it, via `$anchor`.

[How to use multiple schemas in one json file](https://gist.github.com/BrunoS3D/6fdb8ae307cc576667c97778030dfd91)

[JSON Schema bundling finally formalised](https://json-schema.org/blog/posts/bundling-json-schema-compound-documents)

Unnecessarily complex shit.

## [quicktype](https://github.com/glideapps/quicktype)
> Generate types and converters from JSON, Schema, and GraphQL

[quicktype under the hood](http://blog.quicktype.io/under-the-hood/)

- Languages: TS/JS, C++, Rust, Go, C#, Java/Kotlin/Scala, Objective-C/Swift, Python, Ruby, Dart, Haskell, PHP

  > C (cJSON), C++, Crystal, C#, Dart, Elixir, Elm, Flow, Go, Haskell, Java,
  JavaScript, JavaScript PropTypes, JSON Schema, Kotlin, Objective-C, PHP,
  Pike, Python, Ruby, Rust, Scala3, Smithy, Swift, TypeScript, TypeScript
  Effect Schema, TypeScript Zod

- Multiple schemas
  - Directory of schemas
    - `--src-lang` doesn't work with directory of schemas?
  - Multiple schema files
    - Different from `quicktype` on each file seperately
  - `schema.json#/$defs/` / `schema.json#/definitions/`

    [Allow multiple schema inputs - Issue #711 - glideapps/quicktype](https://github.com/glideapps/quicktype/issues/711)
  - All in one big schema struct
    - Type aliases not aliavalbe (`using X = int64_t`), although type aliases will not be used in structs anyway
  - Array of schemas: not supported

- `--src-lang`: `json` by default, which is compatible with `schema` and will lead to confusing results
  - `json`
    - Having an int type alias will break all following ints?

- [App](https://app.quicktype.io/)

```sh
Synopsis

  $ quicktype [--lang LANG] [--src-lang SRC_LANG] [--out FILE] FILE|URL ...     

  LANG ... cjson|c++|cr|cs|dart|elixir|elm|flow|go|haskell|java|js|javascript-  
  prop-
  types|schema|kotlin|objc|php|pike|py|ruby|rs|scala3|Smithy|swift|ts|typescript- 
  effect-schema|typescript-zod

  SRC_LANG ... json|schema|graphql|postman|typescript

Options

 -o, --out FILE                                              The output file. Determines --lang and --top-level.
 -t, --top-level NAME                                        The name for the top level type.
 -l, --lang LANG                                             The target language.
 -s, --src-lang SRC_LANG                                     The source language (default is json).
 --src FILE|URL|DIRECTORY                                    The file, url, or data directory to type.
 --src-urls FILE                                             Tracery grammar describing URLs to crawl.
 --no-maps                                                   Don't infer maps, always use classes.
 --no-enums                                                  Don't infer enums, always use strings.
 --no-uuids                                                  Don't convert UUIDs to UUID objects.
 --no-date-times                                             Don't infer dates or times.
 --no-integer-strings                                        Don't convert stringified integers to integers.
 --no-boolean-strings                                        Don't convert stringified booleans to booleans.
 --no-combine-classes                                        Don't combine similar classes.
 --no-ignore-json-refs                                       Treat $ref as a reference in JSON.
 --graphql-schema FILE                                       GraphQL introspection file.
 --graphql-introspect URL                                    Introspect GraphQL schema from a server.
 --http-method METHOD                                        HTTP method to use for the GraphQL introspection query.
 --http-header HEADER                                        Header(s) to attach to all HTTP requests, including the
                                                             GraphQL introspection query.
 -S, --additional-schema FILE                                Register the $id's of additional JSON Schema files.
 --alphabetize-properties                                    Alphabetize order of class properties.
 --all-properties-optional                                   Make all class properties optional.
 --quiet                                                     Don't show issues in the generated code.
 --debug OPTIONS or all                                      Comma separated debug options: print-graph, print-
                                                             reconstitution, print-gather-names, print-transformations,
                                                             print-schema-resolving, print-times, provenance
 --telemetry enable|disable                                  Enable anonymous telemetry to help improve quicktype
 -h, --help                                                  Get some help.
 -v, --version                                               Display the version of quicktype
```

## Code to schema
Rust:
- [schemars: Generate JSON Schema documents from Rust code](https://github.com/GREsau/schemars) (inactive, [rs](./schemars/src/main.rs))
  - `JsonSchema_repr`
  - `#[serde(deny_unknown_fields)]` → `"additionalProperties": false`
  - [Documenting enum variants - Issue #34](https://github.com/GREsau/schemars/issues/34)
    ```rust
    #[derive(JsonSchema_repr, bevy_reflect::Reflect)]
    #[repr(i32)]
    pub enum MyIntEnum {
        /// Desc 1
        A = 1,
        /// Desc 2
        B = 2,
    }

    use bevy_reflect::Typed;

    let descs = match MyIntEnum::type_info() {
        bevy_reflect::TypeInfo::Enum(enum_info) => enum_info
            .iter()
            .map(|v| v.docs().unwrap().to_string())
            .collect(),
        _ => todo!(),
    };

    let schema = schema_for!(MyIntEnum);
    let mut value = serde_json::to_value(schema).unwrap();
    value["enumDescriptions"] = descs;
    println!("{}", serde_json::to_string_pretty(&value).unwrap());
    ```

C++:
- [Glaze](https://github.com/stephenberry/glaze/blob/main/docs/json-schema.md)
  - 元数据只能通过单独 struct 提供
  - Enum
    - [jsonschema_test.cpp](https://github.com/stephenberry/glaze/blob/469f381bff47bd84257261c6bfbb9f20254af049/tests/json_test/jsonschema_test.cpp#L206-L216)
    - [JSON schema enum value description - Issue #1339](https://github.com/stephenberry/glaze/issues/1339)
- [reflect-cpp](https://github.com/getml/reflect-cpp#json-schema)
  - Intrusive template type
- [StaticJSON: Fast, direct and static typed parsing of JSON with C++](https://github.com/netheril96/StaticJSON)

OpenAPI:
- [wework/json-schema-to-openapi-schema: A little NodeJS package to convert JSON Schema to OpenAPI Schema Objects](https://github.com/wework/json-schema-to-openapi-schema) (discontinued)

## Schema to code
Rust:
- [Typify: compiler from JSON Schema into idiomatic Rust types](https://github.com/oxidecomputer/typify)
- [schemafy: Crate for generating rust types from a json schema](https://github.com/Marwes/schemafy) (discontinued)

C++:
- quicktype
  - All int will be `int64_t`

    [C++: use different integer type - Issue #2180 - glideapps/quicktype](https://github.com/glideapps/quicktype/issues/2180)
  - Empty object will be `std::map<std::string, nlohmann::json>`, unless `"additionalProperties": false`

  ```
  --[no-]just-types                                           Plain types only (off by default)
  --namespace NAME                                            Name of the generated namespace(s)
  --code-format with-struct|with-getter-setter                Generate classes with getters/setters, instead of structs
  --wstring use-string|use-wstring                            Store strings using Utf-16 std::wstring, rather than Utf-8
                                                              std::string
  --const-style west-const|east-const                         Put const to the left/west (const T) or right/east (T
                                                              const)
  --source-style single-source|multi-source                   Source code generation type,  whether to generate single
                                                              or multiple source files
  --include-location local-include|global-include             Whether json.hpp is to be located globally or locally
  --type-style pascal-case|underscore-case|camel-case|upper-  Naming style for types
  underscore-case|pascal-case-upper-acronyms|camel-case-
  upper-acronyms
  --member-style underscore-case|pascal-case|camel-           Naming style for members
  case|upper-underscore-case|pascal-case-upper-
  acronyms|camel-case-upper-acronyms
  --enumerator-style upper-underscore-case|underscore-        Naming style for enumerators
  case|pascal-case|camel-case|pascal-case-upper-
  acronyms|camel-case-upper-acronyms
  --enum-type NAME                                            Type of enum class
  --[no-]boost                                                Require a dependency on boost. Without boost, C++17 is
                                                              required (on by default)
  --[no-]hide-null-optional                                   Hide null value for optional field (off by default)
  ```

- [pearmaster/json-schema-codegen: Generate C++ or Python3 code from JSON-Schema](https://github.com/pearmaster/json-schema-codegen) (inactive)
- [JsonToStruct: Code generator to generate C++ code from JSON schema definitions](https://github.com/SumuduLansakara/JsonToStruct) (discontinued)

Python:
- [pearmaster/json-schema-codegen: Generate C++ or Python3 code from JSON-Schema](https://github.com/pearmaster/json-schema-codegen) (inactive)

OpenAPI:
- [wework/json-schema-to-openapi-schema: A little NodeJS package to convert JSON Schema to OpenAPI Schema Objects](https://github.com/wework/json-schema-to-openapi-schema) (discontinued)

Markdown:
- [jsonschema2md: Convert Complex JSON Schemas into Markdown Documentation](https://github.com/adobe/jsonschema2md)

## Validators
Rust:
- [jsonschema-rs: JSON Schema validation library](https://github.com/Stranger6667/jsonschema-rs)
- [boon: JSONSchema (draft 2020-12, draft 2019-09, draft-7, draft-6, draft-4) Validation in Rust](https://github.com/santhosh-tekuri/boon)