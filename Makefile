.PHONY: clean all

%:
	ghc --make -outputdir build$* $*hs

clean:
	rm -rf build* Multiicycle Partitioner Normal

all: Multicycle. Partitioner. Normal.

.DEFAULT_GOAL := all
