# 3. wichtige Datenstrukturen
## Felder
### Einfache Felder
Felder sind eine Datenstruktur, bei denen ein zusammenhängender Speicherblock für $N$ Elemente reserviert wird.

Man kann zudem in einer Variable $n$ speichern, wie viele Elemente gespeichert wurden, um sich zu merken, an welcher Stelle das nächste Element eingefügt werden darf. Dann sind immer die ersten $n$ Elemente des Feldes verwendet.

Der Speicherbedarf ist $\mathcal O(N)$, ebenso wie die Laufzeit für die Suche eines Elementes $\mathcal O(N)$ beträgt. Das Speichern und Löschen eines Elements laufen dagegen in konstanter Laufzeit $\mathcal O(1)$.

### Sortierte Felder
Sortierte Felder sind eine Erweiterung von Einfachen Feldern, bei denen die Elemente in sortierter Reihenfolge gespeichert sind.

Wird ein neues Elemente gespeichert, muss dies wie bei $\mathrm{InsertionSort}$ an der richtigen Position geschehen, andere Elemente müssen dazu verschoben werden. Ebenso müssen beim Löschen Elemente verschoben werden, damit nur die ersten $n$ Positionen besetzt sind.

Dadurch ist der Speicherbedarf unverändert $\mathcal O(N)$. Die Suche nach einem Element erfolgt mittels $\mathrm{BinarySearch}$ in Laufzeit $\mathcal O(\log_2N)$, allerdings brauchen Speichern und Löschen dafür die Laufzeit $\mathcal O(N)$.

### Felder mit direkter Adressierung
Sei $U\subset \mathbb N_0$ ein Universum der Größe $|U|$ $(U=\{1, \dots, |U|-1\})$. Dann gibt es keine doppelt vorkommenden Schlüssel und in dem Feld $T=\mathrm{new\ array}[|U|]$ derselben Größe können Werte gespeichert werden.

Das Suchen, Einfügen und Löschen von Elementen der Liste funktioniert in konstanter Laufzeit $\mathcal O(1)$, da die Größe des Universums Konstant ist. Die Schlüssel für $T$ müssen dann alle aus $U$ stammen, zudem ist der Speicherbedarf $\Omega(|U|)$. Dies ist nicht sehr effizient.

## Listen
### Einfach verkette Liste
Im Unterschied zu Feldern sind die Elemente einer Liste nicht in einem zusammenhängenden Speicherblock gespeichert. Deshalb müssen in jedem Listenelement Zeiger auf das nächste oder das folgende Element gespeichert werden.

Ein Listenelement $x$ ist damit ein Verbunddatentyp, bestehend aus dem zu speichernden Schlüssel $\mathrm{key}[x]$ sowie Zeiger auf das vorherige Element $\mathrm{prev}[x]$ und / oder das folgende Element $\mathrm{next}[x]$. Zudem wird der Zeiger auf das erste Element der Liste in $\mathrm{head}[L]$ gespeichert. Wenn es keinen Vorgänger bzw. Nachfolger gibt, wird $\mathrm{NIL}$ in dem entsprechenden Zeiger gespeichert.

### Doppelt verkettete Liste
Bei doppelt verketteten Listen werden sowohl Vorgänger als auch Nachfolger eines Elementes $x$ in $x$ gespeichert.

Wie bei einfachen Feldern sind der Speicherbedarf in $\mathcal O(N)$ und die Suche in $\mathcal O(N)$, das Speichern oder Löschen in konstanter Laufzeit $\mathcal O(1)$. Allerdings ist die Suche deutlich länger, da für jedes Element nicht nur ein Index erhöht wird, sondern jedes nachfolgende Element einzeln ermittelt werden muss.

### (Warte-)Schlange (Queue)
Bei einer Warteschlange $Q$ werden neue Elemente am Ende angefügt, während die Elemente vom Anfang ausgehend bearbeitet werden. Sie fällt in die Gruppe der _FIFO_-Speicher[^41]. Dies kann durch eine (doppelt) verkettete Liste dargestellt werden.

$\mathrm{head}[Q]$ verweist auf das vorderste Element von $Q$, $\mathrm{tail}[Q]$ auf das Ende. Die Operation $\mathrm{dequeue}(Q)$ entfernt das erste Element aus $Q$ und gibt es dann zurück, die Operation $\mathrm{enqueue}(Q, x)$ fügt das Element $x$ am Ende von $Q$ an.

[^41]: FIFO: first in, first out

### Prioritätenschlange (Priority Queue)
Eine Prioritätenschlange $Q$ ist eine Erweiterung der Schlange, bei der jedes Element $v$ eine Priorität $p_v$ hat.

Es gibt die Operationen $\mathrm{Einfügen}(Q)$ und $\mathrm{Löschen}(Q)$ wie bei der normalen Schlange. Zudem gibt es die Operation $\mathrm{ExtractMin}(Q)$, die das Objekt mit der geringsten Priorität zurückgibt und aus $Q$ löscht. Weiterhin kann man mit $\mathrm{DecreaseKey}(v,p)$ die Priorität des Elements $v$ auf den Wert $p$ verringern.

Wird die Prioritätenschlange durch einen Rot-Schwarz-Baum realisiert, können all diese Operationen in der Worst-Case-Laufzeit $\mathcal O(\log_2n)$ erfolgen. Dann wird bei $\mathrm{DecreaseKey}(v,p)$ ein neuer Knoten angelegt und der alte gelöscht. Falls mehrere Elemente die gleichen Prioritäten haben, muss eine weitere Information zur Sortierung verwendet werden.

## Graphen
Bestehen aus _Knoten_ und _Kanten_. Kanten können _gerichtet_ sein.

Es gibt auch Graphenvarianten, bei denen eine Kante nur einen Knoten mit sich selbst verbindet, ebenso welche, die mehrere Kanten zwischen Knoten erlauben.

Beispielsweise das "Pageranking" von Google war ein _Graphalgorithmus_, der Google die Vorherrschaft auf dem Suchmaschinenmarkt einbrachte: Das Ranking einer Website wurde aus der Anzahl von Verweisen auf ebendiese Website ermittelt.

### Wege
Ein Weg der Länge $k$ von Knoten $u$ zu Knoten $v$ in einem Graph $G=(V,E)$ ist eine Sequenz von $k+1$ Knoten $(v_0,\dots, v_k)$ mit $u=v_0$ und $v = v_k$, die paarweise durch Kanten $(v_{i-1}, v_i)\in E$ verbunden sind (mit $k=1,\dots,k$).

#### Erreichbarkeit
$u$ ist von $v$ aus erreichbar, wenn es einen Weg von $u$ nach $v$ gibt.

#### Einfachkeit
Ein Weg heißt einfach, wenn kein Knoten mehrfach auf dem Weg vorkommt.

#### Kreis
Ein Kreis ist ein Weg $(v_0,\dots, v_k)$, bei dem Startknoten $v_0$ und Endknoten $v_k$ identisch sind $(v_0=v_k)$.

Ein Kreis heißt einfach, wenn der Weg ein einfacher Weg ist, also wenn kein Knoten mehrfach auf dem Weg vorkommt.

#### Länge von Wegen
Sei $G=(V,E)$ ein Graph. Dann ist $w: E\rightarrow\mathbb R$ eine Abbildung, die die Länge $w(e)$ der Kante $e\in E$ oder die Länge $w(u,v)$ der Kante $(u,v)$ beschreibt. Für den Weg $p=\braket{v_0, v_1,\dots, v_k}$ ist die Länge des Weges $p$ durch $w(p)=\sum_ {i=1}^k w(v_{i-1}, v_i)$ gegeben.

#### Kürzester Weg
Sei $G$ ein Graph, dann gibt $\delta(u,v) = \min_{\{p\}} w(p)$ die Länge des kürzesten Weges $u$ nach $v$ an. $\{p\}$ ist dabei die Menge aller Wege von $u$ nach $v$. Falls es keinen Weg von $u$ nach $v$ gibt, gilt $\delta(u,v)=\infty$.

Wenn $\braket{v_1,\dots, v_k}$ ein kürzester Weg von $v_1$ nach $v_k$ ist, dann ist $\forall 1\le i<j \le k$ der Weg $\braket{v_i,\dots, v_j}$ ein kürzester Weg von $v_i$ nach $v_j$.

Sei $G=(V,E)$ ein gewichteter Graph und sei $s\in V$ ein beliebiger Knoten, dann gilt für jede Kante $(u,v)\in E$, dass $\delta(s,v) \le \delta(s,u)+w(u,v)$.

### Wald & Bäume
Ein kreisfreier ungerichteter Graph heißt Wald. Ein ungerichteter, zusammenhängender, kreisfreier Graph heißt Baum.

### Nachbar
Ein Knoten $u$ ist ein Nachbar eines Knotens $v$ in einem Graph $G=(V,E)$, wenn es eine Kante $(v,u)\in E$ gibt, die sie verbindet.

### Gerichtete Graphen
Ein gerichteter Graph ist ein Paar $(V,E)$, wobei die Knotenmenge $V$ eine endliche Größe $|V|$ hat und $E\subseteq V\times V$ die Kantenmenge des Graphen ist. Eine gerichtete Kante von $u$ nach $v$ wird als $(u,v)$ geschrieben.

Ein gerichteter Graph heißt _stark zusammenhängend_, wenn es von jedem Knoten einen Weg zu jedem anderen Knoten im Graph gibt. Die _starken Zusammenhangskomponenten_ eines Graphen sind die Äquivalenzklassen der Relation "ist beidseitig erreichbar".

Der _Ausgangsgrad_ eines Knotens in einem gerichteten Graph ist die Anzahl Kanten, die den Knoten verlassen. Der _Eingangsgrad_ eines Knotens in einem gerichteten Graph ist die Anzahl Kanten, die auf den Knoten zeigen.

### Ungerichtete Graphen
Ein gerichteter Graph ist ein Paar $(V,E)$, wobei die Knotenmenge $V$ eine endliche Größe $|V|$ hat und $E=\{(a, b)| a,b\in V\}$ die Menge aller Knotenpaare des Graphen ist. Kanten werden als $\{u,v\}$ geschrieben, oft wird aber auch als $(u,v)$, was dieselbe Kante wie $(v,u)$ darstellt.

Ein ungerichteter Graph heißt _zusammenhängend_, wenn es von jedem Knoten einen Weg zu jedem anderen Knoten im Graph gibt. Die _Zusammenhangskomponenten_ eines Graphen sind die Äquivalenzklassen der Relation "ist erreichbar".

Der _Grad_ eines Knotens $v$ in einem ungerichteten Graph ist die Anzahl Kanten, die an $v$ anliegen.

Für die Adjazenzmatrix $A$ gilt $A=A^\mathrm{T}$, für die Adjazenzliste $\mathrm{Adj}$ gilt $u\in\mathrm{Adj}[v]\Leftrightarrow v\in\mathrm{Adj}[u]$.

### Gewichtete Graphen
Es gibt gewichtete und ungewichtete Graphen. Bei gewichteten Graphen haben Knoten und / oder Kanten Gewichte.

Wenn ein Graph ein Straßenverkehrsnetz darstellt, können solche Gewichte beispielsweise die erlaubte Höchtgeschwindigkeit oder die Durchschnittsgeschwindigkeit sein.

Bei gewichteten Graphen können Kanten i.A. auch negative Gewichte haben. Dann kann es sein, dass ein kürzester Weg nicht wohldefiniert ist, insbesondere wenn es Kreise gibt, die einen "negativen" Weg haben.

### Zusammenhang
Ein gerichteter Graph heißt _stark zusammenhängend_, wenn es von jedem Knoten einen Weg zu jedem anderen Knoten im Graph gibt. Ein ungerichteter Graph heißt _zusammenhängend_, wenn es von jedem Knoten einen Weg zu jedem anderen Knoten im Graph gibt.

#### Zusammenhangskomponenten
Die _starken Zusammenhangskomponenten_ eines Graphen sind die Äquivalenzklassen der Relation "ist beidseitig erreichbar". Die _Zusammenhangskomponenten_ eines Graphen sind die Äquivalenzklassen der Relation "ist erreichbar".

### Knotengrade
Der _Ausgangsgrad_ eines Knotens in einem gerichteten Graph ist die Anzahl Kanten, die den Knoten verlassen. Der _Eingangsgrad_ eines Knotens in einem gerichteten Graph ist die Anzahl Kanten, die auf den Knoten zeigen.

### Darstellungen
#### Adjazenzmatrix
Für dicht besetzte Graphen mit $|E| \lesssim |V|^2$ eignen sich Adjazenzmatrizen zur Speicherung der Knoten.

Hierbei ist $A=(a_{ij})$ eine $|V|\times|V|$-Matrix. Hierbei wird für jedes Knotenpaar gespeichert, ob sie durch eine Kante verbunden sind. Bei gewichteten Graphen wird stattdessen das Gewicht $w$ gespeichert, bei ungewichteten gilt $w=1$. Bei ungerichteten Graphen gilt $A=A^\mathrm{T}$.

$$
    a_{ij} = \begin{cases}
        w &: (i, j)\in E \\
        0 &: (i, j)\notin E \\
        \end{cases}
$$

#### Adjazenzlisten
Für dünn besetzte Graphen mit $|E|\ll |V|^2$ eignen sich besonders Adjazenzlisten zum Speichern der Kanten. Hierbei wird für jeden Knoten $v$ eine Liste angelegt, in der die Nachbarn von $v$ gespeichert sind.

Es gibt ein Feld $\mathrm{Adj}$ mit $|V|$ einträgen, je einem pro Knoten. $\mathrm{Adj}[v]$ enthält die Knoten $u$, die mit $v$ benachbart sind. Es gibt also für jedes $u$ eine Kante $(u,v)\in E$.

Für ungerichtete Graphen gilt $u\in\mathrm{Adj}[v]\Leftrightarrow v\in\mathrm{Adj}[u]$.

Für gewichtete Graphen wird das Gewicht $w(u,v)$ zusammen mit dem Knoten $v$ in der Adjazenzliste $\mathrm{Adj}[u]$ von $u$ gespeichert.

## Bäume
Ein Baum ist ungerichteter, zusammenhängender und kreisfreier Graph.

### Baumhöhe
Die Höhe eines Baums mit Wurzel $v$ ist die Anzahl Kanten des längsten einfachen Weges von der Wurzel zu einem Blatt.

Ein Binärbaum der Höhe $h$ hat maximal $2^{h+1}+1$, aber mindestens $\lfloor\log_2n\rfloor$ Knoten.

### Rotationen
Rotationen können die Struktur von Suchbäumen verändern und gleichzeitig die Suchbaumeigenschaft aufrecht erhalten. Sie werden dazu genutzt, Suchbäume zu balancieren.

Sei $p$ ein Knoten in einem Rot-Schwarz-Baum mit $\mathrm{left}[p]=l$ und $\mathrm{right}[p]=r$.

Dann verschiebt eine Rechtsrotation die Struktur nach rechts, sodass $l$ die Position von $p$ einnimmt und $p=\mathrm{right}[l]$ wird. Eine Linksrotation verschiebt die Struktur nach links, sodass $r$ die Position von $p$ einnimmt und $p=\mathrm{left}[r]$ wird.

Anders formuliert wirkt eine Rechtsrotation rechts herum im Uhrzeigersinn, und eine Linksrotation links herum gegen den Uhrzeigersinn.

### Onkelknoten
Der Onkelknoten eines Knotens $v$ mit einer Tiefe von mindestens $2$ ist das Kind von $\mathrm{parent}[\mathrm{parent}[v]]$, das nicht $\mathrm{parent}[v]$ ist.

### Tiefe eines Knotens
Die Tiefe eines Knotens $v$ ist die Länge eines Weges von der Wurzel zu $v$.

### Binärbäume
Ein Binärbaum $T$ ist eine Struktur, die auf einer endlichen Menge definiert ist. Diese Menge nennt man auch die _Knotenmenge_ des Binärbaums. Daher ist die leere Menge ein _leerer Baum_. Graphen sind eine Untergruppe der Graphen.

Ein Binärbaum ist ein Tripel $(v, T_1, T_2)$, wobei $T_1$ und $T_2$ wiederum Binärbäume mit disjunkten Knotenmengen $V_1$ und $V_2$ sind und $v\notin V_1\cup V_2$ Wurzelknoten heißt. Die Knotenmenge des Baums ist dann ${v}\cup V_1 \cup V_2$. $T_1$ heißt linker Unterbaum von $v$ und $T_2$ heißt rechter Unterbaum von $v$. Blattknoten sind die Knoten, deren Unterbäume leer sind. Der Wurzelknoten ist der einzige Knoten, der keine Elternknoten hat.

Ein Knoten $v$ ist ein Verbundobjekt aus dem Schlüssel $\mathrm{key}[v]$ sowie Zeigern auf den Elternknoten $\mathrm{parent}[v]$, den linken Unterbaum $\mathrm{left}[v]$ und den rechten Unterbaum $\mathrm{right}[v]$. Zudem gibt es einen Zeiger $\mathrm{root}[T]$, der auf den Wurzelknoten des Baumes $T$ zeigt.

### Binäre Suchbäume
In einem binären Suchbaum werden die Schlüssel sortiert in einem Binärbaum gespeichert.

Seien $y$ ein Knoten in einem binären Suchbaum und $x$ der Elternknoten von $y$. Wenn $\mathrm{key}[y]>\mathrm{key}[x]$, dann ist $y$ der rechte Unterbaum, ansonsten ist er der linke Unterbaum.

$$
\begin{cases}
    \mathrm{key}[y] \le \mathrm{key}[x] :& y = \mathrm{left}[x] \\
    \mathrm{key}[y] > \mathrm{key}[x] :& y = \mathrm{right}[x]
\end{cases}
$$

Sei $x$ ein Knoten in einem binären Suchbaum mit zwei Kindern. Dann hat der Nachfolger von $x$ maximal ein Kind, da der Nachfolger den nächstgrößeren Schlüssel hat.

Suchalgorithmen brauchen die Laufzeit $\mathcal O(h)$, wobei $h$ die Höhe des Baumes ist. Das Speichern eines neuen Schlüssels benötigt allerdings auch die Laufzeit $\mathcal O(h)$, da zunächst die richtige Position gesucht werden muss.

Die Wost-Case-Speichergröße eines binären Suchbaums ist $\Omega(n)$. Dieser Fall tritt ein, falls die Eingabewerte sortiert sind.

### Rot-Schwarz-Bäume
Rot-Schwarz-Bäume sind balancierte binäre Suchbäume, die nach dem Speichern oder Löschen eines Knotens immer so balanciert werden, dass eine Baumhöhe von $\mathcal O(\log_2n)$ garantiert wird. Das Speichern und Löschen kann ebenso wie das Suchen in einer Laufzeit von $\mathcal O(\log_2n)$ erfolgen.

Der Verbundtyp eines Knotens $k$ enthält die Elemente Farbe $\mathrm{color}[k]$ und Schlüssel $\mathrm{key}[k]$ sowie Zeiger zu dem Elternknoten $\mathrm{parent}[k]$ und den Unterbäumen $\mathrm{left}[k]$ sowie $\mathrm{right}[k]$. Zeiger auf $\mathrm{NIL}$ werden als Zeiger auf Blätter interpretiert, die leere Bäume sind.

![Rot-Schwarz-Baum](rot-schwarz-baum.png)

In Darstellungen wird üblicherweise auf die $\mathrm{NIL}$-Einträge verzichtet.

#### Die Rot-Schwarz-Eigenschaft
Jeder Knoten ist entweder rot oder schwarz, die Wurzel und alle Blätter sind schwarz, ebenso alle Kinder eines roten Knotens. Zudem haben alle Pfade von einem beliebigen Knoten zu den Blätter dieselbe Anzahl an schwarzen Knoten.

Da keine zwei aufeinanderfolgende Knoten in einem Suchpfad rot sein dürfen und alle Pfade zu einem Blatt gleich viele schwarze Knoten haben, hat der Baum eine logarithmische Höhe.

Es gibt nach dem Einfügen oder Löschen eines Knotens zwei Bedingungen, die verletzt sein können. Deshalb muss der Baum neu balanciert werden. Dabei kann die Wurzel rot sein oder es kann ein roter Knoten ein rotes Kind haben.

#### Der $\mathrm{NIL}$-Knoten
Zur Implementierung ist es sinnvoll, einen besonderen Knoten zu definieren. Dieser Knoten heißt $\mathrm{NIL}[T]$ und hat alle Werte auf $\mathrm{NIL}$ gesetzt. Nur $\mathrm{key}[\mathrm{NIL}[T]]$ darf $0$ sein und somit davon abweichen. Dann werden alle Verweise in Bäumen, die $\mathrm{NIL}$ wären, auf den $\mathrm{NIL}$-Knoten gesetzt. Im obigen Beispiel zeigen demnach die Knoten $2$, $6$ und $9$ je zweimal ($\mathrm{left}$ und $\mathrm{right}$) auf $\mathrm{NIL}[T]$. In Darstellungen wird $\mathrm{NIL}[T]$ normalerweise nicht gezeichnet.

#### Die Schwarzhöhe
Die Schwarzhöhe $\mathrm{sh}(v)$ eines Knotens $v$ in einem Rot-Schwarz-Baum ist die Anzahl der schwarzen Knoten ohne Knoten $v$ auf einem Pfad von $v$ zum Knoten $\mathrm{NIL}[T]$. Hierbei wird $\mathrm{NIL}[T]$ mitgezählt, falls $v\neq \mathrm{NIL}[T]$.

Ein Unterbaum mit der Wurzel $v$ eines Rot-Schwarz-Baums hat mindestens $2^{\mathrm{sh}(v) - 1}$ interne Knoten.

## Hashtabellen
Da Felder mit direkter Adressierung einen extrem ineffizienten Speicherbedarf haben, wird stattdessen eine _Hashfunktion_ $h: U \rightarrow \{1, \dots, m-1\}$ verwendet, die das Universum $U$ auf eine Hashtabelle $T[0..m-1]$ der Größe $m$ abbildet. Für einen Schlüssel $k$ nennen wir $h(k)$ den Hashwert von $k$.

### Kollisionen
Kollisionen sind möglich, das heißt es gibt verschiedene Schlüssel $a, b$ gibt, die den selben Hashwert $h(a)=h(b)$ haben.

Dies kann durch Verkettungen in Hashtabellen gelöst werden. Dabei verweist jeder Eintrag in der Hashtabelle $T$ auf eine verkette Liste, die die Schlüssel speichert. Alternativ kann die offene Adressierung verwendet werden.

### Hashfunktionen
Hashfunktionen werden in der Regel zufällig gewählt, weil bei einer zufälligen Wahl nur wenige Kollisionen zu erwarten sind. Allerdings benötigt die Abbildung einer vollständig zufälligen Hashfunktion viel Speicher.

Deswegen wird oft eine Hashfunktion $h$ zufällig aus einer Menge geeigneter Funktionen gewählt, sodass sich die Hashfunktion ähnlich einer vollständig zufälligen Hashfunktion verhält.

* Divisionsmethode: $h(k) = k \mod m$
    * $m$ sei eine Primzahl, die nicht zu nah an einer Zweierpotenz liegt
* Multiplikationsmethode: $\exists A\in(0,1): h(k) = \lfloor m (kA – \lfloor kA\rfloor)\rfloor$
* Universelles Hashing: $h_{a,b}(k) = ((ak+b) \mod p) \mod m$
    * $a\in\{1, \dots, p-1\}$ und $b\in\{0, \dots, p-1\}$ werden zufällig gewählt

Die erwartete Durchschnittslaufzeit für Suchen, Einfügen und Löschen ist $\mathcal O(1+\frac{n}{m})$, wobei $n$ die Anzahl gespeicherter Schlüssel und $m$ die Größe der Hashtabelle ist.

### Offene Adressierung
Alle Schlüssel werden in der Hashtabelle $T$ gespeichert. Beim Einfügen, suchen oder löschen wird des Schlüssels wird zunächst $T[h(k)]$ ausprobiert. Falls das Element belegt ist bzw. den falschen Wert enthält, wird $T[h(k)+1]$, dann $T[h(k)+2]$ und so weiter, bis entweder alle Elemente aus $T$ ausprobiert wurden oder das entsprechende / freie Feld gefunden wurde.

Ein freies Feld wird meist mit $-1$ markiert, ein gelöschtes mit $-2$. Die spezielle Markierung eines gelöschten Feldes ist notwendig, weil die Suche nicht bei einem gelöschten Element abbrechen darf, da das gesuchte Element danach folgen kann.

