#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAIN="main"
OUTPUT_DIR="$SCRIPT_DIR/output"

cd "$SCRIPT_DIR"
mkdir -p "$OUTPUT_DIR"

run_pdflatex() {
  pdflatex -interaction=nonstopmode -halt-on-error \
    -output-directory="$OUTPUT_DIR" "$MAIN.tex"
}

run_bibtex() {
  bibtex "$OUTPUT_DIR/$MAIN"
}

echo "==> Compilando $MAIN.tex..."
run_pdflatex

if [[ -f "$OUTPUT_DIR/$MAIN.aux" ]] && grep -q '\\citation{' "$OUTPUT_DIR/$MAIN.aux" 2>/dev/null; then
  echo "==> Procesando bibliografía..."
  run_bibtex
  run_pdflatex
fi

echo "==> Segunda pasada (referencias cruzadas)..."
run_pdflatex

echo "==> Listo: $OUTPUT_DIR/$MAIN.pdf"
