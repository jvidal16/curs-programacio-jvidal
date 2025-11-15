# Classe 15: Bucle WHILE (II)

## Objectius d'aprenentatge
- Validar entrada d'usuari
- Usar condicions complexes en bucles
- Combinar IF i WHILE
- Treballar amb banderetes (flags)

---

## 1. Validació d'Entrada

!!! note "Definició"
    La **validació** assegura que l'usuari introdueix dades correctes abans de processar-les.

### Patró de validació

```pseudocode
// 1. Demanar dada
LLEGIR variable

// 2. Repetir si invàlida
MENTRE NOT (condició_vàlida) FER
    ESCRIURE "Error!"
    LLEGIR variable
FI_MENTRE

// Ara variable és vàlida
```

---

## 2. Exemples de Validació

### Exemple 1: Nota entre 0 i 10

```pseudocode
ALGORISME ValidarNota
VARIABLES
    nota: REAL
    
INICI
    ESCRIURE "Nota (0-10):"
    LLEGIR nota
    
    MENTRE (nota < 0) O (nota > 10) FER
        ESCRIURE "Error! Nota entre 0 i 10:"
        LLEGIR nota
    FI_MENTRE
    
    ESCRIURE "Nota vàlida:", nota
FI
```

---

### Exemple 2: Opcions de menú

```pseudocode
ALGORISME MenuValidat
VARIABLES
    opcio: ENTER
    
INICI
    ESCRIURE "1. Jugar"
    ESCRIURE "2. Opcions"
    ESCRIURE "3. Sortir"
    ESCRIURE "Tria (1-3):"
    LLEGIR opcio
    
    MENTRE (opcio < 1) O (opcio > 3) FER
        ESCRIURE "Opció invàlida! Tria 1, 2 o 3:"
        LLEGIR opcio
    FI_MENTRE
    
    ESCRIURE "Has triat:", opcio
FI
```

---

## 3. Condicions Compostes

=== "AND - Totes certes"
    ```pseudocode
    MENTRE (x > 0) I (x < 100) FER
        // x entre 1 i 99
    FI_MENTRE
    ```

=== "OR - Almenys una certa"
    ```pseudocode
    MENTRE (resp ≠ 'S') I (resp ≠ 'N') FER
        // Repeteix si no és ni S ni N
    FI_MENTRE
    ```

=== "NOT - Negació"
    ```pseudocode
    MENTRE NOT valid FER
        // Repeteix mentre no sigui vàlid
    FI_MENTRE
    ```

---

### Exemple: Validació complexa

```pseudocode
ALGORISME PasswordSegur
VARIABLES
    password: TEXT
    longitud: ENTER
    
INICI
    ESCRIURE "Contrasenya (8-20 caràcters):"
    LLEGIR password
    longitud ← LONGITUD(password)
    
    MENTRE (longitud < 8) O (longitud > 20) FER
        ESCRIURE "Entre 8 i 20 caràcters:"
        LLEGIR password
        longitud ← LONGITUD(password)
    FI_MENTRE
    
    ESCRIURE "Contrasenya vàlida"
FI
```

---

## 4. Combinació IF dins de WHILE

### Exemple 1: Comptar només parells

```pseudocode
ALGORISME ComptaParells
VARIABLES
    numero, comptador: ENTER
    
INICI
    comptador ← 0
    
    ESCRIURE "Números (0 acaba):"
    LLEGIR numero
    
    MENTRE numero ≠ 0 FER
        SI numero mod 2 = 0 LLAVORS
            comptador ← comptador + 1
        FI_SI
        
        LLEGIR numero
    FI_MENTRE
    
    ESCRIURE "Parells:", comptador
FI
```

---

### Exemple 2: Trobar màxim

```pseudocode
ALGORISME TrobarMaxim
VARIABLES
    numero, maxim: REAL
    primer: BOOLEÀ
    
INICI
    primer ← CERT
    
    ESCRIURE "Números (0 acaba):"
    LLEGIR numero
    
    MENTRE numero ≠ 0 FER
        SI primer LLAVORS
            maxim ← numero
            primer ← FALS
        SINO
            SI numero > maxim LLAVORS
                maxim ← numero
            FI_SI
        FI_SI
        
        LLEGIR numero
    FI_MENTRE
    
    SI NOT primer LLAVORS
        ESCRIURE "Màxim:", maxim
    FI_SI
FI
```

---

## 5. Banderetes (Flags)

!!! note "Què és un flag?"
    Un **flag** és una variable booleana que controla el flux del programa.

### Exemple 1: Cerca amb flag

```pseudocode
ALGORISME CercaNumero
CONSTANTS
    BUSCAT = 7
    
VARIABLES
    numero: ENTER
    trobat: BOOLEÀ
    
INICI
    trobat ← FALS
    
    ESCRIURE "Números (0 acaba):"
    LLEGIR numero
    
    MENTRE (numero ≠ 0) I (NOT trobat) FER
        SI numero = BUSCAT LLAVORS
            trobat ← CERT
            ESCRIURE "Trobat!"
        SINO
            LLEGIR numero
        FI_SI
    FI_MENTRE
    
    SI NOT trobat LLAVORS
        ESCRIURE "No trobat"
    FI_SI
FI
```

---

### Exemple 2: Login amb intents

```pseudocode
ALGORISME LoginSegur
CONSTANTS
    PASSWORD = "1234"
    MAX_INTENTS = 3
    
VARIABLES
    pass: TEXT
    intents: ENTER
    acces: BOOLEÀ
    
INICI
    intents ← 0
    acces ← FALS
    
    MENTRE (intents < MAX_INTENTS) I (NOT acces) FER
        ESCRIURE "Contrasenya:"
        LLEGIR pass
        
        SI pass = PASSWORD LLAVORS
            acces ← CERT
            ESCRIURE "Accés permès"
        SINO
            intents ← intents + 1
            SI intents < MAX_INTENTS LLAVORS
                ESCRIURE "Incorrecte. Intents:", MAX_INTENTS - intents
            FI_SI
        FI_SI
    FI_MENTRE
    
    SI NOT acces LLAVORS
        ESCRIURE "Compte bloquejat"
    FI_SI
FI
```

---

## 6. Patrons Comuns

### Patró 1: Validació

```pseudocode
dada_valida ← FALS

MENTRE NOT dada_valida FER
    LLEGIR dada
    
    SI VALIDAR(dada) LLAVORS
        dada_valida ← CERT
    SINO
        ESCRIURE "Error"
    FI_SI
FI_MENTRE
```

---

### Patró 2: Cerca

```pseudocode
trobat ← FALS
i ← 1

MENTRE (i ≤ N) I (NOT trobat) FER
    SI llista[i] = element LLAVORS
        trobat ← CERT
    SINO
        i ← i + 1
    FI_SI
FI_MENTRE
```

---

### Patró 3: Intents limitats

```pseudocode
intents ← 0
èxit ← FALS

MENTRE (intents < MAX) I (NOT èxit) FER
    // Intentar
    intents ← intents + 1
FI_MENTRE
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Què fa aquest codi?

```pseudocode
suma ← 0
valid ← FALS

MENTRE NOT valid FER
    LLEGIR num
    
    SI num > 0 LLAVORS
        suma ← num
        valid ← CERT
    SINO
        ESCRIURE "Ha de ser positiu!"
    FI_SI
FI_MENTRE

ESCRIURE suma
```

??? success "Resposta"
    Demana un número positiu i el valida. Repeteix mentre sigui negatiu o zero. Al final mostra el número positiu introduït.

---

### 🎯 Activitat 2: Completa el codi

Valida que el número està entre 1 i 100:

```pseudocode
LLEGIR n

MENTRE ___________________ FER
    ESCRIURE "Error! Entre 1 i 100:"
    LLEGIR n
FI_MENTRE
```

??? success "Solució"
    ```pseudocode
    MENTRE (n < 1) O (n > 100) FER
    ```

---

### 🎯 Activitat 3: Troba l'error

```pseudocode
trobat ← FALS
i ← 1

MENTRE i ≤ 10 FER
    LLEGIR num
    SI num = 5 LLAVORS
        trobat ← CERT
    FI_SI
    i ← i + 1
FI_MENTRE
```

Quin és el problema?

??? success "Resposta"
    El bucle sempre fa 10 iteracions, fins i tot després de trobar el 5.
    
    **Solució:** Afegir `NOT trobat` a la condició:
    ```pseudocode
    MENTRE (i ≤ 10) I (NOT trobat) FER
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Validar DNI

Programa que demani un DNI (8 dígits) i validi la longitud.

??? success "Solució"
    ```pseudocode
    ALGORISME ValidarDNI
    VARIABLES
        dni: TEXT
        
    INICI
        ESCRIURE "DNI (8 dígits):"
        LLEGIR dni
        
        MENTRE LONGITUD(dni) ≠ 8 FER
            ESCRIURE "Ha de tenir 8 dígits:"
            LLEGIR dni
        FI_MENTRE
        
        ESCRIURE "DNI vàlid:", dni
    FI
    ```

---

### Exercici 2: Calculadora validada

Calculadora que valida l'operació (+, -, *, /) i la divisió per zero.

??? success "Solució"
    ```pseudocode
    ALGORISME CalculadoraValidada
    VARIABLES
        num1, num2, resultat: REAL
        op: CARÀCTER
        op_valida, div_valida: BOOLEÀ
        
    INICI
        ESCRIURE "Primer número:"
        LLEGIR num1
        
        // Validar operació
        op_valida ← FALS
        MENTRE NOT op_valida FER
            ESCRIURE "Operació (+,-,*,/):"
            LLEGIR op
            
            SI (op='+'O op='-'O op='*'O op='/') LLAVORS
                op_valida ← CERT
            SINO
                ESCRIURE "Operació no vàlida!"
            FI_SI
        FI_MENTRE
        
        // Validar divisor
        div_valida ← FALS
        MENTRE NOT div_valida FER
            ESCRIURE "Segon número:"
            LLEGIR num2
            
            SI (op = '/') I (num2 = 0) LLAVORS
                ESCRIURE "No es pot dividir per zero!"
            SINO
                div_valida ← CERT
            FI_SI
        FI_MENTRE
        
        // Calcular
        SI op = '+' LLAVORS
            resultat ← num1 + num2
        SINO_SI op = '-' LLAVORS
            resultat ← num1 - num2
        SINO_SI op = '*' LLAVORS
            resultat ← num1 * num2
        SINO
            resultat ← num1 / num2
        FI_SI
        
        ESCRIURE "Resultat:", resultat
    FI
    ```

---

### Exercici 3: Joc de preguntes

Fa 3 preguntes matemàtiques. Permet 2 intents per pregunta.

??? success "Solució"
    ```pseudocode
    ALGORISME JocPreguntes
    VARIABLES
        resposta, encerts: ENTER
        encertat: BOOLEÀ
        intents: ENTER
        
    INICI
        encerts ← 0
        
        // Pregunta 1: 5 + 3
        ESCRIURE "=== Pregunta 1 ==="
        ESCRIURE "5 + 3 = ?"
        encertat ← FALS
        intents ← 0
        
        MENTRE (intents < 2) I (NOT encertat) FER
            LLEGIR resposta
            intents ← intents + 1
            
            SI resposta = 8 LLAVORS
                ESCRIURE "Correcte!"
                encerts ← encerts + 1
                encertat ← CERT
            SINO
                SI intents < 2 LLAVORS
                    ESCRIURE "Incorrecte! Prova de nou:"
                SINO
                    ESCRIURE "Incorrecte! Era 8"
                FI_SI
            FI_SI
        FI_MENTRE
        
        // (Repetir per les altres preguntes)
        
        ESCRIURE "Encerts:", encerts, "de 3"
    FI
    ```

---

## 🏠 Deures

1. **Email vàlid:** Valida que conté '@' i almenys 5 caràcters.

2. **Edat vàlida:** Entre 0 i 120, permet 3 intents màxim.

3. **Menú amb validació:** 5 opcions, valida entrada i repeteix fins triar sortir.

4. **Password fort:** Mínim 8 caràcters, conté número i lletra majúscula.

5. **Sistema registre:** Valida nom (no buit), edat (18+), email, confirma tot.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ **Validació** assegura dades correctes abans de processar
    - ✅ **Condicions compostes** amb AND, OR, NOT permeten validacions complexes
    - ✅ **IF dins WHILE** permet decisions dins del bucle
    - ✅ **Flags** controlen el flux amb variables booleanes
    - ✅ Mai confiïs en l'entrada de l'usuari sense validar!

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin operador s'usa per validar un rang (ex: 1-100)?
    
    a) OR  
    b) AND  
    c) NOT  
    d) XOR

??? success "Resposta"
    **b) AND**  
    `(x >= 1) I (x <= 100)`

!!! question "Pregunta 2"
    Quan s'usa un flag?
    
    a) Per comptar  
    b) Per controlar el flux  
    c) Per sumar  
    d) Per comparar

??? success "Resposta"
    **b) Per controlar el flux**  
    Els flags són variables booleanes de control

!!! question "Pregunta 3"
    Què és la "lectura inicial" (priming read)?
    
    a) La primera lectura abans del bucle  
    b) La lectura més important  
    c) La lectura dins del bucle  
    d) La lectura de validació

??? success "Resposta"
    **a) La primera lectura abans del bucle**  
    Necessària per tenir un valor inicial per avaluar la condició