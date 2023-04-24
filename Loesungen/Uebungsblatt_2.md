---
title: Übungsblatt 2
author:
    - Oliver Filla
date:
    - 19.04.2023
---
# Übungsblatt 2
Ich benutze hier `\\` für inline-Kommentare in Pseudocode. Dies ist meines Erachtens besser lesbar.

Restliche Aufgaben wegen Zeitdruck nicht gelöst.

## 1. Laufzeitanalyse
> Betrachten Sie folgenden Algorithmus:
> ```
> BerechneZahl(int n):
>     a = 1
>     b = 1
>     c = 1
>     d = 1
>     for i = 1 to n do
>         a = a*i
>     for i = 1 to n do
>         for j = 1 to i do
>             b = b*j
>
>         for j = 1 to n - i do
>             c = c * (j + i)
>         d = d - a/(b * c)
>         b = 1
>         c = 1
>     return d
> ```

### a)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit des Algorithmus. Das heißt:
> 1. Notieren Sie die Anzahl der Rechenschritte zeilenweise in Abhängigkeit der Eingabegröße $n$.
> 2. Summieren Sie die Gesamtanzahl der Rechenschritte.
> 3. Ordnen Sie die asymptotische Laufzeit in $\mathcal O$-Notation ein.

```
BerechneZahl(int n):
    a = 1  \\ 1
    b = 1  \\ 1
    c = 1  \\ 1
    d = 1  \\ 1
    for i = 1 to n do  \\ n+1
        a = a*i  \\ n
    for i = 1 to n do  \\ n+1
        for j = 1 to i do  \\ t_1 = 1/2 (n^2+3n)
            b = b*j \\ t_2 = 1/2 (n^2 + n)

        for j = 1 to n - i do \\ t_1 = 1/2 (n^2+3n)
            c = c * (j + i)  \\ t_2 = 1/2 (n^2 + n)
        d = d - a/(b * c) \\ n
        b = 1 \\ n
        c = 1 \\ n
    return d
```

$$
\begin{aligned}
    t_1 = &\sum_{i=1}^{n} (i + 1) = n + \sum_{i=1}^{n} i = n + \frac{n(n+1)}{2}
        &&= \frac{1}{2}(n^2 + 3n)\approx \frac{n^2}{2} \\
    t_2 = &\sum_{i=1}^{n} i = \sum_{i=1}^{n} i = \frac{n(n+1)}{2}
        &&= \frac{1}{2}(n^2 + n)\approx \frac{n^2}{2}
\end{aligned}
$$

Summe:
$$
\begin{aligned}
    T(n) = &1\cdot 4 + (n+1)\cdot 2 + n\cdot 4
        + \frac{1}{2}(n^2+3n)\cdot 2 + \frac{1}{2}(n^2+n)\cdot 2  \\
    = &4 + (2n+2) + 4n + (n^2 + 3n) + (n^2+n) \\
    T(n) = &2n^2 + 10n + 6
\end{aligned}
$$
Die asymptotische Worst-Case-Laufzeit ist demnach $T(n) \in \mathcal O(n^2)$.

### b)
> Geben Sie an, was der Algorithmus bei Eingabe der natürlichen Zahl n berechnet. Erklären Sie die Funktionsweise des Algorithmus.

```
BerechneZahl(int n):
    \\ initialisiere Variablen
    a = 1
    b = 1
    c = 1
    d = 1

    \\ berechne a = n! (Fakultät)
    for i = 1 to n do
        a = a*i

    for i = 1 to n do
        \\ berechne b = i!, da am Anfang dieser Schleife b=1
        for j = 1 to i do
            b = b*j

        \\ berechne c = (n-i)!
        for j = 1 to n - i do
            \\ (j+i) läuft von i bis n
            c = c * (j + i)

        d = d - a/(b * c)

        \\ setze Variablen auf 1 zurück
        b = 1
        c = 1
    return d
```

1. berechne $\mathrm a = n!$
2. für $i\le n, i\in\mathbb N:$
    1. berechne $\mathrm b = i!$
    2. berechne $\mathrm c = (n-i)!$
    3. $\mathrm d = \mathrm d - \frac{\mathrm a}{\mathrm b \cdot \mathrm c} = \mathrm d - \frac{n!}{i! \cdot (n-i)!}$
4. $\mathrm d = 1 - \frac{n!}{(n-1)!} - \frac{n!}{(n-2)!} - \ldots  - \frac{n!}{(n-i)!}$ = 1 - $\sum_{i=1}^n \prod_{j=n-i+1}^n j$

### c)
> Lässt sich das Ergebnis des Algorithmus auch effizienter berechnen? Erklären Sie warum nicht oder geben Sie einen schnelleren Algorithmus an und analysieren Sie dessen asymptotische Worst-Case-Laufzeit.

```
BerechneZahl(int n):
    sum = 1  \\ 1
    for i = 1 to n do \\ n+1
        prod = 1  \\ n
        for j = n-i+1 to n \\ n + t_3
            prod = prod * j  \\ t_3
        sum = sum - prod \\ n
    return sum
```

$$
    t_3 = (n-i) + (n-i+1) + \ldots + 2 + 1 = \sum_{j=1}^{n-i} j = \frac{(n-i)n}{2}
$$

## 2. Landau Notation
> Welche der folgenden Aussagen sind korrekt?

$$
    \mathcal O (g(n)) = \{
        f(n) |
        \exists c\in\mathbb R_+:\exists n_0\in\mathbb N:
        \forall\mathbb N \ni n\ge n_0: 0 \le f(n) \le c\cdot g(n)
    \}
$$

### 1.
> $6n^2 + n^3 \in \mathcal O(n^2)$
**Falsch**. Sei $n=\max[n_0, c]$ und $c\ge n_0$:
$$
    f(n) = 6n^2+n^3 = 6c^2 + c^3 \le g(n) = c\cdot c^2 = c^3 \\
    \Rightarrow 6c^2 \le 0
$$
Da $c>0$ kann $c^2<0$ nicht stimmen. Beweis durch Widerspruch.

### 2.
> $2\log_2 n \in \mathcal O(n)$
**Richtig**. Sei $c=2$ und $n_0>1$:
$$
    2\log_2n \le 2n \Rightarrow \log_2n \le n
$$
Dies gilt für $n\ge n_0>1$, q.e.d.

### 3.
> $\mathcal O(n^2+2n) = \mathcal O(n^2)$

### 4.
> $3n^4 + 2n - 3 \in \mathcal O(n^3)$

### 5.
> $\log_2 n + 12 + n \in \mathcal O(n\log_2n)$
