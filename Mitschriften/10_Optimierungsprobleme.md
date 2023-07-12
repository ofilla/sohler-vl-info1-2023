# 10. Optimierungsprobleme
Bei einem Optimierungsproblem wird nach einer _optimalen Lösung_ gesucht. Dies kann z.B. die kürzeste (oder schnellste) Strecke von einem $A$ nach $B$ sein, z.B. zur Arbeit.

Ein klassisches Optimierungsproblem ist das Rucksackproblem.

## Rucksackproblem
Es gibt einen Rucksack mit begrenzter Kapazität, in den Objekte mit verschiedenen Größen und verschiedenen Werten gepackt werden sollen. Ziel ist es, den Rucksack mit dem größtmöglichen Wert zu befüllen.

Dazu hat man eine Menge $M=\{1,\dots,n\}$ an Objekten, die jeweils eine Größe und einen Wert haben. Dies kann man auch durch getrennte Felder für die Werte $w_i$, die Gewichte $g_i$ und die Rucksackgröße $G$ darstellen. Der Einfachheit halber gelte $w_i, g_i, G\in\mathbb N$.

Dann suchen wir eine Teilmenge $S\subseteq M$, für die $w(S) = \sum_{x\in S} w(x)$ maximiert wird und $g(S) = \sum_{x\in S} w(x) \le G$ gilt. Sei weiterhin $M^\prime=\{1,\dots, i\}\subset M$ eine Teilmenge von $M$ mit $i<n$.

## Zulässige Lösungen
Eine Lösung $S\in M^\prime$ heißt _zulässig_ für einen Rucksack der Größe $j$, wenn $g(S)\le j$.

* Ist $S\subseteq \{1,\dots, i-1\}$ eine zulässige Lösung für einen Rucksack der Größe $j-g[i]$ mit dem Wert $w(S)$, dann ist $S \cup \{i\}$ eine zulässige Lösung für einen Rucksack der Größe $j$ mit dem Wert $w(S \cup \{i\})$.
* Ist $S\subseteq \{1,\dots, i-1\}$ eine zulässige Lösung für einen Rucksack der Größe $j$, dann ist $S$ auch eine zulässige Lösung für die ersten $i$ Objekte und einen Rucksack der Größe $j$.
* $S=\{\}$ ist eine zulässige Lösung für _jeden_ Rucksack der Größe $j\ge 0$.

## Optimale Lösungen
Eine zulässige Lösung $S\in M^\prime$ heißt _optimal_ für einen Rucksack der Größe $j$, wenn sie $w(S)$ unter allen Lösungen maximiert.

Sei $O\subseteq M^\prime$ eine optimale Lösung für Objekte aus $M^\prime$ und einen Rucksack der Größe $j$. Es bezeichne $\mathrm{Opt}(i,j)$ den Wert dieser optimalen Lösung. Dann gilt:

1. Ist das Objekt $i\in O$, so ist $O\backslash \{i\}$ eine optimale Lösung mit Objekten aus $\{1,\dots,i-1\}$ für einen Rucksack der Größe $j-g[i]$$. Insbesondere gilt $\mathrm{Opt}(i,j)=w[i] + \mathrm{Opt}(i-1, j-g[i])$.
2. Ist Objekt $i\notin O$ enthalten, so ist $O$ eine optimale Lösung mit Objekten aus $\{1,\dots,i-1\}$ für einen Rucksack der Größe $j$. Insbesondere gilt $\mathrm{Opt}(i,j) = \mathrm{Opt}(i-1, j)$.

Weiterhin gilt:

1. $\forall j\ge g[1]: \mathrm{Opt}(1,j)= w[1]$
2. $\forall j<g[1]: \mathrm{Opt}(1,j)=0$
3. $\forall i>1,g[i]>j: \mathrm{Opt}(i,j) = \mathrm{Opt}(i-1,j)$
4. $\forall i>1, g[i]\le j: \mathrm{Opt}(i,j) = \max\{\mathrm{Opt}(i-1,j), w[i] + \mathrm{Opt}(i-1,j-g[i])\}$

## Methode: Dynamische Programmierung
Dynamische Programmierung kann genutzt werden, um Optimierungsprobleme zu lösen

1. Führe dadurch das Problem auf optimale Teillösungen zurück.
2. Entwerfe eine rekursive Methode zur Bestimmung des _Wertes_ einer optimalen Lösung.
3. Transformiere diese Methode in eine iterative Methode zur Bestimmung des Wertes einer optimalen Lösung.
4. Bestimmen aus dem Wert einer optimalen Lösung und in der iterativen Methode berechneten Zusatzinformationen (oft einer Tabelle) eine optimale Lösung.

### Finde optimale Teillösungen
Sei $O\in M^\prime$ eine optimale Lösung für einen Rucksack der Größe $j$. Sei $\mathrm{Opt}(i,j)$ der Wert einer solchen Lösung. Dann muss $\mathrm{Opt}(n, G)$ ermittelt werden, um das Rucksackproblem zu lösen

Seien $i=1$, die Eingabemenge $\{1,\dots,i\}=\{1\}$ und die Größe des Rucksacks $j$ gegeben.
* Gilt $j\ge g[1]$, dann ist $O=\{1\}$ eine optimale Lösung mit Wert $\mathrm{Opt}(1,j) = w[1]$.
* Ist $j<g[1]$, dann ist $O=\{\}$ eine optimale Lösung mit Wert $\mathrm{Opt}(1,j) = 0$.

### Finde den Wert der optimalen Lösung iterativ
```
Rucksack(n,g,w,G) \\ finde die Werte der optimalen Lösungen
    Opt = new array[1,..,n][0,..,G]
    for j = 0 to G do
        if j<g[1] \\ Lösungen für 1-elementige Lösungen
        then Opt[1,j] = 0
        else Opt[1,j] = w[1]

    for i = 2 to n do
        for j = 0 to G do
            if g[i]>j
            then
                 \\ Objekt i passt nicht in den Rucksack
                Opt[i,j] = Opt[i-1,j]
            else
                \\ finde optimale Lösung
                Opt[i,j] = max{Opt[i-1,j], w[i] + Opt[i-1,j-g[i]]}
    return Opt[n,G]
```

Die Laufzeit ist $T(n)\in \mathcal O(nG)$. Sei $R$ der Wert einer optimalen Lösung für Objekte aus $\{1,\dots,i\}$. Falls nun $g[i]\le j$ und $\mathrm{Opt}(i-1,j-g[i]) +w[i]= R$, so ist das Objekt $i$ in mindestens einer optimalen Lösung enthalten.

### finde den Weg der optimalen Lösung
Wir gehen davon aus, dass das Feld $\mathrm{Opt}$ auch nach dem Aufruf von $\mathrm{Rucksack}$ verfügbar ist.

* Falls das $i$-te Objekt in einer optimalen Lösung für Objekte $1$ bis $i$ und Rucksackgröße $j$ ist, so gib es aus und fahre rekursiv mit Objekt $i-1$ und Rucksackgröße $j-g[i]$ fort.
* Ansonsten fahre mit Objekt $i-1$ und Rucksackgröße $j$ fort.
* In der hiesigen Notation ist $\{\dots\}+\{\dots\}$ das Bilden einer Vereinigungsmenge $\{\dots\}\cup \{\dots\}$.

```
RucksackLösung(Opt,g,w,i,j)
    if i=0 return {}
    if g[i]>j then return RucksackLösung(Opt,g,w,i-1,j)

    if Opt[i,j]=w[i] + Opt[i-1,j-g[i]]
    then return {i} + RucksackLösung(Opt,g,w,i-1,j-g[i])
    else return RucksackLösung(Opt,g,w,i-1,j)
```

Nach der Berechnung der Tabelle $\mathrm{Opt}$ in der Funktion $\mathrm{Rucksack}$ wird $\mathrm{RucksackLösung}(\mathrm{Opt}, g, w, i=n, j=G)$.

Hat die optimale Lösung für Objekte aus $M^\prime$ und Rucksackgröße $j$ den Wert $\mathrm{Opt}(i,j)$, so berechnet Algorithmus $\mathrm{RucksackLösung}$ eine Teilmenge $S\subseteq M^\prime$, so dass $g(S)\le j$ und $w(S)=\mathrm{Opt}(i,j)$ ist.

Mit Hilfe der Algorithmen $\mathrm{Rucksack}$ und $\mathrm{RucksackLösung}$ kann man in der Laufzeit $\mathcal O(nG)$ eine optimale Lösung für das Rucksackproblem berechnen, wobei $n$ die Anzahl der Objekte ist und $G$ die Größe des Rucksacks.

## Travelling Salesman Problem
Sei $G=(V,E)$ ein ungerichteter vollständiger Graph mit positiven Kantengewichten $w(u,v)$ für alle $(u,v)\in E$, o.b.d.A. sei $V={1, \dots, n}$. Gesucht ist eine Reihenfolge $\pi(1),\dots,\pi(n)$ der Knoten aus $V$, so dass die Länge der Rundreise $\pi(1),\dots,\pi(n), \pi(1)$ minimiert wird. Die Länge $L$ der Rundreise ist durch folgende Summe gegeben.

$$
    L = \sum_{i=1}^n w(\pi(i), \pi(i+1 \mod n))
$$

### Dreiecksungleichung
Für je drei Knoten $u,v,x\in V$ gilt $w(u,x) \le w(u,v) + w(v,x)$.

## Heuristik
Heuristiken versuchen, eine optimale Lösung anzunähern und können daher sehr effizient sein. Im Allgemeinen kann man keine Qualität quantitativ garantieren. In diesem Punkt unterscheiden sich Heuristiken von Approximationsalgorithmen.

## Approximationsalgorithmus
Ein Algorithmus $A$ für ein Optimierungsproblem heißt $\alpha(n)$-Approximationsalgorithmus, wenn für alle Eingaben der Größe $n$ folgendes gilt. Hierbei bezeichnet $C$ die Kosten der von $A$ berechneten Lösung, $C^*$ bezeichnet die Kosten der optimalen Lösung. $\alpha(n)$ wird Approximationsfaktor genannt.

$$
    \forall n: \max\left(\frac{C}{C^*}, \frac{C^*}{C}\right) \le \alpha(n)
$$

Beispiele
* minimale Knotenüberdeckung
* Travelling Salesman Problem

