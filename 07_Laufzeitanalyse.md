# 7. Laufzeitanalyse
In der Realität spielen Hardware sowie Software (z.B. OS, Compiler(-optionen)) eine Rolle. Diese Einflüsse sind allerdings in einer konstanten Größenordnung. DIese konstanten Laufzeiten werden hier ignoriert, da meistens die Landau-Notation zur Beschreibung von Laufzeiten verwendet wird.

Unser Rechenmodell besagt, dass eine Pseudocodeoperartion einen Zeitschritt benötigt. Wir zählen diese Zeitschritte. 

Hierbei will man für eine gegebene _Eingabegröße_ $n$ eine obere Schranke für die Laufzeit finden.
Üblicherweise benutzt man eine Worst Case Analyse, auch wenn es auch die Average Case Analyse gibt.

## Worst Case Analyse
Worst-Case Laufzeit $T(n) = \max[\text{Laufzeit}]$ über alle Laufzeiten für Eingabegrößen $\le n$.
Dies ist der Standard, normalerweise ist diese Analyse gemeint, wenn man von "Laufzeitanalyse" spricht.

## Average Case Analyse
Die Worst-Case Laufzeit $T(n) = \mathrm{avg}[\text{Laufzeit}]$ benötigt eine Definition von "Durschschnittlich", also auch Wahrscheinlichkeitsverteilung von Eingabegrößen.
Daher wird sie i.A. nicht verwendet.


## Master-Theorem
Seien $a\ge 1$ und $b\ge 1$ ganzzahlige Konstanten und $f: \mathbb N\rightarrow \mathbb N$. Gelte weiterhin für die Laufzeit $T(n)$:
$$
    T(n) \le
        \begin{cases}
            n=1: f(n) \\
            n>1: a\cdot T(\frac{n}{b}) + f(n)
        \end{cases}
$$
Dann gilt:
$$
\begin{aligned}
    1. &&
        f(n) =a f\left(\frac{n}{b}\right)
        &&\Rightarrow&&
        T(n) &\in\mathcal O(f(n)\cdot\log_2(n)) \\
    2. &&
        \exists \gamma>1:
        f(n) \ge \gamma a f\left(\frac{n}{b}\right)
        &&\Rightarrow&&
        T(n) &\in\mathcal O(f(n)) \\
    3. &&
        \exists \gamma\in(0,1):
        f(n) \le \gamma a f\left(\frac{n}{b}\right)
        &&\Rightarrow&&
        T(n) &\in\mathcal O(a^{\log_b(n)}) \\
\end{aligned}
$$

