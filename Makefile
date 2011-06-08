.PHONY: all clean

all:
	ghc --make -outputdir build ValidConsumedInjector.hs

clean:
	rm -rf build *.o *.hi build ValidConsumedInjector
