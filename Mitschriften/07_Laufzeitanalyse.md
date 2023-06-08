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
Seien $a\ge 1$ und $b\ge 1$ ganzzahlige Konstanten und $f: \mathbb N\rightarrow \mathbb N$ eine Funktion auf natürlichen Zahlen. Sei die Laufzeit [[20230405210837]] $T(n)$ durch folgende rekursive Gleichung beschrieben. [[20230424184614]]

$$
    T(n) \le
        \begin{cases}
            n=1: f(n) \\
            n>1: a\cdot T(\frac{n}{b}) + f(n)
        \end{cases}
$$

Es gebe ein $\gamma$, sodass gilt:

$$
\begin{aligned}
    1. &&
        \gamma=1:&&
        f(n) = \gamma af\left(\frac{n}{b}\right)
        &&\Rightarrow&&
        T(n) &\in\mathcal O{\large(}f(n)\cdot\log_b(n){\large)} \\
    2. &&
        \gamma>1:&&
        f(n) \ge \gamma af\left(\frac{n}{b}\right)
        &&\Rightarrow&&
        T(n) &\in\mathcal O{\large(}f(n){\large)} \\
    3. &&
        0<\gamma<1:&&
        f(n) \le \gamma af\left(\frac{n}{b}\right)
        &&\Rightarrow&&
        T(n) &\in\mathcal O{\large(}a^{\log_b(n)}{\large)} \\
\end{aligned}
$$

### Merkhilfen
Die folgenen Erklärungen sind nicht zwangsweise mathematisch korrekt, daher sind sie eher als Merkhilfe zu verstehen. $T=\log_b(n)$ ist die Tiefe des Rekursionsbaums. Es gibt $3$ Fälle.

1. Der Aufwand $f(n)$ ist in jeder Rekursionsebene _gleichartig_ (z.B. linear, konstant). Hier fließt in jeder Rekursionsebene $f(n)$ ein, daher dominiert am Ende der Term $T\cdot f(n)$.
2. Der Aufwand $f(n)$ _wächst_ in jeder Rekursionsebene (abhängig von $n$). Daher dominiert $f(n)$ über alle Rekursionsebenen.
3. Der Aufwand $f(n)$ _sinkt_ in jeder Rekursionsebene (abhängig von $n$). Hier fließt in jeder Rekursionsebene $a$ als dominanter Faktor ein, daher dominiert insgesamt $a^T$.

### Alternative Formulierung
Es gibt noch andere Formulierungen. Die folgende Formulierung ist gängiger.[^5]
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
    f(n) \in O(n^{\log_b(a) - \varepsilon})
    &&\Rightarrow&&
    T(n) &\in \Theta(n^{\log_b(a)}) \\
    f(n) \in \Theta(n^{\log_b(a)}\log_{10}^k(n))
    &&\Rightarrow&&
    T(n) &\in \Theta(n^{\log_b(a)} \log_{10}^{k+1}(n)) \\
    f(n) \in \Omega(n^{\log_b a + \varepsilon})
    \land \forall n\ge n_0: a f\left(\frac{n}{b}\right) \le kf(n))
    &&\Rightarrow&&
    T(n) &\in \Theta(f(n))
\end{aligned}
$$

[^5]: _Theorem 4.1_ [@AlgorithmsCormen2022, p. 103]

