# Classe 6: Operadors Lògics

## Objectius d'aprenentatge
- Comprendre els operadors lògics I, O, NO
- Utilitzar taules de veritat
- Combinar expressions lògiques
- Aplicar operadors lògics en problemes

---

## 1. Els Tres Operadors Lògics

| Operador | Símbol | Exemple |
|----------|--------|---------|
| I (AND) | `I`, `∧`, `&&` | `A I B` |
| O (OR) | `O`, `∨`, `||` | `A O B` |
| NO (NOT) | `NO`, `¬`, `!` | `NO A` |

!!! info "Nota"
    En aquest curs utilitzarem: `I`, `O`, `NO`

---

## 2. Operador I (AND)

!!! note "I (AND)"
    Retorna `CERT` **només si ambdues** condicions són certes.

### Taula de veritat

| A | B | A I B |
|---|---|-------|
| FALS | FALS | FALS |
| FALS | CERT | FALS |
| CERT | FALS | FALS |
| CERT | CERT | **CERT** |

### Exemple real

```pseudocode
ALGORISME AccesReservat
VARIABLES
    edatValid a: BOOLEÀ
    teCarnet: BOOLEÀ
    potConduir: BOOLEÀ
    
INICI
    edatValida ← CERT   // Té 18 anys o més
    teCarnet ← CERT     // Té carnet de conduir
    
    potConduir ← edatValida I teCarnet
    // Pot conduir només si té edat I té carnet
    
    ESCRIURE "Pot conduir:", potConduir  // CERT
FI
```

---

## 3. Operador O (OR)

!!! note "O (OR)"
    Retorna `CERT` si **almenys una** de les condicions és certa.

### Taula de veritat

| A | B | A O B |
|---|---|-------|
| FALS | FALS | FALS |
| FALS | CERT | **CERT** |
| CERT | FALS | **CERT** |
| CERT | CERT | **CERT** |

### Exemple real

```pseudocode
ALGORISME DescompteEspecial
VARIABLES
    esEstudiant: BOOLEÀ
    esPensionista: BOOLEÀ
    teDescompte: BOOLEÀ
    
INICI
    esEstudiant ← CERT
    esPensionista ← FALS
    
    teDescompte ← esEstudiant O esPensionista
    // Té descompte si és estudiant O pensionista
    
    ESCRIURE "Té descompte:", teDescompte  // CERT
FI
```

---

## 4. Operador NO (NOT)

!!! note "NO (NOT)"
    Inverteix el valor: CERT → FALS, FALS → CERT

### Taula de veritat

| A | NO A |
|---|------|
| FALS | **CERT** |
| CERT | **FALS** |

### Exemple real

```pseudocode
ALGORISME ComprovaDisponibilitat
VARIABLES
    estaOcupat: BOOLEÀ
    estaLliure: BOOLEÀ
    
INICI
    estaOcupat ← CERT
    estaLliure ← NO estaOcupat
    
    ESCRIURE "Està lliure:", estaLliure  // FALS
FI
```

---

## 5. Combinació d'Operadors

### 5.1 Prioritat

!!! warning "Ordre d'avaluació"
    1. `NO`
    2. `I`
    3. `O`
    4. Parèntesis per canviar l'ordre

### 5.2 Exemples

=== "Exemple 1"
    ```pseudocode
    CERT I FALS O CERT
    // Pas 1: CERT I FALS = FALS
    // Pas 2: FALS O CERT = CERT
    // Resultat: CERT
    ```

=== "Exemple 2"
    ```pseudocode
    NO FALS I CERT
    // Pas 1: NO FALS = CERT
    // Pas 2: CERT I CERT = CERT
    // Resultat: CERT
    ```

=== "Exemple 3"
    ```pseudocode
    (CERT O FALS) I (NO CERT)
    // Pas 1: CERT O FALS = CERT
    // Pas 2: NO CERT = FALS
    // Pas 3: CERT I FALS = FALS
    // Resultat: FALS
    ```

---

## 6. Combinació amb Operadors Relacionals

```pseudocode
ALGORISME RangEdat
VARIABLES
    edat: ENTER
    esAdolescent: BOOLEÀ
    
INICI
    ESCRIURE "Quants anys tens?"
    LLEGIR edat
    
    // Adolescent: entre 13 i 19 anys
    esAdolescent ← (edat ≥ 13) I (edat ≤ 19)
    
    ESCRIURE "És adolescent:", esAdolescent
FI
```

---

## 7. Exemples Pràctics Complets

### Exemple 1: Accés a discoteca

```pseudocode
ALGORISME AccesDiscoteca
VARIABLES
    edat: ENTER
    teInvitacio: BOOLEÀ
    potEntrar: BOOLEÀ
    
INICI
    ESCRIURE "Quants anys tens?"
    LLEGIR edat
    
    ESCRIURE "Tens invitació? (CERT/FALS)"
    LLEGIR teInvitacio
    
    // Pot entrar si té 18+ O té invitació
    potEntrar ← (edat ≥ 18) O teInvitacio
    
    ESCRIURE "Pots entrar:", potEntrar
FI
```

---

### Exemple 2: Aprovar assignatura

```pseudocode
ALGORISME AprovarAssignatura
VARIABLES
    notaExamen: REAL
    notaPractiques: REAL
    aprovat: BOOLEÀ
    
INICI
    ESCRIURE "Nota de l'examen:"
    LLEGIR notaExamen
    
    ESCRIURE "Nota de pràctiques:"
    LLEGIR notaPractiques
    
    // Aprova si ambdues notes són ≥ 5
    aprovat ← (notaExamen ≥ 5.0) I (notaPractiques ≥ 5.0)
    
    ESCRIURE "Aprovat:", aprovat
FI
```

---

### Exemple 3: Validació de contrasenya

```pseudocode
ALGORISME ValidarContrasenya
VARIABLES
    longitud: ENTER
    teMajuscules: BOOLEÀ
    teNumeros: BOOLEÀ
    esValida: BOOLEÀ
    
INICI
    longitud ← 10
    teMajuscules ← CERT
    teNumeros ← CERT
    
    // Vàlida si té 8+ caràcters I majúscules I números
    esValida ← (longitud ≥ 8) I teMajuscules I teNumeros
    
    ESCRIURE "Contrasenya vàlida:", esValida
FI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Taules de veritat

Completa les taules:

1. `CERT I CERT` = ?
2. `CERT I FALS` = ?
3. `FALS O CERT` = ?
4. `FALS O FALS` = ?
5. `NO CERT` = ?
6. `NO FALS` = ?

??? success "Solucions"
    1. CERT
    2. FALS
    3. CERT
    4. FALS
    5. FALS
    6. CERT

---

### 🎯 Activitat 2: Avalua expressions

Calcula el resultat:

1. `CERT I CERT I CERT` = ?
2. `CERT O FALS O FALS` = ?
3. `NO (CERT I FALS)` = ?
4. `(CERT O FALS) I CERT` = ?
5. `NO CERT O NO FALS` = ?

??? success "Solucions"
    1. CERT (tots són cert)
    2. CERT (almenys un és cert)
    3. NO FALS = CERT
    4. CERT I CERT = CERT
    5. FALS O CERT = CERT

---

### 🎯 Activitat 3: Expressi ons amb variables

```pseudocode
a ← CERT
b ← FALS
c ← CERT
```

Avalua:

1. `a I b` = ?
2. `a O b` = ?
3. `NO b` = ?
4. `a I b I c` = ?
5. `a O b O c` = ?
6. `(a I b) O c` = ?
7. `a I (b O c)` = ?

??? success "Solucions"
    1. FALS
    2. CERT
    3. CERT
    4. FALS
    5. CERT
    6. CERT
    7. CERT

---

## 💻 Exercicis de Programació

### Exercici 1: Rang de temperatura

Programa que comprovi si la temperatura està entre 18°C i 25°C.

??? success "Solució"
    ```pseudocode
    ALGORISME RangTemperatura
    VARIABLES
        temperatura: REAL
        enRang: BOOLEÀ
        
    INICI
        ESCRIURE "Temperatura actual:"
        LLEGIR temperatura
        
        enRang ← (temperatura ≥ 18.0) I (temperatura ≤ 25.0)
        
        ESCRIURE "Temperatura confortable:", enRang
    FI
    ```

---

### Exercici 2: Número positiu o parell

Programa que comprovi si un número és positiu O parell.

??? success "Solució"
    ```pseudocode
    ALGORISME PositiuOParell
    VARIABLES
        numero: ENTER
        esPositiu: BOOLEÀ
        esParell: BOOLEÀ
        cumpleix: BOOLEÀ
        
    INICI
        ESCRIURE "Introdueix un número:"
        LLEGIR numero
        
        esPositiu ← numero > 0
        esParell ← (numero mod 2) = 0
        cumpleix ← esPositiu O esParell
        
        ESCRIURE "És positiu o parell:", cumpleix
    FI
    ```

---

### Exercici 3: Validació d'edat

Programa que comprovi si una persona té entre 16 i 65 anys.

??? success "Solució"
    ```pseudocode
    ALGORISME ValidarEdat
    VARIABLES
        edat: ENTER
        edatValida: BOOLEÀ
        
    INICI
        ESCRIURE "Introdueix l'edat:"
        LLEGIR edat
        
        edatValida ← (edat ≥ 16) I (edat ≤ 65)
        
        ESCRIURE "Edat vàlida per treballar:", edatValida
    FI
    ```

---

### Exercici 4: Triangle vàlid

Els costats d'un triangle han de complir: cada costat < suma dels altres dos.

??? success "Solució"
    ```pseudocode
    ALGORISME TriangleValid
    VARIABLES
        a, b, c: REAL
        esValid: BOOLEÀ
        
    INICI
        ESCRIURE "Costat a:"
        LLEGIR a
        ESCRIURE "Costat b:"
        LLEGIR b
        ESCRIURE "Costat c:"
        LLEGIR c
        
        esValid ← (a < b + c) I (b < a + c) I (c < a + b)
        
        ESCRIURE "És un triangle vàlid:", esValid
    FI
    ```

---

### Exercici 5: Any de traspàs

Un any és de traspàs si és divisible per 4, però no per 100, excepte si també és divisible per 400.

??? tip "Ajuda"
    `(divisible per 4 I NO divisible per 100) O (divisible per 400)`

??? success "Solució"
    ```pseudocode
    ALGORISME AnyTrapas
    VARIABLES
        any: ENTER
        esTrapas: BOOLEÀ
        
    INICI
        ESCRIURE "Introdueix l'any:"
        LLEGIR any
        
        esTrapas ← ((any mod 4 = 0) I NO (any mod 100 = 0)) O (any mod 400 = 0)
        
        ESCRIURE "És any de traspàs:", esTrapas
    FI
    ```

---

## 🏠 Deures

1. **Descompte VIP:** Programa que doni descompte si el client és VIP I la compra supera 100€.

2. **Accés restringit:** Pot entrar si té clau O és administrador I està en horari laboral.

3. **Número en rang:** Comprova si un número està fora del rang 10-20 (usa NO).

4. **Vocal:** Comprova si un caràcter és vocal (a, e, i, o, u).

5. **Password segura:** Comprova si té 8+ caràcters I conté majúscules I números.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ `I` retorna CERT només si ambdues condicions són certes
    - ✅ `O` retorna CERT si almenys una condició és certa
    - ✅ `NO` inverteix el valor booleà
    - ✅ Prioritat: NO > I > O
    - ✅ Combinem operadors lògics amb relacionals

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin és el resultat de `CERT I FALS`?
    
    a) CERT  
    b) FALS  
    c) Error  
    d) NULL

??? success "Resposta"
    **b) FALS**  
    Amb I, ambdós han de ser CERT

!!! question "Pregunta 2"
    Quin és el resultat de `FALS O CERT`?
    
    a) CERT  
    b) FALS  
    c) Error  
    d) NULL

??? success "Resposta"
    **a) CERT**  
    Amb O, n'hi ha prou amb un CERT

!!! question "Pregunta 3"
    Quin és el resultat de `NO (CERT I CERT)`?
    
    a) CERT  
    b) FALS  
    c) Error  
    d) Depèn

??? success "Resposta"
    **b) FALS**  
    CERT I CERT = CERT, després NO CERT = FALS
