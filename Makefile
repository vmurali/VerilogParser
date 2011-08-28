.PHONY: clean all

%:
	ghc --make -outputdir build$* $*hs

clean:
	rm -rf build* Multicycle Partitioner Normal

all: Multicycle. Partitioner. Normal.

.DEFAULT_GOAL := all
