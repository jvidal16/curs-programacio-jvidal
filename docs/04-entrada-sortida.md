# Classe 4: Sentències d'Assignació i Entrada/Sortida

## Objectius d'aprenentatge
- Dominar l'operador d'assignació
- Utilitzar sentències de lectura de dades
- Utilitzar sentències d'escriptura de dades
- Crear algorismes interactius complets

---

## 1. L'Operador d'Assignació

!!! note "Definició"
    L'operador d'assignació **guarda un valor** en una variable.

### Sintaxi

```pseudocode
variable ← expressió
```

!!! info "Simbols alternatius"
    Segons el context, també es pot veure:
    
    - `variable := expressió`
    - `variable = expressió`
    
    En aquest curs utilitzarem: `←`

---

## 2. Com Funciona l'Assignació

### 2.1 Assignació simple

```pseudocode
VARIABLES
    edat: ENTER
    
INICI
    edat ← 16
    // Ara edat conté el valor 16
FI
```

### 2.2 Assignació amb càlcul

```pseudocode
VARIABLES
    base, alçada, area: REAL
    
INICI
    base ← 5.0
    alçada ← 3.0
    area ← base * alçada    // area = 15.0
FI
```

### 2.3 Assignació amb altres variables

```pseudocode
VARIABLES
    preu, iva, total: REAL
    
INICI
    preu ← 100.0
    iva ← preu * 0.21       // iva = 21.0
    total ← preu + iva      // total = 121.0
FI
```

---

## 3. Avaluació d'Expressions

!!! warning "Important"
    Primer s'avalua la part **dreta** (expressió) i després s'assigna a la **esquerra** (variable).

=== "Exemple 1"
    ```pseudocode
    VARIABLES
        x, y: ENTER
        
    INICI
        x ← 5
        y ← x + 3
        // Pas 1: Avaluar x + 3 = 5 + 3 = 8
        // Pas 2: Assignar 8 a y
        // Resultat: y = 8
    FI
    ```

=== "Exemple 2"
    ```pseudocode
    VARIABLES
        comptador: ENTER
        
    INICI
        comptador ← 0
        comptador ← comptador + 1
        // Pas 1: Avaluar comptador + 1 = 0 + 1 = 1
        // Pas 2: Assignar 1 a comptador
        // Resultat: comptador = 1
    FI
    ```

---

## 4. Sentències de Sortida: ESCRIURE

!!! tip "ESCRIURE"
    Mostra informació a l'usuari (pantalla, consola).

### Sintaxi

```pseudocode
ESCRIURE expressió1, expressió2, ...
```

### Exemples

=== "Text simple"
    ```pseudocode
    ESCRIURE "Hola món!"
    // Mostra: Hola món!
    ```

=== "Variables"
    ```pseudocode
    nom ← "Maria"
    ESCRIURE nom
    // Mostra: Maria
    ```

=== "Combinat"
    ```pseudocode
    edat ← 16
    ESCRIURE "Tinc", edat, "anys"
    // Mostra: Tinc 16 anys
    ```

=== "Expressions"
    ```pseudocode
    a ← 5
    b ← 3
    ESCRIURE "La suma és:", a + b
    // Mostra: La suma és: 8
    ```

---

## 5. Sentències d'Entrada: LLEGIR

!!! tip "LLEGIR"
    Captura dades de l'usuari durant l'execució del programa.

### Sintaxi

```pseudocode
LLEGIR variable
```

### Exemple bàsic

```pseudocode
ALGORISME Salutacio
VARIABLES
    nom: TEXT
    
INICI
    ESCRIURE "Com et dius?"
    LLEGIR nom
    ESCRIURE "Hola", nom, "!"
FI
```

**Execució:**
```
Com et dius?
[usuari escriu: Joan]
Hola Joan !
```

---

## 6. Programa Interactiu Complet

### Exemple 1: Càlcul d'àrea

```pseudocode
ALGORISME AreaRectangle
VARIABLES
    base: REAL
    alçada: REAL
    area: REAL
    
INICI
    ESCRIURE "Càlcul de l'àrea d'un rectangle"
    ESCRIURE "--------------------------------"
    
    ESCRIURE "Introdueix la base:"
    LLEGIR base
    
    ESCRIURE "Introdueix l'alçada:"
    LLEGIR alçada
    
    area ← base * alçada
    
    ESCRIURE "L'àrea és:", area, "m²"
FI
```

**Execució exemple:**
```
Càlcul de l'àrea d'un rectangle
--------------------------------
Introdueix la base:
[usuari: 8.5]
Introdueix l'alçada:
[usuari: 4.0]
L'àrea és: 34.0 m²
```

---

### Exemple 2: Conversió de temperatures

```pseudocode
ALGORISME CelsiusAFahrenheit
VARIABLES
    celsius: REAL
    fahrenheit: REAL
    
INICI
    ESCRIURE "Conversió de Celsius a Fahrenheit"
    ESCRIURE "Introdueix la temperatura en Celsius:"
    LLEGIR celsius
    
    fahrenheit ← (celsius * 9 / 5) + 32
    
    ESCRIURE celsius, "°C són", fahrenheit, "°F"
FI
```

---

### Exemple 3: Compra amb IVA

```pseudocode
ALGORISME CalculPreuFinal
CONSTANTS
    IVA = 0.21
    
VARIABLES
    preuBase: REAL
    importIVA: REAL
    preuFinal: REAL
    
INICI
    ESCRIURE "Introdueix el preu del producte:"
    LLEGIR preuBase
    
    importIVA ← preuBase * IVA
    preuFinal ← preuBase + importIVA
    
    ESCRIURE "-------------------------"
    ESCRIURE "Preu base:    ", preuBase, "€"
    ESCRIURE "IVA (21%):    ", importIVA, "€"
    ESCRIURE "-------------------------"
    ESCRIURE "Preu final:   ", preuFinal, "€"
FI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Traça el programa

Segueix aquest programa pas a pas:

```pseudocode
ALGORISME Traça
VARIABLES
    a, b, c: ENTER
    
INICI
    a ← 10
    b ← 5
    ESCRIURE "a =", a, "b =", b
    
    c ← a + b
    ESCRIURE "c =", c
    
    a ← c - 3
    ESCRIURE "a =", a
    
    b ← a * 2
    ESCRIURE "b =", b
FI
```

??? success "Solució"
    ```
    a = 10
    b = 5
    Sortida: "a = 10 b = 5"
    
    c = 10 + 5 = 15
    Sortida: "c = 15"
    
    a = 15 - 3 = 12
    Sortida: "a = 12"
    
    b = 12 * 2 = 24
    Sortida: "b = 24"
    ```

---

### 🎯 Activitat 2: Intercanvi de valors

Què mostrarà aquest programa?

```pseudocode
ALGORISME Intercanvi
VARIABLES
    x, y, temp: ENTER
    
INICI
    x ← 5
    y ← 10
    
    ESCRIURE "Abans: x =", x, "y =", y
    
    temp ← x
    x ← y
    y ← temp
    
    ESCRIURE "Després: x =", x, "y =", y
FI
```

??? success "Solució"
    ```
    Abans: x = 5 y = 10
    Després: x = 10 y = 5
    ```
    
    Aquest és un patró clàssic per intercanviar valors!

---

### 🎯 Activitat 3: Completa el programa

Completa aquest programa perquè demani el radi i calculi la circumferència:

```pseudocode
ALGORISME Circumferencia
CONSTANTS
    PI = 3.14159
    
VARIABLES
    radi: REAL
    circumferencia: REAL
    
INICI
    ESCRIURE "Introdueix el radi del cercle:"
    // Completa aquí
    
    // Completa el càlcul (C = 2 * π * r)
    
    ESCRIURE "La circumferència és:", circumferencia
FI
```

??? success "Solució"
    ```pseudocode
    ALGORISME Circumferencia
    CONSTANTS
        PI = 3.14159
        
    VARIABLES
        radi: REAL
        circumferencia: REAL
        
    INICI
        ESCRIURE "Introdueix el radi del cercle:"
        LLEGIR radi
        
        circumferencia ← 2 * PI * radi
        
        ESCRIURE "La circumferència és:", circumferencia
    FI
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Suma de dos números

Crea un programa que demani dos números a l'usuari i mostri la seva suma.

??? success "Solució"
    ```pseudocode
    ALGORISME SumaDosNumeros
    VARIABLES
        num1, num2, suma: REAL
        
    INICI
        ESCRIURE "Introdueix el primer número:"
        LLEGIR num1
        
        ESCRIURE "Introdueix el segon número:"
        LLEGIR num2
        
        suma ← num1 + num2
        
        ESCRIURE "La suma és:", suma
    FI
    ```

---

### Exercici 2: Càlcul de mitjana

Programa que demani 4 notes i calculi la mitjana.

??? success "Solució"
    ```pseudocode
    ALGORISME MitjanaQuatreNotes
    VARIABLES
        nota1, nota2, nota3, nota4: REAL
        mitjana: REAL
        
    INICI
        ESCRIURE "Introdueix la primera nota:"
        LLEGIR nota1
        
        ESCRIURE "Introdueix la segona nota:"
        LLEGIR nota2
        
        ESCRIURE "Introdueix la tercera nota:"
        LLEGIR nota3
        
        ESCRIURE "Introdueix la quarta nota:"
        LLEGIR nota4
        
        mitjana ← (nota1 + nota2 + nota3 + nota4) / 4
        
        ESCRIURE "La mitjana és:", mitjana
    FI
    ```

---

### Exercici 3: Conversió de moneda

Programa que converteixi euros a dòlars (tipus de canvi: 1€ = 1.18$).

??? success "Solució"
    ```pseudocode
    ALGORISME EurosADolars
    CONSTANTS
        TIPUS_CANVI = 1.18
        
    VARIABLES
        euros: REAL
        dolars: REAL
        
    INICI
        ESCRIURE "Quants euros vols convertir?"
        LLEGIR euros
        
        dolars ← euros * TIPUS_CANVI
        
        ESCRIURE euros, "€ són", dolars, "$"
    FI
    ```

---

### Exercici 4: Preu total de compra

Programa que demani preu i quantitat, i calculi el total a pagar.

??? success "Solució"
    ```pseudocode
    ALGORISME PreuTotalCompra
    VARIABLES
        preu: REAL
        quantitat: ENTER
        total: REAL
        
    INICI
        ESCRIURE "Introdueix el preu unitari:"
        LLEGIR preu
        
        ESCRIURE "Quantes unitats vols comprar?"
        LLEGIR quantitat
        
        total ← preu * quantitat
        
        ESCRIURE "Total a pagar:", total, "€"
    FI
    ```

---

### Exercici 5: Edat en dies

Programa que demani l'edat en anys i la converteixi a dies (aproximat).

??? tip "Ajuda"
    1 any ≈ 365 dies

??? success "Solució"
    ```pseudocode
    ALGORISME EdatEnDies
    VARIABLES
        edatAnys: ENTER
        edatDies: ENTER
        
    INICI
        ESCRIURE "Quants anys tens?"
        LLEGIR edatAnys
        
        edatDies ← edatAnys * 365
        
        ESCRIURE "Tens aproximadament", edatDies, "dies!"
    FI
    ```

---

## 🏠 Deures

1. **Hipotenusa:** Programa que demani els dos catets d'un triangle rectangle i calculi la hipotenusa. 
   Fórmula: `h² = a² + b²` → `h = √(a² + b²)`

2. **Repartiment:** Programa que demani diners i número de persones, i calculi quant rep cada persona.

3. **Hores treballades:** Demana hores treballades i preu per hora, calcula el salari total.

4. **IMC:** Programa que demani pes (kg) i alçada (m), i calculi l'Índex de Massa Corporal.
   Fórmula: `IMC = pes / (alçada * alçada)`

5. **Descompte:** Demana preu original i percentatge de descompte, calcula preu final.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ L'assignació `←` guarda un valor en una variable
    - ✅ Primer s'avalua l'expressió, després s'assigna
    - ✅ `ESCRIURE` mostra informació a l'usuari
    - ✅ `LLEGIR` captura dades de l'usuari
    - ✅ Els programes interactius combinen entrada i sortida

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Després d'executar `x ← 5` i `x ← x + 3`, quin valor té x?
    
    a) 5  
    b) 3  
    c) 8  
    d) Error

??? success "Resposta"
    **c) 8**  
    Primer x = 5, després x = 5 + 3 = 8

!!! question "Pregunta 2"
    Quina instrucció mostra el text "Hola"?
    
    a) `LLEGIR "Hola"`  
    b) `ESCRIURE "Hola"`  
    c) `"Hola" ← ESCRIURE`  
    d) `IMPRIMIR "Hola"`

??? success "Resposta"
    **b) `ESCRIURE "Hola"`**

!!! question "Pregunta 3"
    Com es captura un valor de l'usuari i es guarda a una variable `edat`?
    
    a) `ESCRIURE edat`  
    b) `edat ← LLEGIR`  
    c) `LLEGIR edat`  
    d) `INPUT edat`

??? success "Resposta"
    **c) `LLEGIR edat`**  
    (En el nostre pseudocodi utilitzem LLEGIR)
