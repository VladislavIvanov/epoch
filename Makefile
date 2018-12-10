REPO = https://github.com/aeternity/cuckoo-prebuilt.git
COMMIT = 8cfd053288f518ad0db441a4763e976f6af686d7

.PHONY: all
all: priv/bin

.PHONY: priv/bin
priv/bin: c_src/.git | priv
	$(MAKE) clean
	( cd $(<D) && git archive --format=tar --prefix=$@/ $(COMMIT); ) | pax -r

c_src/.git:
	git clone -n $(REPO) $(@D)

priv:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf priv/bin

.PHONY: distclean
distclean:
	rm -rf c_src priv
