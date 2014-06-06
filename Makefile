CHORDS=$(wildcard chords/*.cho) $(wildcard chords/*/*.cho)
PDFS=$(patsubst chords/%.cho,pdfs/%.pdf,$(CHORDS))
CHORDLAB=chordlab
STYLE=style/hammersmith.ini

all: $(PDFS)

pdfs/%.pdf: chords/%.cho
	mkdir -p `dirname $@`
	$(CHORDLAB) --style $(STYLE) --ukulele -o $@ $<
