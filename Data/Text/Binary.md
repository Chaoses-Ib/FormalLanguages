# Binary-to-text Encodings
[Wikipedia](https://en.wikipedia.org/wiki/Binary-to-text_encoding)

- yEnc: 98~99%

UTF-8:
- Base122: 87.5%
- 85: 80%
  - Ascii85
  - Base85
  - z85
- Base64: 75%
- Hexadecimal (Base16): 50%
- Decimal: ~42%
- Percent-encoding: ~40%

[Why did base64 win against uuencode? | Hacker News](https://news.ycombinator.com/item?id=38343748)

[When using HTTP, which encoding is better, base64, yEnc, or uuencode? - Stack Overflow](https://stackoverflow.com/questions/17589637/when-using-http-which-encoding-is-better-base64-yenc-or-uuencode)
> There are 94 Unicode characters which can be represented as one byte according to the JSON spec (if your JSON is transmitted as UTF-8). With that in mind, I think the best you can do space-wise is base85 which represents four bytes as five characters. However, this is only a 7% improvement over base64, it's more expensive to compute, and implementations are less common than for base64 so it's probably not a win.

## Non-UTF-8 encodings
- [kosarev/escapeless: Efficient binary encoding for large alphabets](https://github.com/kosarev/escapeless)
- yEnc
- [B-News](https://b-news.sourceforge.net/)

UTF-16/32:
- [qntm/base65536: Unicode's answer to Base64](https://github.com/qntm/base65536)

### yEnc
[Wikipedia](https://en.wikipedia.org/wiki/YEnc)

Only `NUL`, `LF`, `CR`, and `=` are escaped.

> YEnc is unsuitable when the text will be transfered as UTF-8.

- [aswaving/yenc: Encoding and decoding using yEnc encoding in Rust](https://github.com/aswaving/yenc)
- [eshaz/simple-yenc: Minimalist JavaScript binary string encoder / decoder with 1-2% overhead, compared to 33%-40% overhead for 6-bit encoding methods like Base64.](https://github.com/eshaz/simple-yenc)

## Base122
- [kevinAlbs/Base122: A space efficient alternative to base-64](https://github.com/kevinAlbs/Base122)

  [Hacker News](https://news.ycombinator.com/item?id=13049329)

## Base64
Rust:
- base64

[→binary-rs](binary-rs/src/main.rs)

JS:
- Browsers ([MDN](https://developer.mozilla.org/en-US/docs/Glossary/Base64))

  ```ts
  function base64ToBytes(base64) {
    const binString = atob(base64);
    return Uint8Array.from(binString, (m) => m.codePointAt(0));
  }

  function bytesToBase64(bytes: Uint8Array) {
    const binString = Array.from(bytes, (byte) =>
      String.fromCodePoint(byte),
    ).join("");
    return btoa(binString);
  }
  ```
  Cursed.

  [tc39/proposal-arraybuffer-base64: TC39 proposal for Uint8Array<->base64/hex](https://github.com/tc39/proposal-arraybuffer-base64)

  [javascript - How to convert uint8 Array to base64 Encoded String? - Stack Overflow](https://stackoverflow.com/questions/12710001/how-to-convert-uint8-array-to-base64-encoded-string)
