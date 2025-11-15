# Classe 11: Introducció als Bucles

## Objectius d'aprenentatge
- Comprendre el concepte d'iteració
- Distingir entre bucles determinats i indeterminats
- Identificar quan utilitzar cada tipus de bucle
- Entendre l'estructura general dels bucles

---

## 1. Què és un Bucle?

!!! note "Definició"
    Un **bucle** (o iteració) és una estructura de control que permet **repetir** un bloc d'instruccions múltiples vegades.

### Per què necessitem bucles?

Sense bucles:
```pseudocode
ESCRIURE "Hola"
ESCRIURE "Hola"
ESCRIURE "Hola"
ESCRIURE "Hola"
ESCRIURE "Hola"
```

Amb bucles:
```pseudocode
PER i ← 1 FINS 5 FER
    ESCRIURE "Hola"
FI_PER
```

---

## 2. Components d'un Bucle

Tot bucle té tres elements essencials:

!!! info "Elements d'un bucle"
    1. **Inicialització**: Preparar les variables abans del bucle
    2. **Condició**: Determinar quan s'ha de repetir el bucle
    3. **Actualització**: Modificar variables per apropar-se a la fi del bucle

### Exemple visual

```pseudocode
i ← 1                    // 1. Inicialització

MENTRE i ≤ 5 FER         // 2. Condició
    ESCRIURE i
    i ← i + 1            // 3. Actualització
FI_MENTRE
```

---

## 3. Tipus de Bucles

### 3.1 Bucles Determinats (FOR)

!!! tip "Bucles determinats"
    Sabem **exactament** quantes vegades es repetirà el bucle.

**Característiques:**
- Número d'iteracions conegut abans de començar
- Usen una variable comptador
- Ideal per recórrer seqüències

**Exemples d'ús:**
- Mostrar els números de l'1 al 10
- Calcular la taula de multiplicar del 7
- Processar 20 notes d'alumnes

```pseudocode
// Mostrar números de l'1 al 10
PER i ← 1 FINS 10 FER
    ESCRIURE i
FI_PER
```

---

### 3.2 Bucles Indeterminats (WHILE)

!!! tip "Bucles indeterminats"
    **No sabem** quantes vegades es repetirà el bucle (depèn d'una condició).

**Característiques:**
- Número d'iteracions desconegut
- Depenen d'una condició que pot canviar
- Ideal per validacions i esperes

**Exemples d'ús:**
- Validar una contrasenya fins que sigui correcta
- Llegir dades fins que l'usuari vulgui sortir
- Buscar un element en una llista

```pseudocode
// Llegir números fins que introdueixin 0
numero ← 1
MENTRE numero ≠ 0 FER
    ESCRIURE "Introdueix un número (0 per sortir):"
    LLEGIR numero
FI_MENTRE
```

---

## 4. Comparació: FOR vs WHILE

| Característica | FOR (Determinat) | WHILE (Indeterminat) |
|---------------|------------------|---------------------|
| Iteracions | Conegudes | Desconegudes |
| Variable comptador | Automàtica | Manual |
| Ús típic | Recórrer rangs | Condicions dinàmiques |
| Exemple | "Repeteix 10 vegades" | "Repeteix fins que..." |

---

## 5. Quan Utilitzar Cada Bucle?

### Usa FOR quan:

=== "✅ Situació 1"
    Saps exactament quantes vegades has de repetir
    ```pseudocode
    // Mostrar la taula del 5
    PER i ← 1 FINS 10 FER
        ESCRIURE "5 x", i, "=", 5 * i
    FI_PER
    ```

=== "✅ Situació 2"
    Necessites un comptador que varia
    ```pseudocode
    // Comptar enrere des de 10
    PER i ← 10 FINS 1 PAS -1 FER
        ESCRIURE i
    FI_PER
    ```

=== "✅ Situació 3"
    Has de processar un número fix d'elements
    ```pseudocode
    // Llegir 5 notes
    PER i ← 1 FINS 5 FER
        ESCRIURE "Nota", i, ":"
        LLEGIR nota
    FI_PER
    ```

---

### Usa WHILE quan:

=== "✅ Situació 1"
    No saps quantes vegades cal repetir
    ```pseudocode
    // Validar contrasenya
    MENTRE contrasenya ≠ "correcta" FER
        ESCRIURE "Contrasenya:"
        LLEGIR contrasenya
    FI_MENTRE
    ```

=== "✅ Situació 2"
    La condició de sortida és complexa
    ```pseudocode
    // Joc: endevinar un número
    MENTRE intent ≠ numeroSecret I intents < 5 FER
        ESCRIURE "Endevina el número:"
        LLEGIR intent
        intents ← intents + 1
    FI_MENTRE
    ```

=== "✅ Situació 3"
    Depens d'entrada de l'usuari
    ```pseudocode
    // Menú amb sortida
    MENTRE opcio ≠ 0 FER
        ESCRIURE "1. Opció A"
        ESCRIURE "0. Sortir"
        LLEGIR opcio
    FI_MENTRE
    ```

---

## 6. Conceptes Importants

### 6.1 Bucle Infinit

!!! warning "Perill: Bucle infinit"
    Un bucle que **mai acaba** perquè la condició sempre és certa.

```pseudocode
// ❌ MAL - Bucle infinit
i ← 1
MENTRE i ≤ 10 FER
    ESCRIURE i
    // Oblida incrementar i!
FI_MENTRE
```

```pseudocode
// ✅ BÉ - Bucle correcte
i ← 1
MENTRE i ≤ 10 FER
    ESCRIURE i
    i ← i + 1    // Incrementa i
FI_MENTRE
```

---

### 6.2 Condició de Sortida

!!! tip "Condició de sortida"
    Sempre ha d'haver-hi una manera de **sortir** del bucle.

**Preguntes a fer-se:**
- ✅ La condició pot esdevenir falsa?
- ✅ Les variables de la condició es modifiquen dins el bucle?
- ✅ Hi ha un límit màxim d'iteracions?

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Identifica el tipus de bucle

Per a cada situació, indica si utilitzaries FOR o WHILE:

1. Mostrar els números parells del 2 al 20
2. Demanar la contrasenya fins que sigui correcta
3. Calcular el factorial de 5
4. Llegir números fins que s'introdueixi un negatiu
5. Mostrar els dies de la setmana
6. Sumar números fins que la suma superi 100

??? success "Solucions"
    1. **FOR** - Sabem que són 10 números
    2. **WHILE** - No sabem quantes vegades fallaran
    3. **FOR** - Sabem que són 5 multiplicacions
    4. **WHILE** - No sabem quants números introduiran
    5. **FOR** - Sabem que són 7 dies
    6. **WHILE** - No sabem quants números caldrà sumar

---

### 🎯 Activitat 2: Traça el bucle

Què mostrarà aquest codi?

```pseudocode
comptador ← 1
MENTRE comptador ≤ 3 FER
    ESCRIURE "Iteració:", comptador
    comptador ← comptador + 1
FI_MENTRE
ESCRIURE "Fi"
```

??? success "Solució"
    ```
    Iteració: 1
    Iteració: 2
    Iteració: 3
    Fi
    ```

---

### 🎯 Activitat 3: Detecta l'error

Aquest bucle té un problema. Quin?

```pseudocode
PER i ← 1 FINS 5 FER
    ESCRIURE "Número:", i
    i ← i + 1
FI_PER
```

??? success "Resposta"
    **Error:** No s'ha d'incrementar manualment `i` dins d'un bucle FOR.
    El bucle FOR ja gestiona automàticament l'increment.
    
    Correcte:
    ```pseudocode
    PER i ← 1 FINS 5 FER
        ESCRIURE "Número:", i
    FI_PER
    ```

---

### 🎯 Activitat 4: Completa el codi

Completa aquest bucle per mostrar els múltiples de 3 fins a 30:

```pseudocode
PER i ← ___ FINS ___ PAS ___ FER
    ESCRIURE i
FI_PER
```

??? success "Solució"
    ```pseudocode
    PER i ← 3 FINS 30 PAS 3 FER
        ESCRIURE i
    FI_PER
    ```
    O també:
    ```pseudocode
    PER i ← 1 FINS 10 FER
        ESCRIURE i * 3
    FI_PER
    ```

---

## 💻 Exercicis de Reflexió

### Exercici 1: Disseny d'algorisme

Per a cada problema, decideix quin tipus de bucle utilitzaries i per què:

**a) Llegir 10 temperatures i calcular la mitjana**

??? success "Resposta"
    **FOR** - Sabem que són exactament 10 temperatures.

**b) Llegir temperatures fins que l'usuari introdueixi -999**

??? success "Resposta"
    **WHILE** - No sabem quantes temperatures introduirà l'usuari.

**c) Mostrar el compte enrere d'un coet (10, 9, 8, ..., 1, 0)**

??? success "Resposta"
    **FOR** amb pas -1 - Sabem que són 11 números en ordre descendent.

**d) Validar que un número estigui entre 1 i 100**

??? success "Resposta"
    **WHILE** - No sabem quantes vegades l'usuari introduirà un valor incorrecte.

---

### Exercici 2: Pseudocodi bàsic

Escriu pseudocodi per:

**a) Mostrar "Hola" 7 vegades**

??? success "Solució"
    ```pseudocode
    PER i ← 1 FINS 7 FER
        ESCRIURE "Hola"
    FI_PER
    ```

**b) Llegir un número fins que sigui positiu**

??? success "Solució"
    ```pseudocode
    numero ← -1
    MENTRE numero ≤ 0 FER
        ESCRIURE "Introdueix un número positiu:"
        LLEGIR numero
    FI_MENTRE
    ```

---

### Exercici 3: Identificació d'errors

Troba l'error en cada bucle:

**a)**
```pseudocode
PER i ← 5 FINS 1 FER
    ESCRIURE i
FI_PER
```

??? success "Resposta"
    **Error:** Intenta anar de 5 a 1 sense especificar PAS -1.
    No es farà cap iteració.
    
    Correcte:
    ```pseudocode
    PER i ← 5 FINS 1 PAS -1 FER
        ESCRIURE i
    FI_PER
    ```

**b)**
```pseudocode
x ← 0
MENTRE x < 5 FER
    ESCRIURE x
FI_MENTRE
```

??? success "Resposta"
    **Error:** Bucle infinit. `x` mai s'incrementa.
    
    Correcte:
    ```pseudocode
    x ← 0
    MENTRE x < 5 FER
        ESCRIURE x
        x ← x + 1
    FI_MENTRE
    ```

---

## 🏠 Deures

1. **Reflexió:** Escriu 3 exemples de la vida real on utilitzaries un bucle determinat i 3 on utilitzaries un indeterminat.

2. **Anàlisi:** Per a cada situació, indica FOR o WHILE i justifica:
   - Processar les notes de 25 alumnes
   - Esperar que l'usuari introdueixi "sí" o "no"
   - Mostrar la seqüència de Fibonacci fins al número 10
   - Llegir dades fins que l'usuari escrigui "fi"
   - Comptar de 100 a 1

3. **Investigació:** Busca informació sobre altres tipus de bucles (DO-WHILE, REPEAT-UNTIL) i explica com funcionen.

4. **Disseny:** Descriu amb paraules (sense codi) com faries un programa que:
   - Llegeixi números fins que la suma superi 1000
   - Mostri tots els números parells entre 1 i 50

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ Els bucles permeten repetir blocs de codi
    - ✅ **FOR**: bucles determinats (iteracions conegudes)
    - ✅ **WHILE**: bucles indeterminats (iteracions desconegudes)
    - ✅ Tot bucle necessita: inicialització, condició i actualització
    - ✅ Evita bucles infinits assegurant que la condició pot esdevenir falsa

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin tipus de bucle és més adequat per mostrar els números de l'1 al 100?
    
    a) WHILE  
    b) FOR  
    c) Qualsevol dels dos  
    d) Cap dels dos

??? success "Resposta"
    **b) FOR**  
    Sabem exactament quantes iteracions necessitem (100).

!!! question "Pregunta 2"
    Què passa si oblides incrementar el comptador en un WHILE?
    
    a) El programa dóna error  
    b) El bucle no s'executa  
    c) Bucle infinit  
    d) Funciona correctament

??? success "Resposta"
    **c) Bucle infinit**  
    La condició mai canviarà i el bucle continuarà per sempre.

!!! question "Pregunta 3"
    Quin bucle utilitzaries per validar una contrasenya?
    
    a) FOR  
    b) WHILE  
    c) Cap  
    d) Depèn

??? success "Resposta"
    **b) WHILE**  
    No sabem quantes vegades l'usuari introduirà la contrasenya incorrecta.
