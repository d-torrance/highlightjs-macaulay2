TMPDIR := $(shell mktemp -d)
HLJSDIR = $(TMPDIR)/highlight.js


all: $(HLJSDIR)/extra/highlightjs-macaulay2
	cd $(HLJSDIR) && npm install && node ./tools/build.js -t cdn

check: $(HLJSDIR)/extra/highlightjs-macaulay2
	cd $(HLJSDIR) && npm install && node ./tools/build.js -t node && \
		ONLY_EXTRA=true npm run test-markup

$(HLJSDIR)/extra/highlightjs-macaulay2: $(HLJSDIR)
	ln -s $(CURDIR) $@

$(HLJSDIR):
	cd $(TMPDIR) && git clone https://github.com/highlightjs/highlight.js

clean:
	rm -f $(HLSDIR)/extra/highlightjs-macaulay2

.PHONY: all check clean
