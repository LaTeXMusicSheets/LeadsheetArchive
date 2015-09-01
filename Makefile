LATEXMK := latexmk -outdir=export -pdf -silent
PURGECMD := $(LATEXMK) -c
CLEANCMD := $(LATEXMK) -C
TEXFILE := %.tex
PDFFILE := %.pdf

.PHONY: clean
.PHONY: all
.PHONY: purge

# Build all files in dir and make pdfs
all:
	$(LATEXMK)

$(PDFFILE): $(TEXFILE)
	$(LATEXMK) $<

# Remove all auxiliary files (excluding pdf)
purge:
	$(PURGECMD)

# Remove all build files (including pdf)
clean:
	$(CLEANCMD)