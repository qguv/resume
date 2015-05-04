#!/usr/bin/env sh

# OS X is special
uname="$(uname)"
if [[ "$uname" == "Darwin" ]]; then
	SED='sed -E'
elif [[ "$uname" == "Linux" ]]; then
	SED='sed -r'
fi

SOURCE="$1"
DVIFILE="$SOURCE.dvi"
PDFFILE="$SOURCE.pdf"

"latex"  "$SOURCE"
"bibtex" "$SOURCE"
"latex"  "$SOURCE"
"latex"  "$SOURCE"
"dvipdf" "$DVIFILE"

echo "Saved resume to $PDFFILE"
