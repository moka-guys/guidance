.PHONY: all

all: guidance_book.pdf guidance_book.html

guidance_book.html:
	pandoc *.md > guidance_book.html

guidance_book.pdf:
	pandoc -N \
		--variable "geometry=margin=1.0in" \
		--variable mainfont="Palatino" \
		--variable sansfont="Helvetica" \
		--variable monofont="Menlo" \
		--variable fontsize=10pt \
		--variable version=2.0 \
		*.md \
		--pdf-engine=xelatex \
		-o guidance_book.pdf
