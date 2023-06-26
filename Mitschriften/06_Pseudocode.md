# 6. Pseudocode
* Datentyp wird i.A. nicht explizit angegeben
    * nutzen hier nur elementare Datentypen
* eine Anweisung braucht 1 Rechenschritt
* Variablen im Befehlsblock sichtbar
    * durch Einrückung gekennzeichnet

## Kommentare
```
\* Kommentar \*
\\ Kommentar
```

## Verbunddatentypen
Laufzeit der Initialisierung: entspricht reserviertem Speicherplatz

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

## Felder
Laufzeit der Initialisierung: entspricht reserviertem Speicherplatz
* Initialisierung: `x = new <_Verbundtyp_>`
* Zugriff auf das $i$-te Feldelement: `x[i]`
* Index beginnt bei $1$

## Zuweisung
### Typ 1
Es wird eine Kopie von `Y` in `X` gespeichert. Variablen müssen definiert sein.

```
X = Y
```
### Typ 2
Ein _konstant großer_ mathematischer Ausdruck wird in `X` gespeichert. Variablen müssen definiert sein.

```
X = 10
Y = 2
X = X*Y
```

Nicht konstant groß ist z.B. $\sum_{i=1}^N i$. Dies hätte Laufzeit $N$.
Die Summe $\sum_{i=1}^8 i$ ist dagegen konstant groß.
Ggf. wird eine Variable 

## Bedingte Verzweigungen
_lazy evaluation_: Bei _UND_-Verknüpfungen wird nach dem ersten _False_-Ergebnis abgebrochen.

```
X = 10
Y = 20
if X > Y then output << Y
else output << X
```

## Schleifen
### for
Annahmen:
* Die Laufvariable $i$ wird am Ende des Schleifenrumpfs erhöht.
* Nach dem letzten Durchlauf wird die Laufvariable dennoch erhöht.
* Zur Initialisierung wird die Laufvariable $i$ auf den Startwert gesetzt.
    * Deswegen wird das Schleifenkonstrukt einmal mehr als der Schleifenrumpf aufgerufen.
    * Die Laufzeitbestimmung zählt hierbei nur die Aufrufe des Schleifenkonstrukts.
* Laufzeitanalyse: $1 + (n+1) + n + 1 = 2n + 3$

Das bedeutet, dass die Laufvariable beim Eintritt in den Schleifenrumpf schon den Wert für den folgenden Schleifendurchlauf hat. Dies ist für die Betrachtung von Schleifeninvarianten relevant.

```
j=0  \* 1 \*
for i=1 to n do  \* Schleifenkonstrukt n+1 \*
    \* Schleifenrumpf \*
    j = j + i  \* n \*
output << j  \* 1 \*
```

```
j=0  \* 1 \*
for i=n downto 1 do  \* Schleifenkonstrukt n+1 \*
    \* Schleifenrumpf \*
    j = j + i  \* n \*
output << j  \* 1 \*
```

### while
Der Schleifenrumpf kann $0$-mal durchlaufen werden.

```
i=n  \* 1 \*
j=0  \* 1 \*
while i>0 do  \* n+1 \*
    j=j+i  \* n \*
    i=i-1  \* n \*
output << j  \* 1 \*
```

### repeat
Der Schleifenkörper wird mindestens $1$-mal durchlaufen

```
i=n  \* 1 \*
j=0  \* 1 \*
repeat  \* 1 \*
    j=j+i  \* n \*
    i=i-1  \* n \*
until = 0  \* n \*
output << j  \* 1 \*
```

## Prozeduren
* jede Variable wird als Kopie übergeben (_call by value_)
* der Aufruf einer Prozedur kostet einen Zeitschritt
    * die Zuweisung des Ergebnisses kostet einen weiteren Zeitschritt
    * dazu kommt die Zeit für die Prozedur selbst

```
beispiel(j)
    j=j-10
    return j

j=100  \* 1 \*
x=7+beispiel(j)  \* 2+ Zeit für Prozedur \*
output << j  \* 1 \*
output << x  \* 1 \*
```

Ausgabe:

```
100
97
```

