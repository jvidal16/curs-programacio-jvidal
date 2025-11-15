# Classe 14: Bucle WHILE (I)

## Objectius d'aprenentatge
- Comprendre el bucle WHILE
- Diferenciar FOR i WHILE
- Implementar bucles amb condició de continuació
- Usar valors sentinella

---

## 1. Què és el Bucle WHILE?

!!! note "Definició"
    El bucle **WHILE** repeteix instruccions **mentre** una condició sigui CERTA. El nombre d'iteracions és **desconegut** per endavant.

### Diagrama de flux

```
        ┌─────────────┐
    ┌──▶│  CONDICIÓ   │
    │   └──────┬──────┘
    │          │
    │     CERT │ FALS
    │          │   │
    │   ┌──────▼───┴────┐
    │   │               │
    │   │  ┌─────────┐  │
    │   │  │ ACCIONS │  │
    │   │  └────┬────┘  │
    │   │       │       │
    │   └───────┘       │
    │                   ▼
    └──────────────┌─────────────┐
                   │  CONTINUA   │
                   └─────────────┘
```

---

## 2. Sintaxi del WHILE

```pseudocode
MENTRE condició FER
    // Instruccions
FI_MENTRE
```

!!! warning "Important"
    La condició s'avalua **abans** de cada iteració. Si és FALSA inicialment, el bucle **no s'executa mai**.

### Exemple bàsic

```pseudocode
ALGORISME CompteEnrere
VARIABLES
    n: ENTER
    
INICI
    n ← 5
    
    MENTRE n > 0 FER
        ESCRIURE n
        n ← n - 1
    FI_MENTRE
    
    ESCRIURE "Foc!"
FI
```

**Sortida:**
```
5
4
3
2
1
Foc!
```

---

## 3. FOR vs WHILE

=== "FOR (iteracions conegudes)"
    ```pseudocode
    PER i ← 1 FINS 5 FER
        ESCRIURE i
    FI_PER
    ```
    
    - Nombre d'iteracions conegut
    - Control automàtic del comptador
    - Més simple

=== "WHILE (iteracions desconegudes)"
    ```pseudocode
    i ← 1
    MENTRE i ≤ 5 FER
        ESCRIURE i
        i ← i + 1
    FI_MENTRE
    ```
    
    - Nombre d'iteracions desconegut
    - Control manual
    - Més flexible

### Quan usar cada un?

| Usa FOR | Usa WHILE |
|---------|-----------|
| Recórrer 1-10 | Fins que usuari introdueixi 0 |
| Taula de multiplicar | Endevinar número |
| Processar N elements | Validar entrada |
| Iteracions fixes | Condició de parada dinàmica |

---

## 4. Bucles amb Sentinella

!!! note "Valor sentinella"
    Un **valor sentinella** és un valor especial que indica que el bucle ha d'acabar.

### Exemple 1: Suma amb sentinella

```pseudocode
ALGORISME SumaNumeros
VARIABLES
    numero: ENTER
    suma: ENTER
    
INICI
    suma ← 0
    
    ESCRIURE "Número (0 per acabar):"
    LLEGIR numero
    
    MENTRE numero ≠ 0 FER
        suma ← suma + numero
        ESCRIURE "Altre número (0 per acabar):"
        LLEGIR numero
    FI_MENTRE
    
    ESCRIURE "Suma total:", suma
FI
```

---

### Exemple 2: Comptador de positius

```pseudocode
ALGORISME ComptaPositius
VARIABLES
    numero: REAL
    comptador: ENTER
    
INICI
    comptador ← 0
    
    ESCRIURE "Número (-1 per acabar):"
    LLEGIR numero
    
    MENTRE numero ≠ -1 FER
        SI numero > 0 LLAVORS
            comptador ← comptador + 1
        FI_SI
        
        ESCRIURE "Número (-1 per acabar):"
        LLEGIR numero
    FI_MENTRE
    
    ESCRIURE "Positius:", comptador
FI
```

---

## 5. Patró amb Sentinella

!!! tip "Patró estàndard"
    ```pseudocode
    // 1. Lectura inicial (PRIMING READ)
    LLEGIR valor
    
    // 2. Bucle
    MENTRE valor ≠ SENTINELLA FER
        // Processar valor
        
        // 3. Nova lectura
        LLEGIR valor
    FI_MENTRE
    ```

### Per què dues lectures?

- **Primera lectura:** Abans del bucle per tenir un valor inicial
- **Segona lectura:** Al final del bucle per obtenir el següent valor

---

## 6. Errors Comuns

### ❌ Error 1: Bucle infinit

```pseudocode
x ← 1
MENTRE x > 0 FER
    ESCRIURE x
    // Oblida incrementar!
FI_MENTRE
```

!!! danger "Problema"
    `x` mai canvia, la condició sempre és CERTA → bucle infinit

### ✅ Solució

```pseudocode
x ← 1
MENTRE x ≤ 10 FER
    ESCRIURE x
    x ← x + 1  // Modificar variable!
FI_MENTRE
```

---

### ❌ Error 2: Variable no inicialitzada

```pseudocode
MENTRE numero ≠ 0 FER  // numero no té valor!
    LLEGIR numero
FI_MENTRE
```

### ✅ Solució

```pseudocode
LLEGIR numero  // Lectura inicial
MENTRE numero ≠ 0 FER
    // Processar
    LLEGIR numero
FI_MENTRE
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Traça del bucle

Què mostra aquest programa?

```pseudocode
n ← 8
suma ← 0

MENTRE n > 0 FER
    suma ← suma + n
    n ← n - 2
FI_MENTRE

ESCRIURE suma
```

??? success "Solució"
    | Iteració | n | suma |
    |----------|---|------|
    | 0 | 8 | 0 |
    | 1 | 6 | 8 |
    | 2 | 4 | 14 |
    | 3 | 2 | 18 |
    | 4 | 0 | 20 |
    
    **Resultat:** 20

---

### 🎯 Activitat 2: Converteix a WHILE

Converteix aquest FOR a WHILE:

```pseudocode
suma ← 0
PER i ← 1 FINS 10 FER
    suma ← suma + i
FI_PER
```

??? success "Solució"
    ```pseudocode
    suma ← 0
    i ← 1
    MENTRE i ≤ 10 FER
        suma ← suma + i
        i ← i + 1
    FI_MENTRE
    ```

---

### 🎯 Activitat 3: Troba l'error

```pseudocode
comptador ← 1

MENTRE comptador ≤ 5 FER
    ESCRIURE comptador
FI_MENTRE
```

Què falta?

??? success "Resposta"
    **Falta incrementar `comptador`!**
    
    Causa bucle infinit. Solució:
    ```pseudocode
    comptador ← 1
    
    MENTRE comptador ≤ 5 FER
        ESCRIURE comptador
        comptador ← comptador + 1
    FI_MENTRE
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Compte enrere

Programa que demani un número i faci compte enrere fins a 0.

??? success "Solució"
    ```pseudocode
    ALGORISME CompteEnrere
    VARIABLES
        n: ENTER
        
    INICI
        ESCRIURE "Número:"
        LLEGIR n
        
        MENTRE n ≥ 0 FER
            ESCRIURE n
            n ← n - 1
        FI_MENTRE
        
        ESCRIURE "Acabat!"
    FI
    ```

---

### Exercici 2: Endevina el número

El programa té un número secret (42). L'usuari ha d'endevinar-lo.

??? success "Solució"
    ```pseudocode
    ALGORISME EndevinaNumero
    CONSTANTS
        SECRET = 42
        
    VARIABLES
        intents: ENTER
        
    INICI
        ESCRIURE "Endevina el número:"
        LLEGIR intents
        
        MENTRE intents ≠ SECRET FER
            SI intents < SECRET LLAVORS
                ESCRIURE "Més gran!"
            SINO
                ESCRIURE "Més petit!"
            FI_SI
            
            ESCRIURE "Prova de nou:"
            LLEGIR intents
        FI_MENTRE
        
        ESCRIURE "Correcte!"
    FI
    ```

---

### Exercici 3: Mitjana de números

Programa que calculi la mitjana de números introduïts. Acaba amb -1.

??? success "Solució"
    ```pseudocode
    ALGORISME MitjanaNumeros
    VARIABLES
        numero, suma: REAL
        comptador: ENTER
        
    INICI
        suma ← 0
        comptador ← 0
        
        ESCRIURE "Número (-1 per acabar):"
        LLEGIR numero
        
        MENTRE numero ≠ -1 FER
            suma ← suma + numero
            comptador ← comptador + 1
            
            ESCRIURE "Número (-1 per acabar):"
            LLEGIR numero
        FI_MENTRE
        
        SI comptador > 0 LLAVORS
            ESCRIURE "Mitjana:", suma / comptador
        SINO
            ESCRIURE "No s'han introduït números"
        FI_SI
    FI
    ```

---

### Exercici 4: Potències de 2

Mostra totes les potències de 2 menors que 1000.

??? success "Solució"
    ```pseudocode
    ALGORISME PotenciesDe2
    VARIABLES
        potencia: ENTER
        
    INICI
        potencia ← 1
        
        ESCRIURE "Potències de 2 < 1000:"
        
        MENTRE potencia < 1000 FER
            ESCRIURE potencia
            potencia ← potencia * 2
        FI_MENTRE
    FI
    ```

---

## 🏠 Deures

1. **Factorial:** Calcula n! usant WHILE.

2. **Suma parells:** Suma números parells entre 1 i N (N introduït per usuari).

3. **Divisors:** Mostra tots els divisors d'un número.

4. **Màxim i mínim:** Llegeix números (0 acaba) i mostra el màxim i mínim.

5. **Joc amb intents:** Endevinar número amb màxim 5 intents.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ WHILE és per bucles amb nombre d'iteracions **desconegut**
    - ✅ La condició s'avalua **abans** de cada iteració
    - ✅ El bucle pot **no executar-se mai** si la condició inicial és falsa
    - ✅ Cal **modificar les variables** per evitar bucles infinits
    - ✅ Els **sentinelles** marquen el final de l'entrada

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quantes vegades s'executa aquest bucle?
    ```
    x ← 10
    MENTRE x < 5 FER
        ESCRIURE x
    FI_MENTRE
    ```
    
    a) 5  
    b) 10  
    c) Infinites  
    d) 0

??? success "Resposta"
    **d) 0**  
    La condició inicial (10 < 5) és FALSA

!!! question "Pregunta 2"
    Quin és l'error més comú amb WHILE?
    
    a) Oblidar FI_MENTRE  
    b) Bucle infinit  
    c) Massa iteracions  
    d) Condició incorrecta

??? success "Resposta"
    **b) Bucle infinit**  
    Sovint s'oblida modificar les variables de control

!!! question "Pregunta 3"
    Quan usar WHILE en lloc de FOR?
    
    a) Sempre  
    b) Mai  
    c) Quan no sabem quantes iteracions  
    d) Quan volem anar més ràpid

??? success "Resposta"
    **c) Quan no sabem quantes iteracions**  
    FOR és millor quan sabem el nombre exacte