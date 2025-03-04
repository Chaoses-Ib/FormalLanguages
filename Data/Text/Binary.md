# Binary-to-text Encodings
[Wikipedia](https://en.wikipedia.org/wiki/Binary-to-text_encoding)

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

## Base122
- [kevinAlbs/Base122: A space efficient alternative to base-64](https://github.com/kevinAlbs/Base122)

## Base64
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
