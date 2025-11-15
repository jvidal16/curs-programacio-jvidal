# Classe 9: Alternatives Niu ades

## Objectius d'aprenentatge
- Comprendre el concepte de niuament
- Implementar IF dins d'IF
- Treballar amb múltiples nivells de decisió
- Resoldre problemes amb intervals i categories

---

## 1. Què són les Alternatives Niuades?

!!! note "Definició"
    Les **alternatives niuades** consisteixen en col·locar un `IF` (o `IF-ELSE`) **dins d'un altre** `IF` (o `IF-ELSE`).

### Diagrama conceptual

```
SI condició1 LLAVORS
    SI condició2 LLAVORS
        // Acció si ambdues són certes
    FI_SI
FI_SI
```

---

## 2. Sintaxi Bàsica

```pseudocode
SI condició1 LLAVORS
    SI condició2 LLAVORS
        // S'executa si condició1 I condició2 són certes
    SINO
        // S'executa si condició1 és certa i condició2 falsa
    FI_SI
SINO
    // S'executa si condició1 és falsa
FI_SI
```

---

## 3. Exemple Simple

### Accés a una zona

```pseudocode
ALGORISME AccesZona
VARIABLES
    edat: ENTER
    teAutoritzacio: BOOLEÀ
    
INICI
    ESCRIURE "Edat:"
    LLEGIR edat
    
    ESCRIURE "Tens autorització? (CERT/FALS)"
    LLEGIR teAutoritzacio
    
    SI edat ≥ 18 LLAVORS
        SI teAutoritzacio LLAVORS
            ESCRIURE "ACCÉS PERMÈS"
        SINO
            ESCRIURE "Necessites autorització"
        FI_SI
    SINO
        ESCRIURE "Ets menor d'edat, no pots entrar"
    FI_SI
FI
```

---

## 4. Classificació per Intervals

### Exemple 1: Notes amb qualificacions

```pseudocode
ALGORISME QualificacioNota
VARIABLES
    nota: REAL
    
INICI
    ESCRIURE "Introdueix la nota (0-10):"
    LLEGIR nota
    
    SI nota < 5.0 LLAVORS
        ESCRIURE "SUSPÈS"
    SINO
        SI nota < 7.0 LLAVORS
            ESCRIURE "APROVAT"
        SINO
            SI nota < 9.0 LLAVORS
                ESCRIURE "NOTABLE"
            SINO
                ESCRIURE "EXCEL·LENT"
            FI_SI
        FI_SI
    FI_SI
FI
```

**Intervals:**
- 0-4.99: SUSPÈS
- 5-6.99: APROVAT
- 7-8.99: NOTABLE
- 9-10: EXCEL·LENT

---

### Exemple 2: Categories d'edat

```pseudocode
ALGORISME CategoriaEdat
VARIABLES
    edat: ENTER
    
INICI
    ESCRIURE "Edat:"
    LLEGIR edat
    
    SI edat < 12 LLAVORS
        ESCRIURE "Categoria: INFANTIL"
    SINO
        SI edat < 18 LLAVORS
            ESCRIURE "Categoria: ADOLESCENT"
        SINO
            SI edat < 65 LLAVORS
                ESCRIURE "Categoria: ADULT"
            SINO
                ESCRIURE "Categoria: SÈNIOR"
            FI_SI
        FI_SI
    FI_SI
FI
```

---

## 5. Múltiples Condicions

### Exemple: Descompte progressiu

```pseudocode
ALGORISME DescompteProgressiu
VARIABLES
    compra: REAL
    esVIP: BOOLEÀ
    descompte: REAL
    total: REAL
    
INICI
    ESCRIURE "Import de la compra:"
    LLEGIR compra
    
    ESCRIURE "Ets VIP? (CERT/FALS)"
    LLEGIR esVIP
    
    SI compra ≥ 100.0 LLAVORS
        SI esVIP LLAVORS
            descompte ← 0.20    // 20% VIP
        SINO
            descompte ← 0.10    // 10% normal
        FI_SI
    SINO
        SI esVIP LLAVORS
            descompte ← 0.10    // 10% VIP
        SINO
            descompte ← 0.0     // Sense descompte
        FI_SI
    FI_SI
    
    total ← compra * (1 - descompte)
    
    ESCRIURE "Descompte aplicat:", descompte * 100, "%"
    ESCRIURE "Total a pagar:", total, "€"
FI
```

---

## 6. Problemes Comuns i Solucions

### ❌ Error: Manca de claredat

```pseudocode
// Difícil de llegir
SI a > 0 LLAVORS
SI b > 0 LLAVORS
SI c > 0 LLAVORS
ESCRIURE "Tots positius"
FI_SI
FI_SI
FI_SI
```

### ✅ Millor: Indentació adequada

```pseudocode
// Més clar
SI a > 0 LLAVORS
    SI b > 0 LLAVORS
        SI c > 0 LLAVORS
            ESCRIURE "Tots positius"
        FI_SI
    FI_SI
FI_SI
```

### ✅ Encara millor: Operadors lògics

```pseudocode
// Més simple
SI (a > 0) I (b > 0) I (c > 0) LLAVORS
    ESCRIURE "Tots positius"
FI_SI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Traça el programa

Què mostrarà amb aquestes entrades?

```pseudocode
ALGORISME Traça
VARIABLES
    x, y: ENTER
    
INICI
    x ← 10
    y ← 5
    
    SI x > 5 LLAVORS
        SI y > 5 LLAVORS
            ESCRIURE "A"
        SINO
            ESCRIURE "B"
        FI_SI
    SINO
        ESCRIURE "C"
    FI_SI
FI
```

??? success "Solució"
    x = 10 > 5 → CERT
    Entra al primer IF
    
    y = 5 > 5 → FALS
    Va al SINO
    
    Mostra: **B**

---

### 🎯 Activitat 2: Completa el codi

Completa per classificar una temperatura:

```pseudocode
ALGORISME ClassificarTemperatura
VARIABLES
    temp: REAL
    
INICI
    LLEGIR temp
    
    SI temp < 0.0 LLAVORS
        ESCRIURE "MOLT FRED"
    SINO
        SI _______________ LLAVORS
            ESCRIURE "FRED"
        SINO
            SI _______________ LLAVORS
                ESCRIURE "AGRADABLE"
            SINO
                ESCRIURE "CALOR"
            FI_SI
        FI_SI
    FI_SI
FI
```

Intervals:
- < 0: MOLT FRED
- 0-15: FRED
- 15-25: AGRADABLE
- > 25: CALOR

??? success "Solució"
    ```pseudocode
    SI temp < 15.0 LLAVORS
        ESCRIURE "FRED"
    SINO
        SI temp < 25.0 LLAVORS
            ESCRIURE "AGRADABLE"
        SINO
            ESCRIURE "CALOR"
        FI_SI
    FI_SI
    ```

---

### 🎯 Activitat 3: Dibuixa el diagrama

Per aquest codi, dibuixa l'arbre de decisions:

```pseudocode
SI edat < 18 LLAVORS
    SI tePermis LLAVORS
        ESCRIURE "Pots conduir ciclomotor"
    SINO
        ESCRIURE "No pots conduir"
    FI_SI
SINO
    ESCRIURE "Pots conduir cotxe"
FI_SI
```

??? success "Diagrama"
    ```
                 edat < 18?
                  /      \
               SI/        \NO
                /          \
          tePermis?    "Pots conduir cotxe"
            /    \
         SI/      \NO
          /        \
    "Pots conduir  "No pots
     ciclomotor"    conduir"
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: IMC amb categories

Llegeix pes i alçada, calcula IMC i classifica:
- < 18.5: Baix pes
- 18.5-24.9: Normal
- 25-29.9: Sobrepès
- ≥ 30: Obesitat

??? tip "Fórmula"
    IMC = pes / (alçada * alçada)

??? success "Solució"
    ```pseudocode
    ALGORISME CalculIMC
    VARIABLES
        pes, alçada, imc: REAL
        
    INICI
        ESCRIURE "Pes (kg):"
        LLEGIR pes
        
        ESCRIURE "Alçada (m):"
        LLEGIR alçada
        
        imc ← pes / (alçada * alçada)
        
        ESCRIURE "IMC:", imc
        
        SI imc < 18.5 LLAVORS
            ESCRIURE "Baix pes"
        SINO
            SI imc < 25.0 LLAVORS
                ESCRIURE "Pes normal"
            SINO
                SI imc < 30.0 LLAVORS
                    ESCRIURE "Sobrepès"
                SINO
                    ESCRIURE "Obesitat"
                FI_SI
            FI_SI
        FI_SI
    FI
    ```

---

### Exercici 2: Preu d'entrada al parc

- Nens (<12): 5€
- Adolescents (12-17): 8€
- Adults (18-64): 12€
- Sèniors (≥65): 7€

??? success "Solució"
    ```pseudocode
    ALGORISME PreuEntradaParc
    VARIABLES
        edat: ENTER
        preu: REAL
        
    INICI
        ESCRIURE "Edat:"
        LLEGIR edat
        
        SI edat < 12 LLAVORS
            preu ← 5.0
        SINO
            SI edat < 18 LLAVORS
                preu ← 8.0
            SINO
                SI edat < 65 LLAVORS
                    preu ← 12.0
                SINO
                    preu ← 7.0
                FI_SI
            FI_SI
        FI_SI
        
        ESCRIURE "Preu entrada:", preu, "€"
    FI
    ```

---

### Exercici 3: Calculadora d'impostos

- Ingressos < 12000€: 0% impostos
- 12000-30000€: 15% sobre l'excés de 12000
- > 30000€: 2700€ + 25% sobre l'excés de 30000

??? success "Solució"
    ```pseudocode
    ALGORISME CalculImpostos
    VARIABLES
        ingressos, impostos: REAL
        
    INICI
        ESCRIURE "Ingressos anuals:"
        LLEGIR ingressos
        
        SI ingressos < 12000.0 LLAVORS
            impostos ← 0.0
        SINO
            SI ingressos < 30000.0 LLAVORS
                impostos ← (ingressos - 12000.0) * 0.15
            SINO
                impostos ← 2700.0 + (ingressos - 30000.0) * 0.25
            FI_SI
        FI_SI
        
        ESCRIURE "Impostos a pagar:", impostos, "€"
    FI
    ```

---

## 🏠 Deures

1. **Qualificació lletra:** Converteix nota numèrica (0-100) a:
   - 90-100: A
   - 80-89: B
   - 70-79: C
   - 60-69: D
   - <60: F

2. **Descompte per volum i client:** 
   - VIP + compra>500: 25%
   - VIP + compra>100: 15%
   - Normal + compra>500: 15%
   - Normal + compra>100: 10%

3. **Categoria esportiva:** Per edat i gènere (masculí/femení), classifica en categories infantil/cadet/júnior/sènior.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ Les alternatives niuades són IF dins d'IF
    - ✅ Permeten decisions més complexes
    - ✅ La indentació és clau per la llegibilitat
    - ✅ A vegades és millor usar operadors lògics

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    En quin cas és millor usar IF niuats que operadors lògics?
    
    a) Sempre  
    b) Quan tenim intervals no consecutius  
    c) Mai  
    d) Quan volem comprovar intervals consecutius

??? success "Resposta"
    **d) Quan volem comprovar intervals consecutius**  
    Per exemple, classificar notes o temperatures per rangs

!!! question "Pregunta 2"
    Quants FI_SI necessitem per 3 nivells de niuament?
    
    a) 1  
    b) 2  
    c) 3  
    d) 4

??? success "Resposta"
    **c) 3**  
    Un FI_SI per cada SI
