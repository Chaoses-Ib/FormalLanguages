# [MDX](https://mdxjs.com/)
[GitHub](https://github.com/mdx-js/mdx/)

> Markdown for the component era

[What is MDX? | MDX](https://mdxjs.com/docs/what-is-mdx/)

[MDX Plugins | Docusaurus](https://docusaurus.io/docs/next/markdown-features/plugins)

[Playground | MDX](https://mdxjs.com/playground/)

Vite:
- [vite-plugin-react-pages: A vite framework for building react app. Especially suitable for document site and demos/playgrounds of react components.](https://github.com/vitejs/vite-plugin-react-pages)
- [cyco130/vite-plugin-mdx: MDX plugin for Vite](https://github.com/cyco130/vite-plugin-mdx)

VS Code:
- [MDX Analyzer: MDX extension for Visual Studio Code](https://github.com/mdx-js/mdx-analyzer)
- [MDX Preview for Visual Studio Code](https://github.com/xyc/vscode-mdx-preview) (discontinued)

## Markdown
[What is MDX? | MDX](https://mdxjs.com/docs/what-is-mdx/#markdown)
- [Deviations from Markdown](https://github.com/micromark/mdx-state-machine#72-deviations-from-markdown)

[Better compatibility with CommonMark - Issue #1125 - mdx-js/mdx](https://github.com/mdx-js/mdx/issues/1125)

- Tags must be closed.
  ```js
  "reason": "Unexpected closing tag `</a>`, expected corresponding closing tag for `<img>`",
  "ruleId": "end-tag-mismatch",
  "source": "mdast-util-mdx-jsx"
  ```
