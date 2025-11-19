# Similitud cosinus — explicació pas a pas

Perfecte. Anem pas a pas per entendre **què és la similitud cosinus** i com es calcula **matemàticament**, amb un **exemple concret d'una matriu 4×6**.

---

## 🔹 Definició matemàtica

La **similitud cosinus** entre dos vectors $\mathbf{a}$ i $\mathbf{b}$ mesura l'angle entre ells en un espai vectorial:

$$
\text{similitud cosinus}(\mathbf{a}, \mathbf{b}) = 
\frac{\mathbf{a} \cdot \mathbf{b}}{\|\mathbf{a}\| \, \|\mathbf{b}\|}
$$

on:

- $\mathbf{a} \cdot \mathbf{b}$ és el **producte escalar**,
- $\|\mathbf{a}\|$ i $\|\mathbf{b}\|$ són les **normes euclidianes** dels vectors.

El resultat és un nombre entre:

- **1** → vectors idèntics (mateixa direcció)
- **0** → vectors ortogonals (cap similitud)
- **−1** → vectors oposats (direcció contrària)

---

## 🔹 Exemple amb una matriu $4 \times 6$

Suposem que tenim una matriu $M$ amb 4 files (objectes) i 6 columnes (característiques):

$$
M = 
\begin{bmatrix}
1 & 2 & 0 & 0 & 3 & 0 \\
0 & 1 & 0 & 2 & 0 & 1 \\
3 & 0 & 0 & 1 & 0 & 2 \\
0 & 0 & 4 & 0 & 1 & 0
\end{bmatrix}
$$

Cada **fila** és un vector de 6 dimensions.  

Per exemple, la fila 1 és:

$$
\mathbf{v}_1 = [1, 2, 0, 0, 3, 0]
$$

i la fila 2 és:

$$
\mathbf{v}_2 = [0, 1, 0, 2, 0, 1]
$$

---

## 🔹 Càlcul de la similitud cosinus entre $\mathbf{v}_1$ i $\mathbf{v}_2$

### 1️⃣ Producte escalar

$$
\mathbf{v}_1 \cdot \mathbf{v}_2 = (1)(0) + (2)(1) + (0)(0) + (0)(2) + (3)(0) + (0)(1) = 2
$$

### 2️⃣ Normes euclidianes

$$
\|\mathbf{v}_1\| = \sqrt{1^2 + 2^2 + 0^2 + 0^2 + 3^2 + 0^2} = \sqrt{14}
$$

$$
\|\mathbf{v}_2\| = \sqrt{0^2 + 1^2 + 0^2 + 2^2 + 0^2 + 1^2} = \sqrt{6}
$$

### 3️⃣ Similitud cosinus

$$
\text{cosine similarity} = 
\frac{2}{\sqrt{14} \cdot \sqrt{6}} = 
\frac{2}{\sqrt{84}} \approx 0.218
$$

---

## 🔹 Interpretació

El valor **0.218** indica una **baixa similitud** entre les dues files (vectors), ja que l'angle entre ells és força gran.
