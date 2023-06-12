#!/bin/sh

cat Mitschriften/??_*.md > "Algorithmen & Datenstrukturen.md" || exit $?
sed -i 's:(rot-schwarz-baum.png)$:(Mitschriften/rot-schwarz-baum.png):g' "Algorithmen & Datenstrukturen.md" || exit $?
pandoc --defaults templates/defaults.yml --top-level-division=chapter $@ || exit $?
