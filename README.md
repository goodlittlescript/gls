gls(1) -- a library for command sets
=============================================

## SYNOPSIS

`gls` [options] COMMAND ...

## DESCRIPTION

**gls** is a library for making command sets.

## OPTIONS

These options control how `gls` operates.

* `-h`:
  Prints help.

* `-v`:
  Prints version information.

## INSTALLATION

Add `gls` to PATH. If using homebrew:

    brew tap goodlittlescript/homebrew-gls
    brew install gls

## DEVELOPMENT

Setup:

    git clone git://github.com/goodlittlescript/gls
    git submodule init
    git submodule update

To run the tests:

    ./test/suite

To generate the manpages:

    make manpages

To make a new release:

    make release version=x.y.z

Report bugs here: http://github.com/goodlittlescript/gls/issues.

## COPYRIGHT

GLS is Copyright (C) 2014 Simon Chiang <http://github.com/thinkerbot>
