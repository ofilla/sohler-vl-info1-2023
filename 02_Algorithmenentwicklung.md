# 2. Entwicklung von Algorithmen
## Methode: Teile und Herrsche
1. Teile die Eingabe in mehrere gleich große Teile auf.
2. Löse das Problem rekursiv auf den einzelnen Teilen.
3. Füge die Teile zu einer Lösung des Gesamtproblems zusammen.

### Beispiele
* MergeSort
* BinäreSuche

### Unterscheidungen
Teile-und-Herrsche-Algorithmen unterscheiden sich durch...
* die Anzahl der Teilprobleme.
* die Größe der Teilprobleme.
* den Algorithmus für das Zusammensetzen der Teilprobleme.
* den Rekursionsabbruch.

### Laufzeit
Die Laufzeit kann durch eine Laufzeitanalyse vorhergesagt werden:

* $T(1) \in \mathcal O(1)$
* $T(n) = a T(\frac{n}{b}) + f(n)$
    * $a$: Anzahl der Teilprobleme
    * $b$: Größe der Teilprobleme, bestimmt die Höhe des Rekursionsbaums
    * $f(n)$: Aufwand für Aufteilen und Zusammenfügen

## Methode: Dynamische Programmierung
## Methode: Gierige Algorithmen
## Rekursion
Eine rekursive Methode ruft sich selbst mit veränderten Parametern auf. Hierzu ist zu Beginn der Methode eine Abbruchbedingung notwendig, die den einfachsten Fall des Problems löst. Ansonsten kommt es zu einer Endlosrekursion.

Zur Entwicklung von neuen Algorithmen ist Rekursion oft hilfreich, wenn man ein Problem auf eine kleinere Stufe desselben Problems runterbrechen kann. Allerdings sind manche rekursive Methoden ineffizient,[^3] daher sollte ein solcher Algorithmus oft verbessert / angepasst werden.

[^3]: Beispielsweise die Berechnung von Fibbonacci-Zahlen ist rekursiv extrem ineffizient, so lange keine Ergebnisse zwischengespeichert werden.

### Laufzeit
Die Laufzeit kann durch eine Laufzeitanalyse vorhergesagt werden.

* $T(1) \in \mathcal O(1)$
* $T(n) = a T(\frac{n}{b}) + f(n)$
    * $a$: Anzahl der Teilprobleme
    * $n/b$: Größe der Teilprobleme, bestimmt die Höhe des Rekursionsbaums
    * $f(n)$: Aufwand für Aufteilen und Zusammenfügen
* Die Laufzeit beträgt normalerweise $T(n)\in\mathcal O(f(n)\cdot\log_b(n))$
    * $\log_b(n)$ ist die Höhe des Rekursionsbaums
    * meistens ist $b=2$, also gilt meist $T(n)\in\mathcal O(f(n)\cdot\log_2(n))$
    * Auf der letzten Rekursionsstufe gibt es $n$ Teilprobleme der Größe $1$. Es gilt $b^h=n$, wobei $h=\log_b{n}$ die Rekursionshöhe beschreibt.

