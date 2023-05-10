all: html pdf docx rtf

pdf: resume.pdf
resume.tex:	resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md
resume.pdf: resume.tex
	context resume.tex

html: resume.html
resume.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o resume.html resume.md

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

clean:
	rm -f resume.html
	rm -f resume.tex
	rm -f resume.tuc
	rm -f resume.log
	rm -f resume.pdf
	rm -f resume.docx
	rm -f resume.rtf
