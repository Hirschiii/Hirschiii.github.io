# Vorlagen zu Berichten im Physikpraktikum
Diese Vorlagen sollen den Einstieg in die Erstellung von Versuchsberichten mit
LaTeX erleichtern.

## Versuchsbericht-latex.tex
Die Datei Versuchsbericht-latex.tex ist für die Bearbeitung in LateX-Umgebungen
geeignet. Das mit ihr erzeugte Dokument hat die für Versuchsberichte erwünschte
Struktur. Inhaltlich werden die wichtigsten Elemente wie die Einbindung von
Bildern, Tabellen und Literaturverweise vorgeführt.

## Versuchsbericht-lyx.lyx
Eine Version der Vorlage, die für das Arbeiten mit LyX angepasst ist. Der
Vorspann ist hier in die lyx-Datei integriert.

## Versuchsbericht-A01.tex
Eine Version der Vorlage, die für den Bericht im ersten Versuch des
Praktikums (A01) vorbereitet ist.

## Weitere Dateien
* In **Vorspann.tex** werden Pakete geladen und Einstellungen vorgenommen, die
mit großer Wahrscheinlickeit für die Berichte benötigt werden.
* **Deckblatt-Formular.tex** und **Vorspann-Deckblatt.tex** werden in den Vorlagen eingebunden, um das Deckblatt des Berichts zu erzeugen.
* **Literatur.bib** enthält eine Anzahl von Literaturangaben, die teilweise im Hautteil aufgerufen werden.
* In einem Unterordner **Images/** befinden sich einzubindende Bilder und Grafiken
* **remove-clutter.sh** ist ein Minimal-Script, das die von LaTeX, LyX und biber erzeugten Zwischendateien beiseite schafft. Das Script benötigt die unter Linux praktisch überall verfügbare Shell sh als ausführende Umgebung.
