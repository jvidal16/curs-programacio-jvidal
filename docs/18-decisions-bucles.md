# Classe 18: Combinació de Decisions i Bucles

## Objectius d'aprenentatge
- Integrar IF dins de bucles
- Integrar bucles dins d'IF
- Aplicar comptadors condicionals
- Resoldre problemes de cerca

---

## 1. IF dins de FOR

### Patró bàsic

```pseudocode
PER i ← inici FINS fi FER
    SI condició LLAVORS
        // Acció condicional
    FI_SI
FI_PER
```

### Exemple: Comptar parells

```pseudocode
ALGORISME ComptarParells
VARIABLES
    comptador: ENTER
    
INICI
    comptador ← 0
    
    PER i ← 1 FINS 20 FER
        SI i mod 2 = 0 LLAVORS
            comptador ← comptador + 1
        FI_SI
    FI_PER
    
    ESCRIURE "Parells:", comptador
FI
```

---

## 2. IF dins de WHILE

### Exemple: Validar i processar

```pseudocode
ALGORISME ProcessarNotes
VARIABLES
    nota: REAL
    suma: REAL
    comptador: ENTER
    continuar: TEXT
    
INICI
    suma ← 0.0
    comptador ← 0
    continuar ← "s"
    
    MENTRE (continuar = "s") O (continuar = "S") FER
        ESCRIURE "Nota (0-10):"
        LLEGIR nota
        
        SI (nota ≥ 0.0) I (nota ≤ 10.0) LLAVORS
            suma ← suma + nota
            comptador ← comptador + 1
            
            SI nota ≥ 5.0 LLAVORS
                ESCRIURE "Aprovat!"
            SINO
                ESCRIURE "Suspès"
            FI_SI
        SINO
            ESCRIURE "Nota no vàlida"
        FI_SI
        
        ESCRIURE "Més notes? (s/n):"
        LLEGIR continuar
    FI_MENTRE
    
    SI comptador > 0 LLAVORS
        ESCRIURE "Mitjana:", suma / comptador
    FI_SI
FI
```

---

## 3. Bucles dins d'IF

### Exemple: Menú amb opcions

```pseudocode
ALGORISME MenuAmbOpcions
VARIABLES
    opcio, n: ENTER
    
INICI
    ESCRIURE "1. Mostrar números"
    ESCRIURE "2. Taula multiplicar"
    ESCRIURE "3. Sortir"
    LLEGIR opcio
    
    SI opcio = 1 LLAVORS
        PER i ← 1 FINS 10 FER
            ESCRIURE i
        FI_PER
        
    SINO_SI opcio = 2 LLAVORS
        ESCRIURE "Quin número?"
        LLEGIR n
        
        PER i ← 1 FINS 10 FER
            ESCRIURE n, "x", i, "=", n * i
        FI_PER
        
    SINO_SI opcio = 3 LLAVORS
        ESCRIURE "Adéu!"
        
    SINO
        ESCRIURE "Opció no vàlida"
    FI_SI
FI
```

---

## 4. Comptadors Condicionals

### Múltiples comptadors

```pseudocode
ALGORISME EstadistiquesNotes
VARIABLES
    nota: REAL
    excel·lents, notables, aprovats, suspensos: ENTER
    
INICI
    excel·lents ← 0
    notables ← 0
    aprovats ← 0
    suspensos ← 0
    
    PER i ← 1 FINS 10 FER
        ESCRIURE "Nota", i, ":"
        LLEGIR nota
        
        SI nota ≥ 9.0 LLAVORS
            excel·lents ← excel·lents + 1
        SINO_SI nota ≥ 7.0 LLAVORS
            notables ← notables + 1
        SINO_SI nota ≥ 5.0 LLAVORS
            aprovats ← aprovats + 1
        SINO
            suspensos ← suspensos + 1
        FI_SI
    FI_PER
    
    ESCRIURE "Excel·lents:", excel·lents
    ESCRIURE "Notables:", notables
    ESCRIURE "Aprovats:", aprovats
    ESCRIURE "Suspensos:", suspensos
FI
```

---

## 5. Problemes de Cerca

### Cercar i aturar

```pseudocode
ALGORISME CercarPrimer
VARIABLES
    numero, buscat: ENTER
    trobat: BOOLEÀ
    posicio: ENTER
    
INICI
    ESCRIURE "Quin número busques?"
    LLEGIR buscat
    
    trobat ← FALS
    posicio ← 0
    
    PER i ← 1 FINS 10 FER
        SI NO trobat LLAVORS
            ESCRIURE "Número", i, ":"
            LLEGIR numero
            
            SI numero = buscat LLAVORS
                trobat ← CERT
                posicio ← i
            FI_SI
        FI_SI
    FI_PER
    
    SI trobat LLAVORS
        ESCRIURE "Trobat a posició:", posicio
    SINO
        ESCRIURE "No trobat"
    FI_SI
FI
```

---

## 6. Validacions Complexes

```pseudocode
ALGORISME LlegirAmbValidacio
VARIABLES
    valors: ENTER
    suma, valor: ENTER
    valid: BOOLEÀ
    
INICI
    suma ← 0
    valors ← 0
    
    PER i ← 1 FINS 5 FER
        valid ← FALS
        
        MENTRE NO valid FER
            ESCRIURE "Valor positiu", i, ":"
            LLEGIR valor
            
            SI valor > 0 LLAVORS
                valid ← CERT
                suma ← suma + valor
                valors ← valors + 1
            SINO
                ESCRIURE "Ha de ser positiu!"
            FI_SI
        FI_MENTRE
    FI_PER
    
    ESCRIURE "Suma:", suma
    ESCRIURE "Mitjana:", suma / valors
FI
```

---

## 💻 Exercicis

### Exercici 1: Estadístiques completes

Llegeix 15 números i calcula:
- Quants són positius, negatius i zero
- La suma dels positius
- La suma dels negatius

??? success "Solució"
    ```pseudocode
    ALGORISME EstadistiquesCompletes
    VARIABLES
        numero: ENTER
        positius, negatius, zeros: ENTER
        sumaPos, sumaNeg: ENTER
        
    INICI
        positius ← 0
        negatius ← 0
        zeros ← 0
        sumaPos ← 0
        sumaNeg ← 0
        
        PER i ← 1 FINS 15 FER
            ESCRIURE "Número", i, ":"
            LLEGIR numero
            
            SI numero > 0 LLAVORS
                positius ← positius + 1
                sumaPos ← sumaPos + numero
            SINO_SI numero < 0 LLAVORS
                negatius ← negatius + 1
                sumaNeg ← sumaNeg + numero
            SINO
                zeros ← zeros + 1
            FI_SI
        FI_PER
        
        ESCRIURE "Positius:", positius, "Suma:", sumaPos
        ESCRIURE "Negatius:", negatius, "Suma:", sumaNeg
        ESCRIURE "Zeros:", zeros
    FI
    ```

---

### Exercici 2: Primer i últim

Llegeix números fins -1 i mostra el primer i l'últim positiu.

??? success "Solució"
    ```pseudocode
    ALGORISME PrimerUltim
    VARIABLES
        numero, primer, ultim: ENTER
        trobatPrimer: BOOLEÀ
        
    INICI
        trobatPrimer ← FALS
        numero ← 0
        
        MENTRE numero ≠ -1 FER
            ESCRIURE "Número (-1 per sortir):"
            LLEGIR numero
            
            SI numero > 0 LLAVORS
                SI NO trobatPrimer LLAVORS
                    primer ← numero
                    trobatPrimer ← CERT
                FI_SI
                ultim ← numero
            FI_SI
        FI_MENTRE
        
        SI trobatPrimer LLAVORS
            ESCRIURE "Primer positiu:", primer
            ESCRIURE "Últim positiu:", ultim
        SINO
            ESCRIURE "No hi ha positius"
        FI_SI
    FI
    ```

---

### Exercici 3: Validació rang amb reintents

Llegeix 5 números (1-100). Si és invàlid, torna a demanar.

??? success "Solució"
    ```pseudocode
    ALGORISME ValidacioRang
    VARIABLES
        numero: ENTER
        valid: BOOLEÀ
        
    INICI
        PER i ← 1 FINS 5 FER
            valid ← FALS
            
            MENTRE NO valid FER
                ESCRIURE "Número", i, "(1-100):"
                LLEGIR numero
                
                SI (numero ≥ 1) I (numero ≤ 100) LLAVORS
                    valid ← CERT
                    ESCRIURE "Acceptat"
                SINO
                    ESCRIURE "Fora de rang!"
                FI_SI
            FI_MENTRE
        FI_PER
    FI
    ```

---

## 🏠 Deures

1. **Aprovar i suspendre:** 20 notes, compta aprovats i suspensos per separat
2. **Major i menor:** Llegeix nombres fins 0, troba màxim i mínim
3. **Parells i senars:** Suma per separat parells i senars (10 números)
4. **Validació contrasenya:** 3 intents per contrasenya, si falla 3 vegades bloqueja

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ IF dins bucles: condicions en cada iteració
    - ✅ Bucles dins IF: accions condicionals repetitives
    - ✅ Comptadors condicionals: contar segons condició
    - ✅ Validacions: bucles amb condicions complexes

---

## 🤔 Autoavaluació

!!! question "On va el IF per comptar elements que compleixen una condició?"
    
    a) Abans del bucle  
    b) Dins del bucle  
    c) Després del bucle  
    d) Fora de tot

??? success "Resposta"
    **b) Dins del bucle**  
    Per avaluar cada element
