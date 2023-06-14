---
title: Übungsblatt 4
author:
    - Oliver Filla
date:
    - 03.05.2023
---
# Übungsblatt 4
## 1. Binäre Suche
> Betrachten Sie das folgende Feld von Zahlen:
> 
> $A = [6, 3, 36, 99, 2, 39, 12, 45, 23, 17, 24]$
> 
> Strukturieren Sie die Elemente in dem Feld um, sodass Binäre Suche anwendbar ist.
> 
> Führen Sie anschließend die aus der Vorlesung bekannte Methode $\mathrm{BinäreSuche}(A,12,1,11)$ aus, um in dem Feld $A[1, \dots , 11]$ nach dem Wert $12$ zu suchen und geben Sie die Ausgabe, sowie die besuchten Teilfelder des Algorithmus an.

Pseudocode der Suchfunktion:
```
BinäreSuche(A,x,p,r) \\ Finde Zahl x in sortiertem Feld A[p..r]
    if p=r then return p \\ sofern vorhanden
    else \\ Ausgabe: Index der gesuchten Zahl
    int q = (p+r)/2 \\ Berechne die Mitte (Gaußklammer)
    if x <= A[q] then return BinäreSuche(A,x,p,q)
    else return BinäreSuche(A,x,q+1,r)
```

### a) Strukturiere A
$A$ muss aufsteigend sortiert sein, sieht sortiert also folgendermaßen aus:
$$
A = [2, 3, 6, 12, 17, 23, 24, 36, 39, 45, 99]
$$

### b) Suche $12$
```
A = [6, 3, 36, 99, 2, 39, 12, 45, 23, 17, 24]$
sortiere(A)
BinäreSuche(A,12,1,11)
```

* Rückgabewert: $4$
* Besuchte Felder:
    1. Feld $6$, Wert $23$
    2. Feld $3$, Wert $6$
    3. Feld $5$, Wert $17$
    4. Feld $4$, Wert $12$

## 2. Teile und Herrsche
> Gegeben sei ein aufsteigend sortiertes Feld A aus n natürlichen Zahlen. Bei der Übertragung des Feldes ist ein Fehler unterlaufen. Die Diagnose des Fehlers besagt, dass es nach der Übertragung maximal einen Wert gibt, welcher verfälscht wurde. Dies bedeutet, dass die betroffene Stelle des Feldes einen größeren Wert als ursprünglich haben kann. Dadurch kann es sein, dass das Feld nach der Übertragung nicht mehr aufsteigend sortiert ist. Also kann binäre Suche auf dem Feld nicht mehr angewandt werden.
> 
> Trotz dieses Fehlers sollen aber alle unverfälschten Werte von Feld $A$ in Laufzeit $\mathcal O(\log n)$ gesucht werden können.

### a) Algorithmus
> Entwickeln Sie einen Teile-und-Herrsche-Algorithmus, welcher das Feld $A$, dessen Länge $n$ und eine natürliche Zahl $x$ bekommt, und in Laufzeit $\mathcal O(\log n)$ die Position von $x$ im Feld $A$ zurückgibt, sofern $x$ ein unverfälschter Wert ist. Sollte $x$ durch den Übertragungsfehler in $A$ entstanden sein, kann der Algorithmus in Laufzeit $\mathcal O(\log n)$ $\mathcal O(\log n)$ die Position von $x$ ausgeben, oder einen Fehler ausgeben.

Anpassungsidee:

* Betrachte immer die beiden mittleren Werte, statt eines einzelnen. Falls der vordere größer ist als der erste, liegt hier der Vertauschungsfehler vor.
* Falls der Übertragungsfehler $x$ erzeugt hat, kann sofort ein Fehler zurückgegeben werden.
* Ansonsten muss die zweite der mittleren Stellen verwendet werden, um weiterhin binär zu suchen. Auf diese Weise ist der Korrekte der beiden mittleren Werte für den Vergleich herangezogen worden.

```
01. Search(A,x,l,r)
02.     if l=r
03.     then
04.         if A[l]=x
05.         then return l
06.         else return NIL

07.     m = gauss((l+r)/2) \\ Berechne die Mitte (Gaußklammer)
08.     if A[m] > A[m+1] \\ Übertragungsfehler bei m
09.         if A[m] = x then return NIL \\ gefunden, sollte aber nicht da sein
            \\ x < A[m+1] sinnvoller, dann kann man A[l..m-1] betrachten
10.         if x <= A[m+1]
12.         then return Search(A,x,l,m+1)
13.         else return Search(A,x,m+2,r)

14.     if x <= A[m]
15.     then return Search(A,x,l,m)
16.     else return Search(A,x,m+1,r)
```

Offizielle Lösung. Betrachte, ob das Element verfälscht wurde, d.h. der Fehler kann einen Wert vergrößern oder verkleinern.
```
Search(A,x,l,r)
    n = r-l+1 \\ Anzahl der hier betrachteten Elemente
    if n<=3
    then \\ konstante Worst-Case-Laufzeit
        \\ prüfe, ob x enthalten ist
        for i=l to r do
            if A[i] = x then return i
        return NIL \\ Fehler
    \\ ab hier gilt n>=4

    m = gauss((r+l)/2) \\ gaussklammer
    if A[m-1] > A[m] then m = m+1 \\ Wert wurde verkleinert
    if A[m] > A[m+1] then m = m-1 \\ Wert wurde vergrößert

    if A[m] <= x
    then return Search(A,x,m+1,r)
    else return Search(A,x,l,m)
```

### b) Laufzeit
> Beginnen Sie die Laufzeitanalyse Ihres Algorithmus, indem Sie eine Rekursionsgleichung für die Laufzeit herleiten und angeben.

* $n=1$: Zeilen 2-6 werden ausgeführt, daher $T(1) = 3$
* $n>1$:
    * Zeile 2: $1$
    * Zeile 7: $1$
    * Zeile $8$: 1
    * Zeile 9: worst case ist _nicht gefunden_, daher $1$ (ansonsten bricht die Rekursion ab)
    * Zeile 10 oder Zeile 14: $1$
    * Zeilen 12, 13, 15, 16: Genau ein Funktionsaufruf wird ausgeführt, jeder hat $T(\frac{n}{2})$

$$
\begin{aligned}
    T(n) &=
        \begin{cases}
            n=1: & 3 \\
            n>1: & T(\frac{n}{2}) + 6
        \end{cases} \\
    \Rightarrow T(n) &\in \mathcal O(\log_2(n))
\end{aligned}
$$

### c) Korrektheit
> Beweisen Sie die Korrektheit Ihres Algorithmus.

Bessere Idee: Definiere $n=r-l+1$ und beweise für $n$.

### Induktionsanfang
Sei $l=r$. Dann wird die Position $l$ zurückgegeben, falls an der Stelle der Wert $x$ im Feld steht; in diesem Fall wurde $x$ gefunden. Ansonsten wird $\mathrm{NIL}$ zurückgegeben, da $x$ nicht gefunden wurde. Damit stimmt das Ergebnis der Methode $\mathrm{Search}(A, x, l, r)$ für $l=r$.

### Induktionsannahme
Gebe $\mathrm{Search}(A, x, l, r)$ den richtigen Wert für das linken oder rechten Teilfeld $A$ zurück. Dies heißt insbesonde, dass entweder $l$ oder $r$ die Mitte $\frac{l+r}{2}\pm 1$ beschreiben müssen.

### Induktionsschritt
* Sei $l<r$. Dann beschreibt $m=\lbrack\frac{l+r}{2}\rbrack$ die mittlere Stelle und $m+1$ die darauf folgende Stelle des noch zu durchsuchenden Feldes.
* Das Feld ist i.A. sortiert, es gibt nur einen möglichen Fehler. Wenn nun $A[m]>A[m+1]$, so haben wir an der Stelle $m$ den Fehler. Damit gibt es im Rest des Feldes keine Fehler.
    * Falls $x=A[m]$, so wurde ein $x$ gefunden, dass nicht existieren sollte. Dies ist ein Fehlerzustand, daher ist der Rückgabewert $\mathrm{NIL}$ korrekt.
    * Falls $x<A[m+1]$, so ist $x$ aufgrund der Sortierung von $A$ im Bereich $A[l..m+1]$. Dann liefert $\mathrm{Search}(A, x, l, m+1)$ nach Induktionsannahme den richtigen Wert zurück.
    * Falls $x\ge A[m+1]$, so ist $x$ aufgrund der Sortierung von $A$ im Bereich $A[m+2..r]$. Dann liefert $\mathrm{Search}(A, x, l, m+2)$ nach Induktionsannahme den richtigen Wert zurück.
* Falls es an der Stelle $m$ keinen nachweisbaren Fehler gibt, ist das Feld an dieser Stelle korrekt sortiert.
    * Falls $x<A[m]$, so ist $x$ aufgrund der Sortierung von $A$ im Bereich $A[l..m]$. Dann liefert $\mathrm{Search}(A, x, l, m)$ nach Induktionsannahme den richtigen Wert zurück.
    * Falls $x\ge A[m+1]$, so ist $x$ aufgrund der Sortierung von $A$ im Bereich $A[m+1..r]$. Dann liefert $\mathrm{Search}(A, x, l, m+1)$ nach Induktionsannahme den richtigen Wert zurück.

## 3. Rekursionsgleichungen
> Geben Sie für die folgenden Rekursionsgleichungen eine möglichst einfache und langsam wachsene Funktion $g(n)$ an, sodass $T(n)\in\mathcal O(g(n))$ ist.
> Gehen Sie dabei wie folgt vor:
> Lösen Sie die Rekursionsgleichungen auf, um eine nicht rekursive Funktion zu erhalten, welche die Laufzeit in Abhängikeit von $n$ beschreibt und beweisen Sie deren Korrektheit mittels Induktion. Drücken Sie nun Ihre bewiesene Funktion durch $\mathcal O$-Notation aus.

### a)
> $T(n) = \begin{cases}1 & n=1 \\1\cdot T(\frac{n}{4}) + 4& \text{sonst}\end{cases}$

Laufzeit:
$$
\begin{aligned}
    T(n)
        &= T\left(\frac{n}{2}\right) + 4 \\
        &= T\left(\frac{n}{4}\right) + 8 \\
        &= T\left(\frac{n}{8}\right) + 13 \\
        &= \dots \\
      \text{Rekursionstiefe } t \Rightarrow
          T(n) &= T\left(\frac{n}{2^t}\right) + 4t \\
      t = \log_4(n) \Rightarrow
          T(n) &= T\left(\frac{n}{2^{\log_4(n)}}\right) + 4\log_4(n) \\
      \Rightarrow T(n) &= 1 + 4\log_4(n) \\
\end{aligned}
$$

#### Induktionsannahme
Für $n=1$ gilt $T(n=1) = 1 + 4\log_4(1) = 1 = T(1)$.

#### Induktionsvoraussetzung
Sei $n$ eine Viererpotenz und gelte $T(n) = 1+4\log_4(n)$.

#### Induktionsschritt
Zeige, dass $T(4n)$ gilt.
$$
\begin{aligned}
    T(4n)
        &= \left[1+4\log_4\left(\frac{4n}{4}\right)\right] + 4 \\
        &= 5 + 4(\log_4(n) - \log_4(4)) \\
        &= 5 + 4\log_4(n) - 4 \\
        &= 1 + 4\log_4(n) \\
        & \mathrm{q.e.d.}
\end{aligned}
$$

Damit gilt $T(n) \in\mathcal O(log_4(n))$.

### b)
> $T(n) = \begin{cases}1 & n=1 \\2\cdot T(\frac{n}{2}) + n^2& \text{sonst}\end{cases}$

Laufzeit:
$$
\begin{aligned}
    T(n)
        &= \sum_{i=0}^{t-1} 2^i T\left(\frac{n}{2^i}\right) + tn^2 \\
        &= 2^t\cdot T\left(\frac{n}{2^t}\right)
            + \sum_{i=0}^{t-1} 2^i \left(\frac{n}{2^i}\right)^2 \\
        &= 2^t\cdot T\left(\frac{n}{2^t}\right)
            + n^2\sum_{i=0}^{t-1} \frac{1}{2^i} \\
     t = \log_2(n) \Rightarrow T(n)
         &= 2^{\log_2(n)} T(1) + n^2\sum_{i=0}^{\log_2(n)-1} \frac{1}{2^i} \\
         &= 1 + n^2(2-\frac{2}{n}) \\
         &= n + 2n^2-2n \\
     T(n) &= 2n^2 - n
\end{aligned}
$$

Behauptung: $T(n)\in\mathcal O(n^2)$

#### Induktionsvoraussetzung
Sei $c>2$ konstant. Wir beweisen für Zweierpotenzen $n$.

$$
    T(1) = 1 \le c\cdot 1^2 \Rightarrow T(1) \in \mathcal O(n^2)
$$

#### Induktionsannahme
Gelte $T(n) = c\cdot n^2$.

#### Induktionsschritt
Zu zeigen ist $T(2n) \le c\cdot (2n)^2 = 4cn^2$.
$$
\begin{aligned}
    T(2n) &= T(n) + (2n)^2 \\
        &= cn^2 + 4n^2 \\
        &= (c+4)n^2 \le 4cn^2 \\
    \Leftrightarrow c+4 &\le 4c \\
    \Leftrightarrow 4 &\le 3c \\
    \Leftrightarrow \frac{4}{3} &\le c \\
\end{aligned}
$$

Für $c=2$ ist dies gelöst.

### c)
> $T(n) = \begin{cases}1 & n=1 \\3\cdot T(\frac{n}{2}) + n& \text{sonst}\end{cases}$

$$
    T(n) = 3^3 T\left(\frac{n}{3^3}\right) + 3n \\
    = 3^{\log_3(n)} \cdot T\left(\frac{n}{3^{\log_3(n)}}\right) + n\log_3(n) \\
    = n + n\log_3(n)
$$

Behauptung: $T(n)\in\mathcal O(n\log_3(n))$.
Beweis mittels vollständiger Induktion, analog zu a) und b).

### Appendix: Rekursionstiefe
Sei $T(n) = aT(\frac{n}{b}) + f(n)$. Dann gilt: Die Rekursionstiefe ist $\log_b(n)$. Beweis:

Auf der tiefsten Rekursionsebene ist das Array in Blöcke der Größe $1$ unterteilt. Je Ebene wird in $b$ Teile unterteilt, daher gibt es in der $x$-ten Rekursionsebene $b^x$ Teilarrays. Damit diese die Länge 1 haben, muss gelten $\frac{n}{b^x}= 1$. Falls $n$ eine Potenz von $b$ ist, gilt Gleichheit, ansonsten muss es weniger Teilarrays geben. Dies ist äquivalent zu $n=b^x$ und dies zu $\log_b(n)=x$. Daher muss es $x$ Rekursionsebenen geben, damit alle Teilarrays die Länge $1$ haben. Dies bedeutet, die Rekursionstiefe ist $\log_b(n)$.
