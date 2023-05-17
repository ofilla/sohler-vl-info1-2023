---
title: Übungsblatt 7
author:
    - Oliver Filla
date:
    - 17.05.2023
---
# Übungsblatt 7
## 1. Dynamische Programmierung
> Bob hat Angst vorm Klimawandel und betrachtet die Höchsttemperaturen der letzten Jahre. Er möchte die steigende Tendenz der Temperaturen beobachten. Einige kalte Zeiten dazwischen interessieren nicht, da die Tendenz für Bob interessant ist.

> Dafür notiert er die Temperaturen in zeitlicher Reihenfolge in einem Array $A = [a_1 ,\dots, a_l]$. Darin sucht er nach einer längsten aufsteigenden Teilsequenz. Dies ist eine Teilsequenz mit maximaler Länge, deren Elemente  aufsteigend sortiert sind. Dabei muss die Sequenz nicht zusammenhängend sein.

### a)
> Es bezeichne $T (i)$ die Länge der längsten aufsteigenden Teilfolge im Teilarray $A = [a_1 ,\dots, a_l]$, $1 \le i \le l$. Geben Sie eine Rekursionsgleichung für $T (i)$ an und erklären Sie diese.

### b)
> Entwerfen Sie basierend auf der Rekursionsgleichung aus a) einen Algorithmus in Pseudocode, der mit dynamischer Programmierung bei Eingabe eines Arrays $A = [a_1 ,\dots, a_l]$ die Länge einer längsten aufsteigenden Teilsequenz ausgibt. Kommentieren Sie Ihren Algorithmus mit Bezug zu Ihrer Rekursionsgleichung aus a).

### c)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.

### d)
> Beweisen Sie die Korrektheit Ihres Algorithmus mithilfe einer Schleifeninvariante.

### e)
> Geben Sie nun einen Algorithmus in Pseudocode an, der die in b) berechnete Lösung rekonstruiert und eine längste aufsteigende Teilsequenz ausgibt. Wandeln Sie dafür Ihren Algorithmus aus b) ab, indem Sie statt der Länge die Teilsequenz zurück geben. Erklären oder kommentieren Sie Ihren Algorithmus.

## Dynamische Programmierung
> Seien $x = (x_1, \dots, x_m) \in \{0, 1\}^m$ und $y = (y_1, \dots, y_n) \in \{0, 1\}^n$ zwei Bitstrings. Die Editierdistanz zwischen $x$ und $y$ sei definiert als die minimale Anzahl der Operationen, um $x$ in $y$ umzuwandeln: ein Bit einfügen, ein Bit löschen, eine 0 in eine 1 umwandeln oder umgekehrt eine 1 in eine 0 umwandeln.
### a)
> Geben Sie eine Rekursionsgleichung $E(i, j)$ zur Berechnung der Editierdistanz zwischen $(x_1 , \dots, x_i)$ und $(y_1, \dots, y_n)$, $1 \le i \le m, 1 \le j \le n$, an und erklären Sie diese.
> _Hinweis_: _Betrachten Sie die aktuellen Bits_ $x_i$ _und_ $y_j$ .

### b)
> Zeigen Sie die Korrektheit der Rekursionsgleichung aus a).

### c)
> Entwerfen Sie mithilfe der Rekursionsgleichung aus a) einen Algorithmus in Pseudocode, der mit dynamischer Programmierung bei Eingabe zweier Arrays $X = [x_1, \dots, x_m]$ und $Y = [y_1, \dots, y_n]$ mit Einträgen in ${0, 1}$ die Editierdistanz zwischen den Bitstrings $x$ und $y$ ausgibt. Kommentieren Sie Ihren Algorithmus mit Bezug zu Ihrer Rekursionsgleichung aus a).

### d)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.
