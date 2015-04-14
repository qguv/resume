F=resume

resume:
	./makeResume.sh $F

cv:
	./makeCV.sh $F

clean:
	rm -rf *.cv.* *.dvi *.pdf *.aux
