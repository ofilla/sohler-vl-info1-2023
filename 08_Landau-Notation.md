# 8. Landau-Notation
Die detaillierte Laufzeitanalyse hat einige Schwachstellen: Konstante Faktoren werden durch Hardware und Software beeinflusst, die außerhalb des Algorithmus liegen. Zudem ist die Notation fehleranfällig und kompliziert.

Die Landau-Notation nutzt eine _asymptotischen Analyse_ für große Eingabemengen $n\rightarrow\infty$. Kontante Faktoren sind damit vernachlässigbar.

Im Folgenden werden einige Annahmen getroffen:
* Die Funktionen $f$ und $g$ haben den Definitionsbereich $\mathbb N_0$ und sind für große $n$ asymptotisch nicht-negativ sein
* Die Worst-Case-Laufzeit wird asymptotisch angenährt

Bei rekursiven Funktionen muss man mit dem Abschätzen der $\Omega$- und $\mathcal O$-Notationen aufpassen. Oft ist es sinnvoll, diese Funktionen konkret auszurechten.

## Beweise
Für Beweise, z.B. mittels Vollständiger Induktion, darf man die Landau-Notationen nicht verwenden. Bei dieser muss es konkrete Konstanten $c$ geben, die für alle $n\ge n_0$ gelten. Nutzt man während eines Beweises eine Landau-Notation, kann man verschleiern, dass $c$ immer wieder geändert wird.

## Schranken
* Die Schranken $\mathcal O(g(n))$ und $\Omega(g(n))$ geben an, wie stark die analysierte Funktion bei großen $n$ höchstens bzw. mindestens wächst wie $g(n)$.
* Die Schranke $\Theta(g(n))$ gibt dagegen an, dass die Funktion bei großen $n$  in exakt der angegebenen Größenordnung wächst wie $g(n)$.
* Die Schranken $o(g(n))$ und $\omega(g(n))$ geben dagegen an, dass die Funktion immer schwächer bzw. stärker als $g(n)$ wächst.

## $\mathcal O$-Notation
Mit der $\mathcal O$-Notation wird die _obere Schranke_ angenähert.

$f(n)\in\mathcal O (g(n))$ bedeutet, $f$ wächst höchstens so stark wie $g$. Dazu m
$$
    \mathcal O (g(n)) = \{
        \text{Funktion } f(n) |
        \exists c\in\mathbb R_+:\exists n_0\in\mathbb N:
        \forall\mathbb N \ni n\ge n_0: 0 \le f(n) \le c\cdot g(n)
    \}
$$

### Hierarchien:
Satz über Hierarchien:
1. $\forall 2 \le b \in\mathbb R:\mathcal O(\log n) \subseteq\mathcal O(\log^2 n) \subseteq\mathcal O(\log^b n)$
2. $\forall 2 \le b \in\mathbb R:\forall 0<\varepsilon\in\mathbb R: \mathcal O(\log^bn) \subseteq\mathcal O(n^\varepsilon)$
3. $\forall 2 \le b \in\mathbb R:\forall 1> \varepsilon\in\mathbb R:\mathcal O(n^\varepsilon) \subseteq\mathcal O(n) \subseteq\mathcal O(n^2) \subseteq\mathcal O(n^b)$

## $\Omega$-Notation
Die $\Omega$-Notation liefert eine _untere Schranke_ für die Laufzeit.
$f(n)\in\Omega (g(n))$ bedeutet, $f$ wächst mindestens so stark wie $g$.

$$
    \Omega (g(n)) = \{
        \text{Funktion } f(n) |
        \exists c\in\mathbb R_+:\exists n_0\in\mathbb N:
        \forall n\ge n_0: 0 \le c\cdot g(n) \le f(n)
    \}
$$

## Zusammenhang zwischen $\mathcal O(n)$ und $\Omega(n)$

$$
    f(n) \in \mathcal O(g(n)) \Leftrightarrow g(n) \in \Omega(f(n))
$$

## $\Theta$-Notation
$f(n)\in\Theta(n)$ bedeutet, dass $f$ für große $n$ ($n\rightarrow\infty$) genauso stark wächst wie $g$.

$$
    f(n) \in \Theta(g(n)) \Leftrightarrow f(n) \in \mathcal O(g(n)) \land f(n) \in \Omega(g(n))
$$

## $o$-Notation
$f(n)\in o (g(n))$ bedeutet, $f$ wächst weniger stark als $g$.

$$
    o (g(n)) = \{
        \text{Funktion} f(n) |
        \forall c\in\mathbb R_+:\exists n_0\in\mathbb N:
        \forall\mathbb N \ni n\ge n_0: 0 \le f(n) \le c\cdot g(n)
    \}
$$

## $\omega$-Notation
$f(n)\in \omega(g(n))$ bedeutet, $f$ wächst stärker als $g$.

$$
    f(n) \in o(g(n)) \Leftrightarrow g(n) \in o(g(n))
$$

