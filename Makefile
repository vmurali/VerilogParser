.PHONY: all clean

all:
	ghc --make -outputdir build VerilogParser.hs

clean:
	rm -rf build *.o *.hi build VerilogParser
