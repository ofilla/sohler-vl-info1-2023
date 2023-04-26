---
title: Übungsblatt 3
author:
    - Oliver Filla
date:
    - 19.04.2023
---
# Übungsblatt 3
## 1. Schleifeninvariante
> Betrachten Sie den folgenden Algorithmus, der als Eingabe ein Array $A = [a_1, a_2,\dots, a_n]$ der Länge $n$ mit $a_i \in\mathbb N$, $1 \le i \le n$ erhält.
> ```
> BerechneWert(A,n):
> 1.  p=0
> 2.  for i = 1 to n do
> 3.      p = p + A[i]
> 4. return p/n
> ```

### a)
> Stellen Sie eine Behauptung auf, welchen Wert der Algorithmus in Abhängigkeit des Eingabearrays berechnet.

Der Algorithmus berechnet den Mittelwert (Arithmetisches Mittel) der Werte in A.

### b)
> Formulieren Sie eine Schleifeninvariante, die zu Beginn jeder Iteration der for-Schleife (Zeilen 2 und 3) für die Variable $p$ gilt. Beweisen Sie diese mittels vollständiger Induktion.

#### Invariante
Beim $i$-ten Eintritt in den Schleifenrumpf hat $p$ den Wert der Summe der Elemente an der Position $j< i$, wobei $j\in\mathbb N_0$ auch $0$ sein kann: $p=\sum_{j=0}^{i-1} \mathrm A[j]$

#### Induktionsvoraussetzung
Für $i=1$ ist $p=0$. Die Summe aller Elemente an den Positionen vor $i$ ist $\sum_{j=0}^{0} \mathrm A[j]=0$, die Invariante gilt daher. 

#### Induktionsschritt: $i \Rightarrow i+1$
Gelte die Invariante für $i$, so gilt sie auch für $i+1$. Beweis:

* Gelte die Invariante für die Position $i$.
* Dies bedeutet, dass zwischen den Zeilen 2 und 3 $p=\sum_{j=0}^{i-1} \mathrm A[j]$ gilt.
* In Zeile 3 wird $\mathrm A[i]$ addiert, danach gilt $p=\sum_{j=0}^{i} \mathrm A[j]$.
* Am Ende des Schleifendurchlaufs wird $i$ um $1$ erhöht.
* Dann gilt wieder $p=\sum_{j=0}^{i-1} \mathrm A[j]$.
* $\mathrm{q.e.d.}$

### c)
> Verwenden Sie die Schleifeninvariante aus Aufgabenteil b), um zu zeigen, dass die Behauptung aus Aufgabenteil a) korrekt ist.

Wenn Zeile 4 erreicht wird, gilt $p=\sum_{j=0}^{i+1} \mathrm A[j]$, wobei $i=n+1$. Daher gilt $p=\sum_{j=0}^{n} \mathrm A[j]$, was die Summe aller Elemente von $\mathrm A$ ist. Der Mittelwert $\bar{A}$ wird durch die Formel $\bar{A}=\frac{1}{n}\sum_{j=0}^n \mathrm A[j]$ ermittelt. Daher gilt hier $\bar A=\frac{p}{n}$, was zurückgegeben wird. Damit ist die Korrektheit der Annahme in a) bewiesen.

## 2. Korrektheit
> Gegeben sei der folgende Algorithmus zur Berechnung der Potenz $a^b$ für zwei Zahlen $a,b\in \mathrm N_{\ge 0}$.
> ```
> Potenz(a, b):
>     if b = 0 then
>         return 1
>     return a · Potenz(a, b - 1)
> ```
> Beweisen Sie mithilfe von vollständiger Induktion die Korrektheit des Algorithmus. Zeigen Sie dazu einen Induktionsanfang für eine geignete Induktionsvariable, formulieren Sie eine Induktionsannahme und zeigen Sie unter dieser einen Induktionsschritt.

### Induktionsvoraussetzung: $b=0$
Sei $b=0$, so gilt $\mathrm{Potenz}(a,b) = 1 = a^0$.

### Induktionsschritt: $b-1\Rightarrow b$
Gelte $\mathrm{Potenz}(a, b-1) = a^{b-1}$.

$$
\begin{aligned}
    \mathrm{Potenz}(a, b) = &a\cdot \mathrm{Potenz}(a, b-1)\\
        = &a\cdot a^{b-1} \\
        = &a^b\ \mathrm{q.e.d.}
\end{aligned}
$$

## 3. Merge-Operation
> Betrachten Sie die Funktion $\mathrm{Merge}(A, p, q, r)$ aus der Vorlesung. Diese fügt die sortierten Teilarrays $\mathrm A[p..q]$ und $A[q + 1..r]$, $1 \le p \le q < r$, zum sortierten Teilarray $A[p..r]$ zusammen und soll dabei $\mathcal O(n)$ Zeitschritte benötigen, wobei $n = r - p + 1$ ist.

MergeSort:
```
MergeSort(A,p,r) \\ Sortiert A[p..r]
    if p<r then \\ Rekursionsabbruch, wenn p=r
        int q = (p+r)/2 \\ Berechne die Mitte (Gaußklammer)
        MergeSort(A,p,q) \\ Sortiere linke Teilhälfte
        MergeSort(A,q+1,r) \\ Sortiere rechte Teilhälfte
        Merge(A,p,q,r) \\ Füge die Teile zusammen
```

### a)
> Spezifizieren Sie die Merge-Funktion in Pseudocode. Geben Sie außerdem eine intuitive Erklärung zu Ihrem Pseudocode an.

```
Merge(A, left, middle, right)
    l = left \\ 1
    r = middle + 1 \\ 1
    while l <= middle and r <= right \\ t_n+1
        x = A[left + i] \\ t_n
        y = A[middle + 1 + i] \\ t_n
        if x < y then l = l+1 \\ t_n
        else \\ t_n
            A[left + i] = y \\ t_n
            A[middle + 1 + i] = x \\ t_n
        r = r+1 \\ t_n
```

Es funktioniert allerdings nicht. Aus Zeitgründen aufgehört.

### b)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.

```
Merge(A, left, middle, right)
    l = left \\ 1
    r = middle + 1 \\ 1
    while l <= middle and r <= right \\ t_n+1
        x = A[left + i] \\ t_n
        y = A[middle + 1 + i] \\ t_n
        if x < y then l = l+1 \\ t_n
        else \\ t_n
            A[left + i] = y \\ t_n
            A[middle + 1 + i] = x \\ t_n
        r = r+1 \\ t_n
```

$$
\begin{aligned}
    t_n =\ &\mathrm{middle}-\mathrm{left}+1 + \mathrm{right}-\mathrm{middle}+1 \\
    =\ &\mathrm{right} - \mathrm{left} + 2 \\
    =\ &n+2 \\
    t_n \in\ &\mathrm{O}(n)
\end{aligned}
$$

## 4. Teile & Herrsche
> Gegeben sei ein Feld $A$ mit $n$ natürlichen Zahlen. Entwickeln Sie einen rekursiven Teile-und-Herrsche-Algorithmus, der für die Eingabe $A$ die Anzahl der gerade Zahlen in $A$ berechnet. Geben Sie ihren Algorithmus in Pseudocode an und kommentieren Sie diesen.

```
CountEven(A, first, last)  \\ erster Aufruf: CountEven(A, 1, n)
    if first = last \\ einzelnes Element
        if first is even
        then return 1 \\ gerade: zähle dieses Element
        else return 0 \\ ungerade: ignoriere dieses Element
    else \\ nicht notwendig
        \\ gaussklammer: finde das mittlere Element (eher das linke)
        q = gaussklammer((first+last)/2)
        l = CountEven(A, first, q) \\ zähle in linker Hälfte
        r = CountEven(A, q+1, last) \\ zähle in rechter Hälfte
        return l + r \\ beide Hälften zusammen ergeben vollständige Zählung
```
