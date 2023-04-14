---
title: Übungsblatt 0
author:
    - Oliver Filla
date:
    - 12.04.2023
---
# 1. Logik
## Aussagenlogik
> Aussagenlogik befasst sich mit elementaren Aussagen, die durch Variablen repräsentiert und mit Warheitswerten (falsch oder wahr) belegt werden. Diese Aussagen können unterschiedlich verknüpft werden, um Zusammenhänge zwischen den Aussagen zu repräsentieren.
>
> **Aussagen**: z. B.
>
> - A = Das Problem ist leicht
>
> - B = Der Algorithmus löst das Problem
>
> **Verknüpfungen**:
>
> * _unär_: z.B. Negation $\neg$
>
> * binär: z.B. Konjuktion $\land$, Disjunktion $\lor$, Implikation $\Rightarrow$, Äquivalenz $\Leftrightarrow$

## 1.a
> Auf einem Tisch liegen vier Karten mit je einem Buchstaben auf einer Seite und einer
Zahl auf der anderen.
>
> Es soll gelten: **Wenn auf einer Seite ein Vokal steht, dann steht auf der anderen Seite eine ungerade Zahl.**
>
> Welche der Karten $\mathrm 9$, $\mathrm O$, $\mathrm K$, $\mathrm 6$ müssen umgedreht werden, um diese Regel zu über prüfen?

1. Wir müssen die Karte $\mathrm O$ umdrehen, da wir auf der Rückseite eine ungerade Zahl erwarten
2. Die Implikation lässt sich umdrehen zu: _Wenn auf einer Seite eine gerade Zahl steht, dann steht auf der anderen Seite ein Konsonant._ Deswegen muss auf der Rückseite der Karte $\mathrm 6$ ein Konsonant stehen, auch dies muss getestet werden.

Es gilt $A \Rightarrow B \Leftrightarrow \neg B \Rightarrow \neg A$.

## 1.b
> Seien _das Problem ist leicht_ und der _Algorithmus löst das Problem_ zwei Aussagen.
>
> Es gelte: **Wenn das Problem ist leicht gilt, dann gilt der Algorithmus löst das Problem.**
>
> Welche Aussagen sind äquivalent dazu?
> Versuchen Sie die Aussagen als aussagenlogische Formel zu beschreiben.
>
> 1. Aus _der Algorithmus löst das Problem_ folgt _das Problem ist leicht_.
> 2. Aus _der Algorithmus löst das Problem nicht_ folgt _das Problem ist nicht leicht_.
> 3. _Das Problem ist nicht leicht_ oder _der Algorithmus löst das Problem_.
> 4. _Das Problem ist leicht_ und _der Algorithmus löst das Problem_.

1. **Gilt nicht**: Der Algorithmus könnte auch schwere Probleme lösen.
2. **Gilt**: Wäre das Problem leicht, könnte der Algorithmus es lösen. Dies ist nicht der Fall.
3. **Gilt**: Entweder das Problem ist leicht, dann stimmt die zweite Bedingung, oder sie ist nicht leicht und die erste Bedingung gilt.
4. **Gilt nicht**: Die Aussage stimmt nur, wenn das Problem leicht ist _und_ der Algorithmus das Problem löst. Dies ist nicht immer gegeben, siehe Wahrheitstabelle für $A\land B$.

# 2. Beweise über Summen-Notation
> Es seien $A = [a_1, a_2,\dots, a_n ]$ ein aufsteigend sortiertes Array natürlicher Zahlen $[\dots]$ und $k$, $1 \le k \le ⌊n/2⌋$, ein Index.

 $⌊n/2⌋$: Gauss-Klammer: Abgerundet auf ganze Zahl
## 2.a
> Zeigen Sie: Wenn $\sum_{i=1}^k a_i \ge 10$ gilt, folgt auch $\sum_{i=k+1}^n a_i \ge 10$.

Sei $\sum_{i=1}^k a_i \ge 10$.
$$
    \forall 0\le i\le k: a_i \le a_{i+k} \Rightarrow \sum_{i=1}^k a_i \le \sum_{i=1}^{2k} a_{i+k} \\
$$
$$
    \Leftrightarrow \sum_{i=1}^k a_i \le \sum_{i=k}^{2k} a_j
$$
$$
  \forall i: a_i\ge 0 \Rightarrow  \sum_{i=k+1}^{2k} a_i \le \sum_{i=k}^n a_i \Rightarrow \mathrm{q.e.d.}
$$

## 2.b
> Zusätzlich seien alle $a_i\in\mathbb N$ unterschiedlich $[\dots]$. Zeigen Sie, dass dann gilt:  $\sum_{i=k+1}^n a_i \ge k^2$.
Sei $0\notin\mathbb N$.
$$
    \forall i\lt j: a_i \lt a_j \land a_1\in\mathbb N\Rightarrow a_k \gt k \land a_{k+1} \ge k
$$
Da $n\ge 2k$ hat $\sum_{i=k+1}^n a_i$ mindestens $k$ Summanden. $\forall i\gt k: a_i \ge k$. Die Summe aus $k$ Summanden mit einer Größe von mindestens $k$ ist größer als $k^2$, daher gilt $\sum_{i=k+1}^n a_i \ge k^2$.

## 2.c
> _Zur Diskussion_: Welche weiteren logischen Aussagen lassen sich schlussfolgern? Welche verwandten Aussagen folgen nicht?

# 3. Pseudocode
## 3.a
> Gegeben ein Feld A der Länge $n$. Schreiben Sie einen Algorithmus in Pseudocode, der die Summe aller Elemente aus $A$ ausgibt.

```
summe(A, n):
    if n=1 return A[1]
    return A[n] + summe(A, n-1)
```

## 3.b
> Gegeben ein Feld $A$ der Länge $n$. Verwenden Sie Ihren Algorithmus aus der vorherigen Teilaufgabe, um den Durchschnitt der Elemente aus $A$ zu berechnen.

```
avg(A, n):
    sum = summe(A, n)
    return sum/n
```

## 3.c
> Gegeben ein Feld $A$ der Länge $n$ mit den Werten $a_1, a_2,\dots, a_n$ und eine Zahl $m \in \mathbb N$. Sei $k$ die größte Zahl, so dass gilt $\sum^k_{i=1} a_i \le m$. Entwickeln Sie einen Algorithmus, der $k$ berechnet.

```
max_index_with_sum_le_m(A, n, m):
    index = NIL
    for i=1 to n
        sum = summe(A, i)
        if sum > m then return index
        else
            index = i
    return max
```

Performanter:
```
max_index_with_sum_le_m(A, n, m):
    index = NIL
    summe = 0
    for i=1 to n
        summe = summe + A[i]
        if summe > m then return index
        else
            index = i
    return index
```
