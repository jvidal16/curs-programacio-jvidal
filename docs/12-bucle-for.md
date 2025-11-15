# Classe 12: Bucle FOR (I)

## Objectius d'aprenentatge
- Comprendre la sintaxi del bucle FOR
- Utilitzar la variable de control
- Dominar l'increment bàsic
- Aplicar FOR en problemes simples

---

## 1. Sintaxi del Bucle FOR

!!! note "Estructura bàsica"
    ```pseudocode
    PER variable ← valorInicial FINS valorFinal FER
        // Instruccions a repetir
    FI_PER
    ```

### Components

| Component | Descripció | Exemple |
|-----------|------------|---------|
| **variable** | Variable de control del bucle | `i`, `comptador`, `index` |
| **valorInicial** | Primer valor de la variable | `1`, `0`, `10` |
| **valorFinal** | Últim valor (inclusiu) | `10`, `100`, `n` |
| **FER** | Inici del bloc a repetir | - |
| **FI_PER** | Fi del bloc | - |

---

## 2. Com Funciona el FOR

### Execució pas a pas

```pseudocode
PER i ← 1 FINS 3 FER
    ESCRIURE i
FI_PER
```

**Traça d'execució:**

| Pas | Variable `i` | Acció | Sortida |
|-----|--------------|-------|---------|
| 1 | i = 1 | ESCRIURE 1 | `1` |
| 2 | i = 2 | ESCRIURE 2 | `2` |
| 3 | i = 3 | ESCRIURE 3 | `3` |
| 4 | i = 4 | Surt (4 > 3) | - |

!!! info "Important"
    - La variable s'inicialitza automàticament
    - S'incrementa automàticament en cada iteració (+1)
    - El valor final **s'inclou** en les iteracions

---

## 3. Exemples Bàsics

### Exemple 1: Números de l'1 al 10

```pseudocode
ALGORISME Numeros1a10
INICI
    PER i ← 1 FINS 10 FER
        ESCRIURE i
    FI_PER
FI
```

**Sortida:**
```
1
2
3
...
10
```

---

### Exemple 2: Taula de multiplicar

```pseudocode
ALGORISME TaulaMultiplicar
VARIABLES
    numero: ENTER
    
INICI
    ESCRIURE "Quin número vols la taula?"
    LLEGIR numero
    
    PER i ← 1 FINS 10 FER
        ESCRIURE numero, "x", i, "=", numero * i
    FI_PER
FI
```

**Sortida (per numero = 5):**
```
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
...
5 x 10 = 50
```

---

### Exemple 3: Suma dels primers N números

```pseudocode
ALGORISME SumaNumeros
VARIABLES
    n, suma: ENTER
    
INICI
    ESCRIURE "Fins a quin número vols sumar?"
    LLEGIR n
    
    suma ← 0
    PER i ← 1 FINS n FER
        suma ← suma + i
    FI_PER
    
    ESCRIURE "La suma és:", suma
FI
```

**Exemple (n = 5):**
```
suma = 0
suma = 0 + 1 = 1
suma = 1 + 2 = 3
suma = 3 + 3 = 6
suma = 6 + 4 = 10
suma = 10 + 5 = 15
```

---

## 4. La Variable de Control

### Característiques

!!! tip "Variable de control (i, j, k, comptador)"
    - S'incrementa automàticament
    - Pot utilitzar-se dins el bucle
    - NO s'ha de modificar manualment
    - Disponible després del bucle (amb l'últim valor +1)

### ❌ Error comú

```pseudocode
// MAL - No modificar la variable de control
PER i ← 1 FINS 5 FER
    ESCRIURE i
    i ← i + 2    // ❌ NO fer això!
FI_PER
```

### ✅ Ús correcte

```pseudocode
// BÉ - Usar la variable només per llegir
PER i ← 1 FINS 5 FER
    resultat ← i * 2
    ESCRIURE resultat
FI_PER
```

---

## 5. Comptadors i Acumuladors

### 5.1 Comptador

!!! info "Comptador"
    Variable que **conta** quantes vegades passa alguna cosa.

```pseudocode
ALGORISME ComptarParells
VARIABLES
    comptador: ENTER
    
INICI
    comptador ← 0
    
    PER i ← 1 FINS 10 FER
        SI i mod 2 = 0 LLAVORS
            comptador ← comptador + 1
        FI_SI
    FI_PER
    
    ESCRIURE "Hi ha", comptador, "números parells"
FI
```

---

### 5.2 Acumulador

!!! info "Acumulador"
    Variable que **suma** (acumula) valors.

```pseudocode
ALGORISME SumarNotes
VARIABLES
    nota: REAL
    suma: REAL
    
INICI
    suma ← 0.0
    
    PER i ← 1 FINS 5 FER
        ESCRIURE "Nota", i, ":"
        LLEGIR nota
        suma ← suma + nota
    FI_PER
    
    ESCRIURE "Suma total:", suma
    ESCRIURE "Mitjana:", suma / 5
FI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Traça el bucle

Què mostrarà aquest programa?

```pseudocode
PER n ← 2 FINS 5 FER
    ESCRIURE n * n
FI_PER
```

??? success "Solució"
    ```
    4
    9
    16
    25
    ```
    Mostra els quadrats de 2, 3, 4 i 5.

---

### 🎯 Activitat 2: Completa el codi

Completa per mostrar els números senars de l'1 al 9:

```pseudocode
PER i ← ___ FINS ___ FER
    SI _______________ LLAVORS
        ESCRIURE i
    FI_SI
FI_PER
```

??? success "Solució"
    ```pseudocode
    PER i ← 1 FINS 9 FER
        SI i mod 2 ≠ 0 LLAVORS
            ESCRIURE i
        FI_SI
    FI_PER
    ```
    O més eficient:
    ```pseudocode
    PER i ← 1 FINS 9 FER
        ESCRIURE i
        i ← i + 1  // Salta un
    FI_PER
    ```

---

### 🎯 Activitat 3: Troba l'error

Aquest programa té un error. Quin?

```pseudocode
suma ← 0
PER i ← 1 FINS 10 FER
    suma ← i
FI_PER
ESCRIURE suma
```

??? success "Resposta"
    **Error:** Hauria de ser `suma ← suma + i` per acumular.
    Així només mostra l'últim valor (10).
    
    Correcte:
    ```pseudocode
    suma ← 0
    PER i ← 1 FINS 10 FER
        suma ← suma + i
    FI_PER
    ESCRIURE suma  // Mostra 55
    ```

---

### 🎯 Activitat 4: Predi la sortida

```pseudocode
comptador ← 0
PER i ← 1 FINS 8 FER
    SI i mod 3 = 0 LLAVORS
        comptador ← comptador + 1
    FI_SI
FI_PER
ESCRIURE comptador
```

Quin valor mostra?

??? success "Solució"
    **2**
    
    Compta els múltiples de 3 entre 1 i 8:
    - 3: comptador = 1
    - 6: comptador = 2
    
    (9 no s'inclou perquè és > 8)

---

## 💻 Exercicis de Programació

### Exercici 1: Números parells

Programa que mostri tots els números parells de l'1 al 20.

??? success "Solució"
    ```pseudocode
    ALGORISME NumerosParells
    INICI
        PER i ← 1 FINS 20 FER
            SI i mod 2 = 0 LLAVORS
                ESCRIURE i
            FI_SI
        FI_PER
    FI
    ```
    
    O més eficient:
    ```pseudocode
    ALGORISME NumerosParells
    INICI
        PER i ← 2 FINS 20 FER
            ESCRIURE i
            // (necessitaria PAS 2 en la següent classe)
        FI_PER
    FI
    ```

---

### Exercici 2: Factorial

Calcula el factorial d'un número (n! = 1 × 2 × 3 × ... × n).

??? tip "Ajuda"
    Usa un acumulador inicialitzat a 1 i multiplica.

??? success "Solució"
    ```pseudocode
    ALGORISME Factorial
    VARIABLES
        n, factorial: ENTER
        
    INICI
        ESCRIURE "Introdueix un número:"
        LLEGIR n
        
        factorial ← 1
        PER i ← 1 FINS n FER
            factorial ← factorial * i
        FI_PER
        
        ESCRIURE n, "! =", factorial
    FI
    ```

---

### Exercici 3: Comptar vocals

Llegeix 10 caràcters i compta quants són vocals (a, e, i, o, u).

??? success "Solució"
    ```pseudocode
    ALGORISME ComptarVocals
    VARIABLES
        lletra: CARÀCTER
        comptador: ENTER
        
    INICI
        comptador ← 0
        
        PER i ← 1 FINS 10 FER
            ESCRIURE "Caràcter", i, ":"
            LLEGIR lletra
            
            SI (lletra = 'a') O (lletra = 'e') O (lletra = 'i') O 
               (lletra = 'o') O (lletra = 'u') LLAVORS
                comptador ← comptador + 1
            FI_SI
        FI_PER
        
        ESCRIURE "Vocals trobades:", comptador
    FI
    ```

---

### Exercici 4: Mitjana de notes

Llegeix 6 notes i calcula la mitjana.

??? success "Solució"
    ```pseudocode
    ALGORISME MitjanaNotes
    VARIABLES
        nota, suma, mitjana: REAL
        
    INICI
        suma ← 0.0
        
        PER i ← 1 FINS 6 FER
            ESCRIURE "Nota", i, ":"
            LLEGIR nota
            suma ← suma + nota
        FI_PER
        
        mitjana ← suma / 6
        ESCRIURE "Mitjana:", mitjana
    FI
    ```

---

### Exercici 5: Potència

Calcula la potència de dos números (base^exponent) sense usar l'operador de potència.

??? success "Solució"
    ```pseudocode
    ALGORISME Potencia
    VARIABLES
        base, exponent: ENTER
        resultat: ENTER
        
    INICI
        ESCRIURE "Base:"
        LLEGIR base
        
        ESCRIURE "Exponent:"
        LLEGIR exponent
        
        resultat ← 1
        PER i ← 1 FINS exponent FER
            resultat ← resultat * base
        FI_PER
        
        ESCRIURE base, "^", exponent, "=", resultat
    FI
    ```

---

### Exercici 6: Suma de quadrats

Calcula la suma dels quadrats dels primers N números: 1² + 2² + 3² + ... + N².

??? success "Solució"
    ```pseudocode
    ALGORISME SumaQuadrats
    VARIABLES
        n, suma: ENTER
        
    INICI
        ESCRIURE "Fins a quin número?"
        LLEGIR n
        
        suma ← 0
        PER i ← 1 FINS n FER
            suma ← suma + (i * i)
        FI_PER
        
        ESCRIURE "Suma de quadrats:", suma
    FI
    ```

---

## 🏠 Deures

1. **Producte dels primers N números:** Programa que calculi 1 × 2 × 3 × ... × N.

2. **Taula de quadrats:** Mostra els quadrats dels números de l'1 al 15.

3. **Comptar múltiples:** Llegeix un número i compta quants múltiples té entre 1 i 100.

4. **Suma de parells:** Suma només els números parells entre 1 i N.

5. **Comissions:** Un venedor cobra 50€ de comissió per cada venda. Llegeix 8 vendes (CERT/FALS) i calcula el total de comissions.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ FOR és ideal per bucles amb iteracions conegudes
    - ✅ Sintaxi: `PER variable ← inici FINS fi FER`
    - ✅ La variable s'incrementa automàticament (+1)
    - ✅ **Comptador**: conta ocurrències
    - ✅ **Acumulador**: suma valors
    - ✅ NO modificar la variable de control manualment

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quantes vegades s'executa `PER i ← 1 FINS 5 FER`?
    
    a) 4  
    b) 5  
    c) 6  
    d) Infinites

??? success "Resposta"
    **b) 5**  
    Els valors són: 1, 2, 3, 4, 5

!!! question "Pregunta 2"
    Què fa un acumulador?
    
    a) Compta elements  
    b) Suma valors  
    c) Multiplica valors  
    d) Mostra resultats

??? success "Resposta"
    **b) Suma valors**  
    Un acumulador acumula (suma) valors

!!! question "Pregunta 3"
    Quin és l'error en aquest codi?
    ```
    PER i ← 1 FINS 10 FER
        i ← i * 2
        ESCRIURE i
    FI_PER
    ```
    
    a) Falta FI_PER  
    b) No es pot modificar i dins el bucle  
    c) Falta inicialitzar i  
    d) No hi ha error

??? success "Resposta"
    **b) No es pot modificar i dins el bucle**  
    El FOR gestiona automàticament la variable de control
