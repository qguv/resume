F=resume

resume:
	./targets/resume.sh $F

cv:
	./targets/cv.sh $F

sweep:
	rm -rf *.dvi *.aux *.log

clean: sweep
	rm -rf *.pdf
