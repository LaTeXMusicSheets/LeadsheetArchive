LATEXMK := latexmk -outdir=export -pdf -silent -quiet
PURGECMD := $(LATEXMK) -c
CLEANCMD := $(LATEXMK) -C
CCLICMD := ccli2latex
TEXFILE := %.tex
PDFFILE := %.pdf
USRFILE := %.usr
TXTFILE := %.txt

.PHONY: clean
.PHONY: all
.PHONY: purge

leftparen:=(
rightparen:=)

#export PATH := /usr/local/texlive/2016/bin/x86_64-linux:$(PATH)


# Build all files in dir and make pdfs
all:
	@$(LATEXMK)

usr:
	@$(foreach usr,$(wildcard *.usr),make "$(usr:.usr=.tex)"; rm $(usr);)

txt:
		@$(foreach txt,$(wildcard *.txt),make "$(txt:.txt=.tex)"; rm $(txt);)

# Create new tex-song file from lyrics
$(TEXFILE): $(USRFILE)
	@./helper/ccli2latex "$<" "$@"

$(TEXFILE): $(TXTFILE)
		@./helper/cclitxt2latex "$<" "$@"

# Create new bare tex-song file
$(TEXFILE):
	@cp ./helper/Base.tex "$@"

# Compile with PDFLaTeX
$(PDFFILE): $(TEXFILE)
	@$(LATEXMK) "$<"

# Remove all auxiliary files (excluding pdf)
purge:
	@$(PURGECMD)

# Remove all build files (including pdf)
clean:
	@$(CLEANCMD)
