# printf Format
[Wikipedia](https://en.wikipedia.org/wiki/Printf_format_string#Syntax)

`printf` is the name of one of the main C output functions, and stands for "print formatted". Many languages other than C copy the printf format string syntax closely or exactly in their own I/O functions.

## Specification
```antlr
placeholder : '%' parameter? flags? width? ('.' precision)? length? type ;
```

### Parameter
```antlr
parameter : N '$' ;
```
`N` is the number of the parameter to display (POSIX extension).

### Flags
```antlr
flags : [-+ 0,#]+ ;
```
- `-` : Left-align (the default is right-align)
- `+` : Prepend a plus for positive signed-numeric type
- <code>&nbsp;</code> : Prepend a space for positive signed-numeric type (ignored if '+' exists)
- `0` : When the width option is specified, prepend zeros for numeric types (preprend spaces by default)
- `,` : The integer or exponent of a decimal has the thousands grouping separator applied
- `#` : Alternate forms:
  - For `[gG]` types, trailing zeros are not removed.
  - For `[fFeEgG]` types, the output always contains a decimal point.
  - For `[oxX]` types, the text `0`, `0x`, `0X`, respectively, is prepended to non-zero numbers.

### Width
```antlr
width : N | '*' ;
```
Specify the minimum width (i.e. number of characters) to output.
- `*` : The minimum width is passed as another argument, e.g. `printf("%*d", 5, 10)` will result in <code>&nbsp;&nbsp;&nbsp;10</code>.

### Precision
```antlr
precision : N | '*' ;
```
Specify a maximum limit on the output.
- For floating point numeric types, it specifies the number of digits to the right of the decimal point that the output should be rounded.
- For the string type, it limits the number of characters that should be output, after which the string is truncated.
- `*` : The maximum limit is passed as another argument, e.g. `printf("%.*s", 3, "abcdef")` will result in `abc`.

### Length
```antlr
length : 'hh' | 'h' | 'l' | 'll' | 'L' | 'z' | 'j' | 't'
       | platform_specific_length
       ;
platform_specific_length : 'I' | 'I32' | 'I64' | 'q' ;
```
For interger types:
Length | Description
--- | ---
hh | Causes printf to expect an `int`-sized integer argument which was promoted from a `char`.
h | Causes printf to expect an `int`-sized integer argument which was promoted from a `short`.
l | Causes printf to expect a `long`-sized integer argument.
ll | Causes printf to expect a `long long`-sized integer argument.
z | Causes printf to expect a `size_t`-sized integer argument.
j | Causes printf to expect a `intmax_t`-sized integer argument.
t | Causes printf to expect a `ptrdiff_t`-sized integer argument.

Platform-specific:
Length | Description
--- | ---
I | For signed integer types, causes printf to expect `ptrdiff_t`-sized integer argument;<br />For unsigned integer types, causes printf to expect `size_t`-sized integer argument.
I32 | Causes printf to expect a 32-bit integer argument.
I64<br />q | Causes printf to expect a 64-bit (quad word) integer argument

For floating point types:
Length | Description
--- | ---
L | Cause printf to expect a `long double` argument.

Note that `float` arguments are always promoted to `double` when used in a varargs call.

The [inttypes.h](https://en.cppreference.com/w/cpp/header/cinttypes) header includes a number of macros for use in platform-independent printf coding. These must be outside double-quotes, e.g. `printf("%" PRId64 "\n", t);`.

### Type
```antlr
type : [%aAcdeEfFgGinopsuxX] ;
```

Integer types:
Type | Desciption
--- | ---
b, B | <ul><li>C++ {fmt}, Python: Binary format</li><li>Java: Boolean</li></ul>
d<br />i | `int` as a signed integer (when used with scanf for input, `%i` will interpret a number as hexadecimal if it's preceded by `0x`, and octal if it's preceded by `0`)
u | Print decimal unsigned int
x, X | `unsigned int` as a hexadecimal number.<br />e.g. `%02X` or `%.2X`
o | `unsigned int` in octal
p | `void*` in an implementation-defined format
n | <ul><li>Prints nothing, but writes the number of characters written so far into an integer pointer parameter.</li><li>Java: Prints a newline.</li><li>Python: This is the same as `d`, except that it uses the current locale setting to insert the appropriate number separator characters.</li></ul>

Floating point types:
Type | Desciption
--- | ---
f, F | `double` in normal (fixed-point) notation. `f` and `F` only differs in how the strings for an infinite number or NaN are printed (`inf`, `infinity` and `nan` for `f`; `INF`, `INFINITY` and `NAN` for `F`).
e, E | `double` in standard form (`d.ddde±dd`). The exponent always contains at least two digits; if the value is zero, the exponent is `00`.
g, G | `double` in either normal or exponential notation, whichever is more appropriate for its magnitude. This type differs slightly from fixed-point notation in that insignificant zeroes to the right of the decimal point are not included. Also, the decimal point is not included on whole numbers.
a, A | `double` in hexadecimal notation, starting with `0x` or `0X`

String types:
Type | Desciption
--- | ---
% | A literal `%` character (this type doesn't accept any flags, width, precision, length fields)
c | `char`
s | Null-terminated string

## Variants
- C++
  - [{fmt}](#c-fmt)
- F#
- Go
- Haskell
- [Java](#java)
- Julia
- Lua
- MATLAB
- Perl
- PHP
- [Python](#python)
- R
- Raku
- Ruby
- [Rust](#rust)
- Tcl

### C++ {fmt}
[Format Specification Mini-Language](https://fmt.dev/latest/syntax.html#format-specification-mini-language)
```antlr
format_spec ::=  [[fill]align][sign]["#"]["0"][width]["." precision]["L"][type]
fill        ::=  <a character other than '{' or '}'>
align       ::=  "<" | "^" | ">"
sign        ::=  "+" | "-" | " "
width       ::=  integer | "{" [arg_id] "}"
precision   ::=  integer | "{" [arg_id] "}"
type        ::=  "a" | "A" | "b" | "B" | "c" | "d" | "e" | "E" | "f" | "F" | "g" | "G" |
                 "o" | "p" | "s" | "x" | "X"
```

### Java
[Formatter](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Formatter.html)
```antlr
format_spec : '%' (argument_index '$')? flags? width? ('.' precision)? conversion ;
flags       : [-+ 0,#(]+ ;
conversion  : [%aAbBcCdeEfFgGhHnosStTxX] ;
```

### Python
[Format Specification Mini-Language](https://docs.python.org/3/library/string.html#formatspec)
```antlr
format_spec     ::=  [[fill]align][sign][#][0][width][grouping_option][.precision][type]
fill            ::=  <any character>
align           ::=  "<" | "^" | ">" | "="
sign            ::=  "+" | "-" | " "
width           ::=  digit+
grouping_option ::=  "_" | ","
precision       ::=  digit+
type            ::=  "b" | "c" | "d" | "e" | "E" | "f" | "F" | "g" | "G" | "n" | "o" | "s" | "x" | "X" | "%"
```

[Python F-Strings Number Formatting Cheat Sheet - Cheatography](https://cheatography.com/brianallan/cheat-sheets/python-f-strings-number-formatting/)

### Rust
[std::fmt - Rust](https://doc.rust-lang.org/std/fmt/index.html)
```antlr
format_string := text [ maybe_format text ] *
maybe_format := '{' '{' | '}' '}' | format
format := '{' [ argument ] [ ':' format_spec ] [ ws ] * '}'
argument := integer | identifier

format_spec := [[fill]align][sign]['#']['0'][width]['.' precision]type
fill := character
align := '<' | '^' | '>'
sign := '+' | '-'
width := count
precision := count | '*'
type := '' | '?' | 'x?' | 'X?' | identifier
count := parameter | integer
parameter := argument '$'
```