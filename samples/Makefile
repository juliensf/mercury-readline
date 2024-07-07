MMC = mmc

PROGS = test_rl

test_rl$(EXEEXT): test_rl.m Mercury.modules
	$(MMC) --make $@ -lreadline

Mercury.modules: $(wildcard *.m) $(wildcard ../src/*.m)
	$(MMC) -f $(wildcard *.m) $(wildcard ../src/*.m)

tags: $(wildcard *.m) $(wildcard ../src/*.m)
	mtags $(wildcard *.m) $(wildcard ../src/*.m)

.PHONY: realclean
realclean:
	$(MMC) --make test_rl.realclean
	/bin/rm -rf Mercury
	/bin/rm -f Mercury.modules
