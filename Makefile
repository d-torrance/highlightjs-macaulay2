TMPDIR := $(shell mktemp -d)
HLJSDIR = $(TMPDIR)/highlight.js
M2DIR = $(TMPDIR)/M2
BRANCH = master

all: $(HLJSDIR)/extra/highlightjs-macaulay2
	cd $(HLJSDIR) && npm install && node ./tools/build.js -t cdn

check: $(HLJSDIR)/extra/highlightjs-macaulay2
	cd $(HLJSDIR) && npm install && node ./tools/build.js -t node && \
		ONLY_EXTRA=true npm run test-markup

$(HLJSDIR)/extra/highlightjs-macaulay2: $(HLJSDIR)
	ln -s $(CURDIR) $@

$(HLJSDIR):
	cd $(TMPDIR) && git clone --depth 1 \
		https://github.com/highlightjs/highlight.js

update: $(M2DIR)
	mkdir -p tmp
	cd tmp && M2 --script $(M2DIR)/M2/Macaulay2/editors/make-M2-symbols.m2
	mv tmp/highlightjs/macaulay2.js src/languages
	rm -rf tmp

$(M2DIR):
	cd $(TMPDIR) && git clone --depth 1 --filter=blob:none --sparse \
		https://github.com/Macaulay2/M2 -b $(BRANCH)
	cd $(M2DIR) && git sparse-checkout set M2/Macaulay2/editors

clean:
	rm -f $(HLJSDIR)/extra/highlightjs-macaulay2

.PHONY: all check clean update
