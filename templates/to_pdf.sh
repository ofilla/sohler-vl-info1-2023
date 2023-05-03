#!/bin/sh

cat ??_*.md > "Algorithmen & Datenstrukturen.md" || exit $?
pandoc --defaults templates/defaults.yml --top-level-division=chapter $@ || exit $?
