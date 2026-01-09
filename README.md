# md2browser

Render Markdown files to HTML and open them in your browser.

Features:
- Wide layout (60em)
- Automatic dark/light mode based on system preference
- Syntax highlighting optimized for both themes
- Hard line breaks preserved (GFM style)
- Verdana font

## Dependencies

- [pandoc](https://pandoc.org/installing.html)
- [rumdl](https://github.com/rvben/rumdl) - Markdown linter/formatter
- `xdg-open` (Linux) or modify the script for your OS

## Installation

```bash
# Clone the repo
git clone https://github.com/abyrne55/md2browser.git

# Copy CSS to pandoc config directory
mkdir -p ~/.pandoc
cp md2browser.css ~/.pandoc/

# Add the function to your shell
echo 'source /path/to/md2browser/md2browser.sh' >> ~/.bashrc
```

## Usage

```bash
md document.md
```

## Configuration

Set `MD2BROWSER_CSS` to use a custom CSS path:

```bash
export MD2BROWSER_CSS="/path/to/custom.css"
```

## Acknowledgments

Inspired by [this Reddit comment](https://www.reddit.com/r/linux/comments/1023abr/comment/j2sv8a8/).

## License

MIT License - see [LICENSE](LICENSE) for details.
