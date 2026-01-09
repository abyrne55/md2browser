function md() {
  local MD2BROWSER_CSS="${MD2BROWSER_CSS:-$HOME/.pandoc/md2browser.css}"
  local NAME_TEMPLATE=$(realpath "$1" | tr -cs 'a-zA-Z0-9' '-' | sed 's/^-//;s/-$//' | tail -c 80)-XXXX
  local TMP_HTML=$(mktemp /tmp/$NAME_TEMPLATE).html
  cat "$1" \
    | pandoc -f gfm+hard_line_breaks -t html --standalone --embed-resources -c "$MD2BROWSER_CSS" -V pagetitle="$1" -o "${TMP_HTML}"
  xdg-open "${TMP_HTML}"
}
