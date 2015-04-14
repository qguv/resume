#!/usr/bin/env sh

# OS X is special
uname="$(uname)"
if [[ "$uname" == "Darwin" ]]; then
	SED='sed -E'
elif [[ "$uname" == "Linux" ]]; then
	SED='sed -r'
fi

INFILE="$1"
DVIFILE="$INFILE.dvi"
PDFFILE="$INFILE.pdf"

"latex"  "$INFILE"
"bibtex" "$INFILE"
"latex"  "$INFILE"
"latex"  "$INFILE"
"dvipdf" "$DVIFILE"

echo "Saved CV to $PDFFILE"
