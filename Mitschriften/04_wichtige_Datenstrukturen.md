# 4. wichtige Datenstrukturen
## Einfache Felder
Felder sind eine Datenstruktur, bei denen ein zusammenhängender Speicherblock für $N$ Elemente reserviert wird.

Man kann zudem in einer Variable $n$ speichern, wie viele Elemente gespeichert wurden, um sich zu merken, an welcher Stelle das nächste Element eingefügt werden darf. Dann sind immer die ersten $n$ Elemente des Feldes verwendet.

Der Speicherbedarf ist $\mathcal O(N)$, ebenso wie die Laufzeit für die Suche eines Elementes $\mathcal O(N)$ beträgt. Das Speichern und Löschen eines Elements laufen dagegen in konstanter Laufzeit $\mathcal O(1)$.

## Sortierte Felder
Sortierte Felder sind eine Erweiterung von Einfachen Feldern, bei denen die Elemente in sortierter Reihenfolge gespeichert sind.

Wird ein neues Elemente gespeichert, muss dies wie bei $\mathrm{InsertionSort}$ an der richtigen Position geschehen, andere Elemente müssen dazu verschoben werden. Ebenso müssen beim Löschen Elemente verschoben werden, damit nur die ersten $n$ Positionen besetzt sind.

Dadurch ist der Speicherbedarf unverändert $\mathcal O(N)$. Die Suche nach einem Element erfolgt mittels $\mathrm{BinarySearch}$ in Laufzeit $\mathcal O(\log_2N)$, allerdings brauchen Speichern und Löschen dafür die Laufzeit $\mathcal O(N)$.

## Listen
Im Unterschied zu Feldern sind die Elemente einer Liste nicht in einem zusammenhängenden Speicherblock gespeichert. Deshalb müssen in jedem Listenelement Zeiger auf das nächste oder das folgende Element gespeichert werden.

Ein Listenelement $x$ ist damit ein Verbunddatentyp, bestehend aus dem zu speichernden Schlüssel $\mathrm{key}[x]$ sowie Zeiger auf das vorherige Element $\mathrm{prev}[x]$ und / oder das folgende Element $\mathrm{next}[x]$. Zudem wird der Zeiger auf das erste Element der Liste in $\mathrm{head}[L]$ gespeichert. Wenn es keinen Vorgänger bzw. Nachfolger gibt, wird $\mathrm{NIL}$ in dem entsprechenden Zeiger gespeichert.

### Doppelt Verkettete Listen
Bei doppelt verketteten Listen werden sowohl Vorgänger als auch Nachfolger eines Elementes $x$ in $x$ gespeichert.

Wie bei einfachen Feldern sind der Speicherbedarf in $\mathcal O(N)$ und die Suche in $\mathcal O(N)$, das Speichern oder Löschen in konstanter Laufzeit $\mathcal O(1)$. Allerdings ist die Suche deutlich länger, da für jedes Element nicht nur ein Index erhöht wird, sondern jedes nachfolgende Element einzeln ermittelt werden muss.

## Graphen
Bestehen aus _Knoten_ und _Kanten_. Kanten können _gerichtet_ sein.

Beispielsweise das "Pageranking" von Google war ein _Graphalgorithmus_, der Google die Vorherrschaft auf dem Suchmaschinenmarkt einbrachte: Das Ranking einer Website wurde aus der Anzahl von Verweisen auf ebendiese Website ermittelt.

## Binärbäume
Ein Binärbaum $T$ ist eine Struktur, die auf einer endlichen Menge definiert ist. Diese Menge nennt man auch die _Knotenmenge_ des Binärbaums. Daher ist die leere Menge ein _leerer Baum_. Graphen sind eine Untergruppe der Graphen.

Ein Binärbaum ist ein Tripel $(v, T_1, T_2)$, wobei $T_1$ und $T_2$ wiederum Binärbäume mit disjunkten Knotenmengen $V_1$ und $V_2$ sind und $v\notin V_1\cup V_2$ Wurzelknoten heißt. Die Knotenmenge des Baums ist dann ${v}\cup V_1 \cup V_2$. $T_1$ heißt linker Unterbaum von $v$ und $T_2$ heißt rechter Unterbaum von $v$. Blattknoten sind die Knoten, deren Unterbäume leer sind. Der Wurzelknoten ist der einzige Knoten, der keine Elternknoten hat.

Ein Knoten $v$ ist ein Verbundobjekt aus dem Schlüssel $\mathrm{key}[v]$ sowie Zeigern auf den Elternknoten $\mathrm{parent}[v]$, den linken Unterbaum $\mathrm{left}[v]$ und den rechten Unterbaum $\mathrm{right}[v]$. Zudem gibt es einen Zeiger $\mathrm{root}[T]$, der auf den Wurzelknoten des Baumes $T$ zeigt.

### Baumhöhe
Die Höhe eines Binärbaums mit Wurzel $v$ ist die Anzahl Kanten des längsten einfachen Weges von der Wurzel zu einem Blatt.

## Binäre Suchbäume
In einem binären Suchbaum werden die Schlüssel sortiert in einem Binärbaum gespeichert.

Seien $y$ ein Knoten in einem binären Suchbaum und $x$ der Elternknoten von $y$. Wenn $\mathrm{key}[y]>\mathrm{key}[x]$, dann ist $y$ der rechte Unterbaum, ansonsten ist er der linke Unterbaum.

$$
\begin{cases}
    \mathrm{key}[y] \le \mathrm{key}[x] :& y = \mathrm{left}[x] \\
    \mathrm{key}[y] > \mathrm{key}[x] :& y = \mathrm{right}[x]
\end{cases}
$$

