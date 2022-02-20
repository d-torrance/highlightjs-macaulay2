TMPDIR := $(shell mktemp -d)
HLJSDIR = $(TMPDIR)/highlight.js


all: $(HIGHLIGHTJSDIR)
	ln -s $(CURDIR) $(HLJSDIR)/extra/highlightjs-macaulay2
	cd $(HLJSDIR) && npm install && node ./tools/build.js -t cdn

$(HLJSDIR):
	cd $(dir $@) && git clone https://github.com/highlightjs/highlight.js
