.PHONY: all

all: guidance_book.html guidance_book.pdf

guidance_book.html:
	pandoc docs/*.md docs/development/*.md -o guidance_book.html

guidance_book.pdf:
	pandoc -N \
	    docs/*.md \
	    docs/development/*.md \
		--variable "geometry=margin=1.0in" \
		--variable fontsize=10pt \
		--variable version=2.0 \
		*.md \
		--pdf-engine=xelatex \
		-o guidance_book.pdf