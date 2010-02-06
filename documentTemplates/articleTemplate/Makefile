pdf :
	pdflatex articleTemplate
	bibtex articleTemplate
	makeindex articleTemplate.nlo -s nomencl.ist -o articleTemplate.nls
	pdflatex articleTemplate
	pdflatex articleTemplate

clean :
	ls | grep Template | grep -v tex | xargs rm
