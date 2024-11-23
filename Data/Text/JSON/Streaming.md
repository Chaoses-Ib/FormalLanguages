# JSON Streaming
[Wikipedia](https://en.wikipedia.org/wiki/JSON_streaming)

> Line-delimited JSON works very well with traditional line-oriented tools.
> 
> Concatenated JSON works with pretty-printed JSON but requires more effort and complexity to parse. It doesn't work well with traditional line-oriented tools. Concatenated JSON streaming is a superset of line-delimited JSON streaming.
> 
> Length-prefixed JSON works with pretty-printed JSON. It doesn't work well with traditional line-oriented tools, but may offer performance advantages over line-delimited or concatenated streaming. It can also be simpler to parse.

## Newline-delimited JSON
```json
{"some":"thing\n"}
{"may":{"include":"nested","objects":["and","arrays"]}}
```

### [JSON Lines](https://jsonlines.org/)
[GitHub](https://github.com/wardi/jsonlines)

[JSON Lines On the web](https://jsonlines.org/on_the_web/)

[Standard MIME content-type - Issue #19 - wardi/jsonlines](https://github.com/wardi/jsonlines/issues/19)

### [NDJSON: Newline delimited JSON](https://github.com/ndjson/ndjson-spec)
[Relationship to jsonlines.org - Issue #1 - ndjson/ndjson.github.io](https://github.com/ndjson/ndjson.github.io/issues/1)

[jsonlines - Issue #35 - ndjson/ndjson-spec](https://github.com/ndjson/ndjson-spec/issues/35)
> I'm the owner of the ndjson domain and have contributed to the original spec. I'm no longer working with my employer at the time who was interested in the standardisation of NDJSON, so indeed I'm not very motivated to continue the work here and submit a RFC.
>
> That being said. I don't really care about the name and I don't think it's very useful to have two different websites and descriptions for this. Especially since I don't see any differences between the formats.
> 
> I'm open to the idea to deprecate the ndjson repository and redirect the website to jsonlines.org (since some places link it).

### Libraries
Rust:
- [serde-jsonlines: Read & write JSON Lines documents](https://github.com/jwodder/serde-jsonlines)
  - Async: `cargo add serde-jsonlines --features async`
    ```rust
    let jsonl_writer: Option<Arc<tokio::sync::Mutex<serde_jsonlines::AsyncJsonLinesWriter<tokio::fs::File>>>>;

    jsonl_writer = match jsonl_path {
        Some(path) => {
            let file = tokio::fs::File::options()
                .append(true)
                .create(true)
                .open(path)
                .await?;
            Some(Arc::new(tokio::sync::Mutex::new(
                serde_jsonlines::AsyncJsonLinesWriter::new(file),
            )))
        }
        None => None,
    };

    if let Some(writer) = &jsonl_writer {
        let writer = writer.clone();
        let value = value.clone();
        tokio::spawn(async move {
            let mut writer = writer.lock().await;
            writer.write(&value).await.unwrap();
        });
    }
    ```
- [json-lines: A no\_std + serde compatible message library implementing JSON Lines](https://github.com/strawlab/json-lines)
  - > This crate endeavors to have a similar API to the [postcard](https://crates.io/crates/postcard) crate.
- [jsonl: An implementation of JSON Lines for Rust](https://github.com/lunacookies/jsonl) (discontinued)
  - `edition = "2018"`
  - `thiserror = "1"`

Python:
- [jsonlines: python library to simplify working with jsonlines and ndjson data](https://github.com/wbolster/jsonlines)
- [json-lines: Read JSON lines (jl) files, including gzipped and broken](https://github.com/TeamHG-Memex/json-lines) (discontinued)

## Record separator-delimited JSON
```json
␞{"some":"thing\n"}␊
␞{
  "may": {
    "include": "nested",
    "objects": [
      "and",
      "arrays"
    ]
  }
}␊
```

## Concatenated JSON
```json
{"some":"thing\n"}{"may":{"include":"nested","objects":["and","arrays"]}}
```
```json
{
  "some": "thing\n"
}
{
  "may": {
    "include": "nested",
    "objects": [
      "and",
      "arrays"
    ]
  }
}
```

## Length-prefixed JSON
```json
18{"some":"thing\n"}55{"may":{"include":"nested","objects":["and","arrays"]}}
```