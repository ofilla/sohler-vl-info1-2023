# Rechentricks / -regeln
* Satz von Gauß: $\sum_{i=1}^n i = \frac{n(n+1)}{2}$
* Gauß-Klammer:  $\lfloor n/2\rfloor$: Gauss-Klammer: Abgerundet auf ganze Zahl

## Vollständige Induktion
Es soll bewiesen werden, dass eine Aussage $A(n)$ für alle $n\in\mathbb N$ gilt.
1. Induktionsvoraussetzung: Beweise für $n=1$
2. Induktionsschritt: Beweise: Wenn $n$ gilt, dann gilt auch $n+1$ ("$n\Rightarrow n+1$")
    * $n$ gilt ist die Induktionsannahme
    * auch $n-1\Rightarrow n$ ist eine gültige Induktionsannahme
    * für manche Beweise braucht man auch $n-1 \Rightarrow n+1$

### Landau-Notation
Für Beweise mittels Vollständiger Induktion sollte man die Landau-Notationen nicht verwenden. Bei dieser muss es konkrete Konstanten $c$ geben, die für alle $n\ge n_0$ gelten. Nutzt man während eines Beweises eine Landau-Notation, kann man verschleiern, dass $c$ immer wieder geändert wird.

