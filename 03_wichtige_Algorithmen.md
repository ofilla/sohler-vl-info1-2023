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

