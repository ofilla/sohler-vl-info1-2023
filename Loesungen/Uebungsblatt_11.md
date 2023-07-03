---
title: Übungsblatt 11
author:
    - Oliver Filla
date:
    - 28.06.2023
---
# Übungsblatt 11
## 1. Hashtabelle
> Gegeben seien eine Hashtabelle der Größe $m = 11$ und die Hashfunktion $h(x) = x \mod m$.
> 
> Fügen Sie die Schlüssel $112, 121, 17, 356, 202, 876, 394, 26, 742, 652$ in der angegebenen Reihenfolge nach dem Schema offener Addressierung mit linearem Ausprobieren in die Hashtabelle ein. (Es genügt, das Endergebnis aller Einfügeoperationen anzugeben.)

| 1   | 2   | 3 | 4   | 5   | 6  | 7   | 8  | 9   | 10  | 11 |
|:---:|:---:|:-:|:---:|:---:|:--:|:---:|:--:|:---:|:---:|:--:|
| 121 | 112 |   | 356 | 202 | 17 | 876 | 26 | 394 | 742 |    |

## 2. Breitensuche
> Führen Sie auf dem gegebenen Graphen den Breitensuche-Algorithmus aus. Gehen Sie dabei so vor, dass der Knoten $a$ als Startknoten genutzt wird und bei mehreren benachbarten Knoten der mit dem lexikographisch kleineren Buchstaben zuerst der Warteschlange hinzugefügt wird.
> 
> Skizzieren Sie für jeden Schritt der Traversierung den Zustand der Breitensuche. Geben Sie dazu jeweils die Färbung der Knoten und den Inhalt der Warteschlangen-Datenstruktur an.

![vorher: Q={}](./img/11.2.0.png)

#### 1. $a$
![a besucht: Q={b, d}](./img/11.2.1.png)

#### 2. $b$
![b besucht: Q={d, f}](./img/11.2.2.png)

#### 3. $d$
![d besucht: Q={f, h}](./img/11.2.3.png)

#### 4. $f$
![f besucht: Q={h, c, e}](./img/11.2.4.png)

#### 5. $h$
![h besucht: Q={c, e}](./img/11.2.5.png)

#### 6. $c$
![c besucht: Q={e, g}](./img/11.2.6.png)

#### 7. $e$
![e besucht: Q={e, g}](./img/11.2.7.png)

#### 8. $g$
![g besucht: Q={}](./img/11.2.8.png)

## 3. Kreisfreiheit
> Ein ungerichteter Graph heißt _kreisfrei_, wenn es für jedes Knotenpaar $u, v \in V \times V$ nur einen Pfad von $v$ nach $u$ gibt.

### a)
> Gegeben sei ein ungerichteter zusammenhängender Graph $G = (V, E)$ in Adjazenzlistendarstellung. Geben Sie einen Algorithmus in Pseudocode an, der in Zeit $\mathcal O(|V | + |E|)$ entscheidet ob der Graph $G$ kreisfrei ist. Erklären oder kommentieren Sie Ihren Pseudocode.

### b)
> Analysieren Sie die asymptotische Worst-Case-Laufzeit Ihres Algorithmus.

### c)
> Beweisen Sie die Korrektheit Ihres Algorithmus.
