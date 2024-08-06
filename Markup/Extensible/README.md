# Extensible Markup Language (XML)
[Wikipedia](https://en.wikipedia.org/wiki/XML)

## Libraries
- [Document Object Model](https://en.wikipedia.org/wiki/Document_Object_Model) (DOM)
- [Simple API for XML](https://en.wikipedia.org/wiki/Simple_API_for_XML) (SAX)

Rust:
- [quick-xml: Rust high performance xml reader and writer](https://github.com/tafia/quick-xml)
  - Serde: [`Deserializer` module](https://docs.rs/quick-xml/latest/quick_xml/de/) and [`Serializer` module](https://docs.rs/quick-xml/latest/quick_xml/se/index.html)
    - Every tag type should correspond to a struct type, unless it has no attributes/subelements, where `String` can be used.
    - However, the field name is used as the tag name, instead of the type name, except for the root element.
      - Even the tag name of every element in a `Vec` is using the field name of the `Vec` field.
    - Optional attributes must be `Option` to deserialize.
      - `attr: Option<T>` will be serialized as `attr=""`. Use `#[serde(skip_serializing_if = "Option::is_none")]`.

        [Is it as expect that Option attribute serialize into empty string instead of non-attribute. - Issue #692](https://github.com/tafia/quick-xml/issues/692)
    - [Is an XML document valid if there is only an XML declaration? - Issue #599](https://github.com/tafia/quick-xml/issues/599)

    - [xml\_schema\_generator: A collection of helper functions to read a given XML string or stream using quick\_xml and generating a Struct (as String) that you can use in your Rust program to serialize or deserialize XML of the same format](https://github.com/Thomblin/xml_schema_generator)

  [XML parsing in Rust | Mainmatter](https://mainmatter.com/blog/2020/12/31/xml-and-rust/)

- [xml-rs: An XML library in Rust](https://github.com/kornelski/xml-rs)
  - Serde: [serde-xml-rs](https://github.com/Metaswitch/serde-xml-rs) (discontinued)

    [XML parsing in Rust](https://apiraino.github.io/xml-parsing/)

    [Best XML to Rust Converter](https://jsonformatter.org/xml-to-rust)

- [xmlparser: A low-level, pull-based, zero-allocation XML 1.0 parser.](https://github.com/RazrFalcon/xmlparser)
  - [roxmltree: Represent an XML document as a read-only tree.](https://github.com/RazrFalcon/roxmltree)

- [sxd-document: An XML library in Rust](https://github.com/shepmaster/sxd-document)

- [xmltree-rs: Reads an XML file into a simple tree structure](https://github.com/eminence/xmltree-rs)
