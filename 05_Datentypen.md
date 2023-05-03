# 5. Speicher und Datentypen
## Speichermodell
* Beliebig viele Speicherzellen (abstrahiert)
* Durchnummeriert, beginnend mit $1$
* _Elementare Datentypen_ brauchen jeweils eine Speicherzelle
    * In der Realität ist das nicht exakt der Fall, z.B. bei Kommazahlen

Details von Hardwareimplementierungen werden in diesem Modell vernachlässigt.
Diese haben zwar Einfluss, aber üblicherweise in konstanten Größenordnungen.

## Elementare Datentypen
Im Vereinfachten RAM-Modell gehen wir davon aus, dass jeder elementare Datentyp eine Speicherzelle belegt.

Bei einer Zuweisung an eine (andere) Variable werden Elementare Datentypen kopiert. Dies nennt man _copy by value_.
Im Gegensatz dazu wird bei Nicht-Elementare Datentypen nur der Zeiger darauf kopiert. Dies nennt man _copy by reference_.

### ganze Zahlen
### reale Zahlen
### Zeichen
### Zeiger / Referenz
Eine ganze Zahl, die eine Speicherzelle bezeichnet, er kann $0$ bzw. $\mathrm{NIL}$  sein, das bedeutet dann "kein Wert".

Eine Referenz wird z.B. benutzt, um auf größere Datentypen oder Verbundobjekte zu verweisen.
In diesem Fall wird immer auf die erste Speicherzelle verwiesen.

## Nicht-Elementare Datentypen
Nicht-Elementare Datentypen sind aus mehreren Elementaren Datentypen zusammengesetzt.

## Felder
Felder sind zusammenhängende Speicherbereiche, die denselben elementaren Datentyp enthalten.
In einer Variable wird eine Referenz auf die erste Speicherzelle gespeichert.
```
li = new array[n]
li[1] = 4
```

## Verbunddaten
_Elementare Datentypen_ [[20230405203745]] können als Verbund organisiert werden.
In einer Variable wird eine Referenz auf die erste Speicherzelle gespeichert.
```
Verbund list_item:
    previous
    number
    next

li = new list_item
previous[li] = NIL
number[li] = 5
next[li] = NIL
```

## Speicherbedarf
* _Elementare Datentypen_: 1 Zelle
* Felder / Verbunddaten: Summe aller Elemente
* Speicherbedarf Algorithmus
    * Summe _aller_ belegten Zellen (inkl. Parameter)
    * kann von Parametern abhängen

