.PHONY: clean all

%:
	ghc --make -outputdir build $*hs

clean:
	rm -rf build *.o *.hi build Multicycle Partitioner Normal

all: Multicycle. Partitioner. Normal.

.DEFAULT_GOAL := all
