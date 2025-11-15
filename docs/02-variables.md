# Classe 2: Variables i Tipus de Dades

# Autoavaluació Bloc 1

## Classe 1: Introducció a la Programació i el Pseudocodi

??? question "Quina NO és una característica de la programació estructurada?"

    - [ ] Ús de seqüències
    - [x] Ús de salts incondicionals (GOTO)
    - [ ] Ús de seleccions
    - [ ] Ús d'iteracions

    > **Explicació:** La programació estructurada evita els salts incondicionals (GOTO) i utilitza només tres estructures de control: seqüència, selecció i iteració.


## Objectius d'aprenentatge
- Entendre el concepte de variable
- Conèixer els tipus de dades bàsics
- Aprendre a declarar variables i constants
- Aplicar les regles de nomenclatura

---

## 1. Què és una variable?

!!! note "Definició"
    Una **variable** és un espai de memòria amb un nom que pot emmagatzemar un valor que pot canviar durant l'execució del programa.

### Analogia 📦
Pensa en una variable com una caixa etiquetada:
- L'**etiqueta** és el nom de la variable
- El **contingut** és el valor que emmagatzema
- El **tipus de caixa** determina què pot contenir (números, text, etc.)

---

## 2. Tipus de Dades Bàsics

### 2.1 Tipus numèrics

=== "ENTER (integer)"
    ```pseudocode
    edat: ENTER          // Pot ser: -3, 0, 15, 2025
    alumnes: ENTER       // Pot ser: 25, 100, 0
    temperatura: ENTER   // Pot ser: -5, 0, 30
    ```
    
    !!! info
        Emmagatzema números **sense decimals**, positius o negatius.

=== "REAL (float)"
    ```pseudocode
    preu: REAL           // Pot ser: 19.99, 0.5, -3.14
    nota: REAL           // Pot ser: 7.5, 10.0, 4.25
    pes: REAL            // Pot ser: 65.8, 70.0
    ```
    
    !!! info
        Emmagatzema números **amb decimals**.

### 2.2 Tipus de text

=== "CARÀCTER (char)"
    ```pseudocode
    inicial: CARÀCTER    // Pot ser: 'A', 'z', '5', '@'
    lletra: CARÀCTER     // Un sol caràcter entre cometes simples
    ```

=== "TEXT / CADENA (string)"
    ```pseudocode
    nom: TEXT            // Pot ser: "Maria", "Joan Garcia"
    ciutat: TEXT         // Pot ser: "Barcelona", "València"
    missatge: TEXT       // Qualsevol text entre cometes dobles
    ```

### 2.3 Tipus lògic

```pseudocode
esAdult: BOOLEÀ         // Pot ser: CERT o FALS
aprouat: BOOLEÀ         // Pot ser: CERT o FALS
plou: BOOLEÀ           // Pot ser: CERT o FALS
```

!!! info "Tipus BOOLEÀ"
    Només pot tenir dos valors: **CERT** (true) o **FALS** (false)

---

## 3. Declaració de Variables

### Sintaxi

```pseudocode
ALGORISME Exemple
VARIABLES
    nomVariable: TIPUS
    altraVariable: TIPUS
    
INICI
    // Cos del programa
FI
```

### Exemple complet

```pseudocode
ALGORISME DadesPersonals
VARIABLES
    nom: TEXT
    cognom: TEXT
    edat: ENTER
    alçada: REAL
    esEstudiant: BOOLEÀ
    
INICI
    nom ← "Anna"
    cognom ← "Martínez"
    edat ← 16
    alçada ← 1.65
    esEstudiant ← CERT
    
    ESCRIURE "Nom complet:", nom, cognom
    ESCRIURE "Edat:", edat, "anys"
    ESCRIURE "Alçada:", alçada, "metres"
FI
```

---

## 4. Constants

!!! tip "Diferència entre variable i constant"
    - **Variable**: el seu valor **pot canviar** durant l'execució
    - **Constant**: el seu valor **NO canvia mai**

```pseudocode
ALGORISME CalculCircle
CONSTANTS
    PI = 3.14159
    
VARIABLES
    radi: REAL
    area: REAL
    
INICI
    radi ← 5.0
    area ← PI * radi * radi
    ESCRIURE "L'àrea és:", area
FI
```

---

## 5. Regles de Nomenclatura

!!! warning "Normes per nomenar variables"
    ✅ **Permès:**
    
    - Començar amb lletra: `nom`, `edat`, `preu`
    - Utilitzar lletres, números i guió baix: `nom1`, `preu_total`
    - Camel Case: `nomComplet`, `preuTotal`
    - Snake Case: `nom_complet`, `preu_total`
    
    ❌ **NO permès:**
    
    - Començar amb número: `1nom`, `2edat`
    - Utilitzar espais: `nom complet`
    - Utilitzar símbols especials: `preu$`, `nom@`
    - Utilitzar paraules reservades: `INICI`, `SI`, `FI`

### Bones pràctiques

=== "❌ Malament"
    ```pseudocode
    VARIABLES
        x: ENTER
        y: TEXT
        z: REAL
        a: BOOLEÀ
    ```
    
    **Problema:** Noms poc descriptius

=== "✅ Bé"
    ```pseudocode
    VARIABLES
        edat: ENTER
        nomComplet: TEXT
        preuAmbIVA: REAL
        esActiu: BOOLEÀ
    ```
    
    **Millora:** Noms descriptius i clars

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Identifica els tipus

Per a cada valor, indica quin tipus de dada és:

1. `42` → ?
2. `"Hola"` → ?
3. `CERT` → ?
4. `3.14` → ?
5. `'A'` → ?
6. `-15` → ?
7. `FALS` → ?
8. `"123"` → ?

??? success "Solució"
    1. `42` → ENTER
    2. `"Hola"` → TEXT
    3. `CERT` → BOOLEÀ
    4. `3.14` → REAL
    5. `'A'` → CARÀCTER
    6. `-15` → ENTER
    7. `FALS` → BOOLEÀ
    8. `"123"` → TEXT (és text, no número!)

---

### 🎯 Activitat 2: Declara les variables

Escriu les declaracions per emmagatzemar la següent informació:

- El títol d'un llibre
- El número de pàgines
- El preu
- Si està disponible

??? success "Solució"
    ```pseudocode
    VARIABLES
        titol: TEXT
        numeroPagines: ENTER
        preu: REAL
        estaDisponible: BOOLEÀ
    ```

---

### 🎯 Activitat 3: Troba els errors

Identifica els errors en aquests noms de variables:

```pseudocode
VARIABLES
    3alumnes: ENTER        // Error?
    nom complert: TEXT     // Error?
    preu$: REAL           // Error?
    INICI: ENTER          // Error?
    nota_final: REAL      // Error?
```

??? success "Solució"
    ```pseudocode
    VARIABLES
        3alumnes: ENTER        // ❌ No pot començar amb número
        nom complert: TEXT     // ❌ No pot tenir espais
        preu$: REAL           // ❌ No pot tenir símbols especials
        INICI: ENTER          // ❌ Paraula reservada
        nota_final: REAL      // ✅ Correcte!
    ```

---

### 🎯 Activitat 4: Programa complet

Crea un programa que declari variables per a un producte de botiga:

```pseudocode
ALGORISME Producte
VARIABLES
    // Completa les declaracions
    
INICI
    nom ← "Portàtil"
    preu ← 799.99
    quantitat ← 5
    enOferta ← CERT
    categoria ← "Informàtica"
    
    ESCRIURE "Producte:", nom
    ESCRIURE "Preu:", preu, "€"
    ESCRIURE "Stock:", quantitat, "unitats"
    ESCRIURE "En oferta:", enOferta
FI
```

??? success "Solució"
    ```pseudocode
    ALGORISME Producte
    VARIABLES
        nom: TEXT
        preu: REAL
        quantitat: ENTER
        enOferta: BOOLEÀ
        categoria: TEXT
        
    INICI
        nom ← "Portàtil"
        preu ← 799.99
        quantitat ← 5
        enOferta ← CERT
        categoria ← "Informàtica"
        
        ESCRIURE "Producte:", nom
        ESCRIURE "Preu:", preu, "€"
        ESCRIURE "Stock:", quantitat, "unitats"
        ESCRIURE "En oferta:", enOferta
    FI
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Fitxa d'estudiant

Crea un programa que declari i assigni valors per:
- Nom de l'estudiant
- Curs
- Edat
- Nota mitjana
- Si ha aprovat

Mostra tota la informació amb `ESCRIURE`.

### Exercici 2: Caracterís tiques d'un cotxe

Declara variables per:
- Marca i model
- Any de fabricació
- Preu
- Quilòmetres
- Si està en venda

Assigna valors inventats i mostra-los.

### Exercici 3: Dades meteorològiques

Crea variables per:
- Ciutat
- Temperatura (en graus Celsius)
- Humitat (en percentatge)
- Si plou o no

---

## 🏠 Deures

1. **Investigació:** Busca 5 exemples de constants en la vida real (ex: velocitat de la llum, dies de la setmana, etc.)

2. **Programa:** Crea un algorisme per descriure la teva pel·lícula favorita amb almenys 6 variables de diferents tipus.

3. **Anàlisi:** Explica per què aquests noms són bons o dolents:
   - `x1`
   - `preuTotalAmbIVA`
   - `n`
   - `edat_alumne`
   - `FOR`

---

## 📝 Resum

!!! summary "Conceptes clau"
    - ✅ Les variables emmagatzemen dades que poden canviar
    - ✅ Els tipus bàsics són: ENTER, REAL, TEXT, CARÀCTER, BOOLEÀ
    - ✅ Les constants tenen valors fixos
    - ✅ Els noms de variables han de ser descriptius i seguir les normes

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin tipus de dada utilitzaries per emmagatzemar l'edat d'una persona?
    
    a) TEXT  
    b) ENTER  
    c) REAL  
    d) BOOLEÀ

??? success "Resposta"
    **b) ENTER**  
    L'edat és un número sense decimals.

!!! question "Pregunta 2"
    Quin d'aquests noms de variable és incorrecte?
    
    a) `nomAlumne`  
    b) `2reprovats`  
    c) `nota_final`  
    d) `esAprouat`

??? success "Resposta"
    **b) `2reprovats`**  
    No pot començar amb un número.

!!! question "Pregunta 3"
    Quina és la diferència entre una variable i una constant?
    
    a) Cap diferència  
    b) La constant té un nom més curt  
    c) La variable pot canviar de valor, la constant no  
    d) La constant només pot ser numèrica

??? success "Resposta"
    **c) La variable pot canviar de valor, la constant no**
