# Classe 13: Bucle FOR (II)

## Objectius d'aprenentatge
- Utilitzar bucles amb diferents passos (PAS)
- Crear bucles decreixents
- Aplicar FOR en problemes més complexos
- Dominar tècniques avançades amb FOR

---

## 1. Bucles amb PAS

!!! note "Sintaxi amb PAS"
    ```pseudocode
    PER variable ← inici FINS fi PAS increment FER
        // Instruccions
    FI_PER
    ```

### El paràmetre PAS

| PAS | Descripció | Exemple |
|-----|------------|---------|
| `PAS 1` | Increment de 1 (per defecte) | `1, 2, 3, 4, 5` |
| `PAS 2` | Salta de 2 en 2 | `2, 4, 6, 8, 10` |
| `PAS 5` | Salta de 5 en 5 | `5, 10, 15, 20` |
| `PAS -1` | Decrement de 1 | `10, 9, 8, 7` |
| `PAS -2` | Decrement de 2 | `10, 8, 6, 4` |

---

## 2. Bucles Creixents amb PAS

### Exemple 1: Números parells

```pseudocode
ALGORISME NumerosParells
INICI
    PER i ← 2 FINS 20 PAS 2 FER
        ESCRIURE i
    FI_PER
FI
```

**Sortida:**
```
2
4
6
8
10
12
14
16
18
20
```

---

### Exemple 2: Múltiples de 5

```pseudocode
ALGORISME MultiplesDe5
INICI
    ESCRIURE "Múltiples de 5 fins a 50:"
    
    PER i ← 5 FINS 50 PAS 5 FER
        ESCRIURE i
    FI_PER
FI
```

---

### Exemple 3: Anys de traspàs

```pseudocode
ALGORISME AnysDeTraspas
VARIABLES
    anyInicial, anyFinal: ENTER
    
INICI
    ESCRIURE "Any inicial:"
    LLEGIR anyInicial
    
    ESCRIURE "Any final:"
    LLEGIR anyFinal
    
    // Els anys de traspàs són cada 4 anys
    PER any ← anyInicial FINS anyFinal PAS 4 FER
        SI any mod 4 = 0 LLAVORS
            ESCRIURE any
        FI_SI
    FI_PER
FI
```

---

## 3. Bucles Decreixents (PAS negatiu)

### Exemple 1: Compte enrere

```pseudocode
ALGORISME CompteEnrere
INICI
    ESCRIURE "Compte enrere!"
    
    PER i ← 10 FINS 1 PAS -1 FER
        ESCRIURE i
    FI_PER
    
    ESCRIURE "Enlairament!"
FI
```

**Sortida:**
```
Compte enrere!
10
9
8
...
1
Enlairament!
```

---

### Exemple 2: Taula invertida

```pseudocode
ALGORISME TaulaInvertida
VARIABLES
    numero: ENTER
    
INICI
    ESCRIURE "Quin número?"
    LLEGIR numero
    
    PER i ← 10 FINS 1 PAS -1 FER
        ESCRIURE numero, "x", i, "=", numero * i
    FI_PER
FI
```

---

### Exemple 3: Suma decreixent

```pseudocode
ALGORISME SumaDecreixent
VARIABLES
    n, suma: ENTER
    
INICI
    ESCRIURE "Número:"
    LLEGIR n
    
    suma ← 0
    PER i ← n FINS 1 PAS -1 FER
        suma ← suma + i
        ESCRIURE "Sumant", i, "→ total:", suma
    FI_PER
FI
```

---

## 4. Tècniques Avançades

### 4.1 Buscar el màxim

```pseudocode
ALGORISME BuscarMaxim
VARIABLES
    numero, maxim: ENTER
    
INICI
    ESCRIURE "Introdueix 5 números"
    
    // Primer número com a màxim inicial
    ESCRIURE "Número 1:"
    LLEGIR maxim
    
    // Comparar amb la resta
    PER i ← 2 FINS 5 FER
        ESCRIURE "Número", i, ":"
        LLEGIR numero
        
        SI numero > maxim LLAVORS
            maxim ← numero
        FI_SI
    FI_PER
    
    ESCRIURE "El màxim és:", maxim
FI
```

---

### 4.2 Buscar el mínim

```pseudocode
ALGORISME BuscarMinim
VARIABLES
    numero, minim: ENTER
    
INICI
    ESCRIURE "Número 1:"
    LLEGIR minim
    
    PER i ← 2 FINS 10 FER
        ESCRIURE "Número", i, ":"
        LLEGIR numero
        
        SI numero < minim LLAVORS
            minim ← numero
        FI_SI
    FI_PER
    
    ESCRIURE "El mínim és:", minim
FI
```

---

### 4.3 Comptar positius i negatius

```pseudocode
ALGORISME ComptarPositiusNegatius
VARIABLES
    numero: ENTER
    positius, negatius: ENTER
    
INICI
    positius ← 0
    negatius ← 0
    
    PER i ← 1 FINS 8 FER
        ESCRIURE "Número", i, ":"
        LLEGIR numero
        
        SI numero > 0 LLAVORS
            positius ← positius + 1
        SINO_SI numero < 0 LLAVORS
            negatius ← negatius + 1
        FI_SI
    FI_PER
    
    ESCRIURE "Positius:", positius
    ESCRIURE "Negatius:", negatius
FI
```

---

## 5. Patrons Comuns

### 5.1 Seqüències aritmètiques

=== "Parells"
    ```pseudocode
    PER i ← 2 FINS 100 PAS 2 FER
        ESCRIURE i
    FI_PER
    ```

=== "Senars"
    ```pseudocode
    PER i ← 1 FINS 99 PAS 2 FER
        ESCRIURE i
    FI_PER
    ```

=== "Múltiples de 7"
    ```pseudocode
    PER i ← 7 FINS 70 PAS 7 FER
        ESCRIURE i
    FI_PER
    ```

---

### 5.2 Operacions acumulatives

=== "Suma"
    ```pseudocode
    suma ← 0
    PER i ← 1 FINS n FER
        suma ← suma + i
    FI_PER
    ```

=== "Producte"
    ```pseudocode
    producte ← 1
    PER i ← 1 FINS n FER
        producte ← producte * i
    FI_PER
    ```

=== "Potència"
    ```pseudocode
    resultat ← 1
    PER i ← 1 FINS exponent FER
        resultat ← resultat * base
    FI_PER
    ```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Predi la sortida

```pseudocode
PER i ← 10 FINS 4 PAS -2 FER
    ESCRIURE i
FI_PER
```

??? success "Solució"
    ```
    10
    8
    6
    4
    ```

---

### 🎯 Activitat 2: Completa el codi

Mostra els números senars del 15 al 1 (decreixent):

```pseudocode
PER i ← ___ FINS ___ PAS ___ FER
    ESCRIURE i
FI_PER
```

??? success "Solució"
    ```pseudocode
    PER i ← 15 FINS 1 PAS -2 FER
        ESCRIURE i
    FI_PER
    ```

---

### 🎯 Activitat 3: Traça pas a pas

```pseudocode
suma ← 0
PER i ← 5 FINS 1 PAS -1 FER
    suma ← suma + i
FI_PER
ESCRIURE suma
```

??? success "Solució"
    ```
    i=5: suma = 0 + 5 = 5
    i=4: suma = 5 + 4 = 9
    i=3: suma = 9 + 3 = 12
    i=2: suma = 12 + 2 = 14
    i=1: suma = 14 + 1 = 15
    
    Sortida: 15
    ```

---

### 🎯 Activitat 4: Corregeix l'error

```pseudocode
// Volem múltiples de 3 del 3 al 30
PER i ← 3 FINS 30 FER
    ESCRIURE i
FI_PER
```

??? success "Solució"
    Falta especificar `PAS 3`:
    ```pseudocode
    PER i ← 3 FINS 30 PAS 3 FER
        ESCRIURE i
    FI_PER
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Suma de parells

Suma els números parells entre 2 i 100.

??? success "Solució"
    ```pseudocode
    ALGORISME SumaParells
    VARIABLES
        suma: ENTER
        
    INICI
        suma ← 0
        
        PER i ← 2 FINS 100 PAS 2 FER
            suma ← suma + i
        FI_PER
        
        ESCRIURE "La suma és:", suma
    FI
    ```

---

### Exercici 2: Seqüència de Fibonacci

Mostra els primers 10 números de Fibonacci (1, 1, 2, 3, 5, 8, 13, ...).

??? tip "Ajuda"
    Cada número és la suma dels dos anteriors.

??? success "Solució"
    ```pseudocode
    ALGORISME Fibonacci
    VARIABLES
        a, b, seguent: ENTER
        
    INICI
        a ← 1
        b ← 1
        
        ESCRIURE a
        ESCRIURE b
        
        PER i ← 3 FINS 10 FER
            seguent ← a + b
            ESCRIURE seguent
            a ← b
            b ← seguent
        FI_PER
    FI
    ```

---

### Exercici 3: Comptar aprovat/suspès

Llegeix 12 notes i compta quantes són aprovades (≥5) i suspeses (<5).

??? success "Solució"
    ```pseudocode
    ALGORISME ComptarNotes
    VARIABLES
        nota: REAL
        aprovats, suspensos: ENTER
        
    INICI
        aprovats ← 0
        suspensos ← 0
        
        PER i ← 1 FINS 12 FER
            ESCRIURE "Nota", i, ":"
            LLEGIR nota
            
            SI nota ≥ 5.0 LLAVORS
                aprovats ← aprovats + 1
            SINO
                suspensos ← suspensos + 1
            FI_SI
        FI_PER
        
        ESCRIURE "Aprovats:", aprovats
        ESCRIURE "Suspensos:", suspensos
    FI
    ```

---

### Exercici 4: Temperatura màxima i mínima

Llegeix 7 temperatures i troba la màxima i la mínima.

??? success "Solució"
    ```pseudocode
    ALGORISME TemperaturesSetmana
    VARIABLES
        temp, maxima, minima: REAL
        
    INICI
        ESCRIURE "Temperatura dia 1:"
        LLEGIR temp
        
        maxima ← temp
        minima ← temp
        
        PER i ← 2 FINS 7 FER
            ESCRIURE "Temperatura dia", i, ":"
            LLEGIR temp
            
            SI temp > maxima LLAVORS
                maxima ← temp
            FI_SI
            
            SI temp < minima LLAVORS
                minima ← temp
            FI_SI
        FI_PER
        
        ESCRIURE "Temperatura màxima:", maxima, "°C"
        ESCRIURE "Temperatura mínima:", minima, "°C"
    FI
    ```

---

### Exercici 5: Piràmide de números

Mostra una piràmide de números del 1 al N.

Exemple (N=5):
```
1
2 2
3 3 3
4 4 4 4
5 5 5 5 5
```

??? tip "Ajuda"
    Necessitaràs dos bucles (ho veurem millor a la classe 17).

??? success "Solució simplificada"
    ```pseudocode
    ALGORISME Piramide
    VARIABLES
        n: ENTER
        
    INICI
        ESCRIURE "Alçada de la piràmide:"
        LLEGIR n
        
        PER i ← 1 FINS n FER
            PER j ← 1 FINS i FER
                ESCRIURE i, " "
            FI_PER
            ESCRIURE ""  // Salt de línia
        FI_PER
    FI
    ```

---

## 🏠 Deures

1. **Múltiples de 7:** Mostra tots els múltiples de 7 entre 1 i 100.

2. **Suma senars:** Suma els números senars entre 1 i N (N introduït per l'usuari).

3. **Compte enrere personalitzat:** Demana un número i fa un compte enrere fins a 0.

4. **Estadístiques:** Llegeix 15 números i calcula: suma, mitjana, màxim i mínim.

5. **Potències de 2:** Mostra les potències de 2 des de 2^0 fins a 2^10 (1, 2, 4, 8, 16, ..., 1024).

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ `PAS` permet controlar l'increment/decrement
    - ✅ `PAS 2`: salta de 2 en 2
    - ✅ `PAS -1`: decrementa de 1 en 1
    - ✅ PAS negatiu: per bucles decreixents
    - ✅ Tècniques: màxim/mínim, comptadors múltiples, seqüències

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin PAS utilitzaries per números senars del 1 al 99?
    
    a) PAS 1  
    b) PAS 2  
    c) PAS -1  
    d) PAS 3

??? success "Resposta"
    **b) PAS 2**  
    Començant a 1: 1, 3, 5, 7, ...

!!! question "Pregunta 2"
    Com fas un bucle de 10 a 1 (decreixent)?
    
    a) `PER i ← 1 FINS 10 PAS -1`  
    b) `PER i ← 10 FINS 1 PAS -1`  
    c) `PER i ← 10 FINS 1 PAS 1`  
    d) No es pot fer amb FOR

??? success "Resposta"
    **b) `PER i ← 10 FINS 1 PAS -1`**  
    Inici > Fi, amb PAS negatiu

!!! question "Pregunta 3"
    Quin valor mostrarà `suma` al final?
    ```
    suma ← 0
    PER i ← 2 FINS 8 PAS 2 FER
        suma ← suma + i
    FI_PER
    ```
    
    a) 10  
    b) 20  
    c) 16  
    d) 18

??? success "Resposta"
    **b) 20**  
    2 + 4 + 6 + 8 = 20
