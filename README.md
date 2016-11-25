Git-Schulungsmaterialien
========================

Die Schulungsmaterialien sind auf eine zweitägige Schulung ausgelegt;
per Default werden bei einem Aufruf von `make` vier Dateien,
`session_1.pdf` bis `session_4.pdf`, erzeugt; jedes Foliendeck ist für
einen halben Tag gedacht. Zusätzlich liegt unter `workshop.wiki` ein
Beispiel für einen kürzeren Workshop, wird per `make workshop` gebaut.

Die Materialien sind komplett zweisprachig deutsch/englisch.
Durch `mv deckblatt-en.wiki deckblatt.wiki && make` wird die englische Version
produziert.

Die Folien wurden mit dem GPL lizensierten
[wiki2beamer](http://wiki2beamer.sourceforge.net/) realisiert. Das Programm ist
als Abhängigkeit unter `folien/wiki2beamer` inkludiert.

Diverse Teile der Schulung sind per Default nicht eingebunden (z.B.
Gerrit, Gitolite). Am schnellsten findet man diese per
`./find-unused.sh` im Verzeichnis `folien/`; eine entsprechende
Include-Zeile in einer der Session-Datein aktiviert sie.


Lizenz
======

Lizensiert unter der [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).
