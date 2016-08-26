# Makes resumes and CVs from the same LaTeX source file.

LATEXMK := latexmk -pdf

# OS X is special
ifeq "$(shell uname)" 'Darwin'
SED := sed -E
else
SED := sed -r
endif

%.pdf: %.tex
	$(LATEXMK) $*

.PHONY: all resume cv sweep clean

all: cv resume

clean: sweep
	$(LATEXMK) -C -silent

sweep:
	$(LATEXMK) -c -silent
	rm -f cv.tex

# In lines containing %CV, replace text before %CV with text after it.
# %CV For example, this text would only appear in the CV.
# And this text would only appear in the resume. %CV
# This text would be in the resume. %CV And this text would be in the CV.
cv.tex: resume.tex
	$(SED) 's/^.*%CV.?(.*)$$/\1/g' resume.tex > cv.tex

cv: cv.pdf | sweep
resume: resume.pdf | sweep
