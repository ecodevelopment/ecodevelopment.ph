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
	cd output
	git add .
	git commit -am $(commitmsg)
	git push
#
