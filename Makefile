TMPDIR := $(shell mktemp -d)
HLJSDIR = $(TMPDIR)/highlight.js
M2DIR = $(TMPDIR)/M2


all: $(HLJSDIR)/extra/highlightjs-macaulay2
	cd $(HLJSDIR) && npm install && node ./tools/build.js -t cdn

check: $(HLJSDIR)/extra/highlightjs-macaulay2
	cd $(HLJSDIR) && npm install && node ./tools/build.js -t node && \
		ONLY_EXTRA=true npm run test-markup

$(HLJSDIR)/extra/highlightjs-macaulay2: $(HLJSDIR)
	ln -s $(CURDIR) $@

$(HLJSDIR):
	cd $(TMPDIR) && git clone https://github.com/highlightjs/highlight.js

update: $(M2DIR)
	mkdir -p tmp
	cd tmp && M2 --script $(M2DIR)/M2/Macaulay2/editors/make-M2-symbols.m2
	mv tmp/highlightjs/macaulay2.js src/languages
	rm -rf tmp

$(M2DIR):
	cd $(TMPDIR) && git clone https://github.com/Macaulay2/M2

clean:
	rm -f $(HLSDIR)/extra/highlightjs-macaulay2

.PHONY: all check clean update
