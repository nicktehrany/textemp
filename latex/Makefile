DOC = main
DEPS = main.tex main.bib src/Abstract.tex src/Background.tex src/Benchmarks.tex \
src/Conclusion.tex src/Discussion.tex src/Evaluation.tex src/Introduction.tex \
src/Limitations.tex src/Related.tex

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
	$(RM) $(DOC).pdf *.blg *.bbl *.aux *.log *.dvi