REPO = https://github.com/aeternity/epoch.git
COMMIT = 7744a0b28a9faeed8e70315054611b1e67e844fd

.PHONY: all
all: priv/bin

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
