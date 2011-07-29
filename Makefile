.PHONY: clean

%:
	ghc --make -outputdir build $*.hs

clean:
	rm -rf build *.o *.hi build Multicycle VerilogParser

.DEFAULT_GOAL := Multicycle
