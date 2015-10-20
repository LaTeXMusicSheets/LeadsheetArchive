LATEXMK := latexmk -outdir=export -auxdir=tmp -pdf -silent
PURGECMD := $(LATEXMK) -c
CLEANCMD := $(LATEXMK) -C
CCLICMD := ccli2latex
TEXFILE := %.tex
PDFFILE := %.pdf
USRFILE := %.usr

.PHONY: clean
.PHONY: all
.PHONY: purge

leftparen:=(
rightparen:=)

# Build all files in dir and make pdfs
all:
	$(LATEXMK)

# Create new tex-song file from lyrics
$(TEXFILE): $(USRFILE)
	./helper/ccli2latex "$<" "$@"

# Create new bare tex-song file
$(TEXFILE):
	cp ./helper/Base.tex "$@"

# Compile with PDFLaTeX
$(PDFFILE): $(TEXFILE)
	$(LATEXMK) "$<"

# Remove all auxiliary files (excluding pdf)
purge:
	$(PURGECMD)

# Remove all build files (including pdf)
clean:
	$(CLEANCMD)
