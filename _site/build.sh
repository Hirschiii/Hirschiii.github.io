#!/bin/env bash

jekyll build

sshpass -p "$(pass gulugulu@aegaeon.uberspace.de)" rsync -arP --delete _site/ gulugulu@aegaeon.uberspace.de:/home/gulugulu/html/vonhirschfeld.eu/niklas/
git add .
git commit -m "auto updating site"
git push
