---
title: Übungsblatt 7
author:
    - Oliver Filla
date:
    - 24.05.2023
---
# Übungsblatt 7
## 1. Dynamische Programmierung
> Bob hat Angst vor dem Klimawandel und betrachtet die Höchsttemperaturen der letzten Jahre. Er möchte die steigende Tendenz der Temperaturen beobachten. Einige kalte Zeiten dazwischen interessieren nicht, da die Tendenz für Bob interessant ist.

> Dafür notiert er die Temperaturen in zeitlicher Reihenfolge in einem Array $A = [a_1 ,\dots, a_l]$. Darin sucht er nach einer längsten aufsteigenden Teilsequenz. Dies ist eine Teilsequenz mit maximaler Länge, deren Elemente  aufsteigend sortiert sind. Dabei muss die Sequenz nicht zusammenhängend sein.

Die Aufgabenstellung wird insofern interpretiert, dass die Sequenz nicht monoton steigen muss.

### a)
> Es bezeichne $T (i)$ die Länge der längsten aufsteigenden Teilfolge im Teilarray $A = [a_1 ,\dots, a_l]$, $1 \le i \le l$. Geben Sie eine Rekursionsgleichung für $T (i)$ an und erklären Sie diese.

$$
T(i) =
    \begin{cases}
        1 &: i=1 \\
        T(i-1) &: i>1 \forall j<i: A[i] \le A[j] \\
        T(j) + i-j &: i>1\land \exists j<i: A[i] > A[j]
    \end{cases}
$$

1. Falls nur ein Feld betrachtet wird ist die Lösung trivial.
2. Falls das letzte Element kleiner oder gleich aller vorherigen Elemente ist, ist die längste Teilsequenz identisch mit dem der längsten Teilsequenz für $(i-1)$.
3. Falls das $i$-te Element das bislang größte Element ist, muss die längste aufsteigene Teilsequenz auf bis zur Stelle $i$ erweitert werden. Sei $j$ die Position des bisherigen Maximums, dann wird die Teilsequenz von $T(j)$ um $i-j$ Elemente erweitert.

### b)
> Entwerfen Sie basierend auf der Rekursionsgleichung aus a) einen Algorithmus in Pseudocode, der mit dynamischer Programmierung bei Eingabe eines Arrays $A = [a_1 ,\dots, a_l]$ die Länge einer längsten aufsteigenden Teilsequenz ausgibt. Kommentieren Sie Ihren Algorithmus mit Bezug zu Ihrer Rekursionsgleichung aus a).


```
PartialSequence(A, n)
01.    S = new array[1..n]
02.    S[1] = 1 \\ Fall 1.
03.    cur_max_pos = 1 \\ Position des bisherigen Maximums
04.    for i=2 to n do
05.        if A[i] > A[cur_max_pos]
06.        then \\ neues Maximum gefunden
07.            S[i] = S[cur_max_pos] + i-cur_max_pos \\ Fall 3.
08.            cur_max_pos = i
09.         else \\ kein neues Maximum
10.            S[i] = S[j] \\ Fall 2.
11.    return S[n]
```

### c)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.

```
PartialSequence(A, n)
    S = new array[1..n] \\ O(n)
    S[1] = 1 \\ 1
    cur_max_pos = 1 \\ 1
    for i=2 to n do \\ O(n)
        if A[i] > A[cur_max_pos] \\ O(n)
        then \\ neues Maximum gefunden
            S[i] = S[cur_max_pos] + i-cur_max_pos \\ O(n)
            cur_max_pos = i \\ O(n)
        else S[i] = S[j] \\ Fall 2.
    return S[n] \\ O(1)
```

$$
    T(n) = \mathcal O(n)
$$

### d)
> Beweisen Sie die Korrektheit Ihres Algorithmus mithilfe einer Schleifeninvariante.

Im letzten Schleifendurchlauf gilt $i=n$. Danach wird $i$ um eins erhöht, bevor die Schleife abgebrochen wird. Demnach gilt in Zeile $11$ $i+1=n-1$. Wenn die Schleifeninvariante $S[i-1] = T(i)$ gilt, gilt in Zeile $11$ $S[i-1]=S[n]=T(n)$. Dann ist der Algorithmus korrekt.

#### 1. $j<i$
In Zeile $3$ wird $j=1$ initialisiert, beim ersten Eintritt in die Schleife gilt $i=2>j$.
Nur in Zeile $8$ kann im $i$-ten Durchlauf $j=i$ gesetzt werden. Daher gilt beim $(i+1)$-ten Durchlauf der Schleife $i+1>i=j$.

#### 2. $A[j] = \max\{A[1..i-1\}$
##### Induktionsanfang
In den Zeilen $2$ und $3$ werden $j$ und $S[1]$ gesetzt. Für ein einelementiges Feld enthält das erste Feld die Länge des längsten wachsenden Teilfeldes, das die Länge $1$ hat. Da beim ersten Eintritt in die Schleife $i=2$ und $j=1$ gelten, gilt die Invariante.

##### Induktionsannahme
Für $i-1$ gilt die Invariante. Es ist zu zeigen, dass die Invariante auch nach dem $i$-ten Schleifendurchlauf gilt.

##### Induktionsschritt
Nach Induktionsannahme enthält $A[j]$ beim $i$-ten Eintritt in die Schleife die Länge des längsten wachsenden Teilfeldes bis zur Position $i-1$. Falls der Wert an der Stelle $i$ größer ist (Zeile $5$), wird $j=i$ gesetzt (Zeile $8$). Damit enthält $A[j]$ nun die Länge des längsten wachsenden Teilfeldes bis zur Position $i$. Beim nächsten Eintritt in die Schleife ist der Index $i+1$, nun beschreibt $A[j]$ die Länge des längsten wachsenden Teilfeldes bis zur Position $i$. Damit ist die Invariante erfüllt.

#### 3. $S[i-1] = T(i)$
##### Induktionsanfang
Beim ersten Eintritt in die Schleife gelten $i=2$ und $j=1$. Falls $A[2]>A[1]$ (Zeile $5$) wird der Wert $1+2-1=2$ in $S[2]$ gespeichert. Dies entspricht der Länge des längsten wachsenden Teilfeldes in diesem Fall. Ansonsten wird der Wert $1$ in $S[2]$ gespeichert, was ein einelementiges wachsendes Teilfeld beschreibt. Beim zweiten Eintritt in den Schleifenrumpf gilt $i=3$ und $S[2]$ enthält die Länge des längsten wachsenden Teilfeldes. Damit gilt an der Stelle $S[i-1] = T(i)$.

##### Induktionsannahme
Gelte $S[i-1]=T(i)$. Es ist zu zeigen, dass die Invariante auch nach dem $i$-ten Schleifendurchlauf gilt.

##### Induktionsschritt
Beim $i$-ten Eintritt in die Schleife gilt nach Induktionsannahme $S[i-1]=T(i)$. Zudem enthält $A[j]$ die Länge des längsten wachsenden Teilfeldes.

Wenn $A[i]>A[j]$ gilt, muss das längste aufsteigene Teilfeld bis zur Stelle $i$ erweitert werden. Die bisherige Länge $S[j]$ wird um $i-j$ Felder ergänzt, was durch die Summe $S[j]+i-j$ dargestellt wird (Zeile $7$). Dann wird die neue Position des Maximums abgespeichert (Zeile $8$).

Wenn $A[i]\le A[j]$ darf das längste aufsteigene Teilfeld nicht erweitert werden. In diesem Fall gilt $T(i)=T(i-1)$, was an der Stelle $S[i]$ gespeichert wird (Zeile $10$).

Beim nächsten Eintritt ist der Index auf $i+1$ erhöht worden. Es gilt also $S[i-1]=T(i)$.

### e)
> Geben Sie nun einen Algorithmus in Pseudocode an, der die in b) berechnete Lösung rekonstruiert und eine längste aufsteigende Teilsequenz ausgibt. Wandeln Sie dafür Ihren Algorithmus aus b) ab, indem Sie statt der Länge die Teilsequenz zurück geben. Erklären oder kommentieren Sie Ihren Algorithmus.

Gebe die Funktion $\mathrm{PartialSequence}(A, n)$ in Zeile $11$ das berechnete Feld $S$ anstelle dessen letzten Elementes zurück. Im Folgenden stellt $P=\{\dots\}$ eine Menge dar und $P+\{\dots\}$ die Vereinigungsmenge $P\cup \{\dots\}$.

```
PartialSequencePath(S, n)
    path = {}
    current_length = 1 \\ Initalisierung
    for i=2 to n do
        \\ Falls die Länge an dieser Stelle erhöht wurde
        \\ dann wurde dieses Element zur Teilsequenz hinzugefügt
        if S[i] > current_length
        then
            path = path + {i}
            current_length = S[current_length]
    return path
```

## Dynamische Programmierung
> Seien $x = (x_1, \dots, x_m) \in \{0, 1\}^m$ und $y = (y_1, \dots, y_n) \in \{0, 1\}^n$ zwei Bitstrings. Die Editierdistanz zwischen $x$ und $y$ sei definiert als die minimale Anzahl der Operationen, um $x$ in $y$ umzuwandeln: ein Bit einfügen, ein Bit löschen, eine 0 in eine 1 umwandeln oder umgekehrt eine 1 in eine 0 umwandeln.

### a)
> Geben Sie eine Rekursionsgleichung $E(i, j)$ zur Berechnung der Editierdistanz zwischen $(x_1 , \dots, x_i)$ und $(y_1, \dots, y_j)$, $1 \le i \le m, 1 \le j \le n$, an und erklären Sie diese.
> _Hinweis_: _Betrachten Sie die aktuellen Bits_ $x_i$ _und_ $y_j$ .

$$
E(i,j) =
    \begin{cases}
        0 &: i=j=0 \\
        i+j &: i=0 \dot{\lor} j=0 \\
        E(i-1, j-1) + |x_i - y_j| &: i>0 \land j>0 \\
    \end{cases}
$$

1. Falls wenigstens beide Bitstrings die Länge $0$ haben, muss keine Änderung vorgenommen werden.
2. Falls genau einer der beiden Bitstrings die Länge $0$ hat, muss für jedes fehlende Element eingefügt / gelöscht werden. Die Anzahl der Operationen ist $i+j$, da einer der beiden Werte die Differenzlänge angibt und der andere $0$ ist.
3. Die Editierdistanz für zwei nicht-leere Bitstrings ist die Editierdistanz für um ein Element kürzere Bitstrings. Genau dann wenn die letzten Elemente gleich sind, kommt eine weitere Änderung dazu. Dies kann durch die Formel $x_i-y_j$ beschrieben werden.

### b)
> Zeigen Sie die Korrektheit der Rekursionsgleichung aus a).

#### Induktionsvoraussetzung
##### 1. $i=j=0$
Sei $i=j=0$. Dann sind beide Bitstrings identisch. Es gilt $E(0,0)=0$, was die Editierdistanz für identische Bitstrings beschreibt.

##### 2. $i=0 \dot{\lor} j=0$
Ohne Beschränkung der Allgemeinheit sei $i=0$ und $j>0$. Dann ist der Bitstring $x$ um $j$ Elemente kürzer als der Bitstring $y$. Es müssen demnach $j$ Elemente in $x$ eingefügt werden oder $j$ Elemente aus $y$ entfernt werden, um identische Bitstrings zu erhalten. Es gilt $E(0, j) = 0+j = j$, was diese Editierdistanz beschreibt.

#### Induktionsannahme
Berechne $E(i-1,j-1)$ die korrekte Editierdistanz für zwei Bitstrings der Längen $i-1$ und $j-1$.
Es ist zu zeigen, dass $E(i, j)$ die korrekte Editierdistanz für zwei Bitstrings der Längen $i$ und $j$ berechnet

#### Induktionsschritt
Falls $x_i = y_j$ gibt es keine Änderung für die letzten Elemente, also müssen $x_i-y_j=0$ Änderungen an dem letzten Element des manipulierten Bitstrings vorgenommen werden. Falls $x_i\neq y_j$ muss stattdessen eine Änderung vorgenommen werden. Da $x_i,y_j\in\{0,1\}$ gilt $x_i-y_j=\pm 1$, daher gilt $|x_i-y_j|=1$.

Daher müssen für das nur letzte Element $|x_i-y_j|$ Änderungen vorgenommen werden. Für alle bisherigen Elemente müssen nach Induktionsannahme $E(i-1,j-1)$ Änderungen vorgenommen werden. Die Gesamtzahl der Änderungen liegt demnach bei $E(i,j)=E(i-1,j-1)+|x_i-y_j|$, was zu beweisen war.

### c)
> Entwerfen Sie mithilfe der Rekursionsgleichung aus a) einen Algorithmus in Pseudocode, der mit dynamischer Programmierung bei Eingabe zweier Arrays $X = [x_1, \dots, x_m]$ und $Y = [y_1, \dots, y_n]$ mit Einträgen in ${0, 1}$ die Editierdistanz zwischen den Bitstrings $x$ und $y$ ausgibt. Kommentieren Sie Ihren Algorithmus mit Bezug zu Ihrer Rekursionsgleichung aus a).

```
EditDistance(x, y, n, m)
    S = new array[0..n][0..m]

    S[0][0] = 0 \\ i = j = 0

    for i=1 to n do \\ i>0 & j=0
        S[i][0] = i

    for j=1 to n do \\ i=0 & j>0
        S[0][j] = j

    for i=1 to n do
        for j=1 to m do
            effort_this_element = |x[i] - y[j]| \\ Betrag der Differenz
            S[i][j] = S[i-1][j-1] + effort_this_element
```

### d)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.

```
EditDistance(x, y, n, m)
    S = new array[0..n][0..m] \\ O((n+1)*(m+1))

    S[0][0] = 0 \\ i = j = 0 \\ O(1)

    for i=1 to n do \\ O(n+1)
        S[i][0] = i \\ O(n)

    for j=1 to m do \\ O(m+1)
        S[0][j] = j \\ O(m)

    for i=1 to n do \\ O(n+1)
        for j=1 to m do \\ O((n)*(m+1))
            effort_this_element = |x[i] - y[j]| \\ O(n*m)
            S[i][j] = S[i-1][j-1] + effort_this_element \\ O(n*m)
```

Der am stärksten wachsende Term ist $\mathcal O((n+1)(m+1))$ in Zeile $1$. Es gelten $(n+1)(m+1)=mn + m + n + 1$ sowie $\mathcal O(mn + m + n + 1) \subseteq \mathcal O(mn)$. Dies entspricht der Laufzeit in den letzten beiden Zeilen.

$$
    T(n) \in O(mn)
$$
