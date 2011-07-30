.PHONY: clean

%:
	ghc --make -outputdir build $*.hs

clean:
	rm -rf build *.o *.hi build Multicycle VerilogParser Partitioner

.DEFAULT_GOAL := Multicycle
