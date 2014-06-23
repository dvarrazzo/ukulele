CHORDS=$(wildcard chords/*.cho) $(wildcard chords/*/*.cho)
PDFS=$(patsubst chords/%.cho,pdfs/%.pdf,$(CHORDS)) $(patsubst chords/%.cho,pdfs/%-screen.pdf,$(CHORDS))
CHORDLAB=chordlab/chordlab
STYLE=style/hammersmith.ini

.PHONY: clean

all: $(PDFS)

pdfs/%.pdf: chords/%.cho $(STYLE)
	mkdir -p `dirname $@`
	$(CHORDLAB) --style $(STYLE) --ukulele -o $@ $<

pdfs/%-screen.pdf: chords/%.cho $(STYLE)
	mkdir -p `dirname $@`
	$(CHORDLAB) -p 1000x560 --style $(STYLE) --ukulele -o $@ $<

clean:
	rm -rf pdfs
