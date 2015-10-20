PROJECT:=./task-coach-doc
FILES:=$(shell find . -regextype awk -regex '.*\.(tex|bib)')

all: ${PROJECT}.pdf clean see
#------------------------------------------------
${PROJECT}.pdf:	${PROJECT}.tex $(FILES)
		pdflatex ${PROJECT}.tex
		#-bibtex ${PROJECT}.aux
		makeindex ${PROJECT}
		makeindex ${PROJECT}
		#makeindex ${PROJECT}.idx
		#makeindex ${PROJECT}.nlo -s ${PROJECT}.ist -o ${PROJECT}.nls
		#-makeglossaries ${PROJECT}.aux
		pdflatex ${PROJECT}.tex
		pdflatex ${PROJECT}.tex

clean:	.gitignore
	@while read regex;\
	do \
		regex=$$(find . -name "$$regex") ;\
                echo Removendo... [ $${regex} ] ;\
		rm -f $${regex} ;\
	done < .gitignore

see:	${PROJECT}.pdf
	xdg-open ${PROJECT}.pdf
