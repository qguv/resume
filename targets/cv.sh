#!/usr/bin/env sh

# OS X is special
uname="$(uname)"
if [[ "$uname" == "Darwin" ]]; then
	SED='sed -E'
elif [[ "$uname" == "Linux" ]]; then
	SED='sed -r'
fi

INFILE="$1.tex"
SOURCE="cv"
DVIFILE="$SOURCE.dvi"
PDFFILE="$SOURCE.pdf"

# In lines containing %CV, replace text before %CV with text after it.
# %CV For example, this text would only appear in the CV.
# And this text would only appear in the resume. %CV
# This text would be in the resume. %CV And this text would be in the CV.

$SED 's/^.*%CV.?(.*)$/\1/g' "$INFILE" > "$SOURCE.tex" && \
"latex"  "$SOURCE"
"bibtex" "$SOURCE"
"latex"  "$SOURCE"
"latex"  "$SOURCE"
"dvipdf" "$DVIFILE"
rm -rf "$SOURCE.tex"

echo "Saved CV to $PDFFILE"
