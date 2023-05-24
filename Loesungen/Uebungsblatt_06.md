---
title: Übungsblatt 6
author:
    - Oliver Filla
date:
    - 17.05.2023
---
# Übungsblatt 6
## 1.
> Wir betrachten den Algorithmus $\mathrm{SubsetSum}(A, U, n)$ der Vorlesung. Gegeben sei die folgende Menge:

> $A = \{19, 5, 7, 4, 12, 9, 2, 6, 4\}$ und der Wert $u = 15$.

> Wenden Sie den Algorithmus der Vorlesung an, um zu entscheiden, ob es eine Teilmenge $L \subseteq A$ gibt, sodass $\sum_{x\in L} x = u$ gilt. Geben Sie dabei das vollständige Array $I$, sowie das Ergebnis des Algorithmus an.

```
SubsetSum(A, U, n)
    \\ initalisiere Indikator
    Ind = new array [0..U][1..n]
    for j=1 to n do
        Ind[j,1] = false
    Ind[0,1] = true \\ leere Menge
    if A[1] <= U \\ Menge {A[1]}
    then Ind[A[1],1] = true

    \\ suche nach Teilmenge
    for i=2 to n do
        for u=0 to U do
            Ind[u,i] = false
            if Ind[u,i-1] = true then Ind[u,i] = true
            if u>=A[i] und Ind[u-A[i], i-1] = true then Ind[u,i] = true
    return Ind[U,n]
```

$0\equiv \mathrm{false}$ und $1\equiv \mathrm{true}$

|   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---|---|---|---|---|---|---|---|---|---|---|----|----|----|----|----|----|
| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0  | 0  | 0  | 0  | 0  | 0  |
| 2 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0  | 0  | 0  | 0  | 0  | 0  |
| 3 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0  | 0  | 1  | 0  | 0  | 0  |
| 4 | 1 | 0 | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 1 | 0  | 1  | 1  | 0  | 0  | 0  |
| 5 | 1 | 0 | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 1 | 0  | 1  | 1  | 0  | 0  | 0  |
| 6 | 1 | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0  | 1  | 1  | 1  | 1  | 0  |
| 7 | 1 | 0 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 1 | 0  | 1  | 1  | 1  | 1  | 1  |
| 8 | 1 | 0 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1  | 1  | 1  | 1  | 1  | 1  |
| 9 | 1 | 0 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1  | 1  | 1  | 1  | 1  |    |


## 2.
> Gegeben sei ein Array $A[1..n]$ mit $1 \le A[i] \le 3$ für alle $1 \le i \le n$. Eine Spielfigur startet auf der ersten Stelle des Arrays und muss die $n$-te Stelle erreichen. Befindet sich die Figur auf der Stelle $i$ für $1 \le i \le n$, so darf sie mit einem Sprung bis zu $A[i]$ Stellen nach vorne ziehen. Im unten gezeigten Beispiel darf die Figur also von der zweiten Stelle aus bis zu $A[2] = 3$ Stellen weiterspringen, also jede der Stellen $3$, $4$ und $5$ mit einem Sprung erreichen. Gesucht ist die minimale Anzahl von Sprüngen, um beginnend auf der ersten Stelle des Arrays die $n$-te Stelle zu erreichen.

> Für das folgende Beispiel mit $n = 8$ beträgt die minimale Anzahl an Sprüngen $3$ und ergibt sich durch die Sprungfolge $1 \curvearrowright 2 \curvearrowright 5 \curvearrowright 8$.

> $A= (2\ \ 3\ \ 1\ \ 2\ \ 3\ \ 1\ \ 2\ \ 1)$

> Sei $M [i]$ die minimal benötigte Anzahl von Sprüngen, um ausgehend von der $i$-ten Stelle die $n$-te Stelle zu erreichen. Geben Sie eine rekursive Formulierung für $M [i]$ an. Erklären Sie die Funktionsweise dieser. Gehen Sie dabei auf jede Fallunterschiedung ein.

Hier wird $\infty$ als Fehlerwert gewählt, damit $\min\{\dots\}$ diesen Pfad nicht auswählen wird.

$$
M(i) =
    \begin{cases}
        0 &: i = n \\
        \infty &: i>n \\
        1+M(i+1) &: A[i] = 1 \\
        1+ \min\{M(i+1), M(i+2)\} &: A[i] = 2 \\
        1+ \min\{M(i+1), M(i+2), M(i+3)\} &: A[i] = 3 \\
    \end{cases}
$$

```
fastestWay(A, n):
    \\ Kann das Ziel in einem Sprung erreicht werden?
    \\ Dies ist auch der Fall, wenn n=1, da A[i] >= 1
    if n<=A[1] then return 1 \\ springe direkt zum Ziel

    fastest = n \\ längstmöglicher Weg: alle A[i]=1

    \\ Da A[i] <= 3 müssen nur 3 Felder auf den kürzesten Weg überprüft werden
    for i=1 to 3 do
        way = fastestWay(A, n-i) \\ finde den schnellsten Weg zur gewählten Position
        if way < fastest \\ falls der Weg der kürzeste ist:
        then fastest = way \\ speichere diese Weglänge

    return fastest
```

## 3.
> Gegeben sei eine Menge $A$ mit $n$ Zahlen. Die Anzahl der Partitionen von $A$ kann mit der sogenannten Stirling Zahl zweiter Art berechnet werden.

> Diese Zahl $S(n, k)$ ist rekursiv definiert als:

> $S(n,k) = \begin{cases}0 & \text{, falls } k=0,n>0 \\1 & \text{, falls } k=n \\S(n-1,k-1)+k\cdot S(n-1,k) & \text{\ \ sonst}\end{cases}$


> und beschreibt wie viele Partitionen einer $n$-elementigen Menge es in $k$ disjunkte Teilmengen gibt.

### a)
> Geben Sie einen rekursiven Algorithmus in Pseudocode an, welcher bei Eingabe einer Zahl $n$ unter Verwendung von $S(n, k)$ die Anzahl aller Partitionen einer Menge mit $n$ Elementen berechnet.

```
S(n, k)
    if k=n then return 1
    if k>=0 and n>0 then return 0 \\ fange negative Eingaben ab
    return S(n-1, k-1) + k * S(n-1, k)
```

Gesucht ist die Anzahl aller Partitionen:
```
NumberOfAllPartitions(n):
    sum = 0
    for k = 0 to n
        sum = sum + S(n, k)
    return sum
```

### b)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus aus Teilaufgabe a).

```
S(n, k) \\ T(n, k)
    if k=n then return 1 \\ O(1)
    if k>=0 and n>0 then return 0 \\ O(1)
    return S(n-1, k-1) + k * S(n-1, k) \\ T(n-1, k-1) + T(n-1, k)
```

Überlegungen zur Laufzeit:

* Der Rekursionsbaum ist nicht vollständig.
* Seine maximale Höhe ist $n$.
* Der vollständige Baum hat $2^n$ Blätter, tatsächlich hat der Baum weniger Blätter
* Die Laufzeit in jedem Knoten ist konstant.
* Es gibt mehr Blätter als innere Knoten.

Daraus folgt eine Laufzeit von $T_1(n)\in\mathcal O(n)$.

$T(0)\in\mathcal O(1)$ sei die Laufzeit der letzten Rekursionsstufe. Es gilt $T(n)= 2T(n-1) + \mathcal O(1)$. Daher gilt $T(n) = 2^{n-1}T(0)$, also $T(n)\in\mathcal O(2^{n-1}) \subseteq \mathcal O(2^n)$.

```
NumberOfAllPartitions(n): \\ T_2(n)
    sum = 0 \\ O(1)
    for k = 0 to n \\ O(1)
        sum = sum + S(n, k) \\ n*O(2^n)
    return sum
```

$$
\begin{aligned}
    T_1(n, k) &\in \mathcal O(2^n) \\
    T_2(n) &\in \mathcal O(n2^n)
\end{aligned}
$$

### c)
> Geben Sie einen Algorithmus in Pseudocode an, der auf dem Prinzip der dynamischen Programmierung beruht, und bei Eingabe einer Zahl $n$ unter Verwendung von $S(n, k)$ die Anzahl aller Partitionen einer Menge mit $n$ Elementen berechnet.

```
NumberPartitions(n)
    k = n

    S = new array[0..n][0..k]
    for i=0 to n do \\ hier kann n=k gelten
        S[i, i] = 1 \\ k=n
        S[i, 0] = 0 \\ k=0, n>0

    for i=2 to n do
        for j=2 to i-1 do
            S[i, j] = S[i-1,j-1] + j * S[i-1,j]

    sum = 0
    for j=0 to n do
        sum = sum + S[n, j]

    return sum
```

### d)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus aus Teillaufgabe c).

```
NumberPartitions(n)
    k = n \\ O(1)

    S = new array[0..n][0..n] \\ O(n^2)
    for i=0 to n do \\ O(n+1)
        S[i, i] = 1 \\ O(n)
        S[i, 0] = 0 \\ O(n)

    for i=2 to n do \\ O(n)
        for j=2 to i-1 do \\ O(n(n+1))
            S[i, j] = S[i-1,j-1] + j * S[i-1,j] \\ O(n(n+1))

    sum = 0 \\ O(1)
    for j=0 to n do \\ O(n+2)
        sum = sum + S[n, j] \\ O(n+1)

    return sum \\ O(1)
```

Das Erstellen des Feldes braucht $\mathcal O(n^2)$, daher braucht der gesamte Algorithmus $\mathcal O(n^2)$.
