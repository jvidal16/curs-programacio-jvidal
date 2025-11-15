# Classe 5: Expressions Lògiques i Operadors Relacionals

## Objectius d'aprenentatge
- Comprendre els operadors de comparació
- Treballar amb el tipus de dades BOOLEÀ
- Avaluar expressions lògiques
- Aplicar comparacions en pseudocodi

---

## 1. Tipus de Dades BOOLEÀ

!!! note "Definició"
    Una variable **BOOLEANA** només pot tenir dos valors:
    
    - `CERT` (true, vertader, 1)
    - `FALS` (false, fals, 0)

### Exemple de declaració

```pseudocode
VARIABLES
    esAdult: BOOLEÀ
    teCarnetConduir: BOOLEÀ
    aprouat: BOOLEÀ
```

---

## 2. Operadors Relacionals (de Comparació)

| Operador | Significat | Exemple | Resultat |
|----------|-----------|---------|----------|
| `=` o `==` | Igual a | `5 = 5` | `CERT` |
| `≠` o `!=` | Diferent de | `5 ≠ 3` | `CERT` |
| `<` | Menor que | `3 < 5` | `CERT` |
| `>` | Major que | `5 > 3` | `CERT` |
| `≤` o `<=` | Menor o igual | `5 ≤ 5` | `CERT` |
| `≥` o `>=` | Major o igual | `3 ≥ 5` | `FALS` |

!!! info "Nota"
    En aquest curs utilitzarem: `=`, `≠`, `<`, `>`, `≤`, `≥`

---

## 3. Avaluació d'Expressions Relacionals

### Exemples amb números

=== "Comparacions simples"
    ```pseudocode
    10 > 5      // CERT
    3 < 2       // FALS
    7 = 7       // CERT
    4 ≠ 4       // FALS
    8 ≤ 10      // CERT
    15 ≥ 20     // FALS
    ```

=== "Amb variables"
    ```pseudocode
    VARIABLES
        edat: ENTER
        edatMinima: ENTER
        esMajor: BOOLEÀ
        
    INICI
        edat ← 18
        edatMinima ← 16
        
        esMajor ← edat > edatMinima  // CERT
        ESCRIURE "És major?", esMajor
    FI
    ```

---

## 4. Comparació amb TEXT

```pseudocode
VARIABLES
    nom1: TEXT
    nom2: TEXT
    sonIguals: BOOLEÀ
    
INICI
    nom1 ← "Anna"
    nom2 ← "ANNA"
    
    sonIguals ← nom1 = nom2  // FALS (distingeix majúscules!)
    ESCRIURE sonIguals
FI
```

!!! warning "Important"
    Les comparacions de text són **sensibles a majúscules/minúscules**.
    
    - `"Anna" = "anna"` → `FALS`
    - `"Hola" = "Hola"` → `CERT`

---

## 5. Exemples Pràctics

### Exemple 1: Comprovar si és adult

```pseudocode
ALGORISME ComprovacioEdat
VARIABLES
    edat: ENTER
    esAdult: BOOLEÀ
    
INICI
    ESCRIURE "Introdueix la teva edat:"
    LLEGIR edat
    
    esAdult ← edat ≥ 18
    
    ESCRIURE "És adult?", esAdult
FI
```

**Execucions:**
```
Input: 20  →  Output: És adult? CERT
Input: 15  →  Output: És adult? FALS
Input: 18  →  Output: És adult? CERT
```

---

### Exemple 2: Comprovar si aprova

```pseudocode
ALGORISME Aprovacio
VARIABLES
    nota: REAL
    aprova: BOOLEÀ
    
INICI
    ESCRIURE "Introdueix la nota:"
    LLEGIR nota
    
    aprova ← nota ≥ 5.0
    
    ESCRIURE "Aprovat:", aprova
FI
```

---

### Exemple 3: Comparació de preus

```pseudocode
ALGORISME ComparaPreus
VARIABLES
    preu1, preu2: REAL
    primer EsMesBarato: BOOLEÀ
    
INICI
    ESCRIURE "Preu del producte 1:"
    LLEGIR preu1
    
    ESCRIURE "Preu del producte 2:"
    LLEGIR preu2
    
    primerEsMesBarato ← preu1 < preu2
    
    ESCRIURE "El producte 1 és més barat?", primerEsMesBarato
FI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Avalua les expressions

Determina si són CERT o FALS:

1. `10 > 5`
2. `3 = 3`
3. `7 < 7`
4. `15 ≤ 15`
5. `20 ≠ 20`
6. `8 ≥ 10`
7. `"Hola" = "hola"`
8. `5 + 3 > 7`
9. `10 / 2 = 5`
10. `9 mod 2 ≠ 0`

??? success "Solucions"
    1. `CERT` (10 és major que 5)
    2. `CERT` (són iguals)
    3. `FALS` (7 no és menor que 7)
    4. `CERT` (15 és menor o igual a 15)
    5. `FALS` (són iguals)
    6. `FALS` (8 no és major ni igual a 10)
    7. `FALS` (distingeix majúscules)
    8. `CERT` (8 > 7)
    9. `CERT` (5 = 5)
    10. `CERT` (9 mod 2 = 1, i 1 ≠ 0)

---

### 🎯 Activitat 2: Traça el programa

Segueix l'execució:

```pseudocode
ALGORISME Traces
VARIABLES
    a, b: ENTER
    resultat1, resultat2: BOOLEÀ
    
INICI
    a ← 10
    b ← 15
    
    resultat1 ← a < b
    ESCRIURE "resultat1:", resultat1
    
    resultat2 ← a + 5 = b
    ESCRIURE "resultat2:", resultat2
    
    a ← a + 10
    resultat1 ← a > b
    ESCRIURE "resultat1:", resultat1
FI
```

??? success "Solució"
    ```
    a = 10, b = 15
    resultat1 = 10 < 15 = CERT
    Sortida: "resultat1: CERT"
    
    resultat2 = (10 + 5) = 15 = 15 = 15 = CERT
    Sortida: "resultat2: CERT"
    
    a = 10 + 10 = 20
    resultat1 = 20 > 15 = CERT
    Sortida: "resultat1: CERT"
    ```

---

### 🎯 Activitat 3: Completa el programa

```pseudocode
ALGORISME EdatMinima
VARIABLES
    edat, edatMinima: ENTER
    potEntrar: BOOLEÀ
    
INICI
    edatMinima ← 16
    
    ESCRIURE "Quants anys tens?"
    LLEGIR edat
    
    // Completa: comprova si pot entrar
    potEntrar ← _______________
    
    ESCRIURE "Pots entrar:", potEntrar
FI
```

??? success "Solució"
    ```pseudocode
    potEntrar ← edat ≥ edatMinima
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Comprovar si és parell

Escriu un programa que demani un número i indiqui si és parell.

??? tip "Ajuda"
    Un número és parell si `numero mod 2 = 0`

??? success "Solució"
    ```pseudocode
    ALGORISME EsParell
    VARIABLES
        numero: ENTER
        esParell: BOOLEÀ
        
    INICI
        ESCRIURE "Introdueix un número:"
        LLEGIR numero
        
        esParell ← (numero mod 2) = 0
        
        ESCRIURE "És parell?", esParell
    FI
    ```

---

### Exercici 2: Comprovar temperatura

Programa que llegeixi una temperatura i indiqui si és superior a 30°C.

??? success "Solució"
    ```pseudocode
    ALGORISME TemperaltaAlta
    VARIABLES
        temperatura: REAL
        esFaCal or: BOOLEÀ
        
    INICI
        ESCRIURE "Quina temperatura fa?"
        LLEGIR temperatura
        
        esFaCalor ← temperatura > 30.0
        
        ESCRIURE "Fa calor?", esFaCalor
    FI
    ```

---

### Exercici 3: Comprovar contrasenya

Programa que llegeixi una contrasenya i comprovi si coincideix amb "abc123".

??? success "Solució"
    ```pseudocode
    ALGORISME ComprovaContrasenya
    VARIABLES
        contrasenya: TEXT
        esCorrecta: BOOLEÀ
        
    INICI
        ESCRIURE "Introdueix la contrasenya:"
        LLEGIR contrasenya
        
        esCorrecta ← contrasenya = "abc123"
        
        ESCRIURE "Contrasenya correcta?", esCorrecta
    FI
    ```

---

### Exercici 4: Comparar dos números

Programa que llegeixi dos números i indiqui:
- Si són iguals
- Si el primer és major que el segon
- Si el primer és menor que el segon

??? success "Solució"
    ```pseudocode
    ALGORISME ComparaDosNumeros
    VARIABLES
        num1, num2: REAL
        sonIguals, primerMajor, primerMenor: BOOLEÀ
        
    INICI
        ESCRIURE "Primer número:"
        LLEGIR num1
        
        ESCRIURE "Segon número:"
        LLEGIR num2
        
        sonIguals ← num1 = num2
        primerMajor ← num1 > num2
        primerMenor ← num1 < num2
        
        ESCRIURE "Són iguals?", sonIguals
        ESCRIURE "El primer és major?", primerMajor
        ESCRIURE "El primer és menor?", primerMenor
    FI
    ```

---

### Exercici 5: Nota aprovada

Programa que llegeixi una nota (0-10) i indiqui si està aprovada (≥5).

??? success "Solució"
    ```pseudocode
    ALGORISME NotaAprovada
    VARIABLES
        nota: REAL
        aprovat: BOOLEÀ
        
    INICI
        ESCRIURE "Introdueix la nota (0-10):"
        LLEGIR nota
        
        aprovat ← nota ≥ 5.0
        
        ESCRIURE "Aprovat:", aprovat
    FI
    ```

---

## 🏠 Deures

1. **Edat per votar:** Programa que comprovi si una persona té edat per votar (≥18).

2. **Preu amb descompte:** Llegeix un preu i comprova si supera els 100€ (per aplicar descompte).

3. **Temperatura de congelació:** Comprova si la temperatura està sota 0°C.

4. **Divisibilitat:** Programa que llegeixi un número i comprovi si és divisible per 3.

5. **Comparació de notes:** Llegeix dues notes i indica si la primera és millor que la segona.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ El tipus BOOLEÀ té dos valors: CERT i FALS
    - ✅ Els operadors relacionals comparen valors: `=`, `≠`, `<`, `>`, `≤`, `≥`
    - ✅ Una expressió relacional avalua a CERT o FALS
    - ✅ Podem guardar resultats booleans en variables

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin és el resultat de `7 < 5`?
    
    a) CERT  
    b) FALS  
    c) 7  
    d) 5

??? success "Resposta"
    **b) FALS**  
    7 no és menor que 5

!!! question "Pregunta 2"
    Si `x = 10`, quin és el resultat de `x ≥ 10`?
    
    a) FALS  
    b) CERT  
    c) 10  
    d) Error

??? success "Resposta"
    **b) CERT**  
    10 és igual a 10, per tant ≥ és cert

!!! question "Pregunta 3"
    Quin operador utilitzaries per comprovar si dos valors són diferents?
    
    a) `=`  
    b) `<>`  
    c) `≠`  
    d) `!`

??? success "Resposta"
    **c) `≠`**  
    L'operador "diferent de"
