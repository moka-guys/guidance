.PHONY: all

all: guidance_book.pdf

guidance_book.pdf:
	pandoc -N \
	    docs/*.md \
	    docs/development/*seglh*.md \
		*LICENSE.md \
		--variable "geometry=margin=1.0in" \
		--variable fontsize=10pt \
		--variable version=2.0 \
		--pdf-engine=xelatex \
		-o guidance_book.pdf