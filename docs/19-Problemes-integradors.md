# Classe 19: Problemes Integradors

## Objectius d'aprenentatge
- Resoldre problemes complexos complets
- Aplicar metodologia de resolució
- Optimitzar solucions
- Fer traça d'algorismes

---

## 1. Metodologia de Resolució

!!! note "Els 5 passos"
    1. **Entendre** el problema
    2. **Planificar** la solució
    3. **Escriure** l'algorisme
    4. **Provar** amb exemples
    5. **Optimitzar** si cal

### Descomposició del problema

```
PROBLEMA COMPLEX
    ↓
┌─────────────────────┐
│ Subproblema 1       │
│ Subproblema 2       │
│ Subproblema 3       │
└─────────────────────┘
    ↓
SOLUCIÓ COMPLETA
```

---

## 2. Problema 1: Sistema de Notes

### Enunciat

Programa que:

1. Demana nombre d'alumnes
2. Per cada alumne: 3 notes
3. Calcula mitjana individual
4. Mostra aprovat/suspès (≥5)
5. Calcula mitjana de classe

---

### Solució

```pseudocode
ALGORISME SistemaDeNotes
VARIABLES
    n_alumnes, i, j: ENTER
    nota, suma_alumne, mitjana_alumne: REAL
    suma_classe, mitjana_classe: REAL
    aprovats, suspesos: ENTER
    
INICI
    ESCRIURE "Nombre d'alumnes:"
    LLEGIR n_alumnes
    
    // Validar
    MENTRE n_alumnes ≤ 0 FER
        ESCRIURE "Ha de ser positiu:"
        LLEGIR n_alumnes
    FI_MENTRE
    
    suma_classe ← 0
    aprovats ← 0
    suspesos ← 0
    
    // Processar cada alumne
    PER i ← 1 FINS n_alumnes FER
        ESCRIURE "=== ALUMNE", i, "==="
        suma_alumne ← 0
        
        // Llegir 3 notes
        PER j ← 1 FINS 3 FER
            ESCRIURE "Nota", j, ":"
            LLEGIR nota
            
            MENTRE (nota < 0) O (nota > 10) FER
                ESCRIURE "Entre 0 i 10:"
                LLEGIR nota
            FI_MENTRE
            
            suma_alumne ← suma_alumne + nota
        FI_PER
        
        // Mitjana alumne
        mitjana_alumne ← suma_alumne / 3
        suma_classe ← suma_classe + mitjana_alumne
        
        ESCRIURE "Mitjana:", mitjana_alumne
        
        SI mitjana_alumne ≥ 5 LLAVORS
            ESCRIURE "APROVAT"
            aprovats ← aprovats + 1
        SINO
            ESCRIURE "SUSPÈS"
            suspesos ← suspesos + 1
        FI_SI
    FI_PER
    
    // Resum classe
    mitjana_classe ← suma_classe / n_alumnes
    
    ESCRIURE ""
    ESCRIURE "=== RESUM ==="
    ESCRIURE "Mitjana classe:", mitjana_classe
    ESCRIURE "Aprovats:", aprovats
    ESCRIURE "Suspesos:", suspesos
    ESCRIURE "% Aprovats:", (aprovats * 100) / n_alumnes
FI
```

---

## 3. Problema 2: Joc Endevinar Número

### Enunciat

Joc on:

- Programa genera número 1-100
- Usuari té 7 intents
- Programa dona pistes
- Mostra si guanya i en quants intents

---

### Solució

```pseudocode
ALGORISME JocEndevinar
CONSTANTS
    MIN = 1
    MAX = 100
    MAX_INTENTS = 7
    
VARIABLES
    secret, intent: ENTER
    num_intents: ENTER
    encertat: BOOLEÀ
    
INICI
    secret ← ALEATORI(MIN, MAX)
    
    ESCRIURE "Número entre", MIN, "i", MAX
    ESCRIURE "Tens", MAX_INTENTS, "intents"
    
    num_intents ← 0
    encertat ← FALS
    
    MENTRE (num_intents < MAX_INTENTS) I (NOT encertat) FER
        num_intents ← num_intents + 1
        ESCRIURE "Intent", num_intents, ":"
        LLEGIR intent
        
        MENTRE (intent < MIN) O (intent > MAX) FER
            ESCRIURE "Entre", MIN, "i", MAX, ":"
            LLEGIR intent
        FI_MENTRE
        
        SI intent = secret LLAVORS
            encertat ← CERT
            ESCRIURE "CORRECTE en", num_intents, "intents!"
        SINO
            SI intent < secret LLAVORS
                ESCRIURE "MÉS GRAN"
            SINO
                ESCRIURE "MÉS PETIT"
            FI_SI
            
            SI num_intents < MAX_INTENTS LLAVORS
                ESCRIURE "Intents restants:", MAX_INTENTS - num_intents
            FI_SI
        FI_SI
    FI_MENTRE
    
    SI NOT encertat LLAVORS
        ESCRIURE "Has perdut! Era:", secret
    FI_SI
FI
```

---

## 4. Problema 3: Anàlisi de Vendes

### Enunciat

Analitzar vendes setmanals (7 dies):

- Demanar vendes de cada dia
- Calcular total i mitjana
- Trobar millor i pitjor dia
- Comptar dies sobre la mitjana

---

### Solució

```pseudocode
ALGORISME AnalisiVendes
CONSTANTS
    DIES = 7
    
VARIABLES
    vendes: ARRAY[1..7] DE REAL
    dia: ENTER
    total, mitjana: REAL
    millor, pitjor: REAL
    dia_millor, dia_pitjor: ENTER
    dies_sobre_mitjana: ENTER
    
INICI
    total ← 0
    
    // Recollir dades
    PER dia ← 1 FINS DIES FER
        ESCRIURE "Vendes dia", dia, ":"
        LLEGIR vendes[dia]
        
        MENTRE vendes[dia] < 0 FER
            ESCRIURE "No pot ser negatiu:"
            LLEGIR vendes[dia]
        FI_MENTRE
        
        total ← total + vendes[dia]
    FI_PER
    
    // Mitjana
    mitjana ← total / DIES
    
    // Trobar millor i pitjor
    millor ← vendes[1]
    pitjor ← vendes[1]
    dia_millor ← 1
    dia_pitjor ← 1
    
    PER dia ← 2 FINS DIES FER
        SI vendes[dia] > millor LLAVORS
            millor ← vendes[dia]
            dia_millor ← dia
        FI_SI
        
        SI vendes[dia] < pitjor LLAVORS
            pitjor ← vendes[dia]
            dia_pitjor ← dia
        FI_SI
    FI_PER
    
    // Comptar sobre mitjana
    dies_sobre_mitjana ← 0
    PER dia ← 1 FINS DIES FER
        SI vendes[dia] > mitjana LLAVORS
            dies_sobre_mitjana ← dies_sobre_mitjana + 1
        FI_SI
    FI_PER
    
    // Resultats
    ESCRIURE "=== RESUM ==="
    ESCRIURE "Total:", total
    ESCRIURE "Mitjana:", mitjana
    ESCRIURE "Millor dia:", dia_millor, "(", millor, ")"
    ESCRIURE "Pitjor dia:", dia_pitjor, "(", pitjor, ")"
    ESCRIURE "Dies sobre mitjana:", dies_sobre_mitjana
FI
```

---

## 5. Traça d'Algorismes

!!! note "Què és traçar?"
    **Traçar** és seguir pas a pas l'execució d'un algorisme, anotant els valors de totes les variables.

### Exemple de traça

=== "Algorisme"
    ```pseudocode
    suma ← 0
    PER i ← 1 FINS 4 FER
        SI i mod 2 = 0 LLAVORS
            suma ← suma + i
        FI_SI
    FI_PER
    ESCRIURE suma
    ```

=== "Taula de traça"
    | Pas | i | i mod 2 | Condició | suma |
    |-----|---|---------|----------|------|
    | 0   | - | -       | -        | 0    |
    | 1   | 1 | 1       | FALS     | 0    |
    | 2   | 2 | 0       | CERT     | 2    |
    | 3   | 3 | 1       | FALS     | 2    |
    | 4   | 4 | 0       | CERT     | 6    |
    
    **Resultat:** 6

---

### Per què fer traces?

!!! tip "Avantatges"
    1. **Entendre** el funcionament
    2. **Trobar errors** (debugging)
    3. **Verificar** que funciona correctament
    4. **Aprendre** de l'execució

---

## 6. Optimització

### ❌ Ineficient

```pseudocode
// Comptar parells entre 1 i 100
comptador ← 0
PER i ← 1 FINS 100 FER
    SI i mod 2 = 0 LLAVORS
        comptador ← comptador + 1
    FI_SI
FI_PER
```

### ✅ Optimitzat

```pseudocode
// Més eficient
comptador ← 0
PER i ← 2 FINS 100 PAS 2 FER
    comptador ← comptador + 1
FI_PER
```

### ✅✅ Millor encara

```pseudocode
// Càlcul directe
comptador ← 100 / 2
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Traça completa

Fes la traça:

```pseudocode
x ← 10
y ← 0

MENTRE x > 5 FER
    y ← y + x
    x ← x - 2
FI_MENTRE

ESCRIURE y
```

??? success "Solució"
    | Iter | x | x > 5 | y  | x_nou |
    |------|---|-------|----|----- |
    | 0    | 10| -     | 0  | -     |
    | 1    | 10| CERT  | 10 | 8     |
    | 2    | 8 | CERT  | 18 | 6     |
    | 3    | 6 | CERT  | 24 | 4     |
    | 4    | 4 | FALS  | 24 | -     |
    
    **Resultat:** 24

---

### 🎯 Activitat 2: Troba errors

```pseudocode
suma ← 0
PER i ← 1 FINS 10 FER
    suma ← suma + i
    SI i mod 2 = 0 LLAVORS
        i ← i + 1
    FI_SI
FI_PER
```

Quins errors té?

??? success "Resposta"
    **Errors:**
    
    1. Suma tots els números, no només parells
    2. Modifica `i` dins del FOR (no permès)
    
    **Solució:**
    ```pseudocode
    suma ← 0
    PER i ← 1 FINS 10 FER
        SI i mod 2 = 0 LLAVORS
            suma ← suma + i
        FI_SI
    FI_PER
    ```

---

### 🎯 Activitat 3: Optimitza

Com optimitzaries aquest codi?

```pseudocode
PER i ← 1 FINS 1000 FER
    PER j ← 1 FINS 1000 FER
        SI i = j LLAVORS
            ESCRIURE i
        FI_SI
    FI_PER
FI_PER
```

??? success "Resposta"
    **Problema:** Bucles niuats innecessaris
    
    **Optimització:**
    ```pseudocode
    PER i ← 1 FINS 1000 FER
        ESCRIURE i
    FI_PER
    ```
    
    Redueix de O(n²) a O(n)

---

## 💻 Exercicis Integradors

### Exercici 1: Estadístiques d'examen

Programa que:

- Demana notes (acaba amb -1)
- Calcula aprovats, suspesos, mitjana
- Troba nota màxima i mínima
- Histograma: 0-4.9, 5-6.9, 7-8.9, 9-10

??? success "Solució parcial"
    ```pseudocode
    ALGORISME EstadistiquesExamen
    VARIABLES
        nota, suma, mitjana: REAL
        total, aprovats, suspesos: ENTER
        maxima, minima: REAL
        primer: BOOLEÀ
        c1, c2, c3, c4: ENTER
        
    INICI
        total ← 0
        suma ← 0
        aprovats ← 0
        suspesos ← 0
        primer ← CERT
        c1 ← 0  // 0-4.9
        c2 ← 0  // 5-6.9
        c3 ← 0  // 7-8.9
        c4 ← 0  // 9-10
        
        ESCRIURE "Notes (0-10, -1 acaba):"
        LLEGIR nota
        
        MENTRE nota ≠ -1 FER
            SI (nota ≥ 0) I (nota ≤ 10) LLAVORS
                total ← total + 1
                suma ← suma + nota
                
                // Aprovats/Suspesos
                SI nota ≥ 5 LLAVORS
                    aprovats ← aprovats + 1
                SINO
                    suspesos ← suspesos + 1
                FI_SI
                
                // Màxima/Mínima
                SI primer LLAVORS
                    maxima ← nota
                    minima ← nota
                    primer ← FALS
                SINO
                    SI nota > maxima LLAVORS
                        maxima ← nota
                    FI_SI
                    SI nota < minima LLAVORS
                        minima ← nota
                    FI_SI
                FI_SI
                
                // Histograma
                SI nota < 5 LLAVORS
                    c1 ← c1 + 1
                SINO_SI nota < 7 LLAVORS
                    c2 ← c2 + 1
                SINO_SI nota < 9 LLAVORS
                    c3 ← c3 + 1
                SINO
                    c4 ← c4 + 1
                FI_SI
            FI_SI
            
            LLEGIR nota
        FI_MENTRE
        
        SI total > 0 LLAVORS
            mitjana ← suma / total
            
            ESCRIURE "=== RESUM ==="
            ESCRIURE "Total:", total
            ESCRIURE "Mitjana:", mitjana
            ESCRIURE "Màxima:", maxima
            ESCRIURE "Mínima:", minima
            ESCRIURE "Aprovats:", aprovats
            ESCRIURE "Suspesos:", suspesos
            
            ESCRIURE "=== HISTOGRAMA ==="
            ESCRIURE "0-4.9  :", c1
            ESCRIURE "5-6.9  :", c2
            ESCRIURE "7-8.9  :", c3
            ESCRIURE "9-10   :", c4
        FI_SI
    FI
    ```

---

### Exercici 2: Caixa registradora

Simula caixa amb:

- Menú de productes amb preus
- Permet afegir productes
- Calcula total
- Processa pagament i canvi

??? tip "Pistes"
    - Usa bucle per menú repetitiu
    - Valida opcions
    - Calcula canvi correctament

---

### Exercici 3: Gestió d'inventari

Programa per gestionar inventari:

- Afegir producte (nom, preu, stock)
- Buscar producte
- Actualitzar stock
- Mostrar total inventari

??? tip "Pistes"
    - Usa arrays per desar dades
    - Implementa cerca
    - Valida stock no negatiu

---

## 🏠 Deures

1. **Biblioteca:** Sistema de préstecs amb devolucions i multes per retard.

2. **Enquesta:** Recull i analitza respostes (sí/no/ns/nc), calcula percentatges.

3. **Registre d'entrenament:** Seguiment setmanal d'exercicis amb estadístiques.

4. **Mini-comptabilitat:** Ingressos/despeses mensuals amb categories i balanç.

5. **Joc pedra-paper-tisores:** Contra ordinador, comptador de victòries, millor de 5.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ **Metodologia:** Entendre → Planificar → Escriure → Provar → Optimitzar
    - ✅ **Descomposició:** Divideix problemes complexos en simples
    - ✅ **Traça:** Eina essencial per debugar
    - ✅ **Optimització:** Millora eficiència després que funcioni
    - ✅ **Validació:** Sempre valida l'entrada de l'usuari

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin és el primer pas en resoldre un problema?
    
    a) Escriure codi  
    b) Entendre el problema  
    c) Optimitzar  
    d) Provar

??? success "Resposta"
    **b) Entendre el problema**  
    No es pot resoldre el que no s'entén

!!! question "Pregunta 2"
    Quan s'ha d'optimitzar un algorisme?
    
    a) Des del principi  
    b) Després que funcioni  
    c) Mai  
    d) Abans de provar-lo

??? success "Resposta"
    **b) Després que funcioni**  
    Primer fes que funcioni, després millora'l

!!! question "Pregunta 3"
    Per què fer traça d'un algorisme?
    
    a) Perdre temps  
    b) Trobar errors i entendre'l  
    c) És obligatori  
    d) Per fer boniques taules

??? success "Resposta"
    **b) Trobar errors i entendre'l**  
    La traça és una eina de debugging essencial