ifeq "$(shell uname)" 'Darwin'
SED := sed -E
else
SED := sed -r
endif

LATEXMK := latexmk -pdf

%.pdf: %.tex
	$(LATEXMK) $*

.PHONY: all resume cv sweep clean

all: cv resume

clean: sweep
	$(LATEXMK) -C -silent

sweep:
	$(LATEXMK) -c -silent
	rm -f cv.tex

cv.tex: resume.tex
	$(SED) 's/^.*%CV.?(.*)$$/\1/g' resume.tex > cv.tex

cv: cv.pdf | sweep
resume: resume.pdf | sweep
