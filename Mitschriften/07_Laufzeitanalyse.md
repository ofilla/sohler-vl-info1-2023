# 7. Laufzeitanalyse
In der Realität spielen Hardware sowie Software (z.B. OS, Compiler(-optionen)) eine Rolle. Diese Einflüsse sind allerdings in einer konstanten Größenordnung. Diese konstanten Laufzeiten werden hier ignoriert, da meistens die Landau-Notation zur Beschreibung von Laufzeiten verwendet wird.

Unser Rechenmodell besagt, dass eine Pseudocodeoperartion einen Zeitschritt benötigt. Wir zählen diese Zeitschritte. 

Hierbei will man für eine gegebene _Eingabegröße_ $n$ eine obere Schranke für die Laufzeit finden.
Üblicherweise benutzt man eine Worst Case Analyse, auch wenn es auch die Average Case Analyse gibt.

## Worst Case Analyse
Die Worst-Case Laufzeit $T(n) = \max[\text{Laufzeit}]$ ist die längste Laufzeit für alle möglichen Eingaben der Größe $n$.
Dies ist der Standard, normalerweise ist diese Analyse gemeint, wenn man von "Laufzeitanalyse" spricht.

## Average Case Analyse
Die Worst-Case Laufzeit $T(n) = \mathrm{avg}[\text{Laufzeit}]$ ist die längste Laufzeit für alle möglichen Eingaben der Größe $n$. Allerdings benötigt diese Betrachtung eine Definition von "Durschschnittlich", also auch eine Wahrscheinlichkeitsverteilung von Eingabegrößen. Daher wird sie i.A. nicht verwendet.

## Master-Theorem
Seien $a\ge 1$ und $b\ge 1$ ganzzahlige Konstanten und $f: \mathbb N\rightarrow \mathbb N$. Gelte weiterhin für die Laufzeit $T(n)$:
$$
    T(n) \le
        \begin{cases}
            n=1: f(n) \\
            n>1: a\cdot T(\frac{n}{b}) + f(n)
        \end{cases}
$$
Es gilt:
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


### Alternative Formulierung
Es folgt die übliche Formulierung.[^5]
Seien $a\ge 1$ und $b\ge 1$ ganzzahlige Konstanten und $f: \mathbb N\rightarrow \mathbb N$. Gelte weiterhin für die Laufzeit $T(n)$:
$$
    T(n) \le
        \begin{cases}
            n=1: f(n) \\
            n>1: a\cdot T(\frac{n}{b}) + f(n)
        \end{cases}
$$

Seien $\varepsilon >0$, $k<1$, $n_0\in\mathbb N$, dann gilt:

$$
\begin{aligned}
    1. &&
        f(n) = O(n^{\log_b a - \varepsilon})
        &&\Rightarrow&&
        T(n) &\in \mathcal O(n^{\log_b a}) \\
    2. &&
        f(n) = \Theta(n^{\log_b a})
        &&\Rightarrow&&
        T(n) &\in \mathcal O(n^{\log_b a} \log n) \\
    3.
       &&
        f(n) = \Omega(n^{\log_b a + \varepsilon})
        \land \forall n\ge n_0: a f\left(\frac{n}{b}\right) \le kf(n))
        &&\Rightarrow&&
        T(n) &\in \mathcal O(f(n))
\end{aligned}
$$

[^5]: [Wikipedia, 2023-05-17](https://en.wikipedia.org/wiki/Master_theorem_(analysis_of_algorithms))

