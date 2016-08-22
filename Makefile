ifeq "$(shell uname)" 'Darwin'
SED := sed -E
else
SED := sed -r
endif

%.pdf: %.tex
	latex $*
	-bibtex $*
	latex $*
	latex $*
	dvipdf $*.dvi

.PHONY: all resume cv sweep clean

all: cv resume

clean: sweep
	rm -rf *.pdf

sweep:
	rm -rf cv.tex *.dvi *.aux *.log

cv.tex: resume.tex
	$(SED) 's/^.*%CV.?(.*)$$/\1/g' resume.tex > cv.tex

cv: cv.pdf | sweep
resume: resume.pdf | sweep
