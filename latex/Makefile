DOC = main
DEPS = main.tex main.bib src/Abstract.tex src/Introduction.tex

.PHONY: all clean

all: report

report: $(DEPS)
	pdflatex $(DOC).tex
	bibtex $(DOC).aux
	pdflatex $(DOC).tex
	pdflatex $(DOC).tex

view: report
	xdg-open $(DOC).pdf

clean:
	$(RM) $(DOC).pdf *.blg *.bbl *.aux *.log *.dvi *.out *.fdb_latexmk *.fls *.synctex.gz
