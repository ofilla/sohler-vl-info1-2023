# 9. Korrektheitsbeweise
* Elemente eines Korrektheitsbeweise können zur Überprüfung der Funktionsweise während der Laufzeit verwendet werden.
* Aus Korrektheitsbeweisen lassen sich häufig gute Kommentare herleiten.
* Ein Korrektheitsbeweis hält letztlich die Überlegungen fest, die ein Entwickler sowieso machen muss.
* Korrektheitsbeweise helfen dabei, sich dieser Überlegungen bewusst zu werden, und somit Fehler zu vermeiden.

## Definitionen
### Korrektheitsbeweis
Ein Korrektheitsbeweis ist eine formale Argumentation, dass ein Algorithmus korrekt arbeitet.

### Problembeschreibung
Definiert für eine Menge von zulässigen Eingaben die zugehörigen gewünschten Ausgaben.

### Korrektheit
Wir bezeichnen einen Algorithmus für eine vorgegebene Problembeschreibung als _korrekt_, wenn er für jede zulässige Eingabe die in der Problembeschreibung spezifizierte Ausgabe berechnet.

##  Methoden
### Nachvollziehen der Befehle
Ohne Schleifen und Rekursion reicht es, den Ablauf der Befehle zu überprüfen.

### Schleifeninvarianten
Sei $A(n)$ eine Aussage über den Zustand des Algorithmus vor dem $n$-ten Eintritt in den Schleifenrumpf. Eine Schleifeninvariante ist dann korrekt, wenn sie vor jedem Eintritt in den Schleifenrumpf korrekt ist. $A(1)$ wird auch als Initialisierung bezeichnet.

Der Beweis für die Korrektheit erfolgt über Vollständige Induktion. Hierbei ist wesentlich, auf den (Pseudo-)Code einzugehen, d.h. was in welcher Zeile gemacht wird.

Für _for_-Schleifen werden hierbei folgende Annahmen getroffen:[^5]
* Die Laufvariable $i$ wird am Ende des Schleifenrumpfs erhöht.
* Zur Initialisierung wird die Laufvariable $i$ auf den Startwert gesetzt.
* Die Invariante kann von dem Laufparameter $i$ abhängen.

Lemma: $A(i)$ ist eine korrekte Schleifeninvariante.

[^5]: siehe Pseudocode/for-Schleife

### Rekursion
* Der Rekursionsabbruch entspricht dem Anfang der Vollständigen Induktion.
* Der Rekursionsaufruf entspricht dem Induktionsschritt.

## $P$ vs. $NP$
Das Problem $P$ _vs._ $NP$ ist eines der wichtigsten Probleme der theoretischen Informatik und gehört zu den $7$ Millennium-Problemen.

Es gibt die Frage, ob die Menge der Probleme, die _schnell_ lösbar sind ($P$), und die Menge der Probleme, bei denen man eine vorgeschlagene Lösung _schnell_ auf Korrektheit überprüfen kann ($NP$), identisch sind.

* $P$ ist die Menge der Probleme, die in _polynomieller Laufzeit_ zu berechnen sind.
* $NP$ ist die Menge der Probleme, die in _nichtdeterministisch polynomieller Laufzeit_ zu lösen sind.
* Es gilt $P\subset NP$.

