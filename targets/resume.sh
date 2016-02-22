#!/usr/bin/env sh

SOURCE="$1"
DVIFILE="$SOURCE.dvi"
PDFFILE="$SOURCE.pdf"

"latex"  "$SOURCE"
"bibtex" "$SOURCE"
"latex"  "$SOURCE"
"latex"  "$SOURCE"
"dvipdf" "$DVIFILE"

echo "Saved resume to $PDFFILE"
