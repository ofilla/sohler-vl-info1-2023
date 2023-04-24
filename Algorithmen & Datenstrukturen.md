---
title: Algorithmen & Datenstrukturen
author:
  - Prof. Dr. Christian Sohler
  - Oliver Filla
date: Sommersemester 2023
keywords:
  - Informatik
  - Algorithmus
  - Datenstruktur
---
# Algorithmen & Datenstrukturen

## Definitionen
* **Informatik** ist die Disziplin der automatischen Verarbeitung von Information.[^1]
* Ein **Algorithmus** ist eine wohldefinierte Handlungsvorschrift, die einen Wert oder eine Menge von Werten als Eingabe erhält und als Ausgabe einen Wert oder eine Menge von Werten liefert.[^2]

[^1]: https://gi.de/fileadmin/GI/Hauptseite/Themen/was-ist-informatik-kurz.pdf
[^2]: [@AlgorithmsCormen2022]

## Lernziele
* Methoden zur Entwicklung von Algorithmen
* Bewertung der Qualität von Algorithmen
    * Korrektheit
    * Ressourcen, insbesondere Laufzeit
* Lernen grundlegender Algorithmen und Datenstrukturen

## Entwicklung von Algorithmen
### Methode: Teile und Herrsche
### Methode: Dynamische Programmierung
### Methode: Gierige Algorithmen

## wichtige Algorithmen
### InsertionSort
```
InsertionSort(A, n) \\ Feld A der Länge n wird übergeben
    for i=2 to n do
    x = A[i]
    j = i -1
    while j>0 and A[j]>x do
        A[j+1] = A[j]
        j = j-1
    A[j+1]=x
```

Satz: Die Worst-Case-Laufzeit von InsertionSort ist in $\Omega(n^2)$.
Das heißt, für hinreichend große $n$ ist die Laufzeit ungefähr $n^2$.

Korollar: Die Worst-Case-Laufzeit von InsertionSort ist $\Theta(n^2)$.

#### deskriptiver Pseudocode
```
InsertionSort(A, n) \\ Feld A der Länge n wird übergeben
    if n=1 return \\ n=1 ist sortiert
    x = A[n] \\ speichere das letzte Element
    InsertionSort(A,n-1) \\ sortiere das Feld bis auf die letzte Stelle
    Füge x an die korrekte Stelle in A ein
```

### Rekursion
Eine rekursive Methode ruft sich selbst mit veränderten Parametern auf. Hierzu ist zu Beginn der Methode eine Abbruchbedingung notwendig, die den einfachsten Fall des Problems löst. Ansonsten kommt es zu einer Endlosrekursion.

Zur Entwicklung von neuen Algorithmen ist Rekursion oft hilfreich, wenn man ein Problem auf eine kleinere Stufe desselben Problems runterbrechen kann. Allerdings sind manche rekursive Methoden ineffizient,[^3] daher sollte ein solcher Algorithmus oft verbessert / angepasst werden.

[^3]: Beispielsweise die Berechnung von Fibbonacci-Zahlen ist rekursiv extrem ineffizient, so lange keine Ergebnisse zwischengespeichert werden.

## wichtige Datenstrukturen
### Graphen
Bestehen aus _Knoten_ und _Kanten_. Kanten können _gerichtet_ sein.

Beispielsweise das "Pageranking" von Google war ein _Graphalgorithmus_, der Google die Vorherrschaft auf dem Suchmaschinenmarkt einbrachte: Das Ranking einer Website wurde aus der Anzahl von Verweisen auf ebendiese Website ermittelt.


## Speicher und Datentypen
### Speichermodell
* Beliebig viele Speicherzellen (abstrahiert)
* Durchnummeriert, beginnend mit $1$
* _Elementare Datentypen_ brauchen jeweils eine Speicherzelle
    * In der Realität ist das nicht exakt der Fall, z.B. bei Kommazahlen

Details von Hardwareimplementierungen werden in diesem Modell vernachlässigt.
Diese haben zwar Einfluss, aber üblicherweise in konstanten Größenordnungen.

### Elementare Datentypen
Im Vereinfachten RAM-Modell gehen wir davon aus, dass jeder elementare Datentyp eine Speicherzelle belegt.

Bei einer Zuweisung an eine (andere) Variable werden Elementare Datentypen kopiert. Dies nennt man _copy by value_.
Im Gegensatz dazu wird bei Nicht-Elementare Datentypen nur der Zeiger darauf kopiert. Dies nennt man _copy by reference_.

#### ganze Zahlen
#### reale Zahlen
#### Zeichen
#### Zeiger / Referenz
Eine ganze Zahl, die eine Speicherzelle bezeichnet, er kann $0$ bzw. $\mathrm{NIL}$  sein, das bedeutet dann "kein Wert".

Eine Referenz wird z.B. benutzt, um auf größere Datentypen oder Verbundobjekte zu verweisen.
In diesem Fall wird immer auf die erste Speicherzelle verwiesen.

### Nicht-Elementare Datentypen
Nicht-Elementare Datentypen sind aus mehreren Elementaren Datentypen zusammengesetzt.

### Felder
Felder sind zusammenhängende Speicherbereiche, die denselben elementaren Datentyp enthalten.
In einer Variable wird eine Referenz auf die erste Speicherzelle gespeichert.
```
li = new array[n]
li[1] = 4
```

### Verbunddaten
_Elementare Datentypen_ [[20230405203745]] können als Verbund organisiert werden.
In einer Variable wird eine Referenz auf die erste Speicherzelle gespeichert.
```
Verbund list_item:
    previous
    number
    next

li = new list_item
previous[li] = NIL
number[li] = 5
next[li] = NIL
```

## Speicherbedarf
* _Elementare Datentypen_: 1 Zelle
* Felder / Verbunddaten: Summe aller Elemente
* Speicherbedarf Algorithmus
    * Summe _aller_ belegten Zellen (inkl. Parameter)
    * kann von Parametern abhängen

## Pseudocode
* Datentyp wird i.A. nicht explizit angegeben
    * nutzen hier nur elementare Datentypen
* eine Anweisung braucht 1 Rechenschritt
* Variablen im Befehlsblock sichtbar
    * durch Einrückung gekennzeichnet

### Kommentare
```
\* Kommentar \*
\\ Kommentar
```

### Verbunddatentypen
Laufzeit der Initialisierung: entspricht reserviertem Speicherplatz
```
Verbund list_item:
    previous
    number
    next

li = new list_item
previous[li] = NIL
number[li] = 5
next[li] = NIL
```

### Felder
Laufzeit der Initialisierung: entspricht reserviertem Speicherplatz
* Initialisierung: `x = new <_Verbundtyp_>`
* Zugriff auf das $i$-te Feldelement: `x[i]`
* Index beginnt bei $1$

### Zuweisung
#### Typ 1
Es wird eine Kopie von `Y` in `X` gespeichert. Variablen müssen definiert sein.
```
X = Y
```
#### Typ 2
Ein _konstant großer_ mathematischer Ausdruck wird in `X` gespeichert. Variablen müssen definiert sein.
```
X = 10
Y = 2
X = X*Y
```
Nicht konstant groß ist z.B. $\sum_{i=1}^N i$. Dies hätte Laufzeit $N$.
Die Summe $\sum_{i=1}^8 i$ ist dagegen konstant groß.
Ggf. wird eine Variable 

### Bedingte Verzweigungen
_lazy evaluation_: Bei _UND_-Verknüpfungen wird nach dem ersten _False_-Ergebnis abgebrochen.
```
X = 10
Y = 20
if X > Y then output << Y
else output << X
```
### Schleifen
#### for
Annahmen:
* Die Laufvariable $i$ wird am Ende des Schleifenrumpfs erhöht.
* Nach dem letzten Durchlauf wird die Laufvariable dennoch erhöht.
* Zur Initialisierung wird die Laufvariable $i$ auf den Startwert gesetzt.
    * Deswegen wird das Schleifenkonstrukt einmal mehr als der Schleifenrumpf aufgerufen.
    * Die Laufzeitbestimmung zählt hierbei nur die Aufrufe des Schleifenkonstrukts.

```
j=0  \* 1 \*
for i=1 to n do  \* Schleifenkonstrukt n+1 \*
    \* Schleifenrumpf \*
    j = j + i  \* n \*
output << j  \* 1 \*
```
* Laufzeitanalyse: $1 + (n+1) + n + 1 = 2n + 3$

Das bedeutet, dass die Laufvariable beim Eintritt in den Schleifenrumpf schon den Wert für den folgenden Schleifendurchlauf hat. Dies ist für die Betrachtung von Schleifeninvarianten relevant.

#### while
Der Schleifenrumpf kann $0$-mal durchlaufen werden.
```
i=n  \* 1 \*
j=0  \* 1 \*
while i>0 do  \* n+1 \*
    j=j+i  \* n \*
    i=i-1  \* n \*
output << j  \* 1 \*
```
#### repeat
Der Schleifenkörper wird mindestens $1$-mal durchlaufen
```
i=n  \* 1 \*
j=0  \* 1 \*
repeat  \* 1 \*
    j=j+i  \* n \*
    i=i-1  \* n \*
until = 0  \* n \*
output << j  \* 1 \*
```

### Prozeduren
* jede Variable wird als Kopie übergeben (_call by value_)
* der Aufruf einer Prozedur kostet einen Zeitschritt
    * die Zuweisung des Ergebnisses kostet einen weiteren Zeitschritt
    * dazu kommt die Zeit für die Prozedur selbst
```
beispiel(j)
    j=j-10
    return j

j=100  \* 1 \*
x=7+beispiel(j)  \* 2+ Zeit für Prozedur \*
output << j  \* 1 \*
output << x  \* 1 \*
```
Ausgabe:
```
100
97
```

## Laufzeitanalyse
In der Realität spielen Hardware sowie Software (z.B. OS, Compiler(-optionen)) eine Rolle. Diese Einflüsse sind allerdings in einer konstanten Größenordnung. DIese konstanten Laufzeiten werden hier ignoriert, da meistens die Landau-Notation zur Beschreibung von Laufzeiten verwendet wird.

Unser Rechenmodell besagt, dass eine Pseudocodeoperartion einen Zeitschritt benötigt. Wir zählen diese Zeitschritte. 

Hierbei will man für eine gegebene _Eingabegröße_ $n$ eine obere Schranke für die Laufzeit finden.
Üblicherweise benutzt man eine Worst Case Analyse, auch wenn es auch die Average Case Analyse gibt.

### Worst Case Analyse
Worst-Case Laufzeit $T(n) = \max[\text{Laufzeit}]$ über alle Laufzeiten für Eingabegrößen $\le n$.
Dies ist der Standard, normalerweise ist diese Analyse gemeint, wenn man von "Laufzeitanalyse" spricht.

### Average Case Analyse
Die Worst-Case Laufzeit $T(n) = \mathrm{avg}[\text{Laufzeit}]$ benötigt eine Definition von "Durschschnittlich", also auch Wahrscheinlichkeitsverteilung von Eingabegrößen.
Daher wird sie i.A. nicht verwendet.

## Landau-Notation
Die detaillierte Laufzeitanalyse hat einige Schwachstellen: Konstante Faktoren werden durch Hardware und Software beeinflusst, die außerhalb des Algorithmus liegen. Zudem ist die Notation fehleranfällig und kompliziert.

Die Landau-Notation nutzt eine _asymptotischen Analyse_ für große Eingabemengen $n\rightarrow\infty$. Kontante Faktoren sind damit vernachlässigbar.

Im Folgenden werden einige Annahmen getroffen:
* Die Funktionen $f$ und $g$ haben den Definitionsbereich $\mathbb N_0$ und sind für große $n$ asymptotisch nicht-negativ sein
* Die Worst-Case-Laufzeit wird asymptotisch angenährt

Bei rekursiven Funktionen muss man mit dem Abschätzen der $\Omega$- und $\mathcal O$-Notationen aufpassen. Oft ist es sinnvoll, diese Funktionen konkret auszurechten.

### Schranken
* Die Schranken $\mathcal O(g(n))$ und $\Omega(g(n))$ geben an, wie stark die analysierte Funktion bei großen $n$ höchstens bzw. mindestens wächst wie $g(n)$.
* Die Schranke $\Theta(g(n))$ gibt dagegen an, dass die Funktion bei großen $n$  in exakt der angegebenen Größenordnung wächst wie $g(n)$.
* Die Schranken $o(g(n))$ und $\omega(g(n))$ geben dagegen an, dass die Funktion immer schwächer bzw. stärker als $g(n)$ wächst.

### $\mathcal O$-Notation
Mit der $\mathcal O$-Notation wird die _obere Schranke_ angenähert.

$f(n)\in\mathcal O (g(n))$ bedeutet, $f$ wächst höchstens so stark wie $g$. Dazu m
$$
    \mathcal O (g(n)) = \{
        \text{Funktion } f(n) |
        \exist c\in\mathbb R_+:\exist n_0\in\mathbb N:
        \forall\mathbb N \ni n\ge n_0: 0 \le f(n) \le c\cdot g(n)
    \}
$$

#### Hierarchien:
Satz über Hierarchien:
1. $\forall 2 \le b \in\mathbb R:\mathcal O(\log n) \subseteq\mathcal O(\log^2 n) \subseteq\mathcal O(\log^b n)$
2. $\forall 2 \le b \in\mathbb R:\forall 0<\varepsilon\in\mathbb R: \mathcal O(\log^bn) \subseteq\mathcal O(n^\varepsilon)$
3. $\forall 2 \le b \in\mathbb R:\forall 1> \varepsilon\in\mathbb R:\mathcal O(n^\varepsilon) \subseteq\mathcal O(n) \subseteq\mathcal O(n^2) \subseteq\mathcal O(n^b)$

### $\Omega$-Notation
Die $\Omega$-Notation liefert eine _untere Schranke_ für die Laufzeit.

$f(n)\in\Omega (g(n))$ bedeutet, $f$ wächst mindestens so stark wie $g$.
$$
    \Omega (g(n)) = \{
        \text{Funktion } f(n) |
        \exist c\in\mathbb R_+:\exist n_0\in\mathbb N:
        \forall n\ge n_0: 0 \le c\cdot g(n) \le f(n)
    \}
$$
### Zusammenhang zwischen $\mathcal O(n)$ und $\Omega(n)$
$$
    f(n) \in \mathcal O(g(n)) \Leftrightarrow g(n) \in \Omega(f(n))
$$


### $\Theta$-Notation
$f(n)\in\Theta(n)$ bedeutet, dass $f$ für große $n$ ($n\rightarrow\infty$) genauso stark wächst wie $g$.
$$
    f(n) \in \Theta(g(n)) \Leftrightarrow f(n) \in \mathcal O(g(n)) \land f(n) \in \Omega(g(n))
$$

### $o$-Notation
$f(n)\in o (g(n))$ bedeutet, $f$ wächst weniger stark als $g$.
$$
    o (g(n)) = \{
        \text{Funktion} f(n) |
        \forall c\in\mathbb R_+:\exist n_0\in\mathbb N:
        \forall\mathbb N \ni n\ge n_0: 0 \le f(n) \le c\cdot g(n)
    \}
$$

### $\omega$-Notation
$f(n)\in \omega(g(n))$ bedeutet, $f$ wächst stärker als $g$.
$$
    f(n) \in o(g(n)) \Leftrightarrow g(n) \in o(g(n))
$$

## Korrektheitsbeweise
* Elemente eines Korrektheitsbeweise können zur Überprüfung der Funktionsweise während der Laufzeit verwendet werden.
* Aus Korrektheitsbeweisen lassen sich häufig gute Kommentare herleiten.
* Ein Korrektheitsbeweis hält letztlich die Überlegungen fest, die ein Entwickler sowieso machen muss.
* Korrektheitsbeweise helfen dabei, sich dieser Überlegungen bewusst zu werden, und somit Fehler zu vermeiden.

### Definitionen
#### Korrektheitsbeweis
Ein Korrektheitsbeweis ist eine formale Argumentation, dass ein Algorithmus korrekt arbeitet.

#### Problembeschreibung
Definiert für eine Menge von zulässigen Eingaben die zugehörigen gewünschten Ausgaben.

#### Korrektheit
Wir bezeichnen einen Algorithmus für eine vorgegebene Problembeschreibung als _korrekt_, wenn er für jede zulässige Eingabe die in der Problembeschreibung spezifizierte Ausgabe berechnet.

###  Methoden
#### Schleifeninvarianten
Sei $A(n)$ eine Aussage über den Zustand des Algorithmus vor dem $n$-ten Eintritt in den Schleifenrumpf. Eine Schleifeninvariante ist dann korrekt, wenn sie vor jedem Eintritt in den Schleifenrumpf korrekt ist. $A(1)$ wird auch als Initialisierung bezeichnet.

Der Beweis für die Korrektheit erfolgt über Vollständige Induktion.

Für _for_-Schleifen werden hierbei folgende Annahmen getroffen:[^4]
* Die Laufvariable $i$ wird am Ende des Schleifenrumpfs erhöht.
* Zur Initialisierung wird die Laufvariable $i$ auf den Startwert gesetzt.
* Die Invariante kann von dem Laufparameter $i$ abhängen.

Lemma: $A(i)$ ist eine korrekte Schleifeninvariante.

[^4]: siehe Pseudocode/for-Schleife

#### Vollständige Induktion
Es soll bewiesen werden, dass eine Aussage $A(n)$ für alle $n\in\mathbb N$ gilt.
1. Induktionsvoraussetzung: Beweise für $n=1$
2. Induktionsschritt: Beweise: Wenn $n$ gilt, dann gilt auch $n+1$

## Rechentricks / -regeln
* Satz von Gauß: $\sum_{i=1}^n i = \frac{n(n+1)}{2}$

## Literatur
1. [@AlgorithmsCormen2022]
