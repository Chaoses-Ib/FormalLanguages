# Regex Engine API
<table style="white-space: nowrap;">
    <thead>
        <tr>
            <th>Operation</th>
            <th><a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex">.NET</a></th>
            <th><a href="https://docs.python.org/3/library/re.html">Python</a></th>
            <th><a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/package-summary.html">Java</a></th>
            <th><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions">JavaScript</a></th>
            <th><a href="https://en.cppreference.com/w/cpp/regex">C++</a></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>API style</th>
            <td>m/o=p.(sr) | m/o=(spr)</td>
            <td>m/o=(prs)</td>
            <td>o=p.(s).(r)</td>
            <td>m/o=s.(pr) | m=p.(s)</td>
            <td>(osmpr)</td>
        </tr>
        <tr>
            <th>Match the whole string</th>
            <td><code>\Ap\z</code></td>
            <td><a href="https://docs.python.org/3/library/re.html#re.fullmatch">fullmatch(p, s)</a></td>
            <td>
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Pattern.html#matches(java.lang.String,java.lang.CharSequence)">matches(p, s)</a><br />
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#matches()">p.matcher(s).matches()</a>
            </td>
            <td><code>^non_multiline_p$</code></td>
            <td><a href="https://en.cppreference.com/w/cpp/regex/regex_match">match(s, m, p)</a></td>
        </tr>
        <tr>
            <th>Match at the beginning</th>
            <td><code>\Ap</code></td>
            <td><a href="https://docs.python.org/3/library/re.html#re.match">match(p, s)</a></td>
            <td><a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#lookingAt()">p.matcher(s).lookingAt()</a></td>
            <td><code>^non_multiline_p</code></td>
            <td><code>^non_ECMA_multiline_p</code></td>
        </tr>
        <tr>
            <th>Match one from the beginning</th>
            <td>
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.match">p.Match(s)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.match">Match(s, p)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.ismatch">p.IsMatch(s)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.ismatch">IsMatch(s, p)</a>
            </td>
            <td><a href="https://docs.python.org/3/library/re.html#re.search">search(p, s)</a></td>
            <td><a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#find(int)">p.matcher(s).find(0)</a></td>
            <td>
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec">p.exec(s)</a><br />
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match">s.match(nonglobal_p)</a><br />
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search">s.search(p)</a><br />
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test">p.test(s)</a><br />
            </td>
            <td><a href="https://en.cppreference.com/w/cpp/regex/regex_search">search(s, m, p)</a></td>
        </tr>
        <tr>
            <th>Match iteratively</th>
            <td>
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.matches">p.Matches(s)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.matches">Matches(s, p)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.match.nextmatch">last_m.NextMatch()</a>
            </td>
            <td><a href="https://docs.python.org/3/library/re.html#re.finditer">finditer(p, s)</a></td>
            <td>
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#results()">p.matcher(s).results()</a><br />
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#find(int)">p.matcher(s).find()</a>
            </td>
            <td>
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll">s.matchAll(p)</a><br />
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec">global_p.exec(s)</a>
            </td>
            <td>
                <a href="https://en.cppreference.com/w/cpp/regex/regex_iterator">iterator(s, p)</a><br />
                <a href="https://en.cppreference.com/w/cpp/regex/regex_token_iterator">token_iterator(s, p, n)</a><br />
                <a href="https://en.cppreference.com/w/cpp/regex/regex_search">search(last_m.suffix(), m, p))</a>
            </td>
        </tr>
        <tr>
            <th>Match all</th>
            <td>
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.matches">p.Matches(s)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.matches">Matches(s, p)</a>
            </td>
            <td><a href="https://docs.python.org/3/library/re.html#re.findall">findall(p, s)</a></td>
            <td><a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#results()">p.matcher(s).results().toList()</a></td>
            <td>
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll">...s.matchAll(p)</a><br />
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match">s.match(global_p)</a>
            </td>
            <td>-</td>
        </tr>
        <tr>
            <th>Replace one from the beginning</th>
            <td>
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.replace">p.Replace(s, r(), count=1)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.replace">Replace(s, p, r(), count=1)</a>
            </td>
            <td><a href="https://docs.python.org/3/library/re.html#re.sub">sub(p, r(), s, count=1)</a></td>
            <td><a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#replaceFirst(java.util.function.Function)">p.matcher(s).replaceFirst(r())</a></td>
            <td><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace">s.replace(nonglobal_p, r())</a></td>
            <td><a href="https://en.cppreference.com/w/cpp/regex/regex_replace">replace([o, ]s, p, r, format_first_only)</a></td>
        </tr>
        <tr>
            <th>Replace all</th>
            <td>
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.replace">p.Replace(s, r())</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.replace">Replace(s, p, r())</a>
            </td>
            <td><a href="https://docs.python.org/3/library/re.html#re.sub">sub(p, r(), s)</a></td>
            <td><a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#replaceAll(java.util.function.Function)">p.matcher(s).replaceAll(r())</a></td>
            <td>
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll">s.replaceAll(p, r())</a><br />
                <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace">s.replace(global_p, r())</a>
            </td>
            <td><a href="https://en.cppreference.com/w/cpp/regex/regex_replace">replace([o, ]s, p, r)</a></td>
        </tr>
        <tr>
            <th>Split</th>
            <td>
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.split">p.Split(s, count)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.split">Split(s, p)</a>
            </td>
            <td><a href="https://docs.python.org/3/library/re.html#re.split">split(p, s)</a></td>
            <td>
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Pattern.html#split(java.lang.CharSequence,int)">split(s, count)</a><br />
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Pattern.html#splitAsStream(java.lang.CharSequence)">splitAsStream(s)</a>
            </td>
            <td><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split">s.split(p, count)</a></td>
            <td>-</td>
        </tr>
        <tr>
            <th>Escape</th>
            <td>
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.escape">Escape(s)</a><br />
                <a href="https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.unescape">Unescape(s)</a>
            </td>
            <td><a href="https://docs.python.org/3/library/re.html#re.escape">escape(s)</a></td>
            <td>
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Pattern.html#quote(java.lang.String)">quote(s)</a><br />
                <code>\Qs\E</code><br />
                <a href="https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/regex/Matcher.html#quoteReplacement(java.lang.String)">quoteReplacement(s)</a>
            </td>
            <td>-</td>
            <td>-</td>
        </tr>
    </tbody>
</table>

Notations:
- `p`: regular expression pattern
- `s`: string
- `m`: match result
- `r`: replacement
- `o`: replace result