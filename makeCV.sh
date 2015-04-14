#!/usr/bin/env sh

# OS X is special
uname="$(uname)"
if [[ "$uname" == "Darwin" ]]; then
	SED='sed -E'
elif [[ "$uname" == "Linux" ]]; then
	SED='sed -r'
fi

INFILE="$1"
INTEXFILE="$INFILE.tex"

CVFILE="$1.cv"
DVIFILE="$CVFILE.dvi"
PDFFILE="$CVFILE.pdf"

$SED 's/%CV (.*)$/\1/g' "$INTEXFILE" > "$CVFILE.tex" && \
"latex"  "$CVFILE"
"bibtex" "$CVFILE"
"latex"  "$CVFILE"
"latex"  "$CVFILE"
"dvipdf" "$DVIFILE"
echo "Saved CV to $PDFFILE"
