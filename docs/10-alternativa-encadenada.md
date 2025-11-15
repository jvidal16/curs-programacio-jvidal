# Classe 10: Alternatives Encadenades (IF-ELSE IF)

## Objectius d'aprenentatge
- Comprendre l'estructura ELSE IF
- Avaluar seqüencialment múltiples condicions
- Simplificar alternatives niuades
- Implementar menús i casos múltiples

---

## 1. Què són les Alternatives Encadenades?

!!! note "Definició"
    Les **alternatives encadenades** permeten avaluar **múltiples condicions** de forma seqüencial fins que una sigui certa.

### Sintaxi

```pseudocode
SI condició1 LLAVORS
    // Acció 1
SINO_SI condició2 LLAVORS
    // Acció 2
SINO_SI condició3 LLAVORS
    // Acció 3
SINO
    // Acció per defecte (si cap condició és certa)
FI_SI
```

---

## 2. Comparació: Niuat vs Encadenat

=== "❌ Niuat (menys llegible)"
    ```pseudocode
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
    ```

=== "✅ Encadenat (més clar)"
    ```pseudocode
    SI nota < 5.0 LLAVORS
        ESCRIURE "SUSPÈS"
    SINO_SI nota < 7.0 LLAVORS
        ESCRIURE "APROVAT"
    SINO_SI nota < 9.0 LLAVORS
        ESCRIURE "NOTABLE"
    SINO
        ESCRIURE "EXCEL·LENT"
    FI_SI
    ```

---

## 3. Com Funciona l'Avaluació

!!! info "Avaluació seqüencial"
    1. S'avalua la primera condició
    2. Si és CERT → executa el bloc i **surt**
    3. Si és FALS → avalua la següent condició
    4. Repeteix fins trobar una condició certa o arribar a SINO
    5. Si cap condició és certa → executa el bloc SINO

### Exemple amb traça

```pseudocode
nota ← 6.5

SI nota < 5.0 LLAVORS         // 6.5 < 5.0? NO
    ESCRIURE "SUSPÈS"
SINO_SI nota < 7.0 LLAVORS    // 6.5 < 7.0? SÍ → EXECUTA
    ESCRIURE "APROVAT"         // ← Executa això
SINO_SI nota < 9.0 LLAVORS    // No s'avalua
    ESCRIURE "NOTABLE"
SINO                          // No s'avalua
    ESCRIURE "EXCEL·LENT"
FI_SI
```

**Resultat:** "APROVAT"

---

## 4. Exemples Pràctics

### Exemple 1: Classificació d'edat

```pseudocode
ALGORISME ClassificacioEdat
VARIABLES
    edat: ENTER
    
INICI
    ESCRIURE "Introdueix l'edat:"
    LLEGIR edat
    
    SI edat < 3 LLAVORS
        ESCRIURE "BEBÈ"
    SINO_SI edat < 12 LLAVORS
        ESCRIURE "NEN/A"
    SINO_SI edat < 18 LLAVORS
        ESCRIURE "ADOLESCENT"
    SINO_SI edat < 65 LLAVORS
        ESCRIURE "ADULT"
    SINO
        ESCRIURE "SÈNIOR"
    FI_SI
FI
```

---

### Exemple 2: Calculadora simple

```pseudocode
ALGORISME CalculadoraSimple
VARIABLES
    num1, num2, resultat: REAL
    operacio: CARÀCTER
    
INICI
    ESCRIURE "Primer número:"
    LLEGIR num1
    
    ESCRIURE "Segon número:"
    LLEGIR num2
    
    ESCRIURE "Operació (+, -, *, /):"
    LLEGIR operacio
    
    SI operacio = '+' LLAVORS
        resultat ← num1 + num2
        ESCRIURE "Resultat:", resultat
    SINO_SI operacio = '-' LLAVORS
        resultat ← num1 - num2
        ESCRIURE "Resultat:", resultat
    SINO_SI operacio = '*' LLAVORS
        resultat ← num1 * num2
        ESCRIURE "Resultat:", resultat
    SINO_SI operacio = '/' LLAVORS
        SI num2 ≠ 0 LLAVORS
            resultat ← num1 / num2
            ESCRIURE "Resultat:", resultat
        SINO
            ESCRIURE "Error: divisió per zero"
        FI_SI
    SINO
        ESCRIURE "Operació no vàlida"
    FI_SI
FI
```

---

### Exemple 3: Menú de restaurant

```pseudocode
ALGORISME MenuRestaurant
VARIABLES
    opcio: ENTER
    preu: REAL
    
INICI
    ESCRIURE "===== MENÚ ====="
    ESCRIURE "1. Amanida - 6€"
    ESCRIURE "2. Pizza - 9€"
    ESCRIURE "3. Pasta - 8€"
    ESCRIURE "4. Bistec - 15€"
    ESCRIURE "================"
    ESCRIURE "Tria una opció (1-4):"
    LLEGIR opcio
    
    SI opcio = 1 LLAVORS
        ESCRIURE "Has triat: Amanida"
        preu ← 6.0
    SINO_SI opcio = 2 LLAVORS
        ESCRIURE "Has triat: Pizza"
        preu ← 9.0
    SINO_SI opcio = 3 LLAVORS
        ESCRIURE "Has triat: Pasta"
        preu ← 8.0
    SINO_SI opcio = 4 LLAVORS
        ESCRIURE "Has triat: Bistec"
        preu ← 15.0
    SINO
        ESCRIURE "Opció no vàlida"
        preu ← 0.0
    FI_SI
    
    SI preu > 0 LLAVORS
        ESCRIURE "Import a pagar:", preu, "€"
    FI_SI
FI
```

---

## 5. Casos Avançats

### Combinació amb condicions compostes

```pseudocode
ALGORISME PreuEntrada
VARIABLES
    edat: ENTER
    esEstudiant: BOOLEÀ
    preu: REAL
    
INICI
    ESCRIURE "Edat:"
    LLEGIR edat
    
    ESCRIURE "Ets estudiant? (CERT/FALS)"
    LLEGIR esEstudiant
    
    SI (edat < 12) O (edat ≥ 65) LLAVORS
        preu ← 5.0
        ESCRIURE "Tarifa reduïda: ", preu, "€"
    SINO_SI (edat ≥ 12) I (edat < 18) I esEstudiant LLAVORS
        preu ← 7.0
        ESCRIURE "Tarifa estudiant: ", preu, "€"
    SINO_SI (edat ≥ 18) I esEstudiant LLAVORS
        preu ← 9.0
        ESCRIURE "Tarifa estudiant adult: ", preu, "€"
    SINO
        preu ← 12.0
        ESCRIURE "Tarifa general: ", preu, "€"
    FI_SI
FI
```

---

## 6. Bones Pràctiques

!!! tip "Consells"
    1. **Ordre de les condicions:** Posa les condicions més específiques primer
    2. **Cas per defecte:** Usa sempre SINO per gestionar casos no previstos
    3. **Condicions excloents:** Assegura't que les condicions no es solapin
    4. **Llegibilitat:** Si tens més de 5-6 condicions, considera altres estructures

### ❌ Malament: Condicions que es solapen

```pseudocode
SI nota ≥ 5.0 LLAVORS          // 7 compleix aquesta
    ESCRIURE "APROVAT"
SINO_SI nota ≥ 7.0 LLAVORS     // Mai s'executa!
    ESCRIURE "NOTABLE"
FI_SI
```

### ✅ Bé: Condicions progressives

```pseudocode
SI nota ≥ 9.0 LLAVORS
    ESCRIURE "EXCEL·LENT"
SINO_SI nota ≥ 7.0 LLAVORS
    ESCRIURE "NOTABLE"
SINO_SI nota ≥ 5.0 LLAVORS
    ESCRIURE "APROVAT"
SINO
    ESCRIURE "SUSPÈS"
FI_SI
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Què mostra?

```pseudocode
numero ← 75

SI numero < 50 LLAVORS
    ESCRIURE "A"
SINO_SI numero < 75 LLAVORS
    ESCRIURE "B"
SINO_SI numero ≤ 100 LLAVORS
    ESCRIURE "C"
SINO
    ESCRIURE "D"
FI_SI
```

??? success "Resposta"
    **C**
    
    - 75 < 50? NO
    - 75 < 75? NO
    - 75 ≤ 100? SÍ → Mostra "C"

---

### 🎯 Activitat 2: Troba l'error

```pseudocode
ALGORISME DiaDeLaSetmana
VARIABLES
    dia: ENTER
    
INICI
    ESCRIURE "Dia (1-7):"
    LLEGIR dia
    
    SI dia = 1 LLAVORS
        ESCRIURE "Dilluns"
    SINO_SI dia = 2 LLAVORS
        ESCRIURE "Dimarts"
    SINO_SI dia = 3 LLAVORS
        ESCRIURE "Dimecres"
    // ... falten dies ...
    FI_SI
FI
```

Què passa si l'usuari introdueix 8?

??? success "Resposta"
    No mostra res! Falta un `SINO` per gestionar valors invàlids:
    
    ```pseudocode
    SINO
        ESCRIURE "Dia no vàlid (1-7)"
    FI_SI
    ```

---

### 🎯 Activitat 3: Completa el codi

Completa aquest programa per classificar una temperatura de l'aigua:

```pseudocode
ALGORISME EstatAigua
VARIABLES
    temp: REAL
    
INICI
    LLEGIR temp
    
    SI _______________ LLAVORS
        ESCRIURE "SÒLID (Gel)"
    SINO_SI _______________ LLAVORS
        ESCRIURE "LÍQUID"
    SINO
        ESCRIURE "GAS (Vapor)"
    FI_SI
FI
```

Intervals: <0 sòlid, 0-100 líquid, >100 gas

??? success "Solució"
    ```pseudocode
    SI temp < 0.0 LLAVORS
        ESCRIURE "SÒLID (Gel)"
    SINO_SI temp ≤ 100.0 LLAVORS
        ESCRIURE "LÍQUID"
    SINO
        ESCRIURE "GAS (Vapor)"
    FI_SI
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Dia de la setmana

Programa que llegeixi un número (1-7) i mostri el dia corresponent.

??? success "Solució"
    ```pseudocode
    ALGORISME DiaDeLaSetmana
    VARIABLES
        dia: ENTER
        
    INICI
        ESCRIURE "Dia (1-7):"
        LLEGIR dia
        
        SI dia = 1 LLAVORS
            ESCRIURE "Dilluns"
        SINO_SI dia = 2 LLAVORS
            ESCRIURE "Dimarts"
        SINO_SI dia = 3 LLAVORS
            ESCRIURE "Dimecres"
        SINO_SI dia = 4 LLAVORS
            ESCRIURE "Dijous"
        SINO_SI dia = 5 LLAVORS
            ESCRIURE "Divendres"
        SINO_SI dia = 6 LLAVORS
            ESCRIURE "Dissabte"
        SINO_SI dia = 7 LLAVORS
            ESCRIURE "Diumenge"
        SINO
            ESCRIURE "Dia no vàlid"
        FI_SI
    FI
    ```

---

### Exercici 2: Mes de l'any

Llegeix un número (1-12) i mostra el mes i quants dies té.

??? success "Solució"
    ```pseudocode
    ALGORISME MesDelAny
    VARIABLES
        mes: ENTER
        
    INICI
        ESCRIURE "Mes (1-12):"
        LLEGIR mes
        
        SI mes = 1 LLAVORS
            ESCRIURE "Gener - 31 dies"
        SINO_SI mes = 2 LLAVORS
            ESCRIURE "Febrer - 28/29 dies"
        SINO_SI mes = 3 LLAVORS
            ESCRIURE "Març - 31 dies"
        SINO_SI mes = 4 LLAVORS
            ESCRIURE "Abril - 30 dies"
        SINO_SI mes = 5 LLAVORS
            ESCRIURE "Maig - 31 dies"
        SINO_SI mes = 6 LLAVORS
            ESCRIURE "Juny - 30 dies"
        SINO_SI mes = 7 LLAVORS
            ESCRIURE "Juliol - 31 dies"
        SINO_SI mes = 8 LLAVORS
            ESCRIURE "Agost - 31 dies"
        SINO_SI mes = 9 LLAVORS
            ESCRIURE "Setembre - 30 dies"
        SINO_SI mes = 10 LLAVORS
            ESCRIURE "Octubre - 31 dies"
        SINO_SI mes = 11 LLAVORS
            ESCRIURE "Novembre - 30 dies"
        SINO_SI mes = 12 LLAVORS
            ESCRIURE "Desembre - 31 dies"
        SINO
            ESCRIURE "Mes no vàlid"
        FI_SI
    FI
    ```

---

### Exercici 3: Qualificació amb lletres

Converteix nota numèrica (0-100) a lletra:
- 90-100: A
- 80-89: B
- 70-79: C
- 60-69: D
- 0-59: F

??? success "Solució"
    ```pseudocode
    ALGORISME NotaALletra
    VARIABLES
        nota: ENTER
        
    INICI
        ESCRIURE "Nota (0-100):"
        LLEGIR nota
        
        SI nota ≥ 90 LLAVORS
            ESCRIURE "Qualificació: A"
        SINO_SI nota ≥ 80 LLAVORS
            ESCRIURE "Qualificació: B"
        SINO_SI nota ≥ 70 LLAVORS
            ESCRIURE "Qualificació: C"
        SINO_SI nota ≥ 60 LLAVORS
            ESCRIURE "Qualificació: D"
        SINO_SI nota ≥ 0 LLAVORS
            ESCRIURE "Qualificació: F"
        SINO
            ESCRIURE "Nota no vàlida"
        FI_SI
    FI
    ```

---

### Exercici 4: Conversió de notes

Programa que converteixi notes entre sistemes:
- 1: Espanyol a lletres (0-10 → SUSPÈS/APROVAT/etc.)
- 2: Americà a espanyol (A-F → 0-10)

??? success "Solució"
    ```pseudocode
    ALGORISME ConversioNotes
    VARIABLES
        opcio: ENTER
        nota: REAL
        lletra: CARÀCTER
        
    INICI
        ESCRIURE "1. Espanyol a lletres"
        ESCRIURE "2. Americà a espanyol"
        ESCRIURE "Tria opció:"
        LLEGIR opcio
        
        SI opcio = 1 LLAVORS
            ESCRIURE "Nota (0-10):"
            LLEGIR nota
            
            SI nota < 5.0 LLAVORS
                ESCRIURE "SUSPÈS"
            SINO_SI nota < 7.0 LLAVORS
                ESCRIURE "APROVAT"
            SINO_SI nota < 9.0 LLAVORS
                ESCRIURE "NOTABLE"
            SINO
                ESCRIURE "EXCEL·LENT"
            FI_SI
            
        SINO_SI opcio = 2 LLAVORS
            ESCRIURE "Lletra (A, B, C, D, F):"
            LLEGIR lletra
            
            SI lletra = 'A' LLAVORS
                ESCRIURE "Nota: 9-10"
            SINO_SI lletra = 'B' LLAVORS
                ESCRIURE "Nota: 7-8"
            SINO_SI lletra = 'C' LLAVORS
                ESCRIURE "Nota: 5-6"
            SINO_SI lletra = 'D' LLAVORS
                ESCRIURE "Nota: 4"
            SINO_SI lletra = 'F' LLAVORS
                ESCRIURE "Nota: 0-3"
            SINO
                ESCRIURE "Lletra no vàlida"
            FI_SI
        SINO
            ESCRIURE "Opció no vàlida"
        FI_SI
    FI
    ```

---

## 🏠 Deures

1. **Calculadora científica:** Amplia la calculadora amb: potència (^), arrel quadrada (s), modul (m).

2. **Classificador de triangles:** Per 3 costats, determina si és equilàter, isòsceles o escalè.

3. **Tarifes de taxi:** 
   - 0-5km: 5€
   - 5-10km: 5€ + 1€/km addicional
   - 10-20km: 10€ + 0.80€/km addicional
   - >20km: 18€ + 0.60€/km addicional

4. **Sistema de notes:** Programa complet que permeti triar entre diferents sistemes de qualificació.

5. **Menú d'opcions:** Crea un menú amb almenys 6 opcions diferents (calculadora, conversions, jocs, etc.).

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ `SINO_SI` avalua condicions de forma seqüencial
    - ✅ Només s'executa el primer bloc amb condició certa
    - ✅ És més llegible que alternatives niuades
    - ✅ Sempre usa `SINO` per casos per defecte
    - ✅ Ordena les condicions de més a menys específiques

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Si la primera condició és CERT, què passa amb la resta?
    
    a) També s'avaluen  
    b) No s'avaluen  
    c) S'avaluen si són certes  
    d) Depèn

??? success "Resposta"
    **b) No s'avaluen**  
    Només s'executa el primer bloc cert i es surt

!!! question "Pregunta 2"
    Per què és important l'ordre de les condicions?
    
    a) No és important  
    b) Perquè s'avaluen seqüencialment  
    c) Per estètica  
    d) Per velocitat

??? success "Resposta"
    **b) Perquè s'avaluen seqüencialment**  
    La primera condició certa guanya

!!! question "Pregunta 3"
    Quin avantatge té `SINO_SI` sobre IF niuats?
    
    a) És més ràpid  
    b) És més curt  
    c) És més llegible  
    d) Tots els anteriors

??? success "Resposta"
    **c) És més llegible**  
    Principalment millora la claredat del codi
