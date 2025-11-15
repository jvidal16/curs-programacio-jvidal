# Classe 17: Bucles Niuats

## Objectius d'aprenentatge
- Comprendre bucles dins de bucles
- Crear patrons i taules
- Treballar amb matrius conceptuals
- Aplicar niuament en problemes reals

---

## 1. Què són els Bucles Niuats?

!!! note "Definició"
    Un **bucle niuat** és un bucle dins d'un altre bucle.

```pseudocode
PER i ← 1 FINS 3 FER          // Bucle extern
    PER j ← 1 FINS 2 FER      // Bucle intern
        ESCRIURE i, "-", j
    FI_PER
FI_PER
```

**Sortida:**
```
1-1
1-2
2-1
2-2
3-1
3-2
```

---

## 2. Com Funcionen

### Execució pas a pas

| Bucle Extern (i) | Bucle Intern (j) | Sortida |
|------------------|------------------|---------|
| i=1 | j=1 | 1-1 |
| i=1 | j=2 | 1-2 |
| i=2 | j=1 | 2-1 |
| i=2 | j=2 | 2-2 |
| i=3 | j=1 | 3-1 |
| i=3 | j=2 | 3-2 |

!!! tip "Regla d'or"
    Per cada iteració del bucle **extern**, el bucle **intern** es completa TOTALMENT.

---

## 3. Taules de Multiplicar

```pseudocode
ALGORISME TaulesMultiplicar
INICI
    PER i ← 1 FINS 10 FER
        ESCRIURE "===== Taula del", i, "====="
        
        PER j ← 1 FINS 10 FER
            ESCRIURE i, "x", j, "=", i * j
        FI_PER
        
        ESCRIURE ""  // Línia en blanc
    FI_PER
FI
```

---

## 4. Patrons i Figures

### Exemple 1: Quadrat d'asteriscs

```pseudocode
ALGORISME Quadrat
VARIABLES
    mida: ENTER
    
INICI
    ESCRIURE "Mida del quadrat:"
    LLEGIR mida
    
    PER i ← 1 FINS mida FER
        PER j ← 1 FINS mida FER
            ESCRIURE "*"
        FI_PER
        ESCRIURE ""  // Nova línia
    FI_PER
FI
```

**Sortida (mida=4):**
```
****
****
****
****
```

---

### Exemple 2: Triangle

```pseudocode
ALGORISME Triangle
VARIABLES
    alçada: ENTER
    
INICI
    ESCRIURE "Alçada:"
    LLEGIR alçada
    
    PER i ← 1 FINS alçada FER
        PER j ← 1 FINS i FER
            ESCRIURE "*"
        FI_PER
        ESCRIURE ""
    FI_PER
FI
```

**Sortida (alçada=5):**
```
*
**
***
****
*****
```

---

### Exemple 3: Piràmide

```pseudocode
ALGORISME Piramide
VARIABLES
    n: ENTER
    
INICI
    ESCRIURE "Alçada:"
    LLEGIR n
    
    PER i ← 1 FINS n FER
        // Espais
        PER j ← 1 FINS (n - i) FER
            ESCRIURE " "
        FI_PER
        
        // Asteriscs
        PER j ← 1 FINS (2 * i - 1) FER
            ESCRIURE "*"
        FI_PER
        
        ESCRIURE ""
    FI_PER
FI
```

**Sortida (n=4):**
```
   *
  ***
 *****
*******
```

---

## 5. Matrius Conceptuals

### Recórrer una matriu 3x3

```pseudocode
ALGORISME LlegirMatriu
VARIABLES
    valor: ENTER
    
INICI
    ESCRIURE "Introdueix valors 3x3:"
    
    PER fila ← 1 FINS 3 FER
        PER columna ← 1 FINS 3 FER
            ESCRIURE "Element [", fila, "][", columna, "]:"
            LLEGIR valor
            // Aquí processariem el valor
        FI_PER
    FI_PER
FI
```

---

## 6. Problemes Clàssics

### Suma de taula

```pseudocode
ALGORISME SumaTaula
VARIABLES
    suma, valor: ENTER
    
INICI
    suma ← 0
    
    PER i ← 1 FINS 4 FER
        PER j ← 1 FINS 5 FER
            ESCRIURE "Valor [", i, "][", j, "]:"
            LLEGIR valor
            suma ← suma + valor
        FI_PER
    FI_PER
    
    ESCRIURE "Suma total:", suma
FI
```

---

### Buscar en taula

```pseudocode
ALGORISME BuscarEnTaula
VARIABLES
    valor, buscat: ENTER
    trobat: BOOLEÀ
    
INICI
    ESCRIURE "Quin valor busques?"
    LLEGIR buscat
    
    trobat ← FALS
    
    PER i ← 1 FINS 3 FER
        PER j ← 1 FINS 3 FER
            ESCRIURE "Valor [", i, "][", j, "]:"
            LLEGIR valor
            
            SI (valor = buscat) I (NO trobat) LLAVORS
                trobat ← CERT
                ESCRIURE "Trobat a posició [", i, "][", j, "]"
            FI_SI
        FI_PER
    FI_PER
    
    SI NO trobat LLAVORS
        ESCRIURE "No trobat"
    FI_SI
FI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Predi la sortida

```pseudocode
PER i ← 1 FINS 2 FER
    PER j ← 3 FINS 4 FER
        ESCRIURE i + j
    FI_PER
FI_PER
```

??? success "Solució"
    ```
    4
    5
    5
    6
    ```

---

### 🎯 Activitat 2: Completa

Crea un rectangle de 5 files i 8 columnes d'asteriscs:

```pseudocode
PER i ← ___ FINS ___ FER
    PER j ← ___ FINS ___ FER
        _______________
    FI_PER
    _______________
FI_PER
```

??? success "Solució"
    ```pseudocode
    PER i ← 1 FINS 5 FER
        PER j ← 1 FINS 8 FER
            ESCRIURE "*"
        FI_PER
        ESCRIURE ""
    FI_PER
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Escala

Crea una escala descendent:
```
*****
****
***
**
*
```

??? success "Solució"
    ```pseudocode
    ALGORISME Escala
    INICI
        PER i ← 5 FINS 1 PAS -1 FER
            PER j ← 1 FINS i FER
                ESCRIURE "*"
            FI_PER
            ESCRIURE ""
        FI_PER
    FI
    ```

---

### Exercici 2: Taula de quadrats

Mostra una taula amb números i els seus quadrats del 1 al 5:
```
1 x 1 = 1
1 x 2 = 2
...
5 x 5 = 25
```

??? success "Solució"
    ```pseudocode
    ALGORISME TaulaQuadrats
    INICI
        PER i ← 1 FINS 5 FER
            PER j ← 1 FINS 5 FER
                ESCRIURE i, "x", j, "=", i * j
            FI_PER
        FI_PER
    FI
    ```

---

### Exercici 3: Matriu suma

Llegeix una matriu 2x3 i calcula la suma de cada fila.

??? success "Solució"
    ```pseudocode
    ALGORISME MatriuSuma
    VARIABLES
        valor, sumaFila: ENTER
        
    INICI
        PER fila ← 1 FINS 2 FER
            sumaFila ← 0
            
            PER col ← 1 FINS 3 FER
                ESCRIURE "Element [", fila, "][", col, "]:"
                LLEGIR valor
                sumaFila ← sumaFila + valor
            FI_PER
            
            ESCRIURE "Suma fila", fila, ":", sumaFila
        FI_PER
    FI
    ```

---

## 🏠 Deures

1. **Tauler d'escacs:** Crea un patró 8x8 alternat
2. **Triangle invertit:** Com el triangle però al revés
3. **Matriu transposada:** Llegeix 3x2, mostra 2x3
4. **Cerca màxim matriu:** Troba el valor màxim en una matriu 4x4

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ Bucles niuats: bucle dins de bucle
    - ✅ Extern executa 1, intern completa tot
    - ✅ Útils per taules, patrons, matrius
    - ✅ Variables diferents (i, j, k)

---

## 🤔 Autoavaluació

!!! question "Quantes vegades s'executa el bucle intern?"
    ```
    PER i ← 1 FINS 3 FER
        PER j ← 1 FINS 4 FER
            ...
        FI_PER
    FI_PER
    ```
    
    a) 3  
    b) 4  
    c) 7  
    d) 12

??? success "Resposta"
    **d) 12**  
    3 × 4 = 12 iteracions totals
