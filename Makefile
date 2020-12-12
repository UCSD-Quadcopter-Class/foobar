PDF_TARGETS = paper.pdf extended-abstract.pdf
include libpaper/Make.rules
LIBPAPER ?=../libpaper
.PHONY: setup
setup: 
	@(if ! [ -d libpaper ]; then if [ -d $(LIBPAPER) ]; then echo "Linking to $(LIBPAPER)"; ln -sf $(LIBPAPER) ./libpaper; else echo "Couldn't link to $(LIBPAPER), since it doesn't exist.  Clone it?:  'cd ..; git clone git@github.com:NVSL/libpaper.git'"; fi; else echo  "Using this libpaper:"; ls -ld libpaper;fi)
	git config core.hooksPath libpaper/git_hooks


paper.pdf : traits.table.tex PtrTypeAPI.table.tex system-survey.table.tex

GENERATED_TEX+=traits.table.tex PtrTypeAPI.table.tex system-survey.table.tex

