#!/bin/sh

cat Mitschriften/??_*.md > "Algorithmen & Datenstrukturen.md" || exit $?
pandoc --defaults templates/defaults.yml --top-level-division=chapter $@ || exit $?
