#!/bin/sh
# Verschiebt die von LaTex, LyX und biber erzeugten Zwischendateien nach /tmp
#
# Der Zusatz "2> /dev/null" sorgt dafür, dass Meldungen über nicht existierende
# Dateien ins digitale Nirvana geschickt werden.
mv *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.toc *.synctex.gz *~ /tmp 2> /dev/null
