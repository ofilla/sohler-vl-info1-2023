---
title: Übungsblatt 5
author:
    - Oliver Filla
date:
    - 10.05.2023
---
# Übungsblatt 5
## 1. Mastertheorem
> Verwenden Sie das Master-Theorem, um für die folgenden Rekursionsgleichungen asymptotische Schranken anzugeben.

### a)
> $T(n) = \begin{cases}12 & n=1 \\2\cdot T(\frac{n}{2}) + 12& \text{sonst}\end{cases}$

$$
\begin{aligned}
    f(n) &= 12 \\
    f\left(\frac{n}{b}\right) &= 12 \\
    \exists 1>\gamma=\frac{1}{2}: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma\cdot 12\cdot2 &\leq 12 = f(n)
\end{aligned}
$$

Daher ist Teil $3$ vom Mastertheorem erfüllt. Daraus folgt:
$$
    T(n) \in\mathcal O(2^{\log_{2}(n)}) = \mathcal O(n)
$$

### b)
> $T(n) = \begin{cases}1 & n=1 \\1\cdot T(\frac{n}{3}) + n^3& \text{sonst}\end{cases}$

$$
\begin{aligned}
    f(n) &= n^3 \\
    f\left(\frac{n}{b}\right) &= \frac{n^3}{3^3} \\
    \exists 1<\gamma= 3^3: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma \frac{n^3}{3^3} &\leq n^3 = f(n)
\end{aligned}
$$

Daher ist Teil $2$ vom Mastertheorem erfüllt. Daraus folgt:
$$
    T(n) \in\mathcal O(n^3)
$$


### c)
> $T(n) = \begin{cases}1 & n=1 \\1\cdot T(\frac{n}{2}) + n& \text{sonst}\end{cases}$

$$
\begin{aligned}
    f(n) &= n \\
    f\left(\frac{n}{b}\right) &= \frac{n}{2} \\
    \exists 1<\gamma=2: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma \frac{n}{2} &\geq n = f(n)
\end{aligned}
$$

Daher ist Teil $2$ vom Mastertheorem erfüllt. Daraus folgt:
$$
    T(n) \in\mathcal O(n)
$$

### d)
> $T(n) = \begin{cases}1 & n=1 \\2\cdot T(\frac{n}{4}) + \sqrt{n}& \text{sonst}\end{cases}$

$$
\begin{aligned}
    f(n) &= \sqrt{n} \\
    f\left(\frac{n}{b}\right) &= \frac{\sqrt{n}}{2} \\
    \exists \gamma=1: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma \frac{n}{2} &\leq n = f(n)
\end{aligned}
$$

Daher ist Teil $1$ vom Mastertheorem erfüllt. Daraus folgt:
$$
    T(n) \in\mathcal O(\sqrt{n}\log_2n)
$$


## 2. Teile und Herrsche
> Wir betrachten den Aktienkurs der Firma Informatik AG. Der Wert einer Aktie über $n$ Zeiteinheiten wird dabei in dem Array $A$ gespeichert. Wir möchten wissen zu welchen Zeiten wir die Aktie kaufen und verkaufen sollten, um den maximalen Gewinn zu erziehlen.
> Kauf und Verkauf dürfen dabei aber nur einmal passieren.
> Formal ist also ein Array $A[1..n]$ von positiven ganzen Zahlen gegeben und wir wollen die größte Wertdifferenz $A[i] − A[j]$ für $j \le i$ bestimmen.

### a)
> Betrachten Sie zwei benachbarte Teilarrays $A[i..j]$ und $A[j + 1..l]$ mit $1 \le i \le j < l \le n$. Welche Informationen über die Teilarrays werden benötigt, um die maximale Differenz zweier Elemente in $A[i..l]$ in konstanter Zeit zu berechnen? Erklären Sie auch wie diese Berechnung funktioniert.

Es wird von beiden Teilarrays die Position von den jeweiligen globalen Minima und Maxima benötigt. Dann können die jeweiligen Differenzen verglichen werden. Hier gibt es mehrere Fälle: Die Differenz in einem der Teilarrays die größte Differenz sein, oder das die Differenz von dem linken Minimum (an einer Position $i_-\le j$) und dem rechten Maximum (an einer Position nach $i_+\ge j+1$) kann am größten sein.

In jedem dieser Fälle muss jedoch sichergestellt werden, dass das Minimum vor dem Maximum kommt, ansonsten ist es für unseren Gewinn irrelevant. Dies ist für die Differenz aus dem linken Minimum und dem rechten Maximum immer gegeben.

### b)
> Entwickeln Sie einen Teile-und-Herrsche-Algorithmus, der Ihre Überlegungen aus Aufgabenteil a) verwendet, um die größte Wertdifferenz zu berechnen. Geben Sie eine Implementierung Ihres Algorithmus in Pseudocode an und kommentieren Sie diesen. Für die volle Punktzahl wird ein Algorithmus erwartet, dessen Worst-Case-Laufzeit durch $\mathcal O(n)$ beschränkt ist.

Erster Aufruf für ein Feld $A$ der Länge $n$: $\mathrm{maxProfit(A,1,n)}$. Die Rückgabe bzw. Zuordnung von mehreren Variablen erfolgt über einen geeigneten Verbunddatentyp. Dies könnte in Python ein _Tupel_ sein, die Laufzeit wird dadurch nur durch einen konstanten Faktor verändert.

```
\\ finde die Positionen maximalen Differenz im Intervall A[left..right]
maxProfit(A, left, right)
    if left >= right then return NIL, NIL \\ Fehlerzustand
    if left = right-1 \\ Trivialfall bricht Rekursion ab
    then
        if A[left] < A[right] \\ wenn die Differenz positiv ist
        then return left, right \\ ok
        else return NIL, NIL \\ keine positive Differenz vorhanden

    middle = gauss((right-left)/2) \\ gaussklammer: finde Mitte
    \\ finde Positionen der Differenz im linken Teil
    left_min, left_max = maxProfit(A, left, middle)
    \\ finde Positionen der Differenz im rechten Teil
    right_min, right_max = maxProfit(A, middle+1, right)

    \\ berechne Differenzen
    \\ Differenz im linken Teil
    if left_min = NIL \\ links keine positive Differenz
    then diff_left = -1 \\ ungueltige Differenz
    else diff_left = A[left_max] - A[left_min]

    \\ Differenz im rechten Teil
    if right_min = NIL \\ rechts keine positive Differenz
    then diff_right = -1 \\ ungueltige Differenz
    else diff_right = A[right_max] - A[right_min]

    if left_min = NIL and right_max = NIL
    then
        \\ keine positiven Differenzen gefunden
        \\ keine positive Differenz moeglich
        return NIL, NIL
    else
        if left_min = NIL or right_max = NIL
        then
            \\ es gibt keine übergreifende gültige Differenz
            \\ es kann aber links ODER rechts eine gültige Differenz geben
            diff_middle = -1
        else
            \\ maximal moegliche Differenz in beiden Teilen zusammen
            diff_middle = A[right_max] - A[left_min]

    \\ finde min(links, rechts)
    \\ falls beide gleich sind, nehme die groessere Spanne
    if diff_left <= diff_right
    then \\ Positionen aus linkem Teil
        min_pos = left_min
        max_pos = left_max
        current_max_diff = diff_left
    else \\ rechter Teil
        min_pos = right_min
        max_pos = right_max
        current_max_diff = diff_right

    if current_max_diff<0 and diff_middle<0
    then return NIL, NIL \\ keine gültige Differenz gefunden

    if current_max_diff < diff_middle
    then return left_min, right_max
    else return min_pos, max_pos
```

### c)
> Analysieren Sie die Laufzeit Ihres Algorithmus. Stellen Sie hierzu eine Rekursionsgleichung für die Laufzeit Ihres Algorithmus auf und lösen Sie diese. Sie dürfen das Mastertheorem verwenden.

```
maxProfit(A, left, right) \\ T(n)
    if left >= right then return NIL, NIL \\ 1 oder 2
    if left = right-1 \\ 1
    then
        if A[left] < A[right] \\ 1
        then return left, right \\ 1
        else return NIL, NIL \\ 1

    middle = gauss((right-left)/2) \\ 1
    left_min, left_max = maxProfit(A, left, middle) \\ T(n/2)
    right_min, right_max = maxProfit(A, middle+1, right) \\ T(n/2)

    \\ block: 2
    if left_min = NIL
    then diff_left = -1
    else diff_left = A[left_max] - A[left_min]

    \\ block: 2
    if right_min = NIL
    then diff_right = -1
    else diff_right = A[right_max] - A[right_min]

    \\ block: 2-3
    if left_min = NIL or right_max = NIL
    then return NIL, NIL
    else
        if left_min = NIL or right_max = NIL
        then
            diff_middle = -1
        else
            diff_middle = A[right_max] - A[left_min]

    \\ block: 4
    if diff_left <= diff_right
    then
        min_pos = left_min
        max_pos = left_max
        current_max_diff = diff_left
    else \\ rechter Teil
        min_pos = right_min
        max_pos = right_max
        current_max_diff = diff_right

    if current_max_diff<0 and diff_middle<0 \\ 1
    then return NIL, NIL \\ 0-1

    \\ block: 2
    if current_max_diff < diff_middle
    then return left_min, right_max
    else return min_pos, max_pos
```

$$
T(n) =
    \begin{cases}
        \text{Fehlerzustand} & 2 \\
        n=1 & 4\\
        n>1 & 4 + 1 + 2T(\frac{n}{2}) + 2 + 2 + 3 + 4 + 1 + 2
    \end{cases}
$$

Fuer die Worst-Case-Laufzeit vernachlässigen wir den Fehlerzustand, da dies nur einmal beim ersten Aufruf der Funktion auftreten kann.

$$
\Rightarrow T(n) =
    \begin{cases}
        n=1 & 4\\
        n>1 & 2T(\frac{n}{2}) + 19
    \end{cases}
$$

$$
\begin{aligned}
    f(n) &= 19 \\
    f\left(\frac{n}{b}\right) &= 19 \\
    \Rightarrow a\cdot f\left(\frac{n}{b}\right) = 2\cdot 19 &\neq 19 = f(n) \\
    \exists \gamma\leq \frac{1}{2}: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma\cdot 2 \cdot 19 &\leq 19 = f(n)
\end{aligned}
$$

Daher ist Teil $3$ vom Mastertheorem erfüllt. Daraus folgt:
$$
    T(n) \in \mathcal O(2^{\log_{2}n})=\mathcal O(n)
$$

### d)
> Zeigen Sie die Korrektheit Ihres Algorithmus.

```
maxProfit(A, left, right)
 1    if left >= right then return NIL, NIL
 2    if left = right-1
 3    then
 4        if A[left] < A[right]
 5        then return left, right
 6        else return NIL, NIL
 7
 8    middle = gauss((right-left)/2)
 9    left_min, left_max = maxProfit(A, left, middle)
10    right_min, right_max = maxProfit(A, middle+1, right)
11
12    if left_min = NIL
13    then diff_left = -1
14    else diff_left = A[left_max] - A[left_min]
15
16    if right_min = NIL
17    then diff_right = -1
18    else diff_right = A[right_max] - A[right_min]
19
20    if left_min = NIL and right_max = NIL then return NIL, NIL
21    if left_min = NIL or right_max = NIL then diff_middle = -1
22    else diff_middle = A[right_max] - A[left_min]
23
24    if diff_left <= diff_right
25    then
26        min_pos = left_min
27        max_pos = left_max
28        current_max_diff = diff_left
29    else
30        min_pos = right_min
31        max_pos = right_max
32        current_max_diff = diff_right
33
34    if current_max_diff<0 and diff_middle<0 then return NIL, NIL
35    if current_max_diff < diff_middle
36    then return left_min, right_max
37    else return min_pos, max_pos
```

### Induktionsvoraussetzung
Der Algorithmus liefert das korrekte Ergebnis für ein Feld der Länge $2$.

In diesem Fall werden die Zeilen $4-6$ ausgeführt. Falls der erste Wert kleiner ist, werden die Positionen von Minimum und Maximum zurückgegeben, ansonsten wird $\mathrm{NIL}$ als Fehler-Index zurückgegeben.

Damit funktioniert der Algorithmus für $n=2$.

### Induktionsannahme
Liefere der Algorithmus das korrekte Ergebnis für jedes Teilfeld der Länge $n$. Sei das gesamte Feld der Länge $2n$. Dann ist zu zeigen, dass der Algorithmus das Problem löst.

### Induktionsschritt
1. Habe das Feld $A$ die Länge $2n$, dann werden die Zeilen $4-6$ übersprungen.
2. In den Zeilen $8-10$ werden jeweils die Positionen der größten Differenzen der Teilarrays $A[1..\frac{n}{2}]$ und $A[\frac{n}{2}..n]$ ermittelt. Beide Teilarrays haben die Länge $n$, nach Induktionsannahme erhalten wir die korrekten Indizes bzw. $\mathrm{NIL}$ als Fehlermeldung.
3. In den Zeilen $12-18$ werden die Differenzen der Teilbereiche ermittelt, falls sie gültig sind. Ansonsten werden sie auf einen negativen Wert gesetzt, um den Fehler zu kennzeichnen.
4. In Zeile $20$ wird $\mathrm{NIL}$ als Fehlerwert zurückgegeben, falls kein Teilfeld eine gültige Differenz hat. Dann kann es auch keine gültige Differenz im Gesamtfeld geben
5. In Zeile $21$ wird die übergreifende Differenz als fehlerhaft markiert, falls ein Teilfeld keine gültige Differenz hat. Es kann keine die Mitte übergreifende Differenz geben, aber es kann gültige Differenz in einem der beiden Teilarrays geben.
6. In Zeile $22$ wird die übergreifende Differenz ermittelt, falls sie berechnet werden kann.
7. In den Zeilen $24-37$ werden die Positionen mit der größten Differenz ermittelt und zurückgegeben. Falls es in einem Teilbereich keine gültige Differenz gibt, ist der dort angegebene Wert kleiner als _jede_ gültige Differenz. Falls es _nirgendwo_ eine gültige Differenz gibt, wird $\mathrm{NIL}$ als Fehler zurückgegeben.
8. Die in 7. ermittlten Positionen beschreiben geben die größtmögliche Differenz des linken und rechten Teils sowie von dem kleinsten Wert der linken Seite und dem größten Wert der rechten Seite. Dies ist die größtmögliche Differenz im gesamten Feld.

Damit ist bewiesen, dass der Algorithmus korrekt ist.
