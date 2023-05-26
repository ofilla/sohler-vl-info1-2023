---
title: Übungsblatt 8
author:
    - Oliver Filla
date:
    - 07.06.2023
---
# Übungsblatt 8
## 1. Scheduling
> Betrachten Sie die folgenden dargestellten Aufgaben, die am rechten Rand auch als Tupel (Anfangszeitpunkt, Endzeitpunkt) angegeben sind. Geben Sie an, in welcher Reihenfolge die Aufgaben betrachtet werden müssen, damit der Algorithmus $\mathrm{IntervalScheduling}$ aus der Vorlesung anwendbar ist. Führen Sie dann den Algorithmus aus, wobei die Daten in der von Ihnen angegebenen Reihenfolge bearbeitet werden. Geben Sie die Ausgabe des Algorithmus und alle Aufgaben, die nicht erfüllt werden, an.

> $(12,30)$
> $(3,11)$
> $(5,7)$
> $(1,4)$
> $(12,17)$
> $(1,2)$
> $(8,15)$
> $(16,27)$
> $(3,7)$
> $(19,29)$

### Reihenfolge der Eingabewerte
Die Aufgaben müssen aufsteigend nach Endzeitpunkt sortiert sein, damit der in der Vorlesung definerte Algorithmus $\mathrm{IntervalScheduling}$ funktioniert. Damit sind die Eingabewerte in folgender Reihenfolge zu übergeben. Die Positionen $3$ und $4$ dürfen auch vertauscht sein, da die Endzeitpunkte nicht verwendet werden

1. $(1,2)$
2. $(1,4)$
3. $(3,7)$
4. $(5,7)$
5. $(3,11)$
6. $(8,15)$
7. $(12,17)$
8. $(16,27)$
9. $(19,29)$
10. $(12,30)$

### (un)erfüllte Aufgaben
* Rückgabewert: $\{1, 4, 6, 8\}$
* erfüllte Aufgaben:
    1. $(1,2)$
    4. $(5,7)$
    6. $(8,15)$
    8. $(16,27)$
* unerfüllte Aufgaben:
    2. $(1,4)$
    3. $(3,7)$
    5. $(3,11)$
    7. $(12,17)$
    9. $(19,29)$
    10. $(12,30)$

## 2. Gierige Algorithmen
> Wir betrachten ein Problem aus dem Bereich Scheduling:
> Auf einer einzelnen Maschine sind $n$ Jobs mit Bearbeitungszeiten $p_1 ,\dots, p_n \in\mathbb R^+$ auszuführen. Die Maschine kann zu jedem Zeitpunkt höchstens einen der Jobs bearbeiten und es ist nicht erlaubt, die Bearbeitung eines Jobs zugunsten eines anderen Jobs zu unterbrechen und zu einem späteren Zeitpunkt wiederaufzunehmen. Ein _Schedule_ beschreibt nun einen Plan, in welchen Zeiträumen die Jobs auf der Maschine bearbeitet werden. Der Zeitpunkt, zu dem in einem Schedule der Job $i$ beendet ist, wird mit $c_i$ bezeichnet. Wir suchen einen Schedule, der die summierten Beendigungszeitpunkte von allen Jobs, d.h. $\sum_{i=1}^n c_i$ minimiert.
> Beispiel: Gegeben seien drei Jobs mit den Bearbeitungszeiten $p_1 = 1$, $p_2 = 2$ und $p_3 = 3$. Wenn die Jobs in der Reihenfolge $2$, $3$, $1$ ohne Leerlauf bearbeitet werden, ergibt sich $c_2 + c_3 + c_1 = 2 + 5 + 6 = 13$ für die summierten Beendigungszeitpunkte.

### a)
> Entwickeln Sie einen gierigen Algorithmus, der ein Schedule findet, das die summierten Beendigungszeitpunkte von allen Jobs minimiert, und erklären oder kommentieren Sie diesen.

Sei $S=\sum_{i=1}^n c_i$ die zu minimierende Summe. Es gilt $c_i=c_{i-1} + p_i=\sum_{j=1}^i p_j$. Daher gilt $S=\sum_{i=1}^n c_i=\sum_{i=1}^n \sum_{j=1}^i p_j=p_1\cdot n + p_2 \cdot (n-1) + \dots$,  woraus $S=\sum_{i=1}^n p_i\cdot (n+1-i)$ folgt. Da beispielsweise $p_1$ $n$-mal in $S$ einfließt, müssen die Jobs nach Bearbeitungszeit $p_i$ aufsteigent sortiert ausgeführt werden, um $S$ zu minimieren. Für ein Feld $P$ mit den Bearbeitungszeiten in Ausführungsreihenfolge muss also gelten $\forall i<j: P[i]\le P[j]$

```
Schedule(P, n)
    S = new array[1..n] \\ schedule
    \\ Initalisierung: Reihenfolge der übergebenen Jobs
    for i=1 to n do
        S[i] = i

    \\ InsertionSort
    \\ nehme dieselben Änderungen an P und S vor
    for i=2 to n do
        x = P[i] \\ Bearbeitungszeit an Stelle i
        j = i - 1
        \\ verschiebe die Elemente links von i um eins nach rechts,
        \\ bis entweder das erste Element erreicht wurde
        \\ oder das i-te Element richtig einsortiert wurde
        while j>0 and A[j]>x do
            A[j+1] = A[j]
            S[j+1] = S[j]
            j = j-1

        \\ Das i-te Element
        A[j+1] = x
        S[j+1] = i

    return S
```

### b)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.

```
Schedule(P, n)
    S = new array[1..n] \\ O(n)
    for i=1 to n do \\ O(n)
        S[i] = i \\ O(n)

    for i=2 to n do \\ O(n)
        x = P[i] \\ O(n)
        j = i - 1 \\ O(n)
        while j>0 and A[j]>x do \\ n*n-1 = O(n^2)
            A[j+1] = A[j] \\ O(n^2)
            S[j+1] = S[j] \\ O(n^2)
            j = j - 1 \\ O(n^2)

        \\ Das i-te Element
        A[j+1] = x \\ O(n)
        S[j+1] = i \\ O(n)

    return S \\ O(1)
```

Die Worst-Case-Laufzeit beträngt $\mathcal (n^2)$. Dies ist zu erwarten, da die Worst-Case-Laufzeit von InsertionSort ist $\Theta(n^2)$ beträgt.

## 3. Gierige Algorithmen
> Bob hat einen kleinen Unverpacktladen, in dem er verschiedene Lebensmittel wie Gemüse oder Getreide unverpackt verkauft. Er ist beim Großmarkt, um Waren für seinen Laden einzukaufen. Beim Großmarkt hat Bob die Möglichkeit jede der $n$ möglichen Waren in $100\mathrm g$ Einheiten zu kaufen. Die unterschiedlichen Waren sind mit verschiedenen Kennzahlen in $\{1, \dots, n\}$ bezeichnet. Leider hat der Großmarkt aber nur eine begrenzte Menge der einzelnen Waren, da es ein paar Lieferschwierigkeiten gab.
> Nun muss Bob entscheiden, welche Waren er für seinen Laden kauft. Allerdings hat Bob nur einen sehr alten Lastwagen und kann so nur ein Maximalgewicht $G$ an Waren transportieren. Das Gewicht der Verpackungen kann dabei vernachlässigt werden, da Bob selber genug Behälter dabei hat, die bereits im Maximalgewicht G berücksichtigt werden. Zuerst schreibt Bob sich die vorhandenen Mengen in einem Feld $g[1 . . . n]$ mit $g[i] \in\mathbb N$ auf.
> Bob muss sich keine Gedanken über sein Budget für den Einkauf oder darüber machen, welche Produkte seine Kunden kaufen, da das Geschäft gut läuft und alle möglichen Waren sehr begehrt bei seinen Kunden sind. Allerdings möchte er natürlich möglichst viel Gewinn mit den ausgewählten Waren machen. Deswegen notiert sich Bob auch den Gewinn, den er für $100\mathrm g$ der einzelnen Waren erbringen kann, in einem Feld $p[1 . . . n]$ mit $p[i] \in\mathbb N$.
> Also möchte Bob nun die Mengen an Waren auswählen, die ihm möglichst viel Gewinn bringen, aber noch von seinem Lastwagen transportiert werden können.

### a)
> Entwickeln Sie einen gierigen Algorithmus mit einer Laufzeit in $\mathcal O(n \log_2 n)$, der Bob die Entscheidung abnimmt, und erklären oder kommentieren Sie diesen. Dabei können sie davon ausgehen, dass die Gewichtskapazität $G$ des Lastwagens ein Vielfaches von $100\mathrm g$ ist (also $G\%100 = 0$) und die Einträge in $g$ in Gramm sind.

#### Abstrakt
```
Einkauf(G, g, p, n)
1.    Sortiere g und p aufsteigend nach den Werten in p,
      ohne die Zuordnung der Elemente zu verändern.
2.    Iteriere von 1 bis n über i:
3.        Kaufe so viel von Ware i, wie noch in den Wagen passt.
```

Im Folgenden wird die Sortierung der Felder nicht explizit implementiert. Diese Sortierung kann in der Laufzeit $\mathcal O(n\log_2 n)$ erfolgen.

#### Pseudocode
Der folgende Code setzt voraus, dass $g$ und $p$ gemeinsam nach den Werten in $p$ sortiert wurden, ohne die Zuordnung der Elemente zu stören. Dann wird nur noch $g$ im Algorithmus verwendet, da der erzielte Gewinn nicht berechnet werden muss.

Bei der Sortierung sollte zudem darauf geachtet werden, dass bei Gleichheit der Gewinne $p[i]$ nach den Gewichten $g[i]$ sortiert wird, mit dem leichtesten Gewicht zuerst. Nimmt man an, dass keine zwei Waren den exakt gleichen Gewinn bringen, kann man dies vernachlässigen.

Es wird angenommen, dass $G\%100=0$ ist oder dass alle Waren nur in $100\mathrm g$-Einheiten zu kaufen sind.

```
Einkauf(G, g, n)
    S = new array[1..n] \\ Einkaufsliste
    \\ Initialisierung: keine Einkäufe getätigt
    for i=0 to n do
        S[i] = 0

    free = G/100
    \\ für jede Ware, beginnend mit der Ertragreichsten
    for i=1 to n do
        \\ kaufe so viele Waren wie möglich
        \\ aber nicht mehr, als in den Wagen passen
        to_buy = min(g[i], free)

        \\ kaufe entsprechende Waren
        S[i] = to_buy
        \\ lade Einkauf in den Wagen
        free = free - to_buy

    return S
```

### b)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.

```
Einkauf(G, g, n)
1.    S = new array[1..n] \\ O(n)
2.    for i=0 to n do \\ O(n)
3.        S[i] = 0 \\ O(n)

4.    free = G/100 \\ O(1)
5.    for i=1 to n do \\ O(n)
6.        to_buy = min(g[i], free) \\ O(n)
7.        S[i] = to_buy \\ O(n)
8.        free = free - to_buy \\ O(n)

9.    return S \\ O(1)
```

Die gemeinsame Sortierung von $g$ und $p$ kann z.B. mit einer Variante von $\mathrm{MergeSort}$ erfolgen. Da es bei der Sortierung nur auf die Werte in $p$ ankommt (solange die Zuordnung nicht gestört wird), braucht die Sortierung eine Laufzeit von $\mathcal O(n\log_2n)$.

Der restliche Algorithmus hat eine Worst-Case-Laufzeit von $\mathcal O(n)$. Da $\mathcal O(n)\subseteq \mathcal O(n\log_2n)$ ist, ist die Gesamtlaufzeit $T(n) \in \mathcal O(n\log_2n)$.

### c)
> Zeigen Sie die Korrektheit Ihres Algorithmus mit einem Widerspruchsbeweis.
> 
> 1. welche strukturelle Eigenschaft hat die von Ihrem Algorithmus berechnete Lösung?
> 2. Was würde folgen, wenn es eine optimale Lösung gibt, die diese strukturelle Eigenschaft nicht besitzt?

Am Ende des $i$-ten Schleifendurchlaufs wurden so viele der gewinnträchtigsten Ware gekauft wie möglich. Eine Ware $m$ ist genau dann gewinnträchtiger als eine andere Ware $i$, wenn $p[m]>p[i]$. Beim Einkaufen wird nur dann auf eine andere Ware zugegriffen, wenn von der alten Ware keine weiteren Objekte mehr verfügbar sind.

Angenommen, es wird eine Ware $i$ mit geringerem Gewinn $p[i]$ gekauft, bevor die gewinnträchtigste Ware $m$ mit dem Gewinn $p[m]$ gekauft wird. Es gilt also $p[i]<p[m]$. Dann muss die Ware $i$ im sortierten Feld vor der Ware $m$ stehen. $g$ und $p$ sind so sortiert, dass der größte Gewinn in $p[1]$ gespeichert ist, der nächstgrößte Gewinn in $p[2]$ usw, sowie dass $g[j]$ das Gewicht zu der Ware mit dem Gewinn $p[j]$ enthält. Wenn Ware $i$ in diesem Feld vor Ware $m$ steht, ist $p[i]\ge p[m]$. Dies widerspricht der Annahme, dass $m$ die gewinnträchtigste Ware ist.

### d)
> Diskutieren Sie, ob es ebenfalls möglich ist eine optimale Lösung mit Hilfe eines gierigen Algorithmus zu finden, wenn Sie nur die gesamten Mengen eines Produktes abnehmen können. Geben Sie entweder einen kommentierten Algorithmus an oder ein Gegenbeispiel, für das Ihr gieriger Algorithmus keine optimale Lösung findet.

#### Annahme
Ein analog entwickelter Algorithmus würde möglicherweise keine optimale Lösung finden. Wenn es einen solchen Algorithmus gibt, muss er eine andere Strategie verfolgen.

#### Beweis
Sei $G=400$ und gebe es Waren mit den Eigenschaften $(g_1,p_1)=(100, 5)$ und $(g_2,p_2)=(400, 2)$. Dann kauft der Algorithmus nur die Ware $1$ ein, was einen Gewinn von $5$ liefert. Allerdings wäre der optimale Einkauf, Ware $2$ komplett zu kaufen, was einem Gewinn von $4\cdot 2=8>5$ entspricht. Damit die Annahme bewiesen.
