HIGHLIGHTJSDIR := $(shell mktemp -d)/highlight.js

all: $(HIGHLIGHTJSDIR)
	ln -s $(CURDIR) $(HIGHLIGHTJSDIR)/extra/highlightjs-macaulay2
	cd $(HIGHLIGHTJSDIR) && npm install && node ./tools/build.js -t cdn

$(HIGHLIGHTJSDIR):
	cd $(dir $@) && git clone https://github.com/highlightjs/highlight.js
