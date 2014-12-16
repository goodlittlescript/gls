# Builds the gls man pages.
manpages:
	. ./bin/gls .; make man/man1/gls.1 VERSION=$$GLS_VERSION DATE=$$GLS_RELDATE

vendor/ronn/bin/ronn:
	if ! [ -d ronn ]; then git clone git://github.com/thinkerbot/ronn.git vendor/ronn; fi

man/man1/gls.1: README.md vendor/ronn/bin/ronn
	mkdir -p man/man1
	ruby -Ivendor/ronn/lib vendor/ronn/bin/ronn -r --pipe --organization="$(VERSION)" --date="$(DATE)" $< > $@

variables:
	sed -i "" -e "s/GLS_VERSION=.*/GLS_VERSION=\"$(version)\"/" -e "s/GLS_RELDATE=.*/GLS_RELDATE=\"$$(date +%Y-%m-%d)\"/" bin/gls

release: variables manpages
	@printf "\n"
	@printf "%s\n" "--- Updated files for v$(version)"
	@printf "%s\n" "Now commit, make a new release in github, and update"
	@printf "%s\n" "homebrew-gls with the new tar.gz/SHA1.  To calculate"
	@printf "%s\n" "the SHA1 use 'openssl sha1 PATH_TO_TARBALL'."
	@printf "\n"
