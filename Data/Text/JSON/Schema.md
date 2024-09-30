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

[quicktype: Generate types and converters from JSON, Schema, and GraphQL](https://github.com/glideapps/quicktype)

## Code to schema
Rust:
- [schemars: Generate JSON Schema documents from Rust code](https://github.com/GREsau/schemars) (inactive, [rs](./schemars/src/main.rs))
  - `JsonSchema_repr`
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
- [pearmaster/json-schema-codegen: Generate C++ or Python3 code from JSON-Schema](https://github.com/pearmaster/json-schema-codegen)

Python:
- [pearmaster/json-schema-codegen: Generate C++ or Python3 code from JSON-Schema](https://github.com/pearmaster/json-schema-codegen)

OpenAPI:
- [wework/json-schema-to-openapi-schema: A little NodeJS package to convert JSON Schema to OpenAPI Schema Objects](https://github.com/wework/json-schema-to-openapi-schema) (discontinued)

Markdown:
- [jsonschema2md: Convert Complex JSON Schemas into Markdown Documentation](https://github.com/adobe/jsonschema2md)

## Validators
Rust:
- [jsonschema-rs: JSON Schema validation library](https://github.com/Stranger6667/jsonschema-rs)
- [boon: JSONSchema (draft 2020-12, draft 2019-09, draft-7, draft-6, draft-4) Validation in Rust](https://github.com/santhosh-tekuri/boon)