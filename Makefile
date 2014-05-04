CHORDS=$(wildcard chords/*.cho)
PDFS=$(patsubst chords/%.cho,pdfs/%.pdf,$(CHORDS))
CHORDLAB=chordlab
STYLE=style/hammersmith.ini

all: $(PDFS)

pdfs/%.pdf: chords/%.cho
	mkdir -p pdfs
	$(CHORDLAB) --style $(STYLE) --ukulele -o $@ $<
