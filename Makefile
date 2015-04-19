CHORDS=$(wildcard chords/*.cho) $(wildcard chords/*/*.cho)
PDFS=$(patsubst chords/%.cho,pdfs/%.pdf,$(CHORDS))
CHORDLAB=chordlab
STYLE=style/hammersmith.ini

.PHONY: clean

all: $(PDFS)

pdfs/%.pdf: chords/%.cho
	mkdir -p `dirname $@`
	$(CHORDLAB) -p 842x595 --style $(STYLE) --ukulele -o $@ $<

clean:
	rm -rf pdfs
