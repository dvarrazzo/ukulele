CHORDS=$(wildcard chords/*.cho) $(wildcard chords/*/*.cho)
PDFS=$(patsubst chords/%.cho,pdfs/%.pdf,$(CHORDS))
DIRS=$(shell find chords -type d)
SONGBOOKS=$(patsubst chords/%,pdfs/%-songbook.pdf,$(DIRS))
CHORDLAB=chordlab/chordlab
STYLE=style/hammersmith.ini

.PHONY: clean

all: $(PDFS) $(SONGBOOKS)

pdfs/%.pdf: chords/%.cho $(STYLE)
	mkdir -p `dirname $@`
	$(CHORDLAB) -p 842x595 --style $(STYLE) --ukulele -o $@ $<

pdfs/%-songbook.pdf: $(wildcard chords/%/*)
	mkdir -p `dirname $@`
	$(CHORDLAB) -p 842x595 --style $(STYLE) --ukulele -o $@ chords/$*/*.cho

pdfs/%-screen.pdf: chords/%.cho $(STYLE)
	mkdir -p `dirname $@`
	$(CHORDLAB) -p 1000x560 --style $(STYLE) --ukulele -o $@ $<

clean:
	rm -rf pdfs
