# Classe 20: Repàs i Avaluació Final

## Objectius
- Repassar tots els conceptes del curs
- Consolidar coneixements
- Avaluar l'aprenentatge
- Preparar-se per a projectes futurs

---

## 📚 Repàs General del Curs

### Bloc 1: Fonaments

!!! summary "Conceptes clau"
    **Variables i tipus:**
    - ENTER, REAL, TEXT, CARÀCTER, BOOLEÀ
    - Declaració i assignació
    
    **Operadors:**
    - Aritmètics: +, -, *, /, div, mod
    - Prioritat d'operadors
    
    **Entrada/Sortida:**
    - LLEGIR, ESCRIURE
    - Interacció amb l'usuari

---

### Bloc 2: Expressions Lògiques i Decisions

!!! summary "Conceptes clau"
    **Operadors:**
    - Relacionals: =, ≠, <, >, ≤, ≥
    - Lògics: I, O, NO
    
    **Estructures:**
    - SI...LLAVORS...FI_SI
    - SI...LLAVORS...SINO...FI_SI
    - SINO_SI per alternatives múltiples

---

### Bloc 3: Decisions Complexes

!!! summary "Conceptes clau"
    - Alternatives niuades (IF dins d'IF)
    - Alternatives encadenades (SINO_SI)
    - Classificació per intervals
    - Menús d'opcions

---

### Bloc 4: Estructures Repetitives

!!! summary "Conceptes clau"
    **FOR:**
    - Iteracions conegudes
    - PAS per controlar increment
    - Bucles decreixents
    
    **WHILE:**
    - Iteracions desconegudes
    - Validacions
    - Sentinelles
    
    **DO-WHILE:**
    - Postcondició
    - Almenys 1 execució

---

### Bloc 5: Integració

!!! summary "Conceptes clau"
    - Bucles niuats
    - IF dins de bucles
    - Bucles dins d'IF
    - Comptadors condicionals
    - Problemes complexos

---

## 🎯 Guia Ràpida de Sintaxi

### Estructura bàsica

```pseudocode
ALGORISME NomAlgorisme
CONSTANTS
    PI = 3.14159
    
VARIABLES
    variable1: TIPUS
    variable2: TIPUS
    
INICI
    // Codi aquí
FI
```

---

### Decisions

=== "IF Simple"
    ```pseudocode
    SI condició LLAVORS
        // Accions
    FI_SI
    ```

=== "IF-ELSE"
    ```pseudocode
    SI condició LLAVORS
        // Si cert
    SINO
        // Si fals
    FI_SI
    ```

=== "IF Encadenat"
    ```pseudocode
    SI condició1 LLAVORS
        // Opció 1
    SINO_SI condició2 LLAVORS
        // Opció 2
    SINO
        // Defecte
    FI_SI
    ```

---

### Bucles

=== "FOR"
    ```pseudocode
    PER i ← inici FINS fi FER
        // Accions
    FI_PER
    
    PER i ← inici FINS fi PAS increment FER
        // Accions
    FI_PER
    ```

=== "WHILE"
    ```pseudocode
    MENTRE condició FER
        // Accions
        // Actualitzar variables!
    FI_MENTRE
    ```

=== "DO-WHILE"
    ```pseudocode
    FER
        // Accions (mínim 1 cop)
    MENTRE condició
    ```

---

## 📝 Avaluació Teòrica

### Pregunta 1: Tipus de dades
Indica el tipus de dada adequat per:

a) L'edat d'una persona  
b) El preu d'un producte  
c) Si un alumne ha aprovat  
d) El nom d'una ciutat  

??? success "Respostes"
    a) ENTER  
    b) REAL  
    c) BOOLEÀ  
    d) TEXT

---

### Pregunta 2: Operadors
Avalua aquestes expressions:

a) `17 div 5` = ?  
b) `17 mod 5` = ?  
c) `CERT I FALS` = ?  
d) `(5 > 3) O (2 > 10)` = ?  

??? success "Respostes"
    a) 3  
    b) 2  
    c) FALS  
    d) CERT

---

### Pregunta 3: Bucles
Per a cada situació, indica FOR o WHILE:

a) Mostrar números de l'1 al 100  
b) Validar una contrasenya  
c) Calcular factorial de N  
d) Llegir dades fins que l'usuari escrigui "fi"  

??? success "Respostes"
    a) FOR  
    b) WHILE  
    c) FOR  
    d) WHILE

---

## 💻 Avaluació Pràctica

### Exercici 1: Estadístiques bàsiques (5 punts)

Llegeix 10 números i calcula:
- Suma total
- Mitjana
- Quants són positius

??? success "Solució"
    ```pseudocode
    ALGORISME Estadistiques
    VARIABLES
        numero, suma, positius: ENTER
        mitjana: REAL
        
    INICI
        suma ← 0
        positius ← 0
        
        PER i ← 1 FINS 10 FER
            ESCRIURE "Número", i, ":"
            LLEGIR numero
            suma ← suma + numero
            
            SI numero > 0 LLAVORS
                positius ← positius + 1
            FI_SI
        FI_PER
        
        mitjana ← suma / 10
        
        ESCRIURE "Suma:", suma
        ESCRIURE "Mitjana:", mitjana
        ESCRIURE "Positius:", positius
    FI
    ```

---

### Exercici 2: Validació i processament (5 punts)

Llegeix notes (0-10) fins que introdueixin -1.
Calcula la mitjana de les notes vàlides.

??? success "Solució"
    ```pseudocode
    ALGORISME NotesValidacio
    VARIABLES
        nota, suma: REAL
        comptador: ENTER
        
    INICI
        suma ← 0.0
        comptador ← 0
        nota ← 0
        
        MENTRE nota ≠ -1 FER
            ESCRIURE "Nota (-1 per acabar):"
            LLEGIR nota
            
            SI nota ≠ -1 LLAVORS
                SI (nota ≥ 0.0) I (nota ≤ 10.0) LLAVORS
                    suma ← suma + nota
                    comptador ← comptador + 1
                SINO
                    ESCRIURE "Nota no vàlida!"
                FI_SI
            FI_SI
        FI_MENTRE
        
        SI comptador > 0 LLAVORS
            ESCRIURE "Mitjana:", suma / comptador
        SINO
            ESCRIURE "No s'han introduït notes"
        FI_SI
    FI
    ```

---

### Exercici 3: Taula amb cerca (10 punts)

Crea una taula 3x3:
1. Llegeix 9 valors
2. Mostra la suma de cada fila
3. Troba el valor màxim i la seva posició

??? success "Solució"
    ```pseudocode
    ALGORISME TaulaAmbCerca
    VARIABLES
        valor, sumaFila, maxim: ENTER
        filaMax, colMax: ENTER
        primerValor: BOOLEÀ
        
    INICI
        primerValor ← CERT
        
        PER fila ← 1 FINS 3 FER
            sumaFila ← 0
            
            PER col ← 1 FINS 3 FER
                ESCRIURE "Element [", fila, "][", col, "]:"
                LLEGIR valor
                sumaFila ← sumaFila + valor
                
                // Actualitzar màxim
                SI primerValor LLAVORS
                    maxim ← valor
                    filaMax ← fila
                    colMax ← col
                    primerValor ← FALS
                SINO_SI valor > maxim LLAVORS
                    maxim ← valor
                    filaMax ← fila
                    colMax ← col
                FI_SI
            FI_PER
            
            ESCRIURE "Suma fila", fila, ":", sumaFila
        FI_PER
        
        ESCRIURE "Valor màxim:", maxim
        ESCRIURE "Posició: [", filaMax, "][", colMax, "]"
    FI
    ```

---

## 🎓 Projecte Final (Extra)

### Sistema de biblioteca

Crea un sistema de gestió amb:

**Funcionalitats:**
1. Afegir llibres (títol, disponible: CERT/FALS)
2. Préstec de llibre (marca com NO disponible)
3. Devolució de llibre (marca com disponible)
4. Llistar tots els llibres
5. Buscar llibre per títol
6. Estadístiques (total, disponibles, prestats)

**Requisits tècnics:**
- Menú amb DO-WHILE
- Estructura de dades simulada amb bucles
- Validacions amb WHILE
- Comptadors per estadístiques
- Cerca amb flags

---

## 📊 Criteris d'Avaluació

| Criteri | Punts |
|---------|-------|
| Sintaxi correcta | 20% |
| Lògica adequada | 30% |
| Eficiència | 15% |
| Validacions | 15% |
| Claredat del codi | 10% |
| Comentaris | 10% |

---

## 🎯 Consells Finals

!!! tip "Per a l'examen"
    1. **Llegeix bé** l'enunciat
    2. **Planifica** abans de programar
    3. **Traça** amb exemples
    4. **Valida** les entrades
    5. **Prova** casos límit
    6. **Comenta** el codi
    7. **Revisa** abans d'entregar

!!! warning "Errors comuns a evitar"
    - Bucles infinits (oblida actualitzar)
    - Variables no inicialitzades
    - Confondre = i ≠
    - Oblida FI_SI, FI_PER, etc.
    - No validar entrada
    - Usar variables abans de llegir-les

---

## 📚 Recursos per Continuar

### Següents passos:

1. **Aprendre un llenguatge real:**
   - Python (recomanat per començar)
   - JavaScript
   - Java, C++

2. **Temes avançats:**
   - Arrays (vectors)
   - Funcions i procediments
   - Recursivitat
   - Estructures de dades

3. **Pràctica:**
   - Exercicis online (LeetCode, HackerRank)
   - Projectes personals
   - Participar en comunitats

---

## 🏆 Felicitats!

Has completat el curs de Programació Estructurada amb Pseudocodi.

**Conceptes dominats:**
✅ Variables i tipus de dades  
✅ Operadors i expressions  
✅ Entrada i sortida  
✅ Decisions (IF, IF-ELSE, SINO_SI)  
✅ Bucles (FOR, WHILE, DO-WHILE)  
✅ Bucles niuats  
✅ Problemes complexos  

**Ara estàs preparat per:**
- Aprendre llenguatges de programació reals
- Resoldre problemes algorítmics
- Crear els teus propis programes
- Continuar aprenent programació avançada

---

## 📝 Feedback del Curs

Si has arribat fins aquí, enhorabona! 🎉

**Reflexiona sobre:**
- Què t'ha resultat més fàcil?
- Què t'ha costat més?
- Quin concepte t'ha semblat més útil?
- Què t'agradaria aprendre ara?

---

!!! success "Èxit assegurat"
    La programació és una habilitat que es desenvolupa amb la **pràctica constant**.
    
    Segueix practicant, segueix aprenent, segueix creant!
    
    **Molt d'èxit en el teu camí com a programador/a! 🚀**

---

**Fi del curs** 🎓
