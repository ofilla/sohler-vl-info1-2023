---
title: Übungsblatt 2
author:
    - Oliver Filla
date:
    - 19.04.2023
---
# Übungsblatt 2
Ich benutze hier `\\` für inline-Kommentare in Pseudocode. Dies ist meines Erachtens besser lesbar.

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
        for j = 1 to i do  \\ t_1
            b = b*j \\ t_2

        for j = 1 to n - i do \\ t_1
            c = c * (j + i)  \\ t_2
        d = d - a/(b * c) \\ n
        b = 1 \\ n
        c = 1 \\ n
    return d
```

$$
\begin{aligned}
    t_1 = &\sum_{i=1}^{n} (i + 1) \\
    t_2 = &\sum_{i=1}^{n} i \\
    t_3 = &\sum_{i=1}^{n} n-i+1 = t_2 \\
    t_4 = &\sum_{i=1}^{n} n-i
\end{aligned}
$$
$t_3$ ist quasi $t_2$ in umgekehrter Reihenfolge summiert.

Summe:
$$
    T(n) = 2n^2 + 8n + 7
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
    2. berechne $\mathrm c = (n-i+1)!=\frac{n!}{i!}$
    3. $\mathrm d = \mathrm d - \frac{\mathrm a}{\mathrm b \cdot \mathrm c} = \mathrm d - \frac{n!}{i! \cdot (n-i)!} = \mathrm d - 1$
4. $\mathrm d = 1 - n$

### c)
> Lässt sich das Ergebnis des Algorithmus auch effizienter berechnen? Erklären Sie warum nicht oder geben Sie einen schnelleren Algorithmus an und analysieren Sie dessen asymptotische Worst-Case-Laufzeit.

```
BerechneZahl(int n):
    return 1 - n
```

$$
    T(n) = \mathcal O(1)
$$

## 2. Landau Notation
> Welche der folgenden Aussagen sind korrekt?

$$
\begin{aligned}
    \mathcal O (g(n)) =\ &\{
        f(n) |
        \exists c\in\mathbb R_+:\exists n_0\in\mathbb N:
        \forall\mathbb N \ni n\ge n_0: 0 \le f(n) \le c\cdot g(n)
    \} \\
    \Omega (g(n)) =\ &\{
        f(n) |
        \exists c\in\mathbb R_+:\exists n_0\in\mathbb N:
        \forall n\ge n_0: 0 \le c\cdot g(n) \le f(n)
    \} \\
    & f(n) \in \mathcal O(g(n)) \Leftrightarrow \ g(n) \in \Omega(f(n))
\end{aligned}
$$

### 1.
> $6n^2 + n^3 \in \mathcal O(n^2)$

**Falsch**. Seien $c, n_0 > 0$.
$$
    6n^2 + n^3 > cn^3 \\
    \Leftrightarrow n^3 > n^2(c-6) \\
    \Leftrightarrow n > c-6
$$
Sei $n=\max[n_0, c-5]$. Damit gibt es immer ein $n$, dass obige Gleichung erfüllt. Dies widerspricht der Forderung von $\mathcal O(n^2)$.

### 2.
> $2\log_2 n \in \mathcal \Omega(n)$

**Falsch**.

$$
\begin{aligned}
    2\log_2 n \in\ &\mathcal \Omega(n) \\
    \Leftrightarrow n \in \ &\mathcal O(2\log_2(n)) \\
    \Rightarrow n \ge\ &4c\log_2(n) \overset{*}{>} 2c\log_2(n) \\
\end{aligned} \\
    n=\max[n_0, 2^{10c}] \Rightarrow n \ge 4c\log_2(n)
        \begin{cases}
            n=2^{10c} &\overset{**}{\Rightarrow} 2^{10c} \ge 40 c^2 \\
            n=n_0 &\Leftrightarrow \frac{\log_2(n)}{2} > c
                &\overset{**}{\Rightarrow} n_0 \ge \frac{4(\log_2(n))^2}{10}
        \end{cases}
$$

Die Ungleichung $*$ gilt für $n\ge 2$. Die Ungleichungen $**$ stehen im Widerspruch zu der getätigten Aussage. Damit ist der Widerspruchsbeweis abgeschlossen.

### 3.
> $\mathcal O(n^2+2n) = \mathcal O(n^2)$

**Richtig**.

#### $\Leftarrow$
Wenn $f(n) \in \mathcal O(n^2+2n) \Leftarrow f(n) \in \mathcal O(n^2)$.
Beweis:
$$
    f(n) \in \mathcal O(n^2) \Rightarrow
        \exists c,n_0: \forall n\ge n_0: 0\le f(n) \le cn^2 \\
        \text{Sei } c^\prime=c, n_0^\prime=n_0
            \Rightarrow \forall n\ge n_0: 0\le f(n) \le c^\prime(n^2 + 2n) \\
        \Rightarrow \exists c^\prime, n_0^\prime:
            \forall n\ge n_0: 0\le f(n) \le c^\prime(n^2 + 2n) \\
        \Leftrightarrow f(n) \in \mathcal O(n^2+2n)
$$

#### $\Rightarrow$
Wenn $f(n) \in \mathcal O(n^2+2n) \Leftarrow f(n) \in \mathcal O(n^2)$.
Beweis:
$$
    f(n) \in \mathcal O(n^2+2n) \Rightarrow
        \exists c,n_0: \forall n\ge n_0: 0\le f(n) \le c(n^2+2n) \\
    \text{Seien} c^\prime=2c \land n_0 = 3 \Rightarrow \forall n\ge n_0:
        \frac{2c}{c^\prime-c} \overset{*}{\le} n \\
    \Rightarrow \exists c=2c, n_0: \forall n\ge n_0: f(n) \le c^\prime n^2\\
    \Leftrightarrow f(n) \in \mathcal(n^2)
$$

Nebenrechnung:
$$
    cn^2 + 2cn \le c^\prime n^2
        \Leftrightarrow cn + 2c \le c^\prime n
        \Leftrightarrow 2c \le (c^\prime-c)n \\
        \Leftrightarrow \frac{2c}{c^\prime-c} \overset{*}{\le} n
$$

### 4.
> $3n^4 + 2n - 3 \in \Omega(n^3)$

**Richtig**.
Seien $c=n_0=1$, so gilt für alle $n\ge n_0$ $0\le cn^3 \le 3n^4 + 2n-3 \Leftrightarrow 3n^4 + 2n - 3\in\Omega(n^3)$.

### 5.
> $\log_2 n + 12 + n \in \mathcal O(n\log_2n)$

**Richtig**.
Seien $c=15$ und $n_0=2$. Dann gilt für alle $n\ge n_0$ $\log_2(n)+12+n\le cn\log_2n$. Dies ist äquivalent zu der Aussage $\log_2 n + 12 + n \in \mathcal O(n\log_2n)$.
