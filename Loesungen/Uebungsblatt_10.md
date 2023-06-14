---
title: Übungsblatt 10
author:
    - Oliver Filla
date:
    - 14.06.2023
---
# Übungsblatt 10
## Rot-Schwarz-Bäume
### a)
> Vervollständigen Sie die Methode RS-Einfügen-Fix aus der Vorlesung [...], indem Sie den else-Fall ergänzen.

### b)
> Fügen Sie die Schlüssel $30, 42, 41, 50, 55, 1, 3$ in dieser Reihenfolge in einen anfangs leeren Rot-Schwarz-Baum ein und notieren Sie dabei nach jeder Operation den resultierenden Baum.

### c)
> Löschen Sie die Werte $5, 10, 47, 20$ und $18$ in der genannten Reihenfolge [aus dem folgenden Rot-Schwarz-Baum]. Zeichnen Sie den Rot-Schwarz-Baum nach jedem Löschen und geben Sie an, welche Fälle durchgeführt wurden.

![](./img/10.1.c.0.png)

## Suchbäume
> Sei $T$ ein binärer Baum, der nicht zwingend die Suchbaumeigenschaft erfüllt. Es soll nun geprüft werden, ob $T$ ein Suchbaum ist. Für den binären Baum $T$ liefert $\mathrm{root}(T)$ den Wurzelknoten von $T$ . Für jeden Knoten $v \in V$ im binären Baum T stehen folgende Operationen mit Laufzeit $\mathcal O(1)$ zur Verfügung.
> 
> * $\mathrm{key}(v)$ liefert den im Knoten $v$ enthaltenen Schlüssel.
> * $\mathrm{lc}(v)$ liefert einen Zeiger auf das linke Kind von $v$ in $T$ . Hat $v$ kein linkes Kind, liefert $\mathrm{lc}(v)$ den Wert $\mathrm{NIL}$.
> * $\mathrm{rc}(v)$ liefert einen Zeiger auf das rechte Kind von $v$ in $T$ . Hat $v$ kein rechtes Kind, liefert $\mathrm{rc}(v)$ den Wert $\mathrm{NIL}$.
> * $\mathrm{leaf}(v)$ liefert $\mathrm{true}$, falls der Knoten $v$ in $T$ ein Blatt ist. Sonst liefert $\mathrm{leaf}(v)$ den Wert $\mathrm{false}$.
> 
> Für diese Aufgabe soll $T$ ein vollständiger binärer Baum sein. Das heißt, dass jeder innere Knoten in $T$ genau zwei Kinder hat und alle Blätter von $T$ auf der selben Höhe sind.

### a)
> Entwerfen Sie einen Teile-und-Herrsche-Algorithmus, der bei Eingabe eines binären Baumes $T$ mit Knotenmenge $V$ den Wert $\mathrm{true}$ zurückgibt, falls $T$ die Suchbaumeigenschaft erfüllt. Erfüllt $T$ die Suchbaumeigenschaft nicht, soll der Algorithmus $\mathrm{false}$ zurückgeben. Beschreiben Sie Ihren Algorithmus in eigenen Worten und geben Sie den Algorithmus auch in Pseudocode an. Für die volle Punktzahl wird ein Algorithmus erwartet, dessen Laufzeit durch $\mathcal O(|V|)$ beschränkt ist.

### b)
> Analysieren Sie die Laufzeit Ihres Algorithmus.

### c)
> Beweisen Sie die Korrektheit Ihres Algorithmus.
