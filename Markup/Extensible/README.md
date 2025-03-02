# Extensible Markup Language (XML)
[Wikipedia](https://en.wikipedia.org/wiki/XML)

## Libraries
- [Document Object Model](https://en.wikipedia.org/wiki/Document_Object_Model) (DOM)
- [Simple API for XML](https://en.wikipedia.org/wiki/Simple_API_for_XML) (SAX)
- XML to JSON
  
  Maybe converting XML to JSON first is easier and works in most cases?

  Rust:
  - [colingabr/xml2json-rs: A rust library for converting to and from XML and JSON.](https://github.com/colingabr/xml2json-rs)
  - [rtyler/xmltojson: A Rust crate for converting XML to JSON](https://github.com/rtyler/xmltojson)

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
    - Enums
      - [quick\_xml::de - Rust](https://docs.rs/quick-xml/latest/quick_xml/de/index.html#enum-representations)
      - [Cannot Deserialize a Serializable Enum - Issue #808 - tafia/quick-xml](https://github.com/tafia/quick-xml/issues/808)

        > Basically, serde features that requires internal bufferisation, will not work with XML deserializer, because only XML deserializer knows how to convert strings from XML into other types (such as `i32`). Also, conversion of specially named fields (such as `@...` and `$value` or `$text`) also only possible when type deserialized from the XML deserializer. When bufferisation is performed, XML deserializer provides data in very generic form, i. e. as strings and maps only, without special processing of specially named fields.
      - [quick\_xml::serde\_helpers::text\_content - Rust](https://docs.rs/quick-xml/latest/quick_xml/serde_helpers/text_content/index.html)
      - [impl\_deserialize\_for\_internally\_tagged\_enum in quick\_xml - Rust](https://docs.rs/quick-xml/latest/quick_xml/macro.impl_deserialize_for_internally_tagged_enum.html)

    - [xml\_schema\_generator: A collection of helper functions to read a given XML string or stream using quick\_xml and generating a Struct (as String) that you can use in your Rust program to serialize or deserialize XML of the same format](https://github.com/Thomblin/xml_schema_generator)

  - [escape](https://docs.rs/quick-xml/latest/quick_xml/escape/fn.escape.html)
    - Only `<`, `>`, `&`, `'`, `"` are escaped
    - [Question about changing un/escape behavior - Issue #734 - tafia/quick-xml](https://github.com/tafia/quick-xml/issues/734)
    - [Serializing CDATA - Issue #353 - tafia/quick-xml](https://github.com/tafia/quick-xml/issues/353)
    - Cannot fully customize escape behavior
      - [QuoteLevel in quick\_xml::se - Rust](https://docs.rs/quick-xml/latest/quick_xml/se/enum.QuoteLevel.html)
      - [How to ignore double quotation mark when do serialization？ - Issue #362 - tafia/quick-xml](https://github.com/tafia/quick-xml/issues/362)
      - [Support for disabling automatic escaping in `to xml` - Issue #11525 - nushell/nushell](https://github.com/nushell/nushell/issues/11525)

  [XML parsing in Rust | Mainmatter](https://mainmatter.com/blog/2020/12/31/xml-and-rust/)

- [xml-rs: An XML library in Rust](https://github.com/kornelski/xml-rs)
  - Serde: [serde-xml-rs](https://github.com/Metaswitch/serde-xml-rs) (discontinued)

    [XML parsing in Rust](https://apiraino.github.io/xml-parsing/)

    [Best XML to Rust Converter](https://jsonformatter.org/xml-to-rust)

- [xmlparser: A low-level, pull-based, zero-allocation XML 1.0 parser.](https://github.com/RazrFalcon/xmlparser)
  - [roxmltree: Represent an XML document as a read-only tree.](https://github.com/RazrFalcon/roxmltree)

- [sxd-document: An XML library in Rust](https://github.com/shepmaster/sxd-document)

- [xmltree-rs: Reads an XML file into a simple tree structure](https://github.com/eminence/xmltree-rs)

C++:
- [TinyXML](https://www.cs.cmu.edu/~preethi/src/tinyxml/docs/)
  - https://web.archive.org/web/20221201092519/http://www.grinninglizard.com/tinyxmldocs/index.html
  - Escape: `EncodeString()`
    - `<`, `>`, `&`, `'`, `"`, any char < 32
      - Ser: `\n` -> `&#x0A;`, de: `\n` -> ` `
    - > Additionally, any character can be specified by its Unicode code point: The syntax `&#xA0;` or `&#160;` are both to the non-breaking space characher.

  [TinyXML2: A simple, small, efficient, C++ XML parser that can be easily integrated into other programs.](https://github.com/leethomason/tinyxml2)
