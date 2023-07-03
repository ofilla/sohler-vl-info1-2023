---
title: Übungsblatt 12
author:
    - Oliver Filla
date:
    - 03.06.2023
---
# Übungsblatt 12
## 1. Bellman-Ford
> Führen Sie die verbesserte Version des Algorithmus von Bellman-Ford für den gegebenen Graphen mit Startknoten $1$ aus. Tragen Sie dazu die Werte des Arrays $d$ nach jedem Durchlauf der äußeren Schleife des Algorithmus in die Tabelle unten ein. Gehen Sie dabei die Knoten in aufsteigender Reihenfolge durch.
> ![Bellman-Ford](./img/12.1.png)

```
Bellman-Ford(G,s)
    d = new array [1..|V|]
    for each v in V do
        d[v] = inf
    d[s]=0

    for i=1 to |V|-1 do
        for each v in V do
            for each (u,v) in In[v] do
                if d[u]+w(u,v) < d[v]
                then d[v] = d[u] + w(u,v)
    return d
```

| i | d[1] | d[2] | d[3] | d[4] | d[5] | d[6] |
|:-:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0 | 0    | inf  | inf  | inf  | inf  | inf  |
| 1 | 0    | inf  | inf  | 3    | inf  | 11   |
| 2 | 0    | inf  | 4    | 3    | 14   | 10   |
| 3 | 0    | inf  | 4    | 3    | 13   | 10   |
| 4 | 0    | inf  | 4    | 3    | 13   | 10   |
| 5 | 0    | inf  | 4    | 3    | 13   | 10   |

## 2. Graphalgorithmen
> Sei $G = (V, E)$ ein ungerichteter Graph. Eine unabhängige Menge ist eine Teilmenge $U \subseteq V$ der Knotenmenge, für die gilt, dass kein Knotenpaar $u, v \in U$ durch eine Kante verbunden ist. Wir betrachten nun den Spezialfall, dass $G$ ein ungerichteter Graph mit maximalem Knotengrad $d$ ist, d.h. jeder Knoten $v \in V$ hat maximal $d$ Nachbarn.

### a)
> Beschreiben Sie einen gierigen Algorithmus für diesen Spezialfall (nicht notwendigerweise Pseudocode), der für einen gradbeschränkten Graphen $G$ mit maximalem Knotengrad $d$ eine unabhängige Menge berechnet, die mindestens die Größe $\lceil \frac{n}{d+1}\rceil$ hat. Für die volle Punktzahl wird ein Algorithmus erwartet, dessen Worst-Case-Laufzeit durch $\mathcal O(d |V|)$ beschränkt ist.

Der Algorithmus soll nach aufsteigendem Grad Knoten auswählen und ihn, falls er unabhängig von der bisherigen Menge ist, der Menge hinzufügen. Diese Methode wurde gewählt, weil die Wahrscheinlichkeit für eine Kante in die bisher gewählte Menge proportional zu dem Grad des betrachteten Knotens ist.

```
IndependentSet(G)
1.  Q = ... \\ O(|V|)
2.  M = {} \\ O(1)

3.  while Q != {} do \\ O(|V|)
4.      v = ExtractMin(Q) \\ O(|V| * 1)

5.      for u in Adj[v] do \\ O(|V| * (d+1))
6.          Löschen(Q, u) \\ O(|V| * d)

7.      M = M + {v} \\ O(|V| * 1)

8.  return M \\ O(1)
```

### b)
> Begründen Sie, warum Ihr Algorithmus die vorgegebene Laufzeitschranke einhält oder geben Sie, falls ihr Algorithmus diese Schranke nicht einhält, eine möglichst gute Schranke für die Worst-Case-Laufzeit Ihres Algorithmus an und begründen Sie diese.

Die Worst-Case-Laufzeit für Zeile $1$ ist am schwierigsten abzuschätzen. Da die Werte der Prioritäten bekannt sind, nämlich $p\in\{0, \dots, d\}$, kann man ein Array von Listen nutzen, um die Prioritätenschlange $Q$ zu implementieren. In diesem Fall kann das Einfügen in $Q$ in konstanter Laufzeit erfolgen. Da dies für jeden Knoten notwendig ist, erhält man eine Laufzeit von $\mathcal O(|V|)$. Die Schleife in den Zeilen $3-7$ kann maximal $|V|$ oft erfolgen, da in jedem Durchlauf mindestens ein Knoten gelöscht wird. Die Schleife in den Zeilen $5-6$ wird für jeden Knoten $v$ nach der Anzahl des Grades durchlaufen, also maximal $\mathcal O(d|V|)$. Dadurch ist die gesamte Worst-Case-Laufzeit durch $\mathcal O(d|V|)$ beschränkt.

### c)
> Beweisen Sie die Korrektheit Ihres Algorithmus, d.h. dass ihr Algorithmus für jeden ungerichteten Graphen $G$ mit maximalem Knotengrad $d$ eine unabhängige Menge berechnet, die mindestens $\lceil \frac{n}{d+1}\rceil$ Knoten enthält.

#### Invariante
Bei $n$-ten Eintritt in die äußere Schleife enthält $M$ eine unabhängige Menge mit $n-1$ Elementen. Zu dem selben Zeitpunkt enthält $Q$ nur Knoten, die unabhängig von den Knoten in $M$ sind.

#### Induktionsvoraussetzung
Beim $1.$ Eintritt in die Schleife ist $M$ als leere Menge initialisiert worden (vgl. Zeile $2$). Die Invariante ist demnach erfüllt

#### Induktionsannahme
Bei $n$-ten Eintritt gilt die Invariante.

Es ist zu zeigen, dass $M$ beim $n+1$-ten Schleifeneintritt eine unabhängige Menge mit $n$ Elementen ist. Weiter ist zu zeigen, dass $Q$ beim $n+1$-ten Schleifeneintritt nur Knoten enthält, die unabhängig von den Knoten in $M$ sind.

#### Induktionsschritt
In Zeile $4$ wird ein Knoten $v$ aus $Q$ extrahiert, der nach Induktionsannahme unabhängig von den Knoten in $M$ ist. Daher ist $M$ auch dann noch eine unabhängige Menge, wenn $v$ zu $M$ hinzugefügt wurde (Zeile $7$), wodurch die Länge von $M$ um eins erhöht wird. Da nach Induktionsannahme zuvor $n$ Elemente in $M$ waren und nur in Zeile $7$ ein einzelnes Element hinzugefügt wird, sind beim nächsten Schleifeneintritt $n+1$ Elemente in $M$.

Nach Induktionsannahme sind bei Schleifeneintritt alle Knoten in $Q$ unabhängig von $M$. Da nur $v$ in Zeile $7$ zu $M$ hinzugefügt wird, können zu dem Zeitpunkt nur Abhängigkeiten zwischen $v\in M$ und $u\in Q$ bestehen. Dazu muss es eine Kante $(v, u)\in E$ geben. Diese Kante muss in $\mathrm{Adj}[v]$ gespeichert sein, da der Graph ungerichtet ist. Da alle Knoten, auf die das zutrifft, aus $Q$ entfernt werden (Zeilen $5-6$), enthält $Q$ auch beim Schleifenaustritt nur Knoten, die unabhängig von den Knoten in $M$ sind.

Damit wurde die Invariante bewiesen. Dies beweist, dass eine unabhängige Menge berechnet wird.

#### Größe von $M$
Die Größe von $M$ kann durch $d$ abgeschätzt werden. Sei $|M|$ die Anzahl der Elemente in $M$, dann wird $|M|$ in jedem Schleifendurchlauf 'um eins erhöht. $|M|$ ist also genau dann minimal, wenn in jedem Schleifendurchlauf die maximale Menge an Knoten aus $Q$ entfernt wird. In Zeile $4$ wird immer ein Knoten entfernt, in Zeile $6$ wird jeder Nachbar entfernt. Die Anzahl der Nachbarn ist durch $d$ beschränkt, dadurch können je Durchlauf maximal $d+1$ Knoten entfernt werden.

Angenommen, es werden in jedem Durchlauf $d+1$ Knoten entfernt, so muss es $\frac{|V|}{d+1}$ Durchläufe geben. Falls dieser Quotient keine ganze Zahl ist, sind nach dem $\lfloor\frac{|V|}{d+1}\rfloor$-ten Durchlauf noch mindestens ein Knoten, aber maximal $d+1$ Knoten, in $Q$. Dann ist nach dem $\lceil\frac{|V|}{d+1}\rceil$-ten Durchlauf kein Knoten mehr in $Q$ und die Schleife wurde beendet. Da $|M|$ durch die Anzahl der Schleifendurchläufe bestimmt ist, gilt $|M|\ge \lceil\frac{|V|}{d+1}\rceil$, was zu beweisen war.

## 3. Graphalgorithmen
> Marie fand einen Zettel, auf dem ein ungerichteter zusammenhängender Graph $G = (V, E)$ gezeichnet ist. Marie hat vier Farbstifte: rot, blau, schwarz und grün. Sie hat zuerst alle Kanten entweder in rot ($X$) oder blau ($Y$) gefärbt, wobei $E = X \cup Y$ ist.
> 
> Jetzt möchte Marie die Knoten in schwarz oder grün färben, und zwar so, dass die Knoten der roten Kanten beide schwarz oder beide grün sind, und dass die Knoten der blauen Kanten unterschiedlich gefärbt werden.

### a)
> Entwerfen Sie einen Algorithmus $\mathrm{Farben}(V, X, Y)$, der entscheidet, ob solche Knotenfärbung möglich ist und dementsprechend $\mathrm{true}$ bzw. $\mathrm{false}$ zurückgibt. Beschreiben Sie den Algorithmus zunächst mit eigenen Worten. Setzen Sie den Algorithmus dann in Pseudocode um. Für die volle Punktzahl wird ein Algorithmus erwartet, dessen Laufzeit durch $\mathcal O(|V | + |E|)$ beschränkt ist.

### b)
> Analysieren Sie die Laufzeit Ihres Algorithmus.

### c)
> Beweisen Sie die Korrektheit Ihres Algorithmus.
