include ../Make.options

.PHONY: default
default:
	$(MMC) --make libmercury_readline

.PHONY: rebuild
rebuild:
	$(MMC) --rebuild libmercury_readline

.PHONY: install
install:
	$(MMC) --make libmercury_readline.install

tags: $(wildcard *.m)
	mtags $^

.PHONY: clean
clean:
	$(MMC) --make mercury_readline.clean

.PHONY: realclean
realclean:
	$(MMC) --make mercury_readline.realclean
	/bin/rm -rf Mercury
	/bin/rm -f $(wildcard *.err) $(wildcard *.mh)
	/bin/rm -f tags
