# Classe 8: Estructura Alternativa Doble (IF-ELSE)

## Objectius d'aprenentatge
- Comprendre l'estructura IF-ELSE
- Implementar decisions binàries
- Comparar IF simple amb IF-ELSE
- Resoldre problemes amb dues opcions

---

## 1. Què és l'Estructura IF-ELSE?

!!! note "Definició"
    L'estructura **IF-ELSE** permet executar un bloc de codi si la condició és CERTA, i un bloc **diferent** si és FALSA.

### Diagrama de flux

```
        ┌─────────────┐
        │  CONDICIÓ   │
        └──────┬──────┘
               │
          CERT │ FALS
               │   │
          ┌────▼───▼────┐
          │             │
    ┌─────▼──┐    ┌────▼─────┐
    │ACCIONS │    │ ACCIONS  │
    │  CERT  │    │   FALS   │
    └────────┘    └──────────┘
          │             │
          └──────┬──────┘
                 ▼
          ┌─────────────┐
          │  CONTINUA   │
          └─────────────┘
```

---

## 2. Sintaxi de l'IF-ELSE

```pseudocode
SI condició LLAVORS
    // S'executa si la condició és CERTA
SINO
    // S'executa si la condició és FALSA
FI_SI
```

### Exemple bàsic

```pseudocode
ALGORISME ParellOSenar
VARIABLES
    numero: ENTER
    
INICI
    numero ← 7
    
    SI numero mod 2 = 0 LLAVORS
        ESCRIURE "El número és parell"
    SINO
        ESCRIURE "El número és senar"
    FI_SI
FI
```

**Sortida:**
```
El número és senar
```

---

## 3. Diferència entre IF i IF-ELSE

=== "Només IF"
    ```pseudocode
    SI edat ≥ 18 LLAVORS
        ESCRIURE "Ets adult"
    FI_SI
    // Si edat < 18, no mostra res
    ```

=== "IF-ELSE"
    ```pseudocode
    SI edat ≥ 18 LLAVORS
        ESCRIURE "Ets adult"
    SINO
        ESCRIURE "Ets menor d'edat"
    FI_SI
    // Sempre mostra alguna cosa
    ```

---

## 4. Exemples Pràctics

### Exemple 1: Major o menor

```pseudocode
ALGORISME MajorOMenor
VARIABLES
    num1, num2: ENTER
    
INICI
    ESCRIURE "Primer número:"
    LLEGIR num1
    
    ESCRIURE "Segon número:"
    LLEGIR num2
    
    SI num1 > num2 LLAVORS
        ESCRIURE num1, "és major que", num2
    SINO
        ESCRIURE num1, "és menor o igual que", num2
    FI_SI
FI
```

---

### Exemple 2: Nota aprovada o suspesa

```pseudocode
ALGORISME NotaFinal
VARIABLES
    nota: REAL
    
INICI
    ESCRIURE "Introdueix la nota:"
    LLEGIR nota
    
    SI nota ≥ 5.0 LLAVORS
        ESCRIURE "*** APROVAT ***"
        ESCRIURE "Enhorabona!"
    SINO
        ESCRIURE "*** SUSPÈS ***"
        ESCRIURE "Has de tornar-ho a intentar"
    FI_SI
FI
```

---

### Exemple 3: Preu amb o sense descompte

```pseudocode
ALGORISME PreuAmbDescompte
VARIABLES
    preu: REAL
    preuFinal: REAL
    
INICI
    ESCRIURE "Preu del producte:"
    LLEGIR preu
    
    SI preu > 100.0 LLAVORS
        preuFinal ← preu * 0.90    // 10% descompte
        ESCRIURE "S'aplica un 10% de descompte"
        ESCRIURE "Preu final:", preuFinal, "€"
    SINO
        ESCRIURE "No s'aplica descompte"
        ESCRIURE "Preu final:", preu, "€"
    FI_SI
FI
```

---

## 5. Condicions Compostes amb IF-ELSE

### Exemple 1: Rang d'edat amb AND

```pseudocode
ALGORISME EntradaCinema
VARIABLES
    edat: ENTER
    preu: REAL
    
INICI
    ESCRIURE "Edat:"
    LLEGIR edat
    
    SI (edat ≥ 12) I (edat ≤ 65) LLAVORS
        preu ← 8.50
        ESCRIURE "Entrada normal:", preu, "€"
    SINO
        preu ← 5.00
        ESCRIURE "Entrada reduïda:", preu, "€"
    FI_SI
FI
```

---

### Exemple 2: Accés amb OR

```pseudocode
ALGORISME AccesVIP
VARIABLES
    esVIP: BOOLEÀ
    tePagament: BOOLEÀ
    
INICI
    ESCRIURE "Ets VIP? (CERT/FALS)"
    LLEGIR esVIP
    
    ESCRIURE "Tens pagament actiu? (CERT/FALS)"
    LLEGIR tePagament
    
    SI esVIP O tePagament LLAVORS
        ESCRIURE "*** ACCÉS PERMÈS ***"
        ESCRIURE "Benvingut!"
    SINO
        ESCRIURE "*** ACCÉS DENEGAT ***"
        ESCRIURE "Necessites ser VIP o tenir pagament actiu"
    FI_SI
FI
```

---

## 6. Assignació Condicional

Podem utilitzar IF-ELSE per assignar valors diferents:

```pseudocode
ALGORISME CalcularIVA
VARIABLES
    producte: TEXT
    preu: REAL
    iva: REAL
    
INICI
    ESCRIURE "Tipus de producte (alimentació/altres):"
    LLEGIR producte
    
    ESCRIURE "Preu:"
    LLEGIR preu
    
    SI producte = "alimentació" LLAVORS
        iva ← preu * 0.04    // 4% IVA reduït
    SINO
        iva ← preu * 0.21    // 21% IVA general
    FI_SI
    
    ESCRIURE "IVA:", iva, "€"
    ESCRIURE "Total:", preu + iva, "€"
FI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Traça el programa

Què mostrarà amb aquestes entrades?

```pseudocode
ALGORISME Traça
VARIABLES
    x: ENTER
    
INICI
    ESCRIURE "Valor:"
    LLEGIR x
    
    SI x ≥ 0 LLAVORS
        ESCRIURE "Positiu o zero"
    SINO
        ESCRIURE "Negatiu"
    FI_SI
FI
```

Executa amb:
- a) `x = 5`
- b) `x = -3`
- c) `x = 0`

??? success "Solució"
    **a) x = 5:**
    ```
    Valor:
    5
    Positiu o zero
    ```
    
    **b) x = -3:**
    ```
    Valor:
    -3
    Negatiu
    ```
    
    **c) x = 0:**
    ```
    Valor:
    0
    Positiu o zero
    ```

---

### 🎯 Activitat 2: Comparació

Compara aquests dos programes:

**Programa A:**
```pseudocode
SI edat < 18 LLAVORS
    ESCRIURE "Menor"
FI_SI

SI edat ≥ 18 LLAVORS
    ESCRIURE "Adult"
FI_SI
```

**Programa B:**
```pseudocode
SI edat < 18 LLAVORS
    ESCRIURE "Menor"
SINO
    ESCRIURE "Adult"
FI_SI
```

Quin és millor? Per què?

??? success "Resposta"
    **Programa B** és millor perquè:
    
    - És més eficient (només avalua la condició una vegada)
    - És més clar (són dues opcions excloents)
    - Evita errors si es modifica la condició

---

### 🎯 Activitat 3: Completa el codi

```pseudocode
ALGORISME TemperaturaAigua
VARIABLES
    temperatura: REAL
    
INICI
    LLEGIR temperatura
    
    SI _______________ LLAVORS
        ESCRIURE "L'aigua està congelada"
    SINO
        ESCRIURE "L'aigua està líquida"
    FI_SI
FI
```

??? success "Solució"
    ```pseudocode
    SI temperatura < 0.0 LLAVORS
        ESCRIURE "L'aigua està congelada"
    SINO
        ESCRIURE "L'aigua està líquida"
    FI_SI
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Número positiu o negatiu

Programa que llegeixi un número i indiqui si és positiu o negatiu.

??? success "Solució"
    ```pseudocode
    ALGORISME PositiuNegatiu
    VARIABLES
        numero: REAL
        
    INICI
        ESCRIURE "Introdueix un número:"
        LLEGIR numero
        
        SI numero ≥ 0 LLAVORS
            ESCRIURE "El número és positiu o zero"
        SINO
            ESCRIURE "El número és negatiu"
        FI_SI
    FI
    ```

---

### Exercici 2: Major de dos números

Programa que llegeixi dos números i mostri quin és el major.

??? success "Solució"
    ```pseudocode
    ALGORISME MajorDeDos
    VARIABLES
        num1, num2: REAL
        
    INICI
        ESCRIURE "Primer número:"
        LLEGIR num1
        
        ESCRIURE "Segon número:"
        LLEGIR num2
        
        SI num1 > num2 LLAVORS
            ESCRIURE "El major és:", num1
        SINO
            ESCRIURE "El major és:", num2
        FI_SI
    FI
    ```

---

### Exercici 3: Preu amb IVA diferent

Si el producte és un llibre, IVA 4%, sinó 21%.

??? success "Solució"
    ```pseudocode
    ALGORISME PreuAmbIVA
    VARIABLES
        esLlibre: BOOLEÀ
        preu: REAL
        total: REAL
        
    INICI
        ESCRIURE "És un llibre? (CERT/FALS)"
        LLEGIR esLlibre
        
        ESCRIURE "Preu:"
        LLEGIR preu
        
        SI esLlibre LLAVORS
            total ← preu * 1.04
        SINO
            total ← preu * 1.21
        FI_SI
        
        ESCRIURE "Preu final:", total, "€"
    FI
    ```

---

### Exercici 4: Entrada amb edad

Entrada 8€ si té 18+ anys, sinó 5€.

??? success "Solució"
    ```pseudocode
    ALGORISME PreuEntrada
    VARIABLES
        edat: ENTER
        preu: REAL
        
    INICI
        ESCRIURE "Edat:"
        LLEGIR edat
        
        SI edat ≥ 18 LLAVORS
            preu ← 8.0
        SINO
            preu ← 5.0
        FI_SI
        
        ESCRIURE "Preu entrada:", preu, "€"
    FI
    ```

---

### Exercici 5: Contrasenya correcta

Llegeix contrasenya. Si és "Secreta123" mostra "Accés permès", sinó "Accés denegat".

??? success "Solució"
    ```pseudocode
    ALGORISME ValidarAcces
    VARIABLES
        contrasenya: TEXT
        
    INICI
        ESCRIURE "Contrasenya:"
        LLEGIR contrasenya
        
        SI contrasenya = "Secreta123" LLAVORS
            ESCRIURE "*** ACCÉS PERMÈS ***"
            ESCRIURE "Benvingut!"
        SINO
            ESCRIURE "*** ACCÉS DENEGAT ***"
            ESCRIURE "Contrasenya incorrecta"
        FI_SI
    FI
    ```

---

## 🏠 Deures

1. **Valor absolut:** Llegeix un número. Si és negatiu, mostra'l positiu. Sinó, mostra'l tal qual.

2. **Descompte per quantitat:** Si compres 10+ unitats, aplica 15% de descompte. Sinó, 5%.

3. **Jornada laboral:** Si les hores són ≤40, paga normal. Si >40, paga extra (1.5x).

4. **Admissió universitat:** Si la nota és ≥7, acceptat. Sinó, refusat.

5. **Any de traspàs simple:** Si l'any és divisible per 4, és de traspàs. Sinó, no ho és.

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ IF-ELSE té dues branques: una per CERT, una per FALS
    - ✅ Sempre s'executa una de les dues branques
    - ✅ Sintaxi: `SI ... LLAVORS ... SINO ... FI_SI`
    - ✅ És més eficient que usar dos IF separats per opcions excloents

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    En un IF-ELSE, quantes branques s'executen?
    
    a) Cap  
    b) Una  
    c) Dues  
    d) Depèn

??? success "Resposta"
    **b) Una**  
    Sempre s'executa exactament una branca

!!! question "Pregunta 2"
    Què falta en aquest codi?
    ```
    SI x > 5 LLAVORS
        ESCRIURE "Gran"
        ESCRIURE "Petit"
    FI_SI
    ```
    
    a) SINO  
    b) LLAVORS després de SINO  
    c) Res, està correcte  
    d) Un altre FI_SI

??? success "Resposta"
    **a) SINO**  
    Hauria de tenir SINO abans del segon ESCRIURE
