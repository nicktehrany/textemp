DOC = main
DEPS = main.tex main.bib src/Abstract.tex src/Introduction.tex

.PHONY: all clean view spell

all: report

report: clean $(DEPS)
	pdflatex $(DOC).tex
	bibtex $(DOC).aux
	pdflatex $(DOC).tex
	pdflatex $(DOC).tex

spell: *.tex
	@for file in $?; do aspell --lang=en_US --mode=tex -c $$file; done

view: report
	xdg-open $(DOC).pdf

clean:
	$(RM) $(DOC).pdf *.blg *.bbl *.aux *.log *.dvi *.out *.fdb_latexmk *.fls *.synctex.gz
