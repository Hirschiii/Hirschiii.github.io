---
title: "Mathe 1. Klausurvorbereitung"
layout: wiki
type: 
    - school
    - klausur
    - mathe
author: Niklas von Hirschfeld
date: 2023-03-21
categories: []
lastmod: 2023-03-21
tags: []
comments: true
---


# Ganzrationale Funktionen 

- S. 63 ff.


Definition:
: Eine Funktion $f$ der Form $f(x)=a_n \cdot x^n + a_{n-1} \cdot x^{n-1}+...+a_1 \cdot x + a_0$ mit $D_f = \mathbb{R}$
heisst **ganzrationale Funktion von Grad $n$** ($n \in \mathbb{N}, a_n \ne 0$).
Die reellen Zahlen $a_0,a_1,...,a_n$ heissen **Koeffizient**.
{: .defi}

- Eigenschaften können am *Grad* und am *Koeffiziente* abgelesen werden

## Beispiel

$$
\begin{aligned}
f(x)=x^2
\end{aligned}
$$

Dann gilt fuer positive Werte:

**Fuer $x \rightarrow + \infty$ gilt $f(x) \rightarrow + \infty$**

Und fuer negative Werte:

**Fuer $x \rightarrow - \infty$ gilt $f(x) \rightarrow + \infty$**

---

$$
\begin{aligned}
f(x)=x^3
\end{aligned}
$$

Dann gilt fuer positive Werte:

**Fuer $x \rightarrow + \infty$ gilt $f(x) \rightarrow + \infty$**

Und fuer negative Werte:

**Fuer $x \rightarrow - \infty$ gilt $f(x) \rightarrow - \infty$**

<div class="defi">
Satz:
: Bei einer ganzrationalen Funktion $f$ mit $f(x)=a_n \cdot x^n + a_{n-1} \cdot x^{n-1}+...+a_1 \cdot x + a_0 \quad (a_n \ne 0)$ wird das **Verhalten fuer $x \rightarrow \pm \infty$** von dem Summanden $a_nx^n$ (der hoechste) bestimmt.

Bei den Graphen ganzrationaler Funktionen unterscheidet man in vier Faellen:

<div class="tbl">

| n        | $a_n$ | $x \rightarrow - \infty; x \rightarrow - \infty;$       |
| ---      | ---   | ---                                                     |
| gerade   | $>0$  | $f(x) \rightarrow + \infty; f(x) \rightarrow + \infty;$ |
| gerade   | $<0$  | $f(x) \rightarrow - \infty; f(x) \rightarrow - \infty;$ |
| ungerade | $>0$  |  $f(x) \rightarrow - \infty; f(x) \rightarrow + \infty;$                                                       |
| ungerade | $<0$  |   $f(x) \rightarrow + \infty; f(x) \rightarrow - \infty;$                                                      |

</div>
</div>

# Symmetrie von Graphen 

- S. 66 ff

<div class="defi">
Satz:
Der Graph einer Funktion ist nur unter folgenden Bedingungen:

- **Achsensymetrisch zur y-Achse:** Wenn fuer all $x \in D_f$ auch $f(-x)=f(x)$ gilt.
- **Punktsymmetrisch** Wenn fuer all $x \in D_f$ auch $f(-x)=-f(x)$ gilt.
</div>

## Fuer genzrationale Funktionen

Der Graph ist immer:

- **Achsensymetrisch**, wenn alle Exponen **gerade** sind.
- **Punktsymmetrisch**, wenn alle Exponenten **ungerade** sind.



# Nullstellen 

- S. 69 ff

Definition:
: Eine Zahl $x^1$ heisst *Nullstelle* einer Funktion $f$, wenn $f(x^1) = 0$ ist.
{: .defi}

### (1) p-q-Formel

$$
f(x) = x^2 + px + q \Rightarrow x_{1,2}=-\frac{p}{2}\pm \sqrt{(\frac{p}{2})^2 - q}
$$

Eine Funktion $f$ mit $f(x)=ax^2 - 4x +3$ laesst sich auf (1) bzw die *p-q-Formel* zurueck fuehren, indem man
durch $a$ dividiert.

Also fuer:

$$
f(x)=2x^2-8x+6=0 \\
\big\downarrow \\
x^2-4x+3=0
$$

> Sonnst kann auch der *CAS* mit *solve($f(x)=0$)* verwendet werden.

# Linearfaktoren 

- S. 75 ff

Satz:
: Eine ganzrationale Funktion $f$ vom Grad $n$ hat hoechstens $n$ Nullstellen.
{: .defi}

Eine ganzrationale Funktion laesst sich umformen:

$$
f(x)=(x-1)(x+3) = x^2 + 2x -3
$$

Vorteile der beiden: 

<div class="tbl">

| Ablesbar | polynom | linearfaktoren |
| ---|---|---|
| Nullstellen | <i class="fa-regular fa-square-check fa-xl"></i> | <i class="fa-regular fa-square fa-xl"></i> |
| Symmetrie | <i class="fa-regular fa-square fa-xl"></i> | <i class="fa-regular fa-square-check fa-xl"></i> |

</div>

# Ermitteln von Funktionsgleichungen 

- S. 76 ff

$$
\begin{aligned}
f(x)=ax^2+bx+c
\end{aligned}
$$

$$A(-1 | 4) \quad B(0 | 0) \quad C(2 | 4)\\
\big\downarrow\\
\begin{aligned}
\begin{vmatrix}
& 4 & = & a & \cdot & (-1)^2 & + & b & \cdot & (-1) & + & c &  &  \\
& 0 & = & a & \cdot & 0^2    & + & b & \cdot & 0    & + & c &  &  \\
& 2 & = & a & \cdot & 4^2    & + & b & \cdot & 4    & + & c &  &  \\
\end{vmatrix}
\end{aligned}
$$ 


