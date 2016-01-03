.DEFAULT_GOAL=pdf

%-en.pdf: base=$(@:-en.pdf=)
%-en.pdf: FORCE
	cat _head-en.wiki $(base).wiki | ./wiki2beamer > $(base)-en.tex
	pdflatex -halt-on-error $(base)-en.tex

%.wiki: base=$(@:.wiki=)
%.wiki: FORCE 
	cat _head.wiki $@ | ./wiki2beamer > $(base).tex
	pdflatex -halt-on-error $(base)
FORCE:

default: pdf
pdf: session1 session2 session3 session4

session% : n = $(subst session,,$@)
session%:
	[ -s session_$(n).wiki ] && ./wiki2beamer < session_$(n).wiki > session_$(n).tex
	[ -s session_$(n).tex  ] && pdflatex session_$(n) && pdflatex session_$(n)

slidecount:
	@echo `grep '^====[[:space:]]' *.wiki | wc -l` Slides in \
		`grep -l '^====[[:space:]]' *.wiki | wc -l` Dateien

find_unused:
	cat session* | ./compile-session.pl -l

image_slideshow:
	./gen_image_slideshow > image_slideshow.wiki
	cat _head.wiki image_slideshow.wiki| wiki2beamer > image_slideshow.tex
	pdflatex image_slideshow.tex

clean:
	@git clean -fX
	@if ls *.pdf 1>/dev/null 2>&1; then \
		for pdf in *.pdf ; do \
			[ -e $${pdf%.pdf}.wiki ] && rm -v $${pdf} || true; \
		done; \
	fi
