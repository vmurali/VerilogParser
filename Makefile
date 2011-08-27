.PHONY: clean all

%:
	ghc --make -outputdir build$* $*hs

clean:
	rm -rf build* Multicycle ChangeName Partitioner Normal

all: Multicycle. ChangeName. Partitioner. Normal.

.DEFAULT_GOAL := all
