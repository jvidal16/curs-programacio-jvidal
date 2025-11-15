# Classe 3: Expressions Numèriques

## Objectius d'aprenentatge
- Conèixer els operadors aritmètics
- Entendre la prioritat d'operadors
- Crear expressions numèriques compostes
- Aplicar operadors en problemes reals

---

## 1. Operadors Aritmètics Bàsics

| Operador | Operació | Exemple | Resultat |
|----------|----------|---------|----------|
| `+` | Suma | `5 + 3` | `8` |
| `-` | Resta | `10 - 4` | `6` |
| `*` | Multiplicació | `7 * 2` | `14` |
| `/` | Divisió real | `15 / 2` | `7.5` |
| `div` | Divisió entera | `15 div 2` | `7` |
| `mod` | Mòdul (residu) | `15 mod 2` | `1` |

---

## 2. Operadors Especials: div i mod

### 2.1 Divisió entera (div)

!!! info "div - Divisió entera"
    Retorna només la part entera de la divisió (sense decimals).
    
    ```pseudocode
    17 div 5 = 3      // 17 ÷ 5 = 3 amb residu 2
    20 div 3 = 6      // 20 ÷ 3 = 6 amb residu 2
    8 div 2 = 4       // 8 ÷ 2 = 4 amb residu 0
    ```

### 2.2 Mòdul (mod)

!!! info "mod - Residu"
    Retorna el residu de la divisió.
    
    ```pseudocode
    17 mod 5 = 2      // El residu de 17 ÷ 5 és 2
    20 mod 3 = 2      // El residu de 20 ÷ 3 és 2
    8 mod 2 = 0       // El residu de 8 ÷ 2 és 0
    15 mod 4 = 3      // El residu de 15 ÷ 4 és 3
    ```

### Aplicacions pràctiques

=== "Comprovar si és parell"
    ```pseudocode
    ALGORISME EsParell
    VARIABLES
        numero: ENTER
        residu: ENTER
        
    INICI
        numero ← 14
        residu ← numero mod 2
        
        ESCRIURE "El residu és:", residu
        // Si residu = 0, el número és parell
    FI
    ```

=== "Convertir minuts a hores"
    ```pseudocode
    ALGORISME MinutsAHores
    VARIABLES
        minutsTotals: ENTER
        hores: ENTER
        minutsRestants: ENTER
        
    INICI
        minutsTotals ← 135
        hores ← minutsTotals div 60     // 135 div 60 = 2
        minutsRestants ← minutsTotals mod 60  // 135 mod 60 = 15
        
        ESCRIURE hores, "hores i", minutsRestants, "minuts"
        // Mostra: 2 hores i 15 minuts
    FI
    ```

---

## 3. Prioritat d'Operadors

!!! warning "Ordre d'avaluació"
    1. Parèntesis `( )`
    2. Multiplicació, divisió: `*`, `/`, `div`, `mod`
    3. Suma, resta: `+`, `-`

### Exemples

=== "Sense parèntesis"
    ```pseudocode
    resultat ← 5 + 3 * 2
    // Primer: 3 * 2 = 6
    // Després: 5 + 6 = 11
    // resultat = 11
    ```

=== "Amb parèntesis"
    ```pseudocode
    resultat ← (5 + 3) * 2
    // Primer: 5 + 3 = 8
    // Després: 8 * 2 = 16
    // resultat = 16
    ```

=== "Més complex"
    ```pseudocode
    resultat ← 10 + 6 / 2 * 3 - 1
    // Pas 1: 6 / 2 = 3
    // Pas 2: 3 * 3 = 9
    // Pas 3: 10 + 9 = 19
    // Pas 4: 19 - 1 = 18
    // resultat = 18
    ```

---

## 4. Expressions Compostes

### Exemple: Càlcul d'àrea i perímetre

```pseudocode
ALGORISME Rectangle
VARIABLES
    base: REAL
    alçada: REAL
    area: REAL
    perimetre: REAL
    
INICI
    base ← 8.5
    alçada ← 4.0
    
    area ← base * alçada
    perimetre ← 2 * (base + alçada)
    
    ESCRIURE "Àrea:", area, "m²"
    ESCRIURE "Perímetre:", perimetre, "m"
FI
```

### Exemple: Conversió de temperatures

```pseudocode
ALGORISME CelsiusAFahrenheit
VARIABLES
    celsius: REAL
    fahrenheit: REAL
    
INICI
    celsius ← 25.0
    fahrenheit ← (celsius * 9 / 5) + 32
    
    ESCRIURE celsius, "°C són", fahrenheit, "°F"
FI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Calcula mentalment

Quin és el resultat de cada expressió?

1. `8 + 4 * 2` = ?
2. `(8 + 4) * 2` = ?
3. `20 / 4 + 3` = ?
4. `20 / (4 + 3)` = ?
5. `15 mod 4` = ?
6. `15 div 4` = ?
7. `18 mod 3` = ?
8. `10 - 3 * 2 + 1` = ?

??? success "Solucions"
    1. `8 + 4 * 2 = 8 + 8 = 16`
    2. `(8 + 4) * 2 = 12 * 2 = 24`
    3. `20 / 4 + 3 = 5 + 3 = 8`
    4. `20 / (4 + 3) = 20 / 7 = 2.857...`
    5. `15 mod 4 = 3` (residu de 15÷4)
    6. `15 div 4 = 3` (part entera de 15÷4)
    7. `18 mod 3 = 0` (18 és divisible per 3)
    8. `10 - 3 * 2 + 1 = 10 - 6 + 1 = 5`

---

### 🎯 Activitat 2: Traça el programa

Segueix l'execució pas a pas:

```pseudocode
ALGORISME Calculs
VARIABLES
    a, b, c: ENTER
    
INICI
    a ← 10
    b ← 3
    c ← a + b * 2
    ESCRIURE "c =", c
    
    a ← c - 5
    ESCRIURE "a =", a
    
    b ← a mod 4
    ESCRIURE "b =", b
FI
```

??? success "Solució"
    ```
    Pas 1: a = 10
    Pas 2: b = 3
    Pas 3: c = 10 + 3 * 2 = 10 + 6 = 16
    Sortida: "c = 16"
    
    Pas 4: a = 16 - 5 = 11
    Sortida: "a = 11"
    
    Pas 5: b = 11 mod 4 = 3
    Sortida: "b = 3"
    ```

---

### 🎯 Activitat 3: Corregeix els errors

Troba i corregeix els errors en aquest programa:

```pseudocode
ALGORISME CalculPreuTotal
VARIABLES
    preu: REAL
    quantitat: ENTER
    total REAL
    
INICI
    preu ← 15.99
    quantitat ← 3
    total ← preu quantitat
    
    ESCRIURE "Total:", total €
FI
```

??? success "Solució"
    ```pseudocode
    ALGORISME CalculPreuTotal
    VARIABLES
        preu: REAL
        quantitat: ENTER
        total: REAL              // Faltava :
        
    INICI
        preu ← 15.99
        quantitat ← 3
        total ← preu * quantitat  // Faltava *
        
        ESCRIURE "Total:", total, "€"  // Faltava ,
    FI
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Càlcul d'àrea d'un cercle

Escriu un programa que calculi l'àrea d'un cercle amb radi 7.5.

**Fórmula:** `àrea = π × radi²`

??? tip "Ajuda"
    Declara una constant `PI = 3.14159`

??? success "Solució"
    ```pseudocode
    ALGORISME AreaCercle
    CONSTANTS
        PI = 3.14159
        
    VARIABLES
        radi: REAL
        area: REAL
        
    INICI
        radi ← 7.5
        area ← PI * radi * radi
        
        ESCRIURE "L'àrea del cercle és:", area, "m²"
    FI
    ```

---

### Exercici 2: Conversió de segons

Crea un programa que converteixi 3725 segons a hores, minuts i segons.

**Pista:** Usa `div` i `mod`

??? success "Solució"
    ```pseudocode
    ALGORISME ConvertirSegons
    VARIABLES
        segonsTotals: ENTER
        hores: ENTER
        minuts: ENTER
        segons: ENTER
        
    INICI
        segonsTotals ← 3725
        
        hores ← segonsTotals div 3600
        minuts ← (segonsTotals mod 3600) div 60
        segons ← segonsTotals mod 60
        
        ESCRIURE hores, "h", minuts, "m", segons, "s"
        // Mostra: 1h 2m 5s
    FI
    ```

---

### Exercici 3: Mitjana de tres notes

Calcula la mitjana de tres notes: 7.5, 8.0 i 6.5

??? success "Solució"
    ```pseudocode
    ALGORISME MitjanaNotes
    VARIABLES
        nota1, nota2, nota3: REAL
        mitjana: REAL
        
    INICI
        nota1 ← 7.5
        nota2 ← 8.0
        nota3 ← 6.5
        
        mitjana ← (nota1 + nota2 + nota3) / 3
        
        ESCRIURE "La mitjana és:", mitjana
    FI
    ```

---

### Exercici 4: Preu amb IVA

Calcula el preu final d'un producte que costa 49.99€ aplicant-li un 21% d'IVA.

??? success "Solució"
    ```pseudocode
    ALGORISME PreuAmbIVA
    CONSTANTS
        IVA = 0.21
        
    VARIABLES
        preuBase: REAL
        preuFinal: REAL
        
    INICI
        preuBase ← 49.99
        preuFinal ← preuBase * (1 + IVA)
        
        ESCRIURE "Preu base:", preuBase, "€"
        ESCRIURE "Preu amb IVA:", preuFinal, "€"
    FI
    ```

---

### Exercici 5: Repartiment de caramels

Tens 47 caramels i vols repartir-los equitativament entre 6 amics. 
Calcula:
- Quants caramels rebrà cada amic
- Quants caramels sobraran

??? success "Solució"
    ```pseudocode
    ALGORISME RepartirCaramels
    VARIABLES
        caramels: ENTER
        amics: ENTER
        perPersona: ENTER
        sobren: ENTER
        
    INICI
        caramels ← 47
        amics ← 6
        
        perPersona ← caramels div amics
        sobren ← caramels mod amics
        
        ESCRIURE "Cada amic rep:", perPersona, "caramels"
        ESCRIURE "Sobren:", sobren, "caramels"
    FI
    ```

---

## 🏠 Deures

1. **Velocitat mitjana:** Escriu un programa que calculi la velocitat mitjana d'un cotxe que ha recorregut 250 km en 3.5 hores. Fórmula: `velocitat = distància / temps`

2. **Canvi de moneda:** Converteix 100 euros a dòlars (tipus de canvi: 1€ = 1.18$)

3. **Volum d'un cilindre:** Calcula el volum d'un cilindre amb radi 3.0 i alçada 10.0. Fórmula: `volum = π × radi² × alçada`

4. **Descompte:** Un article costa 89.90€ i té un descompte del 15%. Calcula el preu final.

5. **Últim dígit:** Escriu un programa que obtingui l'últim dígit d'un número (ex: de 5849 obtenir 9). Pista: usa `mod`

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ Els operadors bàsics són: `+`, `-`, `*`, `/`
    - ✅ `div` dóna la part entera, `mod` dóna el residu
    - ✅ La prioritat: parèntesis > multiplicació/divisió > suma/resta
    - ✅ Les expressions compostes combinen diversos operadors

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin és el resultat de `23 mod 5`?
    
    a) 4  
    b) 3  
    c) 5  
    d) 0

??? success "Resposta"
    **b) 3**  
    23 ÷ 5 = 4 amb residu 3

!!! question "Pregunta 2"
    Quin és el resultat de `5 + 3 * 2`?
    
    a) 16  
    b) 11  
    c) 13  
    d) 8

??? success "Resposta"
    **b) 11**  
    Primer 3 * 2 = 6, després 5 + 6 = 11

!!! question "Pregunta 3"
    Quin operador utilitzaries per saber si un número és divisible per 3?
    
    a) `div`  
    b) `/`  
    c) `mod`  
    d) `*`

??? success "Resposta"
    **c) `mod`**  
    Si `numero mod 3 = 0`, és divisible per 3
