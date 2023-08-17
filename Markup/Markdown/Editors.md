# Markdown Editors
## [Visual Studio Code](https://github.com/Chaoses-Ib/SoftwareDevelopment#integrated-development-environments)
[Markdown Language Features](https://code.visualstudio.com/docs/languages/markdown):
- Document outline

- Snippets for Markdown

- Go to header in file: `Ctrl+Shift+O`

- Go to header in workspace: `Ctrl+T`

- Path completions

- Creating links to a header in another file (`[](##)`)

- Inserting images and links to files
  - Drag and drop
  - Copy and paste

  The `markdown.copyFiles.destination` setting controls where the new image file should be created. For example:
  ```json
  "markdown.copyFiles.destination": {
    "*": "images/${documentBaseName}/"
  }
  ```
  After insertion, the image can be renamed by Rename Symbol (`F2`) on the path.

  However, there is no detection for dangling images.

- Smart selection expand/shrink: `Shift+Alt+→/←`

- Link validation

  Link validation is off by default. To enable it, just set `"markdown.validate.enabled": true`.

  Note that this feature does not support footnotes, even if Markdown Footnotes is installed.

- Find All References to headers and links: `Shift+Alt+F12`

- Rename headers and links

- Automatic link updates on file move or rename
  
  Disabled by default. You can enable this feature with the `markdown.updateLinksOnFileMove.enabled` setting.

- Markdown preview
  - Switch between views: `Ctrl+Shift+V`
  - View the preview side-by-side: `Ctrk+K, V`

- Dynamic previews and preview locking

  By default, Markdown previews automatically update to preview the currently active Markdown file. You can lock a Markdown preview using the `Markdown: Toggle Preview Locking` command to keep it locked to its current Markdown document.

- Editor and preview synchronization

  You can disable scroll synchronization using the `markdown.preview.scrollPreviewWithEditor` and `markdown.preview.scrollEditorWithPreview` settings.

  Additionally, double clicking an element in the Markdown preview will automatically open the editor for the file and scroll to the line nearest the clicked element.

- Markdown preview security

  For security reasons, VS Code restricts the content displayed in the Markdown preview. This includes disabling script execution and only allowing resources to be loaded over HTTPS.

- Keyboard shortcuts

  When text is selected, pressing `*`, `_`, <code>\`</code> and `(` will quote the text with corresponding characters. However, `~` is not supported.

Extensions:
- [Markdown Checkboxes](https://github.com/mjbvz/vscode-markdown-checkboxes)

- [Markdown Footnotes](https://github.com/mjbvz/vscode-markdown-footnotes)

- Emojis
  - [:emojisense:](https://github.com/mattbierner/vscode-emojisense)
  - [Markdown Emoji](https://github.com/mjbvz/vscode-markdown-emoji)

- Mermaid
  - [Markdown Preview Mermaid Support](https://github.com/mjbvz/vscode-markdown-mermaid)
  - [Mermaid Markdown Syntax Highlighting](https://github.com/bpruitt-goddard/vscode-mermaid-syntax-highlight)

- Clipboard
  - [Markdown Paste](https://github.com/telesoho/vscode-markdown-paste-image)
    - `Ctrl+Alt+V`
    - [Feature request: follow link title · Issue #27 · telesoho/vscode-markdown-paste-image](https://github.com/telesoho/vscode-markdown-paste-image/issues/27)

    Rules:
    - Remove domain names in link titles (for Edge)

      ```json
      {
          // e.g. [telesoho/vscode-markdown-paste-image: Smartly paste for Markdown. (github.com)](https://github.com/telesoho/vscode-markdown-paste-image)
          "regex": "^(\\[.+?) \\([^\\s)]+\\.[^\\s)]+\\)\\]",
          "options": "g",
          "replace": "$1]"
      },
      ```

  - [Paste URL](https://github.com/kukushi/PasteURL)
    - `Ctrl+Alt+P`

  - [Paste Image](https://github.com/mushanshitiancai/vscode-paste-image)

- [Markdown Shortcuts](https://github.com/mdickin/vscode-markdown-shortcuts)

- [Markdown All in One](https://github.com/yzhang-gh/vscode-markdown)
  - Keyboard shortcuts
  - Table of contents
  - List editing
  - Print Markdown to HTML
  - GitHub Flavored Markdown
  - Math
  - Auto completions
  - Paste link on selected text

- [Foam: A personal knowledge management and sharing system for VSCode](https://github.com/foambubble/foam)
  - Graph visualization
  - Link autocompletion
  - Sync links on file rename
  - Unique identifiers across directories
  - Link preview and navigation
  - Go to definition, peek references
  - Navigation in preview
  - Note embed
  - Support for sections
  - Link alias
  - Templates
  - Backlinks panel
  - Tag explorer panel
  - Orphans and placeholder panels
  - Syntax highlight
  - Daily note
  - Generate references for your wikilinks

## Table editors
- [Convert Markdown Table to Markdown Table - Table Convert Online](https://tableconvert.com/markdown-to-markdown)
