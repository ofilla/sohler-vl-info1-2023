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
    Ind[A[1],1] = true \\ Menge {A[1]}

    \\ suche nach Teilmenge
    for i=2 to n do
        for u=0 to U do
            Ind[u,i] = false
            if Ind[u,i-1] = true then Ind[u,i] = true
            if u>=A[i] und Ind[u-A[i], i-1] = true then Ind[u,i] = true
    return Ind[U,n]
```

`Ind[A[1], 1]` existiert nicht! U.a. aus Zeitgründen nicht weiter bearbeitet.


|      | i=1   | i=2 | i=3 | i=4 | i=5 | i=6 | i=7 | i=8 |
|------|-------|-----|-----|-----|-----|-----|-----|-----|
| j=0  | true  |     |     |     |     |     |     |     |
| j=1  | false |     |     |     |     |     |     |     |
| j=2  | false |     |     |     |     |     |     |     |
| j=3  | false |     |     |     |     |     |     |     |
| j=4  | false |     |     |     |     |     |     |     |
| j=5  | false |     |     |     |     |     |     |     |
| j=6  | false |     |     |     |     |     |     |     |
| j=7  | false |     |     |     |     |     |     |     |
| j=8  | false |     |     |     |     |     |     |     |
| j=9  | false |     |     |     |     |     |     |     |
| j=10 | false |     |     |     |     |     |     |     |
| j=11 | false |     |     |     |     |     |     |     |
| j=12 | false |     |     |     |     |     |     |     |
| j=13 | false |     |     |     |     |     |     |     |
| j=14 | false |     |     |     |     |     |     |     |
| j=15 | false |     |     |     |     |     |     |     |

## 2.
> Gegeben sei ein Array $A[1..n]$ mit $1 \le A[i] \le 3$ für alle $1 \le i \le n$. Eine Spielfigur startet auf der ersten Stelle des Arrays und muss die $n$-te Stelle erreichen. Befindet sich die Figur auf der Stelle $i$ für $1 \le i \le n$, so darf sie mit einem Sprung bis zu $A[i]$ Stellen nach vorne ziehen. Im unten gezeigten Beispiel darf die Figur also von der zweiten Stelle aus bis zu $A[2] = 3$ Stellen weiterspringen, also jede der Stellen $3$, $4$ und $5$ mit einem Sprung erreichen. Gesucht ist die minimale Anzahl von Sprüngen, um beginnend auf der ersten Stelle des Arrays die $n$-te Stelle zu erreichen.

> Für das folgende Beispiel mit $n = 8$ beträgt die minimale Anzahl an Sprüngen $3$ und ergibt sich durch die Sprungfolge $1 \curvearrowright 2 \curvearrowright 5 \curvearrowright 8$.

> $A= (2\ \ 3\ \ 1\ \ 2\ \ 3\ \ 1\ \ 2\ \ 1)$

> Sei $M [i]$ die minimal benötigte Anzahl von Sprüngen, um ausgehend von der $i$-ten Stelle die $n$-te Stelle zu erreichen. Geben Sie eine rekursive Formulierung für $M [i]$ an. Erklären Sie die Funktionsweise dieser. Gehen Sie dabei auf jede Fallunterschiedung ein.

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

### b)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus aus Teilaufgabe a).


```
S(n, k) \\ T(n)
    if k=n then return 1 \\ O(1)
    if k>=0 and n>0 then return 0 \\ O(1)
    return S(n-1, k-1) + k * S(n-1, k) \\ 2T(n-1) + 1
```

$T(0)\in\mathcal O(1)$ sei die Laufzeit der letzten Rekursionsstufe. Es gilt $T(n)= 2T(n-1) + \mathcal O(1)$. Daher gilt $T(n) = 2^{n-1}T(0)$, also $T(n)\in\mathcal O(2^{n-1}) \subseteq \mathcal O(2^n)$.

### c)
> Geben Sie einen Algorithmus in Pseudocode an, der auf dem Prinzip der dynamischen Programmierung beruht, und bei Eingabe einer Zahl $n$ unter Verwendung von $S(n, k)$ die Anzahl aller Partitionen einer Menge mit $n$ Elementen berechnet.

```
Stirling(n, k)
    S = new array[0..n][0..k]
    for i=0 to min{n, k} do \\ hier kann n=k gelten
        S[i,i] = 1 \\ k=n
    for i=1 to n do \\ für alle n>1
        S[i, 0] = 0 \\ k=0, n>0

    for i=2 to n do \\ n-Index
        for j=1 to k do
            if j <= n then
            S[i, j] = S[i-1,j-1] + j * S[i-1,j]

    return S[n, k]
```

### d)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus aus Teillaufgabe c).

```
Stirling(n, k)
    S = new array[0..n][0..k] \\ O(nk)
    for i=0 to min{n, k} do \\ min{n, k} + 2
        S[i,i] = 1 \\ min{n, k} + 1
    for i=1 to n do \\ n+1
        S[i, 0] = 0 \\ n

    for i=2 to n do \\ n-1
        for j=1 to k do \\ k+1
            if j <= n then \\ (n-2)*k
            S[i, j] = S[i-1,j-1] + j * S[i-1,j] \\ (n-2)*k

    return S[n, k] \\ 1
```

Das Erstellen des Feldes braucht $\mathcal O(nk)$, daher braucht der gesamte Algorithmus $\mathcal O(nk)$.

Dies ist nicht so effizient, wie es sein könnte. Beispielsweise wird der Wert an der Position $S[n, 0]$ nie gebraucht werden, aber dennoch berechnet. Auf die Laufzeit wirkt sich das aber erst aus, wenn man einen effizienteren Speichertyp als ein Feld benutzt, beispielsweise eine dünnbesetzte Matrix (_sparse matrix_) oder einen FIFO-Speicher einer Länge $\approx n-k$. Damit könnte man die Laufzeit weiter verringern.
