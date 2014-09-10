## Makefile for nanoc site
SHELL = /bin/bash
now := $(shell date "+%F %T")
commitmsg := "Website update at $(now)"

.PHONY: all clean build publish
all: publish

clean:

build:
	nanoc

publish: build
	cd output && git add . && git commit -am $(commitmsg) && git push

first_time:
	rm -rf output/
	git checkout --orphan gh-pages
	git clone . output
	cd output && git checkout gh-pages && rm -rf * && git add . && git commit -am 'Nuked output dir' && git remote rm origin && git remote origin add git@github.com:ecodevelopment/ecodevelopment.ph.git
#
