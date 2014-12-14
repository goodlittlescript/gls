# Builds the gls man pages.
manpages:
	. ./bin/gls .; make man/man1/gls.1 VERSION=$$GLS_VERSION DATE=$$GLS_RELDATE

vendor/ronn/bin/ronn:
	if ! [ -d ronn ]; then git clone git://github.com/thinkerbot/ronn.git vendor/ronn; fi

man/man1/gls.1: README.md vendor/ronn/bin/ronn
	mkdir -p man/man1
	ruby -Ivendor/ronn/lib vendor/ronn/bin/ronn -r --pipe --organization="$(VERSION)" --date="$(DATE)" $< > $@
