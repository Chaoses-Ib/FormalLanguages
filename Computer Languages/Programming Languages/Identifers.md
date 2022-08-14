# Identifers
## Unicode
[UAX #31: Unicode Identifier and Pattern Syntax](https://www.unicode.org/reports/tr31/)

Within the ASCII range, the valid characters are `[A-Za-z]` (no underscore) for `XID_Start` and `[A-Za-z_0-9]` for `XID_Continue`. For all valid characters, see [DerivedCoreProperties](https://www.unicode.org/Public/14.0.0/ucd/DerivedCoreProperties.txt).

## Languages
<table>
    <thead>
        <tr>
            <th>Language</th>
            <th>Identifers</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://en.cppreference.com/w/c/language/identifier">C</a></td>
            <td><code>(?!digit)([A-Za-z_0-9]|\unnnn|\Unnnnnnnn)+</code> (it is implementation-defined if raw Unicode characters are allowed)<td>
        </tr>
        <tr>
            <td><a href="https://en.cppreference.com/w/cpp/language/identifiers">C++</a></td>
            <td><code>[\p{XID_Start}_][\p{XID_Continue}]*</code></td>
        </tr>
        <tr>
            <td><a href="https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/lexical-structure#643-identifiers">C#</a></td>
            <td><code>([\p{XID_Start}_@]|\unnnn|\Unnnnnnnn) ([\p{XID_Continue}]|\unnnn|\Unnnnnnnn)*</code></td>
        </tr>
        <tr>
            <td><a href="https://262.ecma-international.org/#sec-names-and-keywords">JavaScript</a></td>
            <td><code>([\p{ID_Start}_$]|\unnnn|u{nnnnnn}) ([\p{ID_Continue}$]|\unnnn|u{nnnnnn})*</code></td>
        </tr>
        <tr>
            <td><a href="https://docs.python.org/3/reference/lexical_analysis.html#identifiers">Python</a></td>
            <td>
<pre><code>identifier   ::=  xid_start xid_continue*
id_start     ::=  &lt;all characters in general categories Lu, Ll, Lt, Lm, Lo, Nl, the underscore, and characters with the Other_ID_Start property&gt;
id_continue  ::=  &lt;all characters in id_start, plus characters in the categories Mn, Mc, Nd, Pc and others with the Other_ID_Continue property&gt;
xid_start    ::=  &lt;all characters in id_start whose NFKC normalization is in "id_start xid_continue*"&gt;
xid_continue ::=  &lt;all characters in id_continue whose NFKC normalization is in "id_continue*"&gt;</code></pre>
            </td>
        </tr>
    </tbody>
</table>