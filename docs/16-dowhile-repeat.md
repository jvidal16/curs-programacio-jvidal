# Classe 16: Bucle DO-WHILE / REPEAT-UNTIL

## Objectius d'aprenentatge
- Comprendre bucles amb postcondició
- Distingir WHILE de DO-WHILE
- Aplicar REPEAT-UNTIL
- Triar el bucle adequat

---

## 1. Bucle DO-WHILE

!!! note "Sintaxi"
    ```pseudocode
    FER
        // Instruccions
    MENTRE condició
    ```

### Diferència clau amb WHILE

| WHILE | DO-WHILE |
|-------|----------|
| Avalua ABANS | Avalua DESPRÉS |
| Pot no executar-se | S'executa ALMENYS 1 vegada |
| Precondició | Postcondició |

---

## 2. Exemple Comparatiu

=== "WHILE"
    ```pseudocode
    x ← 10
    MENTRE x < 5 FER
        ESCRIURE x
        x ← x + 1
    FI_MENTRE
    // No mostra res!
    ```

=== "DO-WHILE"
    ```pseudocode
    x ← 10
    FER
        ESCRIURE x
        x ← x + 1
    MENTRE x < 5
    // Mostra 10 (una vegada)
    ```

---

## 3. Quan Utilitzar DO-WHILE

### ✅ Ideal per:

- Menús (mostrar almenys una vegada)
- Validacions (demanar almenys una vegada)
- Jocs (jugar almenys una ronda)

### Exemple: Menú

```pseudocode
ALGORISME MenuPrincipal
VARIABLES
    opcio: ENTER
    
INICI
    FER
        ESCRIURE "===== MENÚ ====="
        ESCRIURE "1. Jugar"
        ESCRIURE "2. Opcions"
        ESCRIURE "3. Sortir"
        ESCRIURE "================"
        LLEGIR opcio
        
        SI opcio = 1 LLAVORS
            ESCRIURE "Iniciant joc..."
        SINO_SI opcio = 2 LLAVORS
            ESCRIURE "Configuració..."
        FI_SI
        
    MENTRE opcio ≠ 3
    
    ESCRIURE "Adéu!"
FI
```

---

## 4. REPEAT-UNTIL (Variant)

!!! info "REPEAT-UNTIL"
    Repeteix fins que la condició sigui CERTA (al revés de DO-WHILE).

```pseudocode
REPETIR
    // Instruccions
FINS condició
```

### Exemple

```pseudocode
ALGORISME ValidarAmbRepeat
VARIABLES
    password: TEXT
    
INICI
    REPETIR
        ESCRIURE "Password:"
        LLEGIR password
    FINS password = "correcte"
    
    ESCRIURE "Accés permès"
FI
```

---

## 5. Comparació dels Tres Bucles

| Bucle | Avaluació | Iteracions mínimes |
|-------|-----------|-------------------|
| WHILE | Abans | 0 |
| DO-WHILE | Després | 1 |
| FOR | Abans | 0 |

---

## 💻 Exercicis

### Exercici 1: Calculadora

Calculadora que es repeteix fins que l'usuari triï sortir.

??? success "Solució"
    ```pseudocode
    ALGORISME Calculadora
    VARIABLES
        num1, num2, resultat: REAL
        operacio: CARÀCTER
        continuar: TEXT
        
    INICI
        FER
            ESCRIURE "Primer número:"
            LLEGIR num1
            
            ESCRIURE "Operació (+,-,*,/):"
            LLEGIR operacio
            
            ESCRIURE "Segon número:"
            LLEGIR num2
            
            SI operacio = '+' LLAVORS
                resultat ← num1 + num2
            SINO_SI operacio = '-' LLAVORS
                resultat ← num1 - num2
            SINO_SI operacio = '*' LLAVORS
                resultat ← num1 * num2
            SINO_SI operacio = '/' LLAVORS
                SI num2 ≠ 0 LLAVORS
                    resultat ← num1 / num2
                SINO
                    ESCRIURE "Error: divisió per zero"
                    resultat ← 0
                FI_SI
            FI_SI
            
            ESCRIURE "Resultat:", resultat
            
            ESCRIURE "Continuar? (s/n):"
            LLEGIR continuar
            
        MENTRE (continuar = "s") O (continuar = "S")
        
        ESCRIURE "Fins aviat!"
    FI
    ```

---

### Exercici 2: Joc de daus

Llança dos daus fins obtenir doble sis.

??? success "Solució"
    ```pseudocode
    ALGORISME JocDaus
    VARIABLES
        dau1, dau2, intents: ENTER
        
    INICI
        intents ← 0
        
        FER
            // Simular llançament (números 1-6)
            ESCRIURE "Llançant daus..."
            intents ← intents + 1
            
            ESCRIURE "Dau 1 (1-6):"
            LLEGIR dau1
            ESCRIURE "Dau 2 (1-6):"
            LLEGIR dau2
            
            ESCRIURE "Has tret:", dau1, "i", dau2
            
        MENTRE (dau1 ≠ 6) O (dau2 ≠ 6)
        
        ESCRIURE "Doble sis en", intents, "intents!"
    FI
    ```

---

## 🏠 Deures

1. **Endevinar amb repetició:** Joc que permet jugar diverses vegades
2. **Validar correu:** Demanar email fins que contingui '@'
3. **Comptar vocals:** Llegir frases fins escriure "fi"
4. **ATM simulat:** Menú bancari amb opcions múltiples

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ DO-WHILE s'executa ALMENYS 1 vegada
    - ✅ Avalua la condició AL FINAL
    - ✅ Ideal per menús i validacions
    - ✅ REPEAT-UNTIL és la variant inversa

---

## 🤔 Autoavaluació

!!! question "Quin bucle garanteix almenys 1 execució?"
    
    a) FOR  
    b) WHILE  
    c) DO-WHILE  
    d) Cap

??? success "Resposta"
    **c) DO-WHILE**
