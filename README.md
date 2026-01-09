# md2browser

Simple shell function for rendering Markdown files to HTML and opening them in your default web browser. Motivated by a dissatisfaction with the lack of lightweight open-source Markdown viewers (not editors) for Linux. Inspired by [this Reddit comment](https://www.reddit.com/r/linux/comments/1023abr/comment/j2sv8a8/).

## Setup
Run these three commands...
```bash
curl --create-dirs -o ~/.pandoc/md2browser.css https://raw.githubusercontent.com/abyrne55/md2browser/refs/heads/main/md2browser.css
curl https://raw.githubusercontent.com/abyrne55/md2browser/refs/heads/main/md2browser.sh >> ~/.bashrc
source ~/.bashrc
```
...or manually follow these instructions:
1. Make sure you have [`pandoc`](https://pandoc.org/installing.html) (for rendering Markdown to HTML) and [`rumdl`](https://github.com/rvben/rumdl) (for cleaning up the input Markdown file such that Pandoc renders it properly) installed and in your `$PATH`
2. Download the CSS template ([md2browser.css](./md2browser.css) to somewhere where Pandoc can find it, e.g., `~/.pandoc/md2browser.css`
3. Copy the `md()` shell function ([md2browser.sh](./md2browser.sh)) and paste it into your `~/.bashrc` (or wherever your shell's config lives)
4. Make customizations if necessary, for example...
   * `md()`: change `xdg-open` to `open` if you're using macOS
   * `md()`: remove the `rumdl` line if don't think a linting step is necessary
   * `md2browser.css`: change the font, background color, etc.
5. Restart your terminal (or run `source ~/.bashrc`)

## Usage
```bash
md document.md
# and then your default browser opens a rendered version of document.md :)
```

## How It Works
1. `cat`s your Markdown file into a linter ([rumdl](https://github.com/rvben/rumdl)) to fix anything that might trip up the renderer without actually modifying the file
2. Pipes the linter's output into [Pandoc](https://pandoc.org/installing.html), which uses the provided CSS* to render the linted Markdown input to a self-contained HTML file
3. Saves that HTML to a temporary file created using `mktemp` and named based on the original Markdown file's absolute path
4. Opens that temporary HTML file in your default web browser

*the provided CSS is just the default CSS that Pandoc uses, plus some quality-of-life tweaks like an automatic dark mode, a sans-serif font, and a wider body column.
