---
layout: note
type: 
    - school
    - physik
title: Wurf
date: 
author: Niklas von Hirschfeld
status: In Progress
labels:
---

# Klausur 2023 2 HJ.

- Freier Fall
- Waagerechter Wurf
- Kräfte
    - insbes. $F=m*a$
    - Aufprall
- Geschwindigkeit als *Vektor*
- Auswertung mit Taschenrechner

# Aufgaben 2023-03-08

## Waagerechter Wurf Station 5

### Bewegung horizontale

> Die Bewegung in horizontaler Richtung ist gemäß Auswertung eine **glechförmige 
> Bewegung**

<div style='width: 60%; margin: 0 auto' class='ui rounded images'>
<img class='ui image' src='/notes/note-physik-2023-11-2--wurf--a/horizontale_Bewegung_gleichförmig.png'>
</div>

## Bewegung vertikal

> Die Bewegung in vertikaler Richtung ist gemäß Auswertung ein **exponetieller Fall**

<div style='width: 60%; margin: 0 auto' class='ui rounded images'>
<img class='ui image' src='/notes/note-physik-2023-11-2--wurf--a/vertikale_bewegung_gleichförmig.png'>
</div>

## Wagerechter Wurf Übung

> Im Schwimbad springt jemand mit Anlauf ($v=5\frac{m}{s}$) von einem $10$m-Turm

### a)

> Bestimmen Sie die Zeit vom Absprung zum Aufprall auf dam Wasser.

Formel:
: $s(t)=\frac{1}{2}*a*t^2+y_0$

$$
\begin{aligned}
y_0&=10m&&\\
a&=9.81\frac{m}{s^2}&&\\
\end{aligned}
$$
$$
0m=-\frac{1}{2}*9.81\frac{m}{s^2}*t^2+10 \Rightarrow t\approx 1.43s
$$

> Gelöst mit **cas** und **solve**

Bis zum Aufprall dauert es ungefähr $1.43s$.

#### Links

- [Waagerechter Wurf Leifi](https://www.leifiphysik.de/mechanik/waagerechter-und-schraeger-wurf/grundwissen/waagerechter-wurf)

### b)

> Bestimmen Sie damit, wie weit die Person sich bis zum Aufrpall vom Turm bewegt hat.

Formel:
: $s(t)=t*v$

$$
s(t)=1.43s*5\frac{m}{s}=7.15m
$$

Bis zum Aufprall werden $7.15m$ zurück gelegt.

### c) $F=m*a$

$$
a=\dot{v}
$$

Es wird die Gesammtgeschwindigkeit gebraucht:

$$
\begin{aligned}
v_{ges}^2&=v_x^2+v_y^2&&\\
v_y&=9.81\frac{m}{s^2}*t; t=1.43s&&\\
&\approx14\frac{m}{s}&&\\
v_{ges}&\approx14.87\frac{m}{s}&&\\
a&=\frac{v_{ges}}{\Delta t_{Brems}}; \Delta t_{Brems}=1s&&\\
&\approx14.87\frac{m}{s^2}
\end{aligned}
$$

---

$$
\begin{aligned}
F&=m*a; \: m=60kg&&\\
&=892.2N&&\\
\end{aligned}
$$

Die wirkende Kragt beträgt ungefähr $892.2N$

## Sil

Grafik auf itslearnign

An jedem Pfeil, soweut möglich höhe, Ges, besch notieren

<div style='width: 100%; margin: 0 auto' class='ui rounded images'>
<img class='ui image' src='/notes/note-physik-2023-11-2--wurf--a/pfeil_sil.png'>
</div>

### b) Bewegunsgleichung

$$
\begin{aligned}
g&=9.81 \frac{m}{s^2}&&\\
v_0&=40 \frac{m}{s}&&\\
h(t)&=-\frac{1}{2}gt^2+v_0t&&\\
v(t)&=-g*t+v_0&&\\
0\frac{m}{s}&=-g*t+v_0 \Rightarrow t \approx 4,077s&&\\
\end{aligned}
$$

> Es dauert ungefaehr $4.077s$, bis der Pfeil nach unten faellt.

### c) 

> Die Bewegungsenergie vom Anfang der Bewegung wird bis zum hoechsten Punkt in Hoehen
> energie umgewandelt und anschließend zurück in Bewegungsenergie.
> Deshalb müssen die Beträge der Geschwindigkeit auf jeder Höhe jewils gleich sein, wodurch die Fallzeit der Steigzeit entsprechen muss.

> ALT: Es handelt sich um eine gleichmäßog beschleunigte Bewegung.
> Das $h-t(h)-Diagramm$ ist eine Parabel und damit symmetrisch um den Scheitelpunkt.

### d)

$t=4.077s$ in $h(t)$ einsetzen

Aus der graphischen Darstellung von $h(t)$ lässt sich das Maximum ablesen bei $h\approx 81.55m$.
Das ist die maximale Höhe

### e) 

Es gitb dann eine Starthöhe, die in $h(t)$ addit wird. Dadurch geht die Symmetrie verloren,
wodurch die Flugzeit nicht mehr der doppelten Steigzeit entspricht.

### f)

Bei der Kombination aus gleichförmiger Bewegung und freiem Fall verläuft die
gleichförmige Bewegung senkrecht.

# Klausur vorbereitung

## Aufgabe 1

1. CAS Tabellencalulation
2. Werte $t$ in $s$ und $v$ in $m/s$ eintippen
3. Beide makieren
4. Graphic
4. Calk -> Reg -> Lineare Reg

Die graphische Darstellung legt einen linearen Zusammenhang nahe.

Die Regresseion ergibt:

$$
y=ax+b
$$

$$
\begin{aligned}
a&\approx 1,63&&\\
b&\approx 0&&\\
v^2&\approx 0.9997
\end{aligned}
$$

## Aufgabe 2

<div style='width: 100%; margin: 0 auto' class='ui rounded images'>
<img class='ui image' src='/notes/note-physik-2023-11-2--wurf--a/matrix_neos_sprung.png'>
</div>

