# 4. wichtige Algorithmen
## Rekursionsalgorithmen
### Insertion Sort
```
InsertionSort(A, n) \\ Feld A der Länge n wird übergeben
    for i=2 to n do
        x = A[i]
        j = i - 1
        while j>0 and A[j]>x do
            A[j+1] = A[j]
            j = j - 1
        A[j+1] = x
```

Die Worst-Case-Laufzeit von InsertionSort ist $\Theta(n^2)$.

#### deskriptiver Pseudocode
```
InsertionSort(A, n) \\ Feld A der Länge n wird übergeben
    if n=1 return \\ n=1 ist sortiert
    x = A[n] \\ speichere das letzte Element
    InsertionSort(A,n-1) \\ sortiere das Feld bis n-1
    Füge x an die korrekte Stelle in A ein
```

### Merge Sort
$\mathrm{MergeSort}$ sortiert erst beide Hälften eines Feldes seperat, bevor es sie zusammenfügt. Dadurch wird das Feld rekursiv sortiert.

* Erster Aufruf: $\mathrm{MergeSort}(A,1,n)$ mit einem Feld $A$ der Länge $n$.
* Worst-Case-Laufzeit: $T(n) \le \begin{cases} 1 \Leftrightarrow n=1\\ 2T(\frac{n}{2}) + n: \text{sonst}\end{cases}\Rightarrow T(n) = \mathcal O(n\log_2 n)$

Satz: Der Algorithmus $\mathrm{MergeSort}(A,p,r)$ sortiert das Feld $A[p..r]$ korrekt.
Satz: Der Algorithmus $\mathrm{MergeSort}(A,1,n)$ hat eine Laufzeit von $\mathcal O(n \log_2 n)$.

#### deskriptiver Pseudocode
```
MergeSort(A,p,r) \\ Sortiert A[p..r]
    if p<r then \\ Rekursionsabbruch, wenn p=r
        int q = (p+r)/2 \\ Berechne die Mitte (Gaußklammer)
        MergeSort(A,p,q) \\ Sortiere linke Teilhälfte
        MergeSort(A,q+1,r) \\ Sortiere rechte Teilhälfte
        Merge(A,p,q,r) \\ Füge die Teile zusammen
```

#### Pseudocode: Merge
```
Merge(A, p, q, r)
    B = new array[1..(r-p+1)] \\ Feld zum Einsortieren
    i = p \\ aktuelle Position linker Teilarray
    j = q+1 \\ aktuelle Position rechter Teilarray
    for k=1 to r-p+1 do
        \\ wenn rechter Rand überschritten wurde oder das linke Element kleiner ist
        if i <= q and (j>r or A[i] <= A[j])
        then
            \\ dann nehme das linke Element (falls vorhanden)
            B[k] = A[i] \\ in richtige Position in B einfügen
            i = i+1
        else
            \\ sonst nehme das rechte Element
            B[k] = A[j] \\ in richtige Position in B einfügen
            j = j+1
    A[p..r] = B[1..(r-p+1)] \\ kopiere Daten von B nach A
```

### BinarySearch
$\mathrm{BinarySearch}$ sucht erst in beiden Hälften eines Feldes seperat, die Ergebnisse vergleicht. Dadurch wird das Feld rekursiv durchsucht.

Satz: Die Laufzeit von $\mathrm{BinäreSuche}(A,x,p,r)$ ist $\mathcal O(\log_2 n)$, wobei $n= r-p+1$ die Größe des zu durchsuchenden Bereichs ist.
Satz: Der Algorithmus $\mathrm{BinäreSuche}(A,x,p,r)$ findet den Index einer Zahl $x$ in einem sortierten Feld $A[p..r]$, sofern $x$ in $A[p..r]$ vorhanden ist.

#### deskriptiver Pseudocode
```
BinarySearch(A,x,p,r) \\ Finde Zahl x in sortiertem Feld A[p..r]
    if p=r then return p \\ sofern vorhanden
    else \\ Ausgabe: Index der gesuchten Zahl
    int q = (p+r)/2 \\ Berechne die Mitte (Gaußklammer)
    if x <= A[q] then return BinarySearch(A,x,p,q)
    else return BinarySearch(A,x,q+1,r)
```

### $n$-Ziffer-Integer Multiplikation
Für große Zahlen wird angenommen, dass jede Ziffer eine Speicherzelle benötigt. Zwei $n$-Ziffer-Zahlen kann in der Laufzeit $\Theta(n)$ berechnet werden. Eine $n$-Ziffer kann in Laufzeit $\Theta(n+k)$ mit $10^k$ multipliziert werden.

Dazu wird wie bei der schriftlichen Multiplikation vorgegangen, wobei $A,B,C,D$ $n$-Ziffern sind. $AB\cdot CD = 100AC + 10(AD + BC) + BD$. Dies sind $4$ Multiplikationen von $n$-Ziffern. Die Laufzeit ist allerdings $T(n)=4T(\frac{n}{2})+cn \in \Theta(n^2)$.

Effizienter wird die Multiplikation, wenn die Identität $(A+B)(C+D)=AC+BC+AD+BD$ verwendet wird. Damit kann die Summe $BC+AD$ durch $(A+B)(C+D)-AC-BD$ ausgedrückt werden, die Werte $AC$ und $BD$ müssen ohnehin berechnet werden. Dadurch kann man sich eine Multiplikation sparen und man erhält die Laufzeit von $T(n)=3T(\frac{n}{2})+cn \in \Theta(n)$.

### Algorithmus von Strassen (Matrixmultiplikation)
Mithilfe des Algorithmus von Strassen kann das Produkt zweier $n\times n$-Matrizen rekursiv in der Worst-Case-Laufzeit $\mathcal O(n^2)$ berechnet werden.

Dazu kann jede $n\times n$-Matrix in $4$ Teilmatrizen der Größe $\frac{n}{2}\times\frac{n}{2}$ aufteilen. Dann werden $8$ $\frac{n}{2}\times\frac{n}{2}$-Matrizen multipliziert und $4$ $\frac{n}{2}\times\frac{n}{2}$-Matrizen addiert.

$$
    \begin{pmatrix}A&B\\C&D\end{pmatrix}
        \cdot \begin{pmatrix}E&F\\ G&H\end{pmatrix}
        =
            \begin{pmatrix}
                AE + BG & AF + BH \\
                CE + DG & CF + DH \\
            \end{pmatrix}
$$

Mit dieser simplen Methode ist die Laufzeit $T(n)\in \mathcal O(n^{\log_2 8})\subseteq\mathcal O(n^3)$.

$$
    T(n) =
        \begin{cases}
            c & n=1 \\
            8T(\frac{n}{2}) + cn^2 & n>1
        \end{cases}
$$


Es können einige Relationen verwendet werden, um die Multiplikation einer $\frac{n}{2}\times\frac{n}{2}$-Matrix zu sparen.

* $P_1 = A (F-H)$
* $P_2= (A+B)H$
* $P_3 = (C+D)E$
* $P_4 = D(G-E)$
* $P_5 = (A+D)(E+H)$
* $P_6 =(B-D)(G+H)$
* $P_7 = (A-C)(E+F)$
* $AE + BG = P_4 + P_5 + P_6 – P_2$
* $AF + BH = P_1 + P_2$
* $AF + BH = P_1 + P_2$
* $AF + BH = P_1 + P_5 – P_3 – P_7$

Auf diese Weise kann das Produkt zweier $n\times n$-Matrizen in der Laufzeit $\mathcal O(n^{\log_2 7})\subseteq\mathcal O(n^2)$ berechnet werden.

## Dynamische Programmierung
### Fibbonacci-Zahlen
#### primitiver rekursiver Algorithmus
```
FibRecursive(n)
    if n=1 then return 1
    if n=2 then return 1
    return Fib2(n-1) + Fib2(n-2)
```

$\mathrm{FibRecursive}$ hat eine Laufzeit von $T(n)\in\Omega(2^n)$, da für jede Rekursionsebene $2$-mal der komplette Rekursionsbaum aufgerufen werden muss. Beispielsweise wird $\mathrm{FibRecursive}(6)$ dreimal $\mathrm{FibRecursive}(3)$ aufrufen.

$$
    T(n) =
        \begin{cases}
            2 & n=1 \\
            3 & n=2 \\
            T(n-1) + T(n-2) + 1 & n>2
        \end{cases}
$$

#### dynamischer Algorithmus
Ein besserer Algorithmus speichert Zwischenergebnisse, um doppelte Berechnungen zu vermeiden. Dies gehört zur Dynamischen Programmierung und benötigt eine Worst-Case-Laufzeit von $\mathcal O(n)$.

```
Fib1(n)
    F = new array[1..n]
    F[1] = 1
    F[2] = 1
    for i=3 to n do
        F[i] = F[i-1] + F[i-2]
    return F[n]
```

### SearchMax
Suche das Maximum der Werte in einem Feld $A$ der Länge $n$. In diesem Fall bringt die Dynamisch Programmierung keine Laufzeitverkürzung.

#### rekursiv
Rekursiver Algorithmus.
```
SearchMaxRecursive(A, n)
    if n=1 then return A[1]
    prev_max = SearchMaxRecursive(A, n-1)
    return max{prev_max, A[n]}
```

#### dynamisch
Algorithmus nach Dynamischer Programmierung.
```
MaxSucheDP(A,n)
    Max = new array [1...n]
    Max[1] = A[1]
    for i=2 to n do
        Max[i] = max{Max[i-1], A[i]}
    return Max[n]
```

### Partition
Sei eine Menge natürlicher Zahlen $M\subset \mathbb N$ gegeben. Nun soll festgestellt werden, ob $M$ in zwei Mengen $L,R$ aufgeteilt werden kann, sodass die Summe aller Elemente in den Teilmengen gleich ist.

$$
    \sum_{x\in L} x = \sum_{y\in R} y
$$

* Das Partitionsproblem ist $NP$-vollständig.
* Die Frage, ob man Partition in _polynomieller_ Laufzeit lösen kann, ist äquivalent zur Frage ob $P$ gleich $NP$ ist.
* Sei $W=\sum_{x\in M} x$, so kann man die zwei Teilmengen $L,R$ genau dann finden, wenn es eine Teilmenge $L$ mit $\sum_{x\in L} x=\frac{W}{2}$ gibt.

### SubsetSum
$\mathrm{SubsetSum}$ löst eine verallgemeinerte Fragestellung aus der Partitionsfrage.
Gibt es für ein gegebenes $U$ eine Teilmenge $L\subseteq M$, für die $U=\sum_{x\in L} x$ gilt?

* Sei $M=\{x_1, \dots, x_n\}$ eine Menge, deren Elemente eine Reihenfolge haben.
* Definiere Indikatorfunktion $\mathrm{Ind}(U,m)$.

#### Entwicklung des Algorithmus
1. Sei $x_n\in L$
    * Es gilt $L=\{x_n\} \cup L\backslash \{x_n\}$.
    * Sei $U^\prime=U-x_n$
    * Gesucht wird eine Menge $L^\prime\subseteq L\backslash \{x_n\}: U^\prime=\sum_{x\in L} x$
2. Sei $x_n\notin L$
    * Gesucht wird eine Menge $L^\prime\subseteq L\backslash \{x_n\}: U=\sum_{x\in L} x$

#### Indikatorfunktion
$$
    \mathrm{Ind}(U,m) =
        \begin{cases}
            \mathrm{true} & \exists L\subseteq M: U=\sum_{x\in L} x \\
            \mathrm{false} & \nexists L\subseteq M: U=\sum_{x\in L} x
        \end{cases}
$$

#### Rekursive Beschreibung
```
Ind(A, U, n)
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

#### Pseudocode
```
SubsetSum(A, U, n)
    \\ initalisiere Indikator
    Ind = new array [0..U][1..n]
    for j=1 to U do
        Ind[j,1] = false
    Ind[0,1] = true \\ leere Menge
    if A[1] <= U \\ Menge {A[1]}
    then Ind[A[1],1] = true

    \\ suche nach Teilmenge
    for i=2 to n do
        for u=0 to U do
            Ind[u,i] = false
            if Ind[u,i-1] = true then Ind[u,i] = true
            if u>=A[i] und Ind[u-A[i], i-1] = true
            then Ind[u,i] = true
    return Ind[U,n]
```

$\mathrm{SubsetSum}(A, U, n)$ hat eine Laufzeit von $T(n)=\mathcal O(nU)$.

#### Korrektheitsbeweis
Der Korrektheitsbeweis nutzt die Schleifeninvariante $\mathrm{Ind}[u,i]=\mathrm{true}$ genau dann, wenn es eine Teilmenge der ersten $i$ Zahlen aus $A$ gibt, die sich zu $u$ aufsummieren.

## Optimierungsprobleme
### Rucksackproblem
Es gibt einen Rucksack mit begrenzter Kapazität, in den Objekte mit verschiedenen Größen und verschiedenen Werten gepackt werden sollen. Ziel ist es, den Rucksack mit dem größtmöglichen Wert zu befüllen.

Dazu hat man eine Menge $M=\{1,\dots,n\}$ an Objekten, die jeweils eine Größe und einen Wert haben. Dies kann man auch durch getrennte Felder für die Werte $w_i$, die Gewichte $g_i$ und die Rucksackgröße $G$ darstellen.

Dies ist ein Optimierungsproblem.[^31]

[^31]: siehe Kapitel $10$: _Optimierungsprobleme_

### Wechselgeldrückgabe
Ein eingegebener Centbetrag soll mit möglichst wenig Münzen zurückgegeben werden. Dies wird mit einem gierigen Algorithmus gelöst.

Sei $B$ der Centbetrag. Ein gieriger Algorithmus wählt zunächst die größte verfügbare Münze $M$ mit $M\le B$ aus und sucht die optimale Rückgabe für den Restbetrag $B-M$.

#### Korrektheit
Angenommen, die Menge der Münzen sei $\{50, 10, 5, 1\}$, dann funktioniert der Algorithmus.

Falls die Menge der Münzen aber $\{50, 10, 7, 5, 1\}$ ist, löst der Algorithmus das Problem nicht: Sei $B=14$, so liefert der Algorithmus $(1\times 10, 4\times 1)$ als Ergebnis. Die optimale Lösung wäre aber $(2\times 7)$.

### Interval-Scheduling
Ziel ist es, eine Ressource möglichst effektiv zu nutzen. Dies bedeutet, dass die Ressource möglichst wenig genutzt wird oder immer möglichst schnell wieder freigegeben wird.

#### Notation
Sei die Eingabe eine Menge von Intervallen. In Pseudocode kann dies durch die Anzahl $n$, sowie Felder mit den Anfangswerten $A$ und den Endwerten $E$ dargestellt werden.

Gesucht sei die Menge $S\subseteq \{1,\dots,n\}$, sodass die Anzahl der Elemente maximiert wird, wenn sich die verschiedenen Intervalle nicht überlappen. $\forall i \in S: \exists i\neq j\in S: E[i]\le A[j] \lor E[j]\le A[i]$.

#### Kompatible Intervalle
Zwei Intervalle heißen kompatibel, wenn sie sich nicht teilweise überlappen. D.h. mit Feldern der Anfangswerte $A$ und Feldern der Endwerte $E$ gilt $\forall i \in S: \exists i\neq j\in S: E[i]\le A[j] \lor E[j]\le A[i]$.

#### Gieriger Algorithmus
1. Wähle ein Interval $i_j$ geschickt und füge es in die Ergebnismenge $S$ ein.
2. Entferne alle Intervalle, die nicht mit $i_j$ kompatibel sind.
3. Gehe zu $1$.

Die Schwierigkeit liegt in Schritt $1$. Sowohl die Wahl des erstmöglichen Intervals als auch die Wahl des kürzesten Intervals liefert nicht immer das gewünschte Ergebnis. Da die Ressource immer möglichst früh freigegeben werden soll, kann man immer das Interval nehmen, das am frühesten endet.

Der Algorithmus $\mathrm{IntervalSchedule}$ berechnet in Laufzeit $\mathcal O(n)$ eine optimale Lösung, wenn die Eingabe nach Endzeit der Intervalle sortiert ist. Die Sortierung kann in $\mathcal O(n \log n)$ Zeit berechnet werden.

```
\\ Voraussetzung: Die Intervalle sind nach Endzeitpunkt sortiert.
IntervalScheduling(A,E,n)
    S = {1}
    j = 1
    for i=2 to n do
        if A[i] >= E[j] then
            S = S + {i} \\ Vereinigungsmenge
            j = i
    return S
```

### Interval-Scheduling mit Deadlines
Wie beim Interval-Scheduling soll eine Ressource bestmöglich genutzt werden. Im Unterschied zu den dortigen Bedingungen sollen hier aber bestimmte Aufgaben gelöst werden, die die Ressource für eine gewisse Dauer in Anspruch nehmen. Zudem hat jede Aufgabe eine Deadline, zu der sie erfüllt sein soll.

Wird eine Aufgabe $z$ Zeiteinheiten nach der Deadline erfüllt, hat sie eine Verzögerung von $z$. Wird eine Aufgabe innerhalb der Deadline beendet, hat sie eine Verzögerung von $0$.

In diesem Fall wird so optimiert, dass die maximale Verzögerung minimiert wird. Hierzu müssen die Aufgaben in der Reihenfolge ihrer Deadlines bearbeitet werden.

#### Notation
Sei die Eingabe eine Menge von Intervallen. In Pseudocode kann dies durch die Anzahl $n$, sowie Felder mit den Laufzeiten $t$ und den Deadlines $d$.

Es sollen die Startzeitpunkte der jeweiligen Aufgaben zurückgegeben werden.

#### Pseudocode
Unter der Annahme, dass die Aufgaben in Reihenfolge ihrer Deadlines nicht-absteigend sortiert sind, löst der folgende Algorithmus das Problem in Laufzeit $T(n)\in\mathcal O(n)$ optimal und ohne Leerlauf.

```
LatenessScheduling(t,d,n)
    A = new array [1..n]
    z=0
    for i=1 to n do
        A[i] = z
        z = z + t[i]
    return A
```

#### Leerlauf
Alle Lösungen ohne Leerlauf, bei denen die Aufgaben nicht-absteigend nach Deadline sortiert sind, haben dieselbe maximale Verzögerung. Es gibt immer eine optimale Lösung ohne Leerlauf, bei der die Aufgaben nicht-absteigend nach Deadline sortiert sind.

#### Inversion
Eine Reihenfolge von Aufgaben hat eine Inversion $(i,j)$, wenn Aufgabe $i$ vor Aufgabe $j$ in der Reihenfolge auftritt, aber die Deadline $d[i]$ von Aufgabe $i$ größer ist als die Deadline $d[j]$ von Aufgabe $j$.

Eine Reihenfolge ohne Inversionen ist nicht-absteigend sortiert.

Gibt es in einer Reihenfolge von Aufgaben eine Inversion $(i,j)$, dann gibt es auch eine Inversion zweier in der Reihenfolge benachbarter Aufgaben und man kann Aufgabe $i$ und $j$ vertauschen, ohne die Lösung zu verschlechtern.

## Suchbaumalgorithmen
### Binäre Suchbäume
#### Inorder-Tree-Walk
Sei $x$ ein binärer Suchbaum. Dann gibt diese Prozedur den kompletten Baum in aufsteigender Reihenfolge in Laufzeit $\mathcal O(n)$ aus.

```
Inorder-Tree-Walk(x)
    if x=NIL then return \\ kein Baum
    Inorder-Tree-Walk(left[x])
    Ausgabe key[x]
    Inorder-Tree-Walk(right[x])
```

#### BinaryTreeSearch
Sei $x$ ein binärer Suchbaum der Höhe $h$. Dann gibt $\mathrm{BinaryTreeSearch}(x,k)$ den Knoten mit dem Schlüssel $k$ aus, falls dieser in dem Baum $x$ enthalten ist. Ansonsten gibt die Funktion $\mathrm{NIL}$ zurück, dies benötigt die Worst-Case-Laufzeit $\mathcal O(h)$ aus.

```
BinaryTreeSearch(x,k)
    if x=NIL or k=key[x] then return x
    if k<key[x] then return BinaryTreeSearch(left[x],k)
    else return BinaryTreeSearch(right[x],k)
```

#### MinSearch / MaxSearch
Sei $x$ ein binärer Suchbaum der Höhe $h$, dann können der minimale und der maximale Schlüssel in Worst-Case-Laufzeit $\mathcal O(h)$ gefunden werden.

```
MinSearch(x)
    while left[x] != NIL do
        x = left[x]
    return x
```

#### FollowerSearch
$\mathrm{FollowerSearch}(x)$ sucht den Nachfolgerknoten in einem binären Suchbaum der Höhe $h$ in der Worst-Case-Laufzeit $\mathcal O(h)$. Nachfolger bedeutet, dass $x$ den nächstgrößten Schlüssel besitzt. Analog kann der Vorg

1. Falls es einen rechten Unterbaum gibt, ist der am weitesten links liegende Knoten der Nachfolger.
2. Ansonsten ist der Nachfolger der erste Elternknoten, dessen Schlüssel größer als der von $x$ ist. Gibt es keinen solchen Knoten, dann hat $x$ den größten Schlüssel.

```
FollowerSearch(x)
    if right[x] != NIL \\ es gibt einen rechten Unterbaum
    then
        \\ der Knoten mit dem kleinsten Wert ist der Nachfolger
        return MinSearch(right[x])

    y = parent[x]
    while y != NIL and x = right[y] do
        x = y
        y = parent[y]
    return y
```

#### Save
Um einen neuen Schlüssel $k$ in einem binären Suchbaum $T$ der Höhe $h$ zu speichern, muss der Blattknoten gefunden werden, an den der neue Knoten angehängt wird. Daraufhin wird ein neuer Knoten als Unterbaum abgespeichert. Da dies konstante Laufzeit erfordert, benötigt der Speichervorgang die Laufzeit $O(h)$, die durch die Suche des Blattknotens mittels $\mathrm{FollowerSearch}(x)$ entsteht.

```
Save(T,k)
    \\ create new node
    z = new node
    key[z] = k
    right[z] = NIL
    left[z] = NIL

    \\ find future parent node
    y = NIL
    x = root[T]
    while x != NIL do
        y=x
        if k < key[x]
        then x = left[x]
        else x = right[x]

    parent[z] = y

    if y=NIL
    then root[T] = z
    else
        if key[z] < key[y]
        then left[y] = z
        else right[y] = z
```

#### Delete
Beim Löschen eines Knotens $z$ aus einem binären Suchbaum $T$ der Höhe $h$ muss der Baum wieder korrekt zusammengebaut werden. Dies funktioniert nur in der Worst-Case-Laufzeit $\mathcal O(h)$.

1. Wenn $z$ keine Kinder hat, kann $z$ einfach entfernt werden.
2. Wenn $z$ ein Kind hat, dann wird $z$ mit seinem Kind ersetzt.
3. Wenn $z$ zwei Kinder hat, dann muss es mit seinem Nachfolger $y$ ersetzt werden. Dazu muss der Schlüssel $\mathrm{key}[z]$ auf den des Nachfolgers $\mathrm{key}[y]$ gesetzt werden, woraufhin der Nachfolger $y$ entfernt werden kann.

```
Löschen(T,z)
    if left[z]=NIL or right[z]=NIL then y=z
    else y = FollowerSearch(z)

    if left[y]=NIL
    then x = right[y]
    else x = left[y]

    if x != NIL
    then parent[x]=parent[y]

    if parent[y]=NIL
    then root[T]=x
    else
        if y = left[parent[y]]
        then left[parent[y]]=x
        else right[parent[y]]=x

    key[z]=key[y]
    delete y
```

### Rot-Schwarz-Bäume
#### Linksrotation
Sei $p$ ein Knoten in einem Rot-Schwarz-Baum mit $\mathrm{left}[p]=l$ und $\mathrm{right}[p]=r$. Eine Linksrotation verschiebt die Struktur nach links, sodass $r$ die Position von $p$ einnimmt und $p=\mathrm{left}[r]$ wird. Die Rotation läuft gegen den Uhrzeigersinn.

```
Linksrotation(T,x)
    y = right[x]
    right[x] = left[y]

    if left[y]!=NIL then parent[left[y]] = x

    parent[y] = parent[x]

    if parent[x]=NIL
    then root[T] = y
    else
        if x=left[parent[x]]
        then left[parent[x]] = y
        else right[parent[x]] = y

    left[y] = x
    parent[x] = y
```

#### RS-Einfügen
Beim Einfügen in einen Rot-Schwarz-Baum muss zunächst ein neuer Knoten eingefügt werden. Daraufhin muss die Baumstruktur repariert werden, sodass die Rot-Schwarz-Eigenschaft wieder erfüllt sind. So lange diese Reparatur maximal die Laufzeit $\mathcal O(\log_2n)$ benötigt, läuft der gesamte Algorithmus in der Laufzeit $T(n)\in\mathcal O(\log_2n)$.

```
RSEinfügen(T,k)
    \\ Initialisiere neuen Knoten
    z = new node
    key[z] = k
    left[z] = NIL[T]
    right[z] = NIL[T]
    color[z] = rot

    \\ Suche Position zum Einfügen
    y = NIL[T]
    x = Root[T]
    while x!=NIL[T] do
        y = x
        if k<key[x]
        then x = left[x]
        else x = right[x]

    \\ Füge Knoten z ein
    parent[z] = y
    if y=NIL[T]
    then root[T] = z
    else
        if k<key[y]
        then left[y] = z
        else right[y] = z

    RS-Einfügen-Fix(T,z) \\ Repariere Baumstruktur
```

#### RS-Einfügen-Fix
Die Struktur des Rot-Schwarz-Baumes $T$ wird nach dem Einfügen eines neuen Knotens $z$ in der Laufzeit $\mathcal O(\log_2n)$ wieder repariert. Nachdem diese Prozedur am Ende der Prozedur $\mathrm{RSEinfügen}(T,z)$ ausgeführt wurde, erfüllt $T$ wieder die Rot-Schwarz-Eigenschaft.

Hierbei wandert die Rot-Markierung des neuen Knotens schrittweise eine Ebene Richtung Wurzel. Wenn diese Markierung an der Wurzel angekommen ist, muss diese noch schwarz gefärbt werden, damit die Rot-Schwarz-Eigenschaft erfüllt ist.

Beim Reparieren soll man folgende Schleifeninvariante gelten.

1. Knoten $z$ ist rot.
2. Wenn $\mathrm{parent}[z]$ die Wurzel ist, dann ist $\mathrm{parent}[z]$ schwarz.
3. Es gibt maximal eine Verletzung der Rot-Schwarz-Eigenschaften:
    1. Ist die Wurzel rot, dann ist $z$ die Wurzel.
    2. Hat ein roter Knoten rote Kinder, dann ist $\mathrm{parent}[z]$ rot.
4. Die Anzahl der schwarzen Knoten auf allen Pfaden von der Wurzel zu jedem Blatt ist gleich.

##### Fallunterscheidung
1. Falls $z$ die Wurzel ist, muss $z$ schwarz gefärbt werden.
2. Der Onkel von $z$ ist rot, ebenso wie der Vater von $z$. Dann muss die rote Ebene um eine Ebene nach oben geschoben werden.
    1. Der Vater und der Onkel von $z$ werden schwarz gefärbt.
    2. Der Großvater von $z$ wird rot gefärbt.
    3. Die Rot-Schwarz-Bedingung muss ausgehend vom Großvater geprüft werden.
4. Der Onkel von $z$ ist schwarz, außerdem sind $z$ und der Vater $\mathrm{parent}(z)$ beide linke bzw. rechte Kinder.
    1. Der Onkel von $z$ wird rot gefärbt.
    2. Rotation um den Großvater von $z$:
        1. $z$ und Vater sind linke Kinder: Rechtsrotaton
        2. $z$ und Vater sind rechte Kinder: Linksrotation
5. Der Onkel von $z$ ist schwarz.
    1. Rotation um den Vaterknoten.
        1. $z$ ist ein rechtes Kind und der Vater ist ein linkes Kind: Linksrotation
        2. $z$ ist ein linkes Kind und der Vater ist ein rechtes Kind: Rechtsrotation
    2. Die Rot-Schwarz-Bedingung muss ausgehend vom Vater geprüft werden.

##### Pseudocode
```
RSEinfügenFix(T,z)
    while color[parent[z]] = rot do
        if parent[z] = left[parent[parent[z]]] then
            y = right[parent[parent[z]]] \\ Onkel von z

            if color[y] = rot then \\ Onkel ist rot
                \\ schiebe rote "Ebene" eine Stufe höher
                color[parent[z]] = schwarz
                color[y] = schwarz
                color[parent[parent[z]]] = rot
                \\ prüfe beim Großvater weiter
                z = parent[parent[z]]
            else \\ Onkel schwarz
                if z = right[parent[z]] then
                    \\ parent[z] rechter Knoten
                    Linksrotation(T, parent[z])
                    \\ prüfe beim Vater weiter
                    z = parent[z]
                else \\ z und parent[z] linke Knoten
                    color[parent[z]] = schwarz
                    color[parent[parent[z]]] = rot
                    Rechtsrotation(T, parent[parent[z]])
        else
            \\ analog
    color[root[T]] = schwarz
```

#### RS-Löschen
Der Prozedur wird ein Knoten $z$ übergeben, die aus dem Baum $T$ gelöscht werden soll. Das Löschen erfolgt wie beim allgemeinen binären Suchbaum. Danach muss der Baum repariert werden, falls die Rot-Schwarz-Eigenschaft nicht mehr gilt. Das Löschen erfolgt in Laufzeit $\mathcal O(\log_2n)$.

1. Wenn $z$ keine Kinder hat, kann $z$ einfach entfernt werden.
2. Wenn $z$ ein Kind hat, dann wird $z$ mit seinem Kind ersetzt.
3. Wenn $z$ zwei Kinder hat, dann muss es mit seinem Nachfolger $y$ ersetzt werden. Dazu muss der Schlüssel $\mathrm{key}[z]$ auf den des Nachfolgers $\mathrm{key}[y]$ gesetzt werden, woraufhin der Nachfolger $y$ entfernt werden kann.
4. Falls $z$ schwarz ist, müssen die Rot-Schwarz-Eigenschaft wiederhergestellt werden.

```
RSLöschen(T,z)
    if left[z] = NIL[T] or right[z] = NIL[T]
    then y = z
    else y = NachfolgerSuche(z)

    if left[y] != NIL[T]
    then x = left[y]
    else x = right[y]

    parent[x] = parent[y]

    if parent[y] = NIL[T]
    then root[T] = x
    else
        if y = left[parent[y]]
        then left[parent[y]] = x
        else right[parent[y]] = x

    key[z] = key[y]

    if color[y] = schwarz
    then RS-Löschen-Fix(T,x)

    parent[NIL[T]] = NIL
    delete y
```

#### RS-Löschen-Fix
Die Struktur des Rot-Schwarz-Baumes $T$ wird nach dem Löschen eines Knotens $z$ in der Laufzeit $\mathcal O(\log_2n)$ wieder repariert. Nachdem diese Prozedur am Ende der Prozedur $\mathrm{RSLöschen}(T,z)$ ausgeführt wurde, erfüllt $T$ wieder die Rot-Schwarz-Eigenschaft.

Die Rot-Schwarz-Eigenschaft kann verletzt worden sein, wenn $z$ schwarz ist, denn dann kann es sein, dass nach dem Löschen zwei rote Knoten aufeinanderfolgen.

##### Fallunterscheidung
Wenn der Knoten $x$, der den Knoten $z$ ersetzt, rot ist, muss $x$ nur schwarz gefärbt werden um den Baum zu reparieren. Seien $x$ schwarz und $w$ der Geschwisterknoten von $x$, dann gibt es folgende Fälle.

1. $w$ ist rot.
    1. Färbe $w$ schwarz.
    2. Rotiere so um $\mathrm{parent}[x]$, dass $w$ und $\mathrm{parent}[x]$ die Plätze tauschen.
    3. Fahre Prüfung mit $x$ an neuer Position fort.
2. $w$ von $x$ und beide Kinder von $w$ sind schwarz.
    1. Färbe $w$ rot.
    2. Fahre Prüfung mit $\mathrm{parent}[x]$ fort.
3. $w$ ist schwarz und mindestens ein Kind von $w$ ist rot.
    1. Falls nur das Kind auf der selben Seite wie $x$ rot ist:
        2. Färbe das rote Kind von $w$ schwarz.
        3. Färbe $w$ rot.
        4. Rotiere so um $w$, dass $w$ und das umgefärbte Kind die Plätze tauschen.
        5. Fahre mit Prüfung für $x$ fort
    2. Sonst:
        1. Färbe $w$ wie $\mathrm{parent}[x]$.
        2. Färbe $\mathrm{parent}[w]$ und das Kind auf der von $x$ abgewandten Seite schwarz.
        3. Rotiere so um $\mathrm{parent}[x]$, dass $w$ und $\mathrm{parent}[x]$ die Plätze tauschen.

##### Pseudocode
```
RS-Löschen-Fix(T,x)
    while x != root[T] and color[x]=schwarz do
        if x = left[parent[x]] then
            w = right[parent[x]]
            if color[w] = rot
            then \\ Geschwisterknoten ist rot
                color[w] = schwarz
                color[parent[x]] = rot
                Linksrotation(T, parent(x))
                w = right[parent[x]]

            if color[left[w]] = schwarz and color[right[w]] = schwarz
            then \\ beide Kinder des Geschwisterknotens sind schwarz
                color[w] = rot
                x = parent[x]
            else \\ mindestens ein Kind des Geschwisterknotens ist rot
                if color[right[w]] = schwarz
                then \\ nur das linke Kind des Geschwisterknotens ist rot
                    color[left[w]] = schwarz
                    color[w] = rot
                    Rechtsrotation(T,w)
                    w = right[parent[x]]
                else \\ das linke Kind ist nicht schwarz
                    color[w] = color[parent[x]]
                    color[parent[x]] = schwarz
                    color[right[w]] = schwarz
                    Linksrotation(T, parent[x])
                    x = root[T]
        else
            \\ analoger Fall
    color[x] = schwarz
```

## Hashalgorithmen
### Einfügen mit Offener Adressierung
Alle Schlüssel werden in der Hashtabelle $T$ gespeichert. Zunächst wird versucht, den Schlüssel $k$ in $T[h(k)]$ einzufügen. Falls dort schon ein Schlüssel gespeichert ist, wird $T[h(k)+1]$ ausprobiert. Dies wird fortgeführt, bis der Schlüssel gespeichert wurde. Wurden alle $m$ Elemente der Hashtabelle ausprobiert, wird ein Fehler ausgegeben.

```
Einfügen(T,k)
    i = 0
    while i<m do
        j = (h(k) + i) mod m
        if T[j] < 0
        then T[j] = k
        else i = i+1
    if i=m
    then output << "Zu viele Schlüssel in der Hash-Tabelle"
```

### Suche mit Offener Adressierung
Die Suche funktioniert analog zum Einfügen und wird abgebrochen, wenn der Schlüssel gefunden wurde, alle Zellen der Hashtabelle durchsucht oder eine leere Zelle gefunden wurde. In den letzteren Fällen ist der Schlüssel nicht gespeichert.

Um zu zeigen, dass kein gültiger Wert gespeichert ist, wird in leeren Zellen $-1$ gespeichert. Dies kann man als Zustand nach der Initialisierung annehmen.

```
Suche(T,k)
    i = 0
    while i<m and T[j] != -1 do
        j = (h(k) + i) mod m
        if T[j] = k then return j
        i = i+1
    return -1
```

### Löschen mit Offener Adressierung
Da die Suche nicht abbrechen darf, wenn ein Element in $T$ gelöscht wurde, muss ein anderer Wert gespeichert werden, um die Löschung zu markieren. Dazu kann man $\mathrm{DELETED}=-2$ wählen. Das zu löschende Feld muss erst gefunden werden, dann kann es gelöscht werden.

```java
Löschen(T,k)
    i = Suche(T, k)
    if i = -1 then return -1 \\ nicht gefunden
    T[i] = -2
```

## Graphalgorithmen
### Single Source Shortest Path ($\mathrm{SSSP}$)
Gegeben seien ein Graph $G$ und ein Startknoten $s\in G$. Dann soll der Algorithmus für jeden anderen Knoten $s\neq k\in G$ den kürzesten Weg von $s$ nach $k$ berechnen.

Für ungewichtete Graphen kann dies über die Breitensuche ermittelt werden. Für gewichtete Graphen ohne negative Gewichte liefert Dijkstras Algorithmus den kürzesten Weg, für gewichtete Graphen mit negativen Gewichten kann der Bellman-Ford-Algorithmus verwendet werden.

### All Pairs Shortest Path ($\mathrm{APSP}$)
Gegeben seien ein Graph $G$. Dann soll der Algorithmus für alle Knotenpaare  $a, b\in G: a\neq b$ den kürzesten Weg von $a$ nach $b$ berechnen.

Dies kann mit dem Floyd-Warshall-Algorithmus erfolgen.

### Breitensuche ($\mathrm{BFS}$)
Sei ein Graph $G=(V,E)$ in der Adjazenzlistendarstellung dargestellt. Dann können alle von einem Startknoten $s$ ausgehenden Wege mit einer Breitensuche (_BFS_)[^32] in der Worst-Case-Laufzeit $\mathcal O(|V|+|E|)$ gesucht werden. Hierbei werden zunächst alle Nachbarn eines Knotens betrachtet, bevor diese Nachbarn bearbeitet werden.

[^32]: breadth first search

#### Technische Invariante
Allen Knoten wird eine von $3$ Farben ($\mathrm{weiß}$, $\mathrm{grau}$, $\mathrm{schwarz}$) zugewiesen. Alle noch nicht "entdeckten" Knoten sind $\mathrm{weiß}$. Wenn $u$ schwarz ist, dann sind seine adjazenten Knoten $\mathrm{grau}$ oder $\mathrm{schwarz}$. $\mathrm{Graue}$ Knoten können auch $\mathrm{weiße}$ adjazente Knoten haben.

#### Breitensuchbaum
Dazu wird ein Breitensuchbaum $\mathrm{BFS}$ erstellt. Zu Beginn der Breitensuche enthält $B$ nur einen Knoten, den Startknoten $s=\mathrm{root}[B]$.

Wird im Laufe des Algorithmus ein $\mathrm{weißer}$ Knoten $v$ entdeckt, der über die Kante $(u,v)$ entdeckt wurde, werden $(u,v)$ und $v$ dem Baum hinzugefügt. $u$ wird dabei der Vater von $v$.

#### Pseudocode
Bei der Initialisierung werdenfür jeden Knoten $u$ der Abstand $\mathrm d[u]=\infty$ zu $s$, der Vaterknoten $\pi[u]=\mathrm{pi}[u]=\mathrm{NIL}$ und die Farbe $\mathrm{color}[u]=\mathrm{weiß}$ initialisiert. Zudem wird $s$ in der Warteschlange $Q$ gespeichert.

```
BFS(G,s)
    initialisiere BFS
    while Q != {} do
        u = head[Q]
        for each v in Adj[u] do
            if color[v] = weiß
            then
                color[v] = grau
                d[v] = d[u] + 1
                pi[v] = u
                enqueue(Q,v)
        dequeue(Q)
        color[u] = schwarz
```

### Dijkstras Algorithmus
Sei $G=(V,E)$ ein gewichteter Graph in Adjazenzlistendarstellung, dessen Kanten nicht-negative Gewichte haben. Dann kann Dijkstras Algorithmus die Kürzesten Wege von einem Startknoten $s\in V$ zu allen anderen Knoten ermitteln. Dies benötigt die Laufzeit $\mathcal O([|V|+|E|]\log_2 |V|)$.

Dazu wird von $s$ ausgehend immer derjenige Knoten $u$ als nächstes betrachtet, der den kürzesten Gesamtweg hat. Für jeden benachbarten Knoten kann ein bislang kürzester Weg ermittelt werden. Danach wird der aktuelle Knoten schwarz gefärbt um zu speichern, dass der kürzeste Weg für $u$ korrekt berechnet ist.

Für den Fall, dass nur eine geringe Anzahl $W$ von ganzzahligen Gewichten $w\in\{1,\dots,W\}$ erlaubt ist, kann der Algorithmus so modifiziert werden, dass die Laufzeit $\mathcal O(W\cdot |V| + |E|)$ ist.

Zu jedem Ausführungszeitpunkt von Dijkstras Algorithmus ist für jeden Knoten $w$ die Strecke $\mathrm d[w]$ größer oder gleich dem kürzesten Weg: $\mathrm d[w] \ge \delta(s,w)$.

#### Pseudocode
Für alle Knoten $u \neq s$ wird der Weg zu diesem Knoten als $\mathrm d[u]=\infty$ initialisiert, der Weg nach $s$ als $\mathrm d[s]=0$. Alle Knoten werden mit der Farbe $\mathrm{color}[u]=\mathrm{weiß}$ initialisiert. $\mathrm{pi}[v]=\pi[v]$ verweist auf den Vaterknoten von $v$.

```
DijkstrasAlgorithmus(G, w, s)
    Initialisiere SSSP
    Q = V[G]
    while Q != {} do
        u = ExtractMin(Q)
        for each v in Adj[u] do
            if d[u] + w(u,v) < d[v] then
                d[v] = d[u] + w(u, v)
                DecreaseKey(v, d[v])
                pi[v] = u
        color[u] = schwarz
```

### Bellman-Ford-Algorithmus
Der Bellman-Ford-Algorithmus ist dazu gedacht, die Länge eines kürzesten Weges eines gewichteten Graphen $G=(V,E)$ vom Startknoten $s\in V$ aus zu berechnen, wobei Kanten $(u,v)\in E$ negative Gewichte $w(u,v)$ haben dürfen. In der hier angegebenen Beschreibung darf der Graph allerdings keine negativen Kreise haben.

#### rekursive Beschreibung
Sei $P$ ein optimaler $s$-$v$-Weg mit maximal $i$ Kanten mit $u$ als dem letzten Knoten vor $v$, dann sei $\mathrm{Opt}(i, v)$ die Länge von $P$.

 $$
    \mathrm{Opt}(i, v) =
        \begin{cases}
            \min_{(u,v)\in E}
                \{
                    \mathrm{Opt}(i-1, v),
                    \mathrm{Opt}(i-1, u) + w(u, v)
                \}
                &\Leftrightarrow i > 0 \\
             0 &\Leftrightarrow i=0 \land v=s \\
             \infty &\Leftrightarrow i=0 \land v\neq s \\
        \end{cases}
$$

Falls $i>0$ Kanten erlaubt sind, so wird zunächst die Länge des optimalen Weges mit einer Kante weniger ermittelt. Dieser kann um die Kante $(u,v)$ ergänzt werden, wenn das Gewicht der Kante $w(u,v)$ den Gesamtweg verringert. Deswegen müssen beide Wege ermittelt werden, der kürzere ist der optimale Weg.

Falls der Weg keine Kanten mehr erlaubt $(i=0)$, dann ist der optimale Weg dann $0$, wenn der Startknoten erreicht wurde, und ansonsten $\infty$.

Dieser Algorithmus benötigt eine Laufzeit in $\mathcal O(|V|^2 |E|)$ und Speicherplatz in $\mathcal O(|V|^2)$. Er kann verbessert werden, wenn zuvor Listen mit Eingangsknoten berechnet werden und nur der optimale Weg $\mathrm{d}[v]$ für jeden Knoten $v$ berechnet wird.

#### Pseudocode
Um die Performance des obigen Algorithmus zu verbessern, kann für jeden Knoten $v$ eine Liste $\mathrm{In}[v]$ mit allen eingehenden Knoten in der Laufzeit $\mathcal O(|V|+|E|)$ berechnet werden. Wenn nur noch der optimale Weg $\mathrm d[v]$ gespeichert wird, kann zudem der Speicherbedarf reduziert werden. Dann beträgt die Laufzeit $\mathcal O(|V|^2+|V|\cdot |E|)$ und den Speicherplatz $\mathcal O(|V|)$. Falls der Graph mindestens $|V|$ Kanten hat, dann beträgt die Laufzeit immer $\mathcal O(|V|\cdot |E|)$.

```
Bellman-Ford(G,s)
    \\ Initialisierung
    d = new array [1..|V|]
    for each v in V do
        d[v] = inf \\ Unendlich
    d[s]=0

    for i=1 to |V|-1 do
        for each v in V do
            for each (u,v) in In[v] do
                if d[u]+w(u,v) < d[v]
                then d[v] = d[u] + w(u,v)
    return d
```

### Floyd-Warshall-Algorithmus
Sei $G=(V,E)$ ein Graph ohne negative Kreise. Dann berechnet der Algorithmus von Floyd-Warshall die Entfernung zwischen jedem Knotenpaar in einer Laufzeit $\mathcal O(|V|^3)$.

Hierzu wird eine Adjazenzmatrix $W=(w_{ij})$ übergeben, die für jeden Knoten das Gewicht $w_{ij}$ beinhaltet. Hierbei gelten $\forall i=j: w_{ij}=0$ und $\nexists (i,j)\in E: w_{ij}=\infty$.

Da kein Knoten doppelt in einem kürzsten Weg vorkommt, kann man nur die Wege betrachten, die jeden Knoten maximal einmal enthalten. Daher kann der kürzeste Weg von $i$ nach $j$ entweder der kürzste Weg ohne einen beliebigen Knoten $k$ sein, oder der kürzeste Weg von $i$ nach $k$ zuzüglich des kürzesten Weges von $k$ nach $j$.

Sei $d_{ij}^{(k)}$ die Länge des kürzesten Weges von $i$ nach $j$, der nur die Knoten aus der Menge $\{1,\dots, k\}$ verwendet.

$$
    d_{ij}^{(k)} =
        \begin{cases}
            w_{ij} &\Leftrightarrow k=0 \\
            \min{\large \{}
                d_{ij}^{(k-1)},
                d_{ik}^{(k-1)} + d_{kj}^{(k-1)}
            {\large \}} &\Leftrightarrow k>0
        \end{cases}
$$

Dann kann der jeweils kürzeste Pfad zu allen Knoten in einer dreidimensionalen Matrix $D$ gespeichert werden. Dieser Algorithmus nutzt die Technik der dynamischen Programmierung.

```
Floyd-Warshall(W,n)
    \\ Reserviere Speicher für Felder D(k)
    D = new array[V][V][V]
    D(0) = W

    for k=1 to n do
        for i=1 to n do
            for j=1 to n do
                d[i, j, k] = min{d[i, j, k-1], d[i, k, k-1]+d[k, j, k-1]}
    return D(n)
```

### Tiefensuche ($DFS$)
Sei ein Graph $G=(V,E)$ in der Adjazenzlistendarstellung dargestellt. Dann wird in einer Tiefensuche ($DFS$)[^33] jeder Knoten in der Worst-Case-Laufzeit $\mathrm O(|V|+|E|)$ bearbeitet. DIe Tiefensuche ist rekursiv, jeder neu entdeckte Knoten $v_i$ wird unmittelbar als Ausgangspunkt einer Tiefensuche verwendet.

Erst wenn diese Tiefensuche an $v$ abgeschlossen wird, wird nach weiteren unentdeckten Nachbarn des zuvor entdeckten Knotens $v_{i-1}$ gesucht. Wird von einem Knoten $v$ aus ein Knoten $w$ entdeckt, dann werden erst alle Nachbarknoten von $w$ abgearbeitet, bevor die anderen Nachbarknoten von $v$ bearbeitet werden.

Dadurch gibt es einen Unterschied zwischen dem Entdeckungszeitpunkt $d[v]$ eines Knotens $v$ und dem Abarbeitungszeitpunkt $f[v]$, wobei $d[v]<f[v]$ und $d[v], f[v] \in [1, |V|]$ gelten. Vor $d[v]$ ist $v$ $\mathrm{weiß}$, zwischen $d[v]$ und $f[v]$ ist $v$ $\mathrm{grau}$, nach $f[v]$ ist $v$ $\mathrm{schwarz}$.

Die Tiefensuche kann beispielsweise zur Suche von starken Zusammenhangskomponenten oder für topologische Sortierungen verwendet werden.

[^33]: depth first search

#### Technische Invariante
Allen Knoten wird eine von $3$ Farben ($\mathrm{weiß}$, $\mathrm{grau}$, $\mathrm{schwarz}$) zugewiesen. Alle noch nicht "entdeckten" Knoten sind $\mathrm{weiß}$. Wenn $u$ schwarz ist, dann sind seine adjazenten Knoten $\mathrm{grau}$ oder $\mathrm{schwarz}$. $\mathrm{Graue}$ Knoten können auch $\mathrm{weiße}$ adjazente Knoten haben.

#### Klammersatz zur Tiefensuche
In jeder Tiefensuche eines gerichteten oder ungerichteten Graphen gilt für jeden Knoten $u$ und $v$ genau eine der folgenden drei Bedingungen.

* Die Intervalle $[d[u],f[u]]$ und $[d[v],f[v]]$ sind vollständig disjunkt.
* Das Intervall $[d[u],f[u]]$ ist vollständig im Interval $[d[v],f[v]]$ enthalten und $u$ ist der Nachfolger von $v$ im DFS-Wald.
* Intervall $[d[v],f[v]]$ ist vollständig im Interval $[d[u],f[u]]$ enthalten und $v$ ist Nachfolger von $u$ im DFS-Wald.

Als Korollar folgt dass ein Knoten $v$ ist genau dann echter ($u\neq v$) Nachfolger von Knoten $u$ im $DFS$-Wald von $G$, wenn $d[u]<d[v]<f[v]<f[u]$.

#### Satz vom weißen Weg
In einem $DFS$-Wald eines gerichteten oder ungerichteten Graphen $G$ ist ein Knoten $v$ genau dann ein Nachfolger des Knotens $u$, wenn $v$ zum Zeitpunkt $d[u]$ über einen Weg weißer Knoten erreicht werden kann.

#### Klassifikation von Kanten
Kanten im $DFS$-Wald werden allgemein als _Baumkanten_ bezeichnet. _Rückwärtskanten_ sind Kanten $(u,v)$, die den Knoten $u$ mit dem Vorgängerknoten $v$ verbinden. _Vorwärtskanten_ sind Kanten $(u,v)$, die keine Baumkanten sind aber $v$ mit dem Nachfolger $u$ verbinden. Alle übrigen Kanten sind _Kreuzkanten_.

Vorwärtskanten bilden eine Abkürzung von einem Knoten zu einem Nachfolger, Rückwärtskanten schließen einen Kreis. Kreuzkanten bilden Verbindungen zwischen verschiedenen Bereichen im $DFS$-Wald.

#### Pseudocode
```
DFS(G)
    for each vertex u in V do
        color[u] = weiß
        p[u] = NIL
        time = 0

    for each vertex u in V do
        if color[u] = weiß
        then DFS-Visit(u)

DFS-Visit(u)
    color[u] = grau
    time = time + 1
    d[u] = time

    for each v in Adj[u] do
        if color[v] = weiß
        then p[v] = u
        DFS-Visit(v)

    color[u] = schwarz
    time = time + 1
    f[u] = time
```



### Minimale Spannbäume
#### Kreiseliminierung
Minimale Spannbäume können berechnet werden, in denen alle Kreise aus einem Graph $G$ eliminieren. So lange es Kreise im Graphen gibt, werden Kreise gesucht, aus denen das Element mit dem größten Gewicht entfernt wird.

Dieser Algorithmus ist recht langsam, weil die Suche nach Kreisen rechenintensiv ist. Zusätzlich muss für jeden Kreis diejenige mit dem größten Gewicht identifiziert werden, auch dies kostet Zeit.

```
MST(G)
    T=G
    while T ist kein Baum do
        Finde Kreis in T
        Entferne die Kante mit maximalem Gewicht aus dem Kreis
    return T
```

#### Algorithmus von Kruskal
Der Algorithmus von Kruskal wählt Kanten aus einem Graphen aufsteigend nach Gewicht aus. Dadurch können Inseln von verbundenen Knoten entstehen, die am Ende des Algorithmus verbunden sind.

Der Algorithmus von Kruskal berechnet in der Laufzeit $\mathcal O(|E| \log_2 |E|)$ einen minimalen Spannbaum eines gewichteten, zusammenhängenden, ungerichteten Graphen $G=(V,E)$.

```
Kruskal(G)
    A = {} \\ leere Menge
    Sortiere Kanten nach Gewicht

    for each (u,v) in E geordnet nach aufsteigendem Gewicht do
        Graph H = (V,A)
        if u und v sind nicht in derselben Zusammenhangskomponente in H
        then A = A + {(u,v)} \\ Vereinigungsmenge
    return A
```

Die Zusammenhangskomponenten des durch die Kanten aus $A$ erzeugten Graphen können durch eine Union-Find-Datenstruktur dargestellt werden.

```
Kruskal(G)
    A = {} \\ leere Menge

    for each vertex v in V do
        Make-Set(v)

    Sortiere Kanten nach Gewicht

    for each (u,v) in E (geordnet nach aufsteigendem Gewicht) do
        if Find(u) != Find(v)
        then
            A = A + {(u,v)} \\ Vereinigungsmenge
            Union(u,v)
    return A
```

### Algorithmus von Prim
<!-- missing -->

