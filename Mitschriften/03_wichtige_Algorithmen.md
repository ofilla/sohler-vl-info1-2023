# 3. wichtige Algorithmen
## Insertion Sort
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

### deskriptiver Pseudocode
```
InsertionSort(A, n) \\ Feld A der Länge n wird übergeben
    if n=1 return \\ n=1 ist sortiert
    x = A[n] \\ speichere das letzte Element
    InsertionSort(A,n-1) \\ sortiere das Feld bis auf die letzte Stelle
    Füge x an die korrekte Stelle in A ein
```

## Merge Sort
$\mathrm{MergeSort}$ sortiert erst beide Hälften eines Feldes seperat, bevor es sie zusammenfügt. Dadurch wird das Feld rekursiv sortiert.

* Erster Aufruf: $\mathrm{MergeSort}(A,1,n)$ mit einem Feld $A$ der Länge $n$.
* Worst-Case-Laufzeit: $T(n) \le \begin{cases} 1 \Leftrightarrow n=1\\ 2T(\frac{n}{2}) + n: \text{sonst}\end{cases}\Rightarrow T(n) = \mathcal O(n\log_2 n)$

Satz: Der Algorithmus $\mathrm{MergeSort}(A,p,r)$ sortiert das Feld $A[p..r]$ korrekt.
Satz: Der Algorithmus $\mathrm{MergeSort}(A,1,n)$ hat eine Laufzeit von $\mathcal O(n \log_2 n)$.

### deskriptiver Pseudocode
```
MergeSort(A,p,r) \\ Sortiert A[p..r]
    if p<r then \\ Rekursionsabbruch, wenn p=r
        int q = (p+r)/2 \\ Berechne die Mitte (Gaußklammer)
        MergeSort(A,p,q) \\ Sortiere linke Teilhälfte
        MergeSort(A,q+1,r) \\ Sortiere rechte Teilhälfte
        Merge(A,p,q,r) \\ Füge die Teile zusammen
```

## BinarySearch
$\mathrm{BinarySearch}$ sucht erst in beiden Hälften eines Feldes seperat, die Ergebnisse vergleicht. Dadurch wird das Feld rekursiv durchsucht.

Satz: Die Laufzeit von $\mathrm{BinäreSuche}(A,x,p,r)$ ist $\mathcal O(\log_2 n)$, wobei $n= r-p+1$ die Größe des zu durchsuchenden Bereichs ist.
Satz: Der Algorithmus $\mathrm{BinäreSuche}(A,x,p,r)$ findet den Index einer Zahl $x$ in einem sortierten Feld $A[p..r]$, sofern $x$ in $A[p..r]$ vorhanden ist.

### deskriptiver Pseudocode
```
BinarySearch(A,x,p,r) \\ Finde Zahl x in sortiertem Feld A[p..r]
    if p=r then return p \\ sofern vorhanden
    else \\ Ausgabe: Index der gesuchten Zahl
    int q = (p+r)/2 \\ Berechne die Mitte (Gaußklammer)
    if x <= A[q] then return BinarySearch(A,x,p,q)
    else return BinarySearch(A,x,q+1,r)
```

## $n$-Ziffer-Integer Multiplikation
Für große Zahlen nehmen wir an, dass jede _Ziffer_ eine Speicherzelle benötigt. Zwei $n$-Ziffer-Zahlen können wir in der Laufzeit $\Theta(n)$ berechnen. Ein $n$-Ziffer können wir in Laufzeit $\Theta(n+k)$ mit $10^k$ multiplizieren.

Dazu multiplizieren wir schriftlich, wobei $A,B,C,D$ $n$-Ziffern sind: $AB\cdot CD = 100AC + 10(AD + BC) + BD$. Dies sind $4$ Multiplikationen von $n$-Ziffern. Dies hat allerdings eine Laufzeit von $T(n)=4T(\frac{n}{2})+cn$, daher gilt $T(n)\in \Theta(n^2)$.

Effizienter wird es, wenn wir die Identität $(A+B)(C+D)=AC+BC+AD+BD$ verwenden. Damit können wir die Summe $BC+AD$ durch $(A+B)(C+D)-AC-BD$ ausdrücken, die Werte $AC$ und $BD$ müssen wir ohnehin berechnen. Dadurch kann man sich eine Multiplikation sparen und man erhält die Laufzeit von $T(n)=3T(\frac{n}{2})+cn$, daher gilt $T(n)\in \Theta(n)$.

## Algorithmus von Strassen (Matrixmultiplikation)
Falls wir das Produkt von zwei $n\times n$-Matrizen berechnen wollen, können wir diese in je $4$ Teilmatrizen der Größe $\frac{n}{2}\times\frac{n}{2}$ aufteilen. Dann multiplizieren wir $8$ $\frac{n}{2}\times\frac{n}{2}$-Matrizen und addieren $4$ $\frac{n}{2}\times\frac{n}{2}$-Matrizen.


$$
    \begin{pmatrix}A&B\\C&D\end{pmatrix}
        \cdot \begin{pmatrix}E&F\\ G&H\end{pmatrix}
        =
            \begin{pmatrix}
                AE + BG & AF + BH \\
                CE + DG & CF + DH \\
            \end{pmatrix}
$$

Die Laufzeit ist dann $T(n)\in \mathcal O(n^{\log_2 8})\subseteq\mathcal O(n^3)$:

$$
    T(n) =
        \begin{cases}
            c & n=1 \\
            8T(\frac{n}{2}) + cn^2 & n>1
        \end{cases}
$$


Wir können folgende Rechentricks nutzen:

* $P_1 = A (F-H)$
* $P_2= (A+B)H$
* $P_3 = (C+D)E$
* $P_4 = D(G-E)$
* $P_5 = (A+D)(E+H)$
* $P_6 =(B-D)(G+H)$
* $P_7 = (A-C)(E+F)$

Damit können wir eine Matrixmultiplikation sparen:
* $AE + BG = P_4 + P_5 + P_6 – P_2$
* $AF + BH = P_1 + P_2$
* $AF + BH = P_1 + P_2$
* $AF + BH = P_1 + P_5 – P_3 – P_7$

Auf diese Weise können wir zwei $n\times n$-Matrizen in der $\mathcal O(n^{\log_2 7})\approx\mathcal O(n^{1.81})$ berechnen.

## Fibbonacci-Zahlen
### primitiver rekursiver Algorithmus
```
FibRecursive(n)
    if n=1 then return 1
    if n=2 then return 1
    return Fib2(n-1) + Fib2(n-2)
```

$\mathrm{FibRecursive}$ hat eine Laufzeit von $T(n)\in\Omega(1.6^n)$, da für jede Rekursionsebene $2$-mal der komplette Rekursionsbaum aufgerufen werden muss. Beispielsweise wird $\mathrm{FibRecursive}(6)$ dreimal $\mathrm{FibRecursive}(3)$ aufrufen.

$$
    T(n) =
        \begin{cases}
            2 & n=1 \\
            3 & n=2 \\
            T(n-1) + T(n-2) + 1 & n>2
        \end{cases}
$$

### dynamischer Algorithmus
Ein besserer Algorithmus speichert Zwischenergebnisse, um doppelte Berechnungen zu vermeiden. Dies gehört zur Dynamischen Programmierung.

Für jedes $m>0$ gilt, dass $\mathrm{FibDynamicCalc}(m)$ maximal zweimal aufgerufen wird. Daher ist die Laufzeit von $\mathrm{FibDynamic}(n)$ linear $T(n)\in\mathcal O(n)$.

```
FibDynamic(n)
    F = new array [1..n]
    for i=1 to n do
        F[i]=0
    F[1] = 1
    F[2] = 1

    return FibDynamicCalc(F, n)

FibDynamicCalc(F, n)
    if F[n] > 0 then return F[n]
    else
        F[n] = FibDynamicCalc(F,n-1) + FibDynamicCalc(F,n-2)
    return F[n]
```

Vereinfacht:
```
Fib1(n)
    F = new array[1..n]
    F[1] = 1
    F[2] = 1
    for i=3 to n do
        F[i] = F[i-1] + F[i-2]
    return F[n]
```

## SearchMax
Suche das Maximum der Werte in einem Feld $A$ der Länge $n$. In diesem Fall bringt die Dynamisch Programmierung keine Laufzeitverkürzung.

### rekursiv
Rekursiver Algorithmus.
```
SearchMaxRecursive(A, n)
    if n=1 then return A[1]
    prev_max = SearchMaxRecursive(A, n-1)
    return max{prev_max, A[n]}
```

### dynamisch
Algorithmus nach Dynamischer Programmierung.
```
MaxSucheDP(A,n)
    Max = new array [1...n]
    Max[1] = A[1]
    for i=2 to n do
        Max[i] = max{Max[i-1], A[i]}
    return Max[n]
```

## Partition
Sei eine Menge natürlicher Zahlen $M\subset \mathbb N$ gegeben. Nun soll festgestellt werden, ob $M$ in zwei Mengen $L,R$ aufgeteilt werden kann, sodass die Summe aller Elemente in den Teilmengen gleich ist.

$$
    \sum_{x\in L} x = \sum_{y\in R} y
$$

* Partition ist $NP$-vollständig.
* Die Frage, ob man Partition in _polynomieller_ Laufzeit lösen kann, ist äquivalent zur Frage ob $P$ gleich $NP$ ist.
* Sei $W=\sum_{x\in M} x$, so kann man die zwei Teilmengen $L,R$ genau dann finden, wenn es eine Teilmenge $L$ mit $\sum_{x\in L} x=\frac{W}{2}$ gibt.

## SubsetSum
$\mathrm{SubsetSum}$ löst eine verallgemeinerte Fragestellung aus der Partitionsfrage.
Gibt es für ein gegebenes $U$ eine Teilmenge $L\subseteq M$, für die $U=\sum_{x\in L} x$ gilt?

* Sei $M=\{x_1, \dots, x_n\}$ eine Menge, deren Elemente eine Reihenfolge haben.
* Definiere Indikatorfunktion $\mathrm{Ind}(U,m)$.

### Entwicklung des Algorithmus
1. Sei $x_n\in L$
    * Es gilt $L=\{x_n\} \cup L\backslash \{x_n\}$.
    * Sei $U^\prime=U-x_n$
    * Gesucht wird eine Menge $L^\prime\subseteq L\backslash \{x_n\}: U^\prime=\sum_{x\in L} x$
2. Sei $x_n\notin L$
    * Gesucht wird eine Menge $L^\prime\subseteq L\backslash \{x_n\}: U=\sum_{x\in L} x$

### Indikatorfunktion
$$
    \mathrm{Ind}(U,m) =
        \begin{cases}
            \mathrm{true} & \exists L\subseteq M: U=\sum_{x\in L} x \\
            \mathrm{false} & \nexists L\subseteq M: U=\sum_{x\in L} x
        \end{cases}
$$

#### Rekursive Beschreibung
```
Ind(A, U, m)
    if n=1
    then
        if U>0 \\ Ind(0, 1)
        then return true
        else \\ Ind(U, 1)
        if A[1]=U
        then return true
        else return false
    if U>=x and Ind(A, U-x, n-1) = true then return true
    return Ind(A, U, n-1)
```

### Pseudocode
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
            if u≥A[i] und Ind[u-A[i], i-1] = true then Ind[u,i] = true
    return Ind[U,n]
```

$\mathrm{SubsetSum}(A, U, n)$ hat eine Laufzeit von $T(n)=\mathcal O(nU)$.

#### Korrektheitsbeweis
Der Korrektheitsbeweis nutzt die Schleifeninvariante $\mathrm{Ind}[u,i]=\mathrm{true}$ genau dann, wenn es eine Teilmenge der ersten $i$ Zahlen aus $A$ gibt, die sich zu $u$ aufsummieren.
