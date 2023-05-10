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
    \Rightarrow a\cdot f\left(\frac{n}{b}\right) =2\cdot12 &\neq 12= f(n) \\
    \exists \gamma\leq \frac{1}{2}: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma\cdot 12\cdot2 &\leq 12 = f(n)
\end{aligned}
$$

Daher ist Teil $3$ vom Mastertheorem erfüllt. Daraus folgt:
$$
    T(n) \in\mathcal O(2^{\log_{12}(n)})
$$

### b)
> $T(n) = \begin{cases}1 & n=1 \\1\cdot T(\frac{n}{3}) + n^3& \text{sonst}\end{cases}$

$$
\begin{aligned}
    f(n) &= n^3 \\
    f\left(\frac{n}{b}\right) &= \frac{n^3}{9} \\
    \Rightarrow a\cdot f\left(\frac{n}{b}\right) =\frac{n^3}{9} &\neq n^3 = f(n) \\
    \exists \gamma\leq 9: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma \frac{n^3}{9} &\leq n^3 = f(n)
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
    \Rightarrow a\cdot f\left(\frac{n}{b}\right) =\frac{n}{2} &\neq n = f(n) \\
    \exists \gamma\in[1,2]: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma \frac{n}{2} &\geq n = f(n)
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
    \Rightarrow a\cdot f\left(\frac{n}{b}\right) = 2\frac{\sqrt{n}}{2} = \sqrt{n} &= \sqrt{n} = f(n) \\
    \exists \gamma\leq\sqrt{2}: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma \frac{n}{2} &\leq n = f(n)
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

Es wird von beiden Teilarrays die Position von den jeweiligen globalen Minima und Maxima benötigt. Dann können die jeweiligen Differenzen verglichen werden. Hier gibt es mehrere Fälle: Die Differenz in einem der Teilarrays die größte Differenz sein, oder das die Differenz von dem linken Minimum (an einer Position $i_-\le j$) und dem rechten Maximum (an einer Position nach $i_+\ge j+1$) kann am größten sein. In jedem dieser Fälle muss jedoch sichergestellt werden, dass das Minimum vor dem Maximum kommt, ansonsten ist es für unseren Gewinn irrelevant.

### b)
> Entwickeln Sie einen Teile-und-Herrsche-Algorithmus, der Ihre Überlegungen aus Aufgabenteil a) verwendet, um die größte Wertdifferenz zu berechnen. Geben Sie eine Implementierung Ihres Algorithmus in Pseudocode an und kommentieren Sie diesen. Für die volle Punktzahl wird ein Algorithmus erwartet, dessen Worst-Case-Laufzeit durch $\mathcal O(n)$ beschränkt ist.

Erster Aufruf für ein Feld $A$ der Länge $n$: $\mathrm{maxProfit(A,1,n)}$. Die Rückgabe bzw. Zuordnung von mehreren Variablen erfolgt über einen geeigneten Verbunddatentyp. Dies könnte in Python ein _Tupel_ sein, die Laufzeit wird dadurch nur durch einen konstanten Faktor verändert.

```
\\ finde die Positionen maximalen Differenz im Intervall A[left..right]
maxProfit(A, left, right)
    if left >= right then return NIL \\ Fehlerzustand
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

    if current_max_diff < diff_middle
    then return left_min, right_max
    else return min_pos, max_pos
```

### c)
> Analysieren Sie die Laufzeit Ihres Algorithmus. Stellen Sie hierzu eine Rekursionsgleichung für die Laufzeit Ihres Algorithmus auf und lösen Sie diese. Sie dürfen das Mastertheorem verwenden.

```
maxProfit(A, left, right) \\ T(n)
    if left >= right then return NIL \\ 1 oder 2
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

    \\ block: 2
    if left_min = NIL and right_max = NIL
    then return NIL, NIL
    else diff_middle = A[right_max] - A[left_min]

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
        n>1 & 4 + 1 + 2T(\frac{n}{2}) + 2 + 2 + 2 + 4 + 2
    \end{cases}
$$

Fuer die Worst-Case-Laufzeit vernachlässigen wir den Fehlerzustand, da dies nur einmal beim ersten Aufruf der Funktion auftreten kann.

$$
\Rightarrow T(n) =
    \begin{cases}
        n=1 & 4\\
        n>1 & 2T(\frac{n}{2}) + 16
    \end{cases}
$$

$$
\begin{aligned}
    f(n) &= 16 \\
    f\left(\frac{n}{b}\right) &= 16 \\
    \Rightarrow a\cdot f\left(\frac{n}{b}\right) = 2\cdot16 &\neq 16= f(n) \\
    \exists \gamma\leq \frac{1}{2}: \gamma a\cdot f\left(\frac{n}{b}\right) = \gamma\cdot2\cdot16 &\leq 16 = f(n)
\end{aligned}
$$

Daher ist Teil $3$ vom Mastertheorem erfüllt. $\mathcal O(2^{\log_{16}n})=\mathcal O(\log_{8}n)$ Daraus folgt:
$$
    T(n) \in\mathcal O(\log_{8}n) \subseteq \mathcal O(n)
$$


### d)
> Zeigen Sie die Korrektheit Ihres Algorithmus.

Aus Zeitgruenden nicht gelöst.
