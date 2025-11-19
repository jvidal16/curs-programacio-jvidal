# Pràctica: Sistema de Recomanació amb Similaritat Cosinus

## Introducció

!!! info "Objectius de la pràctica"
    En aquesta pràctica aprendràs a:
    
    - Treballar amb vectors i matrius utilitzant arrays
    - Implementar operacions matemàtiques bàsiques
    - Calcular la similaritat entre vectors
    - Construir un sistema de recomanació de pel·lícules
    
    **Durada estimada:** 4-6 hores

!!! note "Estructura del projecte"
```
    similaritat_cosinus/
    ├── bin/
    │   └── main.dart
    ├── lib/
    │   └── similaritat_cosinus.dart  ← Aquí escriuràs el codi
    ├── test/
    │   └── similaritat_cosinus_test.dart
    └── pubspec.yaml
```

!!! warning "Abans de començar"
    Assegura't de tenir instal·lat:
    
    - Dart SDK (versió 3.0 o superior)
    - Un editor de codi (VS Code, IntelliJ, etc.)
    
    Crea el projecte executant:
```bash
    dart create -t console similaritat_cosinus
    cd similaritat_cosinus
```

---

## Fase 1: Operacions bàsiques amb vectors

### Exercici 1.1: Calcular la norma d'un vector

!!! example "Enunciat"
    La **norma** (o magnitud) d'un vector és la seva "longitud". Es calcula amb la fórmula:
    
    $$\|v\| = \sqrt{v_1^2 + v_2^2 + ... + v_n^2}$$
    
    **Exemple visual:**
    
    Per al vector `[3.0, 4.0]`:
    
    - Elevar al quadrat cada element: `3² = 9`, `4² = 16`
    - Sumar els quadrats: `9 + 16 = 25`
    - Arrel quadrada: `√25 = 5.0`
    
    **Tasca:** Implementa la funció `calcularNorma` que rep un vector (List<double>) i retorna la seva norma.

**Codi a implementar:**
```dart
import 'dart:math';

/// Calcula la norma (magnitud) d'un vector
/// 
/// Exemple:
/// calcularNorma([3.0, 4.0]) retorna 5.0
/// perquè √(3² + 4²) = √(9 + 16) = √25 = 5
double calcularNorma(List<double> vector) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  // 1. Crea una variable per acumular la suma dels quadrats
  // 2. Recorre el vector i suma el quadrat de cada element
  // 3. Retorna l'arrel quadrada de la suma (usa sqrt() del paquet dart:math)
  
  // Exemple de codi:
  // double sumaQuadrats = 0.0;
  // for (int i = 0; i < vector.length; i++) {
  //   sumaQuadrats += vector[i] * vector[i];
  // }
  // return sqrt(sumaQuadrats);
}
```

!!! tip "Consells"
    - Per elevar al quadrat: `valor * valor`
    - Per fer l'arrel quadrada: `sqrt(suma)` (necessites `import 'dart:math';`)
    - Recorda iterar per tots els elements del vector amb un bucle `for`
    - Pots usar `vector.length` per saber quants elements té el vector

!!! warning "Casos especials"
    - Si el vector està buit, la norma ha de ser 0.0
    - Si tots els elements són 0, la norma també ha de ser 0.0

??? success "Exemples de prova"
```dart
    calcularNorma([1.0, 0.0, 0.0])  // Retorna: 1.0
    calcularNorma([3.0, 4.0])        // Retorna: 5.0
    calcularNorma([0.0, 0.0, 0.0])  // Retorna: 0.0
    calcularNorma([])                // Retorna: 0.0
    calcularNorma([-3.0, -4.0])     // Retorna: 5.0 (la norma és sempre positiva)
```

??? example "Solució completa"
```dart
    double calcularNorma(List<double> vector) {
      double sumaQuadrats = 0.0;
      for (int i = 0; i < vector.length; i++) {
        sumaQuadrats += vector[i] * vector[i];
      }
      return sqrt(sumaQuadrats);
    }
```

---

### Exercici 1.2: Calcular el producte escalar

!!! example "Enunciat"
    El **producte escalar** (o dot product) entre dos vectors es calcula multiplicant els elements corresponents i sumant els resultats:
    
    $$A \cdot B = a_1 \times b_1 + a_2 \times b_2 + ... + a_n \times b_n$$
    
    **Exemple visual:**
    
    Per als vectors `[1.0, 2.0, 3.0]` i `[4.0, 5.0, 6.0]`:
```
    1.0 × 4.0 = 4.0
    2.0 × 5.0 = 10.0
    3.0 × 6.0 = 18.0
    ─────────────────
    Suma = 32.0
```
    
    **Tasca:** Implementa la funció `calcularProducteEscalar` que rep dos vectors i retorna el seu producte escalar.

**Codi a implementar:**
```dart
/// Calcula el producte escalar entre dos vectors
/// 
/// Exemple:
/// vectorA = [1.0, 2.0, 3.0]
/// vectorB = [4.0, 5.0, 6.0]
/// Resultat: 1×4 + 2×5 + 3×6 = 4 + 10 + 18 = 32.0
double calcularProducteEscalar(List<double> vectorA, List<double> vectorB) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  // 1. Primer comprova que els vectors tenen la mateixa longitud
  //    Si no, llença una excepció: throw ArgumentError("missatge");
  // 2. Crea una variable per acumular el resultat
  // 3. Recorre ambdós vectors simultàniament
  // 4. Multiplica els elements corresponents i suma'ls al resultat
  
  // Exemple de codi:
  // if (vectorA.length != vectorB.length) {
  //   throw ArgumentError("Els vectors han de tenir la mateixa longitud");
  // }
  // 
  // double resultat = 0.0;
  // for (int i = 0; i < vectorA.length; i++) {
  //   resultat += vectorA[i] * vectorB[i];
  // }
  // return resultat;
}
```

!!! tip "Consells"
    - Pots usar `vectorA.length` per obtenir la longitud
    - Per accedir a l'element `i` dels dos vectors: `vectorA[i]` i `vectorB[i]`
    - Si les longituds són diferents, has de llançar un error
    - Un bucle `for` és perfecte per recórrer ambdós vectors alhora

!!! warning "Validació important"
```dart
    if (vectorA.length != vectorB.length) {
      throw ArgumentError("Els vectors han de tenir la mateixa longitud");
    }
```
    Aquesta comprovació és essencial per evitar errors en temps d'execució!

??? success "Exemples de prova"
```dart
    calcularProducteEscalar([1.0, 2.0, 3.0], [4.0, 5.0, 6.0])  // Retorna: 32.0
    calcularProducteEscalar([1.0, 0.0], [0.0, 1.0])            // Retorna: 0.0
    calcularProducteEscalar([2.0, 3.0], [5.0, 7.0])            // Retorna: 31.0 (2×5 + 3×7)
    calcularProducteEscalar([1.0, 2.0], [1.0, 2.0, 3.0])       // Llença ArgumentError
```

??? example "Solució completa"
```dart
    double calcularProducteEscalar(List<double> vectorA, List<double> vectorB) {
      if (vectorA.length != vectorB.length) {
        throw ArgumentError("Els vectors han de tenir la mateixa longitud");
      }
      
      double resultat = 0.0;
      for (int i = 0; i < vectorA.length; i++) {
        resultat += vectorA[i] * vectorB[i];
      }
      return resultat;
    }
```

---

### Exercici 1.3: Calcular la similaritat cosinus

!!! example "Enunciat"
    La **similaritat cosinus** mesura l'angle entre dos vectors i indica com de similars són. El seu valor està entre -1 i 1:
    
    - **1.0**: Vectors idèntics o proporcionals (molt similars)
    - **0.0**: Vectors ortogonals (sense relació)
    - **-1.0**: Vectors oposats (totalment diferents)
    
    Fórmula:
    
    $$\text{similaritat} = \frac{A \cdot B}{\|A\| \times \|B\|}$$
    
    **Exemple visual:**
```
    vectorA = [1, 2, 3]
    vectorB = [1, 2, 3]  (idèntics)
    
    producteEscalar = 1×1 + 2×2 + 3×3 = 14
    normaA = √(1² + 2² + 3²) = √14 ≈ 3.742
    normaB = √(1² + 2² + 3²) = √14 ≈ 3.742
    
    similaritat = 14 / (3.742 × 3.742) = 1.0 ✓
```
    
    **Tasca:** Implementa la funció `calcularSimilaritatCosinus` utilitzant les funcions anteriors.

**Codi a implementar:**
```dart
/// Calcula la similaritat cosinus entre dos vectors
/// 
/// Exemple:
/// vectorA = [1.0, 2.0, 3.0]
/// vectorB = [1.0, 2.0, 3.0]
/// Són idèntics, per tant retorna 1.0
double calcularSimilaritatCosinus(List<double> vectorA, List<double> vectorB) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  // 1. Comprova que els vectors tenen la mateixa longitud
  // 2. Calcula la norma de vectorA (usa la funció que has creat abans)
  // 3. Calcula la norma de vectorB
  // 4. Si alguna norma és 0, retorna 0.0 (per evitar divisió per zero)
  // 5. Calcula el producte escalar entre vectorA i vectorB
  // 6. Retorna: producteEscalar / (normaA * normaB)
  
  // Exemple de codi:
  // if (vectorA.length != vectorB.length) {
  //   throw ArgumentError("Els vectors han de tenir la mateixa longitud");
  // }
  // 
  // double normaA = calcularNorma(vectorA);
  // double normaB = calcularNorma(vectorB);
  // 
  // if (normaA == 0 || normaB == 0) {
  //   return 0.0;
  // }
  // 
  // double producteEscalar = calcularProducteEscalar(vectorA, vectorB);
  // return producteEscalar / (normaA * normaB);
}
```

!!! tip "Reutilitza el teu codi"
    Pots (i has de) utilitzar les funcions `calcularNorma` i `calcularProducteEscalar` que ja has implementat!
    
    Això és un exemple de **composició de funcions**: construir funcions complexes a partir de funcions simples.

!!! warning "Evita la divisió per zero"
    Si qualsevol dels dos vectors té norma 0, la funció ha de retornar 0.0 sense fer la divisió.
```dart
    if (normaA == 0 || normaB == 0) {
      return 0.0;
    }
```

??? success "Exemples de prova"
```dart
    // Vectors idèntics → similaritat = 1.0
    calcularSimilaritatCosinus([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])  // Retorna: 1.0
    
    // Vectors proporcionals → similaritat = 1.0
    calcularSimilaritatCosinus([1.0, 2.0], [2.0, 4.0])            // Retorna: 1.0
    
    // Vectors ortogonals (perpendiculars) → similaritat = 0.0
    calcularSimilaritatCosinus([1.0, 0.0], [0.0, 1.0])            // Retorna: 0.0
    
    // Vectors oposats → similaritat = -1.0
    calcularSimilaritatCosinus([1.0, 0.0], [-1.0, 0.0])           // Retorna: -1.0
    
    // Vector zero
    calcularSimilaritatCosinus([0.0, 0.0], [1.0, 2.0])            // Retorna: 0.0
```

??? example "Solució completa"
```dart
    double calcularSimilaritatCosinus(List<double> vectorA, List<double> vectorB) {
      if (vectorA.length != vectorB.length) {
        throw ArgumentError("Els vectors han de tenir la mateixa longitud");
      }
      
      double normaA = calcularNorma(vectorA);
      double normaB = calcularNorma(vectorB);
      
      if (normaA == 0 || normaB == 0) {
        return 0.0;
      }
      
      double producteEscalar = calcularProducteEscalar(vectorA, vectorB);
      return producteEscalar / (normaA * normaB);
    }
```

!!! info "Comprova el teu progrés"
    Executa els tests per validar les teves funcions:
```bash
    dart test test/similaritat_cosinus_test.dart
```
    
    Si tots els tests de la Fase 1 passen, estàs llest per continuar! ✅

---

## Fase 2: Operacions amb matrius

!!! info "Què és una matriu?"
    Una matriu és un array bidimensional (un array d'arrays). Cada element s'accedeix amb dos índexs: fila i columna.
```dart
    List<List<double>> matriu = [
      [1.0, 2.0, 3.0],  // Fila 0
      [4.0, 5.0, 6.0],  // Fila 1
      [7.0, 8.0, 9.0],  // Fila 2
    ];
    
    // Accedir a l'element de la fila 1, columna 2
    double valor = matriu[1][2];  // 6.0
```

### Exercici 2.1: Transposar una matriu

!!! example "Enunciat"
    **Transposar** una matriu significa canviar les files per columnes. Per exemple:
```
    Matriu original (2 files × 3 columnes):
    [1, 2, 3]
    [4, 5, 6]
    
    Matriu transposada (3 files × 2 columnes):
    [1, 4]
    [2, 5]
    [3, 6]
```
    
    **Per què és important?**
    
    En el nostre sistema de recomanació, tenim una matriu on:
    
    - Files = Pel·lícules
    - Columnes = Usuaris
    
    Però per calcular similaritats entre usuaris, necessitem que:
    
    - Files = Usuaris
    - Columnes = Pel·lícules
    
    La transposició fa exactament això!
    
    **Tasca:** Implementa la funció `transposarMatriu` que rep una matriu i retorna la seva transposada.

**Codi a implementar:**
```dart
/// Transposa una matriu (canvia files per columnes)
/// 
/// Exemple:
/// Entrada:  [[1, 2, 3], [4, 5, 6]]
/// Sortida:  [[1, 4], [2, 5], [3, 6]]
List<List<double>> transposarMatriu(List<List<double>> matriu) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  // 1. Si la matriu està buida, retorna una matriu buida []
  // 2. Obtén el nombre de files: matriu.length
  // 3. Obtén el nombre de columnes: matriu[0].length
  // 4. Crea una nova matriu buida per la transposada
  // 5. Per cada columna j de 0 a numColumnes:
  //    a. Crea una nova fila buida
  //    b. Per cada fila i de 0 a numFiles:
  //       - Afegeix matriu[i][j] a la nova fila
  //    c. Afegeix la nova fila a la matriu transposada
  
  // Exemple de codi:
  // if (matriu.isEmpty) {
  //   return [];
  // }
  // 
  // int numFiles = matriu.length;
  // int numColumnes = matriu[0].length;
  // 
  // List<List<double>> transposada = [];
  // 
  // for (int j = 0; j < numColumnes; j++) {
  //   List<double> novaFila = [];
  //   for (int i = 0; i < numFiles; i++) {
  //     novaFila.add(matriu[i][j]);
  //   }
  //   transposada.add(novaFila);
  // }
  // 
  // return transposada;
}
```

!!! tip "Consells per treballar amb matrius"
```dart
    // Crear una matriu buida
    List<List<double>> matriu = [];
    
    // Crear una fila buida
    List<double> novaFila = [];
    
    // Afegir un element a una fila
    novaFila.add(5.0);
    
    // Afegir una fila a la matriu
    matriu.add(novaFila);
    
    // Accedir a l'element de la fila i, columna j
    double valor = matriu[i][j];
    
    // Modificar un element
    matriu[i][j] = 10.0;
```

!!! warning "Bucles imbricats"
    Aquesta funció necessita dos bucles `for` imbricats (un dins de l'altre):
    
    - El bucle extern recorre les **columnes** de la matriu original
    - El bucle intern recorre les **files** de la matriu original

??? success "Exemple visual pas a pas"
```dart
    // Matriu original (2 files × 3 columnes)
    [[1.0, 2.0, 3.0],
     [4.0, 5.0, 6.0]]
    
    // Procés de transposició:
    
    // Columna 0 de l'original → Fila 0 de la transposada
    j=0: Agafar matriu[0][0]=1.0 i matriu[1][0]=4.0 → [1.0, 4.0]
    
    // Columna 1 de l'original → Fila 1 de la transposada
    j=1: Agafar matriu[0][1]=2.0 i matriu[1][1]=5.0 → [2.0, 5.0]
    
    // Columna 2 de l'original → Fila 2 de la transposada
    j=2: Agafar matriu[0][2]=3.0 i matriu[1][2]=6.0 → [3.0, 6.0]
    
    // Matriu transposada (3 files × 2 columnes)
    [[1.0, 4.0],
     [2.0, 5.0],
     [3.0, 6.0]]
```

??? example "Solució completa"
```dart
    List<List<double>> transposarMatriu(List<List<double>> matriu) {
      if (matriu.isEmpty) {
        return [];
      }
      
      int numFiles = matriu.length;
      int numColumnes = matriu[0].length;
      
      List<List<double>> transposada = [];
      
      for (int j = 0; j < numColumnes; j++) {
        List<double> novaFila = [];
        for (int i = 0; i < numFiles; i++) {
          novaFila.add(matriu[i][j]);
        }
        transposada.add(novaFila);
      }
      
      return transposada;
    }
```

---

### Exercici 2.2: Extreure files i columnes

!!! example "Enunciat"
    De vegades necessitem treballar amb una fila o columna específica d'una matriu.
    
    **Exemple:**
```
    Matriu:
    [1, 2, 3]
    [4, 5, 6]
    [7, 8, 9]
    
    Fila 1: [4, 5, 6]
    Columna 1: [2, 5, 8]
```
    
    **Tasca 1:** Implementa `obtenirFila` que extreu una fila completa de la matriu.
    
    **Tasca 2:** Implementa `obtenirColumna` que extreu una columna completa de la matriu.

**Codi a implementar (Part 1):**
```dart
/// Extreu una fila d'una matriu
/// 
/// Exemple:
/// matriu = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
/// obtenirFila(matriu, 1) retorna [4, 5, 6]
List<double> obtenirFila(List<List<double>> matriu, int indiceFila) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  // 1. Comprova que indiceFila està dins del rang (0 a matriu.length-1)
  //    Si no, llença: throw RangeError("Índex de fila fora de rang");
  // 2. Retorna una còpia de la fila: List.from(matriu[indiceFila])
  //    (Usem List.from per crear una còpia, no una referència)
  
  // Exemple de codi:
  // if (indiceFila < 0 || indiceFila >= matriu.length) {
  //   throw RangeError("Índex de fila fora de rang");
  // }
  // return List.from(matriu[indiceFila]);
}
```

**Codi a implementar (Part 2):**
```dart
/// Extreu una columna d'una matriu
/// 
/// Exemple:
/// matriu = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
/// obtenirColumna(matriu, 1) retorna [2, 5, 8]
List<double> obtenirColumna(List<List<double>> matriu, int indiceColumna) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  // 1. Si la matriu està buida, retorna una llista buida []
  // 2. Comprova que indiceColumna està dins del rang (0 a matriu[0].length-1)
  // 3. Crea una llista buida per la columna
  // 4. Per cada fila de la matriu:
  //    - Afegeix l'element matriu[fila][indiceColumna] a la llista
  // 5. Retorna la llista
  
  // Exemple de codi:
  // if (matriu.isEmpty) {
  //   return [];
  // }
  // 
  // if (indiceColumna < 0 || indiceColumna >= matriu[0].length) {
  //   throw RangeError("Índex de columna fora de rang");
  // }
  // 
  // List<double> columna = [];
  // for (int i = 0; i < matriu.length; i++) {
  //   columna.add(matriu[i][indiceColumna]);
  // }
  // return columna;
}
```

!!! warning "Validació dels índexs"
    Recorda comprovar sempre que els índexs estan dins dels límits vàlids!
    
    - Per files: `0 <= indiceFila < matriu.length`
    - Per columnes: `0 <= indiceColumna < matriu[0].length`

!!! tip "Diferència entre fila i columna"
    - **Fila**: És fàcil, ja està guardada com un array dins de la matriu
    - **Columna**: Hem de recórrer totes les files i agafar l'element de la mateixa posició

??? success "Exemples de prova"
```dart
    List<List<double>> matriu = [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
      [7.0, 8.0, 9.0],
    ];
    
    // Obtenir files
    obtenirFila(matriu, 0)      // Retorna: [1.0, 2.0, 3.0]
    obtenirFila(matriu, 1)      // Retorna: [4.0, 5.0, 6.0]
    obtenirFila(matriu, 2)      // Retorna: [7.0, 8.0, 9.0]
    obtenirFila(matriu, 3)      // Llença RangeError
    
    // Obtenir columnes
    obtenirColumna(matriu, 0)   // Retorna: [1.0, 4.0, 7.0]
    obtenirColumna(matriu, 1)   // Retorna: [2.0, 5.0, 8.0]
    obtenirColumna(matriu, 2)   // Retorna: [3.0, 6.0, 9.0]
    obtenirColumna(matriu, 3)   // Llença RangeError
```

??? example "Solucions completes"
```dart
    List<double> obtenirFila(List<List<double>> matriu, int indiceFila) {
      if (indiceFila < 0 || indiceFila >= matriu.length) {
        throw RangeError("Índex de fila fora de rang");
      }
      return List.from(matriu[indiceFila]);
    }
    
    List<double> obtenirColumna(List<List<double>> matriu, int indiceColumna) {
      if (matriu.isEmpty) {
        return [];
      }
      
      if (indiceColumna < 0 || indiceColumna >= matriu[0].length) {
        throw RangeError("Índex de columna fora de rang");
      }
      
      List<double> columna = [];
      for (int i = 0; i < matriu.length; i++) {
        columna.add(matriu[i][indiceColumna]);
      }
      return columna;
    }
```

!!! info "Comprova el teu progrés"
    Executa els tests de la Fase 2:
```bash
    dart test test/similaritat_cosinus_test.dart
```

---

## Fase 3: Sistema de recomanació

### Context del problema

!!! info "Com funciona un sistema de recomanació?"
    Imagina que tens una matriu d'avaluacions de pel·lícules:
    
    |          | Usuari 0 | Usuari 1 | Usuari 2 | Usuari 3 |
    |----------|----------|----------|----------|----------|
    | Movie 0  | 5.0      | 4.0      | 1.0      | 0.0      |
    | Movie 1  | 4.0      | 5.0      | 2.0      | 1.0      |
    | Movie 2  | 1.0      | 1.0      | 5.0      | 4.0      |
    | Movie 3  | 0.0      | 2.0      | 4.0      | 5.0      |
    | Movie 4  | 2.0      | 0.0      | 3.0      | 4.0      |
    
    **Observacions:**
    
    - Usuari 0 i Usuari 1 valoren alt Movies 0 i 1 → **gustos similars**
    - Usuari 2 i Usuari 3 valoren alt Movies 2, 3 i 4 → **gustos similars**
    - 0.0 significa que l'usuari no ha vist la pel·lícula
    
    **Objectiu del sistema:**
    
    1. **Trobar usuaris similars:** Usuari 0 i Usuari 1 tenen gustos similars
    2. **Recomanar pel·lícules:** 
        - Usuari 0 no ha vist Movie 3 (avaluació = 0.0)
        - Usuari 1 (similar) li ha donat 2.0
        - Podem recomanar Movie 3 a Usuari 0 amb puntuació estimada ≈ 2.0

!!! note "Filtratge col·laboratiu"
    Aquest tipus de sistema s'anomena **Collaborative Filtering** (filtratge col·laboratiu):
    
    - No necessita conèixer les característiques de les pel·lícules
    - Es basa només en les avaluacions dels usuaris
    - Funciona amb el principi: "usuaris amb gustos similars valoren pel·lícules similars"

### Exercici 3.1: Trobar usuaris similars

!!! example "Enunciat"
    Aquesta és la funció principal del sistema! Ha de trobar quins usuaris tenen gustos més similars a un usuari donat.
    
    **Algorisme:**
    
    1. Agafar el vector d'avaluacions de l'usuari de referència
    2. Per cada altre usuari:
        - Calcular la similaritat cosinus entre els seus vectors
        - Guardar l'usuari i la similaritat
    3. Ordenar els resultats per similaritat (de major a menor)
    4. Retornar els N usuaris més similars
    
    **Tasca:** Implementa `trobarUsuarisSimilars` que:
    
    - Rep una matriu on cada fila és un usuari
    - Calcula la similaritat d'aquest usuari amb tots els altres
    - Retorna els N usuaris més similars (ordenats de major a menor similaritat)

**Codi a implementar:**
```dart
/// Troba els usuaris més similars a un usuari donat
/// 
/// Paràmetres:
/// - matriuUsuaris: cada fila és un usuari, cada columna una pel·lícula
/// - usuariId: índex de l'usuari de referència
/// - numResultats: nombre d'usuaris similars a retornar
/// 
/// Retorna: array amb [usuariId, similaritat] ordenat per similaritat
/// 
/// Exemple:
/// matriuUsuaris = [
///   [5.0, 4.0, 1.0],  // Usuari 0
///   [4.0, 5.0, 2.0],  // Usuari 1 (similar a 0)
///   [1.0, 1.0, 5.0],  // Usuari 2 (diferent)
/// ]
/// 
/// trobarUsuarisSimilars(matriuUsuaris, 0, 2)
/// Retorna: [[1, 0.98], [2, 0.15]]  (Usuari 1 és molt similar a Usuari 0)
List<List<double>> trobarUsuarisSimilars(
  List<List<double>> matriuUsuaris, 
  int usuariId, 
  int numResultats
) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  
  // PART 1: Validació
  // 1. Comprova que usuariId està dins del rang (0 a matriuUsuaris.length-1)
  //    Si no: throw RangeError("usuariId fora de rang");
  
  // PART 2: Preparació
  // 2. Crea una llista buida per guardar els resultats: List<List<double>> resultats = [];
  // 3. Obtén el vector de l'usuari de referència: 
  //    List<double> usuariReferencia = matriuUsuaris[usuariId];
  
  // PART 3: Calcular similaritats
  // 4. Per cada altre usuari (altreUsuariId de 0 a matriuUsuaris.length-1):
  //    a. Si altreUsuariId == usuariId, salta'l (continue)
  //       (No comparem un usuari amb ell mateix)
  //    b. Obtén el vector de l'altre usuari:
  //       List<double> usuariComparar = matriuUsuaris[altreUsuariId];
  //    c. Calcula la similaritat cosinus:
  //       double similaritat = calcularSimilaritatCosinus(usuariReferencia, usuariComparar);
  //    d. Afegeix el resultat:
  //       resultats.add([altreUsuariId.toDouble(), similaritat]);
  
  // PART 4: Ordenar i retornar
  // 5. Ordena els resultats per similaritat (columna 1) de forma descendent:
  //    resultats.sort((a, b) => b[1].compareTo(a[1]));
  //    (Nota: b[1].compareTo(a[1]) és ordre descendent, no a[1].compareTo(b[1]))
  // 6. Retorna només els primers numResultats elements:
  //    if (resultats.length > numResultats) {
  //      return resultats.sublist(0, numResultats);
  //    }
  //    return resultats;
  
  // Exemple de codi complet a la solució...
}
```

!!! tip "Consells importants"
    - Cada resultat és un array de 2 elements: `[usuariId, similaritat]`
    - Per guardar l'usuariId com a double: `altreUsuariId.toDouble()`
    - Per ordenar en ordre **descendent**: `b[1].compareTo(a[1])` (nota l'ordre de b i a)
    - Per ordenar en ordre **ascendent**: `a[1].compareTo(b[1])`
    - Usa `.sublist(0, numResultats)` per agafar només els primers N elements

!!! warning "No comparis un usuari amb ell mateix"
```dart
    if (altreUsuariId == usuariId) continue;
```
    Això és important perquè un usuari sempre té similaritat 1.0 amb ell mateix!

??? success "Exemple pas a pas"
```dart
    // Matriu d'usuaris (cada fila és un usuari)
    matriuUsuaris = [
      [5.0, 4.0, 1.0, 0.0],  // Usuari 0
      [4.0, 5.0, 2.0, 1.0],  // Usuari 1
      [1.0, 1.0, 5.0, 4.0],  // Usuari 2
      [0.0, 2.0, 4.0, 5.0],  // Usuari 3
    ];
    
    // Trobar usuaris similars a Usuari 0
    usuariReferencia = [5.0, 4.0, 1.0, 0.0]  // Usuari 0
    
    // Comparar amb Usuari 1
    usuariComparar = [4.0, 5.0, 2.0, 1.0]
    similaritat = calcularSimilaritatCosinus([5,4,1,0], [4,5,2,1]) ≈ 0.95
    Afegir: [1.0, 0.95]
    
    // Comparar amb Usuari 2
    usuariComparar = [1.0, 1.0, 5.0, 4.0]
    similaritat = calcularSimilaritatCosinus([5,4,1,0], [1,1,5,4]) ≈ 0.15
    Afegir: [2.0, 0.15]
    
    // Comparar amb Usuari 3
    usuariComparar = [0.0, 2.0, 4.0, 5.0]
    similaritat = calcularSimilaritatCosinus([5,4,1,0], [0,2,4,5]) ≈ 0.34
    Afegir: [3.0, 0.34]
    
    // Resultats abans d'ordenar:
    [[1.0, 0.95], [2.0, 0.15], [3.0, 0.34]]
    
    // Resultats després d'ordenar:
    [[1.0, 0.95], [3.0, 0.34], [2.0, 0.15]]
    
    // Retornar només els 2 primers (numResultats = 2):
    [[1.0, 0.95], [3.0, 0.34]]
```

??? example "Solució completa"
```dart
    List<List<double>> trobarUsuarisSimilars(
      List<List<double>> matriuUsuaris, 
      int usuariId, 
      int numResultats
    ) {
      if (usuariId < 0 || usuariId >= matriuUsuaris.length) {
        throw RangeError("usuariId fora de rang");
      }
      
      List<List<double>> resultats = [];
      List<double> usuariReferencia = matriuUsuaris[usuariId];
      
      for (int altreUsuariId = 0; altreUsuariId < matriuUsuaris.length; altreUsuariId++) {
        if (altreUsuariId == usuariId) continue;
        
        List<double> usuariComparar = matriuUsuaris[altreUsuariId];
        double similaritat = calcularSimilaritatCosinus(usuariReferencia, usuariComparar);
        
        resultats.add([altreUsuariId.toDouble(), similaritat]);
      }
      
      resultats.sort((a, b) => b[1].compareTo(a[1]));
      
      if (resultats.length > numResultats) {
        return resultats.sublist(0, numResultats);
      }
      return resultats;
    }
```

---

### Exercici 3.2: Recomanar pel·lícules

!!! example "Enunciat"
    Ara utilitzarem els usuaris similars per recomanar pel·lícules!
    
    **Lògica del sistema:**
    
    1. Trobar els 5 usuaris més similars a l'usuari donat
    2. Per cada pel·lícula que l'usuari NO ha vist (avaluació = 0):
        - Calcular una puntuació ponderada basada en les avaluacions dels usuaris similars
        - Fórmula: `Puntuació = Σ(avaluació × similaritat) / Σ(similaritat)`
    3. Ordenar les pel·lícules per puntuació estimada
    4. Retornar les N millors recomanacions
    
    **Exemple visual:**
```
    Usuari 0 no ha vist Movie 3 (avaluació = 0.0)
    
    Usuaris similars i les seves avaluacions de Movie 3:
    - Usuari 1 (similaritat 0.95): avaluació = 2.0
    - Usuari 2 (similaritat 0.34): avaluació = 4.0
    - Usuari 3 (similaritat 0.15): avaluació = 5.0
    
    Puntuació estimada:
    = (2.0×0.95 + 4.0×0.34 + 5.0×0.15) / (0.95 + 0.34 + 0.15)
    = (1.9 + 1.36 + 0.75) / 1.44
    = 4.01 / 1.44
    ≈ 2.78
    
    Recomanació: Movie 3 amb puntuació 2.78 ⭐⭐⭐
```
    
    **Tasca:** Implementa `recomanarPellicules`.

**Codi a implementar:**
```dart
/// Recomana pel·lícules a un usuari basant-se en usuaris similars
/// 
/// Paràmetres:
/// - matriuAvaluacions: files són pel·lícules, columnes són usuaris
/// - usuariId: usuari al qual recomanar
/// - numRecomanacions: nombre de pel·lícules a recomanar
/// 
/// Retorna: array amb [pelliId, puntuacioEstimada] ordenat per puntuació
List<List<double>> recomanarPellicules(
  List<List<double>> matriuAvaluacions,
  int usuariId,
  int numRecomanacions
) {
  // TODO: Implementa aquesta funció
  
  // PISTES:
  
  // =====================================================================
  // PART 1: Validacions i preparació
  // =====================================================================
  // 1. Si matriuAvaluacions està buida, retorna []
  // 2. Obtén numPellicules = matriuAvaluacions.length
  // 3. Obtén numUsuaris = matriuAvaluacions[0].length
  // 4. Valida que usuariId està dins del rang (0 a numUsuaris-1)
  //    Si no: throw RangeError("usuariId fora de rang");
  
  // =====================================================================
  // PART 2: Trobar usuaris similars
  // =====================================================================
  // 5. Transposa la matriu per obtenir vectors d'usuaris:
  //    List<List<double>> matriuUsuaris = transposarMatriu(matriuAvaluacions);
  //    
  //    Per què? Perquè matriuAvaluacions té:
  //    - Files = Pel·lícules
  //    - Columnes = Usuaris
  //    
  //    I necessitem que cada fila sigui un usuari per trobar similaritats
  
  // 6. Troba els 5 usuaris més similars:
  //    List<List<double>> usuarisSimilars = trobarUsuarisSimilars(matriuUsuaris, usuariId, 5);
  
  // =====================================================================
  // PART 3: Calcular puntuacions per cada pel·lícula
  // =====================================================================
  // 7. Crea una llista buida per les puntuacions: 
  //    List<List<double>> puntuacionsPellicules = [];
  
  // 8. Per cada pel·lícula (pelliId de 0 a numPellicules-1):
  //    
  //    a. Comprova si l'usuari ja ha valorat aquesta pel·lícula:
  //       if (matriuAvaluacions[pelliId][usuariId] > 0) {
  //         continue;  // Saltar aquesta pel·lícula
  //       }
  //    
  //    b. Inicialitza acumuladors:
  //       double puntuacioTotal = 0.0;
  //       double pesTotal = 0.0;
  //    
  //    c. Per cada usuari similar (i de 0 a usuarisSimilars.length-1):
  //       - Obtén l'ID de l'usuari similar:
  //         int altreUsuariId = usuarisSimilars[i][0].toInt();
  //       - Obtén la similaritat:
  //         double similaritat = usuarisSimilars[i][1];
  //       - Obtén l'avaluació d'aquest usuari per aquesta pel·lícula:
  //         double avaluacio = matriuAvaluacions[pelliId][altreUsuariId];
  //       
  //       - Si l'usuari similar ha valorat la pel·lícula (avaluacio > 0):
  //         * puntuacioTotal += avaluacio * similaritat;
  //         * pesTotal += similaritat;
  //    
  //    d. Si pesTotal > 0 (almenys un usuari similar ha valorat la pel·lícula):
  //       - Calcula la puntuació estimada:
  //         double puntuacioEstimada = puntuacioTotal / pesTotal;
  //       - Afegeix a la llista:
  //         puntuacionsPellicules.add([pelliId.toDouble(), puntuacioEstimada]);
  
  // =====================================================================
  // PART 4: Ordenar i retornar
  // =====================================================================
  // 9. Ordena puntuacionsPellicules per puntuació (columna 1) descendent:
  //    puntuacionsPellicules.sort((a, b) => b[1].compareTo(a[1]));
  
  // 10. Retorna només les primeres numRecomanacions pel·lícules:
  //     if (puntuacionsPellicules.length > numRecomanacions) {
  //       return puntuacionsPellicules.sublist(0, numRecomanacions);
  //     }
  //     return puntuacionsPellicules;
}
```

!!! tip "Consells per aquesta funció"
    - Aquesta és la funció més complexa de la pràctica. Pren-te el teu temps!
    - Implementa-ho pas a pas seguint les pistes
    - Prova amb les dades petites primer
    - Usa `print()` per debugar i veure els valors intermitjos

!!! warning "Només recomana pel·lícules no vistes"
```dart
    if (matriuAvaluacions[pelliId][usuariId] > 0) {
      continue;  // L'usuari ja ha vist aquesta pel·lícula
    }
```

!!! info "Per què funciona la ponderació?"
    La fórmula `Σ(avaluació × similaritat) / Σ(similaritat)` dona més pes a les opinions d'usuaris més similars:
```
    Exemple:
    - Usuari molt similar (0.95) diu 2.0 → contribueix 1.9
    - Usuari poc similar (0.15) diu 5.0 → contribueix 0.75
    
    La opinió de l'usuari similar té més impacte!
```

??? success "Exemple pas a pas complet"
```dart
    // Matriu d'avaluacions (pel·lícules × usuaris)
    matriuAvaluacions = [
      [5.0, 4.0, 1.0, 0.0],  // Movie 0
      [4.0, 5.0, 2.0, 1.0],  // Movie 1
      [1.0, 1.0, 5.0, 4.0],  // Movie 2
      [0.0, 2.0, 4.0, 5.0],  // Movie 3
      [2.0, 0.0, 3.0, 4.0],  // Movie 4
    ];
    
    // Recomanar a Usuari 0
    usuariId = 0
    
    // PART 2: Trobar usuaris similars
    matriuUsuaris = transposarMatriu(matriuAvaluacions)
    // matriuUsuaris = [
    //   [5.0, 4.0, 1.0, 0.0, 2.0],  // Usuari 0
    //   [4.0, 5.0, 1.0, 2.0, 0.0],  // Usuari 1
    //   [1.0, 2.0, 5.0, 4.0, 3.0],  // Usuari 2
    //   [0.0, 1.0, 4.0, 5.0, 4.0],  // Usuari 3
    // ]
    
    usuarisSimilars = trobarUsuarisSimilars(matriuUsuaris, 0, 5)
    // usuarisSimilars = [[1, 0.95], [3, 0.34], [2, 0.15]]
    
    // PART 3: Calcular puntuacions
    
    // Movie 0: Usuari 0 ja l'ha valorat (5.0) → SALTAR
    
    // Movie 1: Usuari 0 ja l'ha valorat (4.0) → SALTAR
    
    // Movie 2: Usuari 0 ja l'ha valorat (1.0) → SALTAR
    
    // Movie 3: Usuari 0 NO l'ha valorat (0.0) → CALCULAR
    pelliId = 3
    puntuacioTotal = 0.0
    pesTotal = 0.0
    
    // Usuari similar 1 (similaritat 0.95):
    avaluacio = matriuAvaluacions[3][1] = 2.0
    puntuacioTotal += 2.0 * 0.95 = 1.9
    pesTotal += 0.95
    
    // Usuari similar 3 (similaritat 0.34):
    avaluacio = matriuAvaluacions[3][3] = 5.0
    puntuacioTotal += 5.0 * 0.34 = 1.7
    pesTotal += 0.34
    
    // Usuari similar 2 (similaritat 0.15):
    avaluacio = matriuAvaluacions[3][2] = 4.0
    puntuacioTotal += 4.0 * 0.15 = 0.6
    pesTotal += 0.15
    
    puntuacioEstimada = (1.9 + 1.7 + 0.6) / (0.95 + 0.34 + 0.15)
                      = 4.2 / 1.44
                      ≈ 2.92
    
    Afegir: [3.0, 2.92]
    
    // Movie 4: Usuari 0 ja l'ha valorat (2.0) → SALTAR
    
    // RESULTAT FINAL:
    puntuacionsPellicules = [[3.0, 2.92]]
    
    // Recomanació: Movie 3 amb puntuació 2.92
```

??? example "Solució completa"
```dart
    List<List<double>> recomanarPellicules(
      List<List<double>> matriuAvaluacions,
      int usuariId,
      int numRecomanacions
    ) {
      if (matriuAvaluacions.isEmpty) {
        return [];
      }
      
      int numPellicules = matriuAvaluacions.length;
      int numUsuaris = matriuAvaluacions[0].length;
      
      if (usuariId < 0 || usuariId >= numUsuaris) {
        throw RangeError("usuariId fora de rang");
      }
      
      List<List<double>> matriuUsuaris = transposarMatriu(matriuAvaluacions);
      List<List<double>> usuarisSimilars = trobarUsuarisSimilars(matriuUsuaris, usuariId, 5);
      
      List<List<double>> puntuacionsPellicules = [];
      
      for (int pelliId = 0; pelliId < numPellicules; pelliId++) {
        if (matriuAvaluacions[pelliId][usuariId] > 0) {
          continue;
        }
        
        double puntuacioTotal = 0.0;
        double pesTotal = 0.0;
        
        for (int i = 0; i < usuarisSimilars.length; i++) {
          int altreUsuariId = usuarisSimilars[i][0].toInt();
          double similaritat = usuarisSimilars[i][1];
          double avaluacio = matriuAvaluacions[pelliId][altreUsuariId];
          
          if (avaluacio > 0) {
            puntuacioTotal += avaluacio * similaritat;
            pesTotal += similaritat;
          }
        }
        
        if (pesTotal > 0) {
          double puntuacioEstimada = puntuacioTotal / pesTotal;
          puntuacionsPellicules.add([pelliId.toDouble(), puntuacioEstimada]);
        }
      }
      
      puntuacionsPellicules.sort((a, b) => b[1].compareTo(a[1]));
      
      if (puntuacionsPellicules.length > numRecomanacions) {
        return puntuacionsPellicules.sublist(0, numRecomanacions);
      }
      return puntuacionsPellicules;
    }
```

!!! success "Felicitats! 🎉"
    Has implementat un sistema de recomanació complet!

---

## Fase 4: Visualització i proves

### Exercici 4.1: Funcions d'utilitat

!!! example "Enunciat"
    Per visualitzar millor els resultats, implementa aquestes funcions d'ajuda que faran l'output més llegible.

**Codi a implementar:**
```dart
/// Mostra els usuaris similars de forma llegible
void mostrarUsuarisSimilars(List<List<double>> resultats, int usuariReferencia) {
  print("🎯 Usuaris més similars a l'usuari $usuariReferencia:");
  print("=" * 50);
  
  for (int i = 0; i < resultats.length; i++) {
    int usuariId = resultats[i][0].toInt();
    double similaritat = resultats[i][1];
    
    // Crea una barra visual (20 caràcters màxim)
    // similaritat està entre 0 i 1, multipliquem per 20 per fer-la visible
    String barra = "█" * (similaritat * 20).round();
    
    print("${i + 1}. Usuari $usuariId - Similaritat: ${similaritat.toStringAsFixed(4)}");
    print("   $barra");
  }
  print("");
}

/// Mostra les recomanacions de pel·lícules
void mostrarRecomanacions(List<List<double>> recomanacions, int usuariId) {
  print("🎬 Recomanacions per a l'usuari $usuariId:");
  print("=" * 50);
  
  for (int i = 0; i < recomanacions.length; i++) {
    int pelliId = recomanacions[i][0].toInt();
    double puntuacio = recomanacions[i][1];
    
    // Crea estrelles segons la puntuació (màxim 5)
    String estrelles = "⭐" * puntuacio.round();
    
    print("${i + 1}. Pel·lícula $pelliId - "
          "Puntuació estimada: ${puntuacio.toStringAsFixed(2)} $estrelles");
  }
  print("");
}

/// Mostra una matriu de forma llegible
void mostrarMatriu(List<List<double>> matriu, String titol) {
  print(titol);
  print("-" * 40);
  for (int i = 0; i < matriu.length; i++) {
    String fila = "Fila $i: [";
    for (int j = 0; j < matriu[i].length; j++) {
      fila += matriu[i][j].toStringAsFixed(1);
      if (j < matriu[i].length - 1) fila += ", ";
    }
    fila += "]";
    print(fila);
  }
  print("");
}
```

!!! tip "Funcions de visualització"
    Aquestes funcions no tenen lògica complexa, només formategen l'output per fer-lo més llegible:
    
    - `"=" * 50` crea una línia de 50 caràcters "="
    - `.toStringAsFixed(4)` mostra un número amb 4 decimals
    - `.round()` arrodoneix un número a l'enter més proper

---

### Exercici 4.2: Funcions de dades

!!! example "Enunciat"
    Implementa funcions per generar dades de prova.

**Codi a implementar:**
```dart
import 'dart:math';

/// Dades petites per desenvolupament i testing
List<List<double>> obtenirDadesPetites() {
  return [
    // User0, User1, User2, User3
    [5.0, 4.0, 1.0, 0.0], // Movie0
    [4.0, 5.0, 2.0, 1.0], // Movie1
    [1.0, 1.0, 5.0, 4.0], // Movie2
    [0.0, 2.0, 4.0, 5.0], // Movie3
    [2.0, 0.0, 3.0, 4.0], // Movie4
  ];
}

/// Dades grans per testing de rendiment
List<List<double>> obtenirDadesGrans() {
  Random rng = Random(42); // Seed fixa per resultats consistents
  List<List<double>> dades = [];
  
  int numUsuaris = 50;
  int numPelLicules = 100;
  
  for (int i = 0; i < numPelLicules; i++) {
    List<double> avaluacions = [];
    for (int j = 0; j < numUsuaris; j++) {
      // 70% de probabilitat de valorar una pel·lícula
      // Si la valora, avaluació entre 0.0 i 5.0
      double avaluacio = rng.nextDouble() < 0.7 ? rng.nextDouble() * 5 : 0.0;
      avaluacions.add(double.parse(avaluacio.toStringAsFixed(1)));
    }
    dades.add(avaluacions);
  }
  
  return dades;
}

/// Valida els càlculs amb casos coneguts
void validarCalculs() {
  print("🔍 VALIDANT ELS CÀLCULS...");
  print("=" * 50);
  
  // Test 1: Vectors idèntics han de tenir similaritat 1.0
  List<double> vector1 = [1.0, 2.0, 3.0];
  List<double> vector2 = [1.0, 2.0, 3.0];
  double sim1 = calcularSimilaritatCosinus(vector1, vector2);
  print("Test 1 - Vectors idèntics: $sim1 (esperat: 1.0) ${sim1 == 1.0 ? '✅' : '❌'}");
  
  // Test 2: Vectors ortogonals han de tenir similaritat 0.0
  List<double> vector3 = [1.0, 0.0];
  List<double> vector4 = [0.0, 1.0];
  double sim2 = calcularSimilaritatCosinus(vector3, vector4);
  print("Test 2 - Vectors ortogonals: $sim2 (esperat: 0.0) ${sim2 == 0.0 ? '✅' : '❌'}");
  
  // Test 3: Vectors oposats han de tenir similaritat -1.0
  List<double> vector5 = [1.0, 0.0];
  List<double> vector6 = [-1.0, 0.0];
  double sim3 = calcularSimilaritatCosinus(vector5, vector6);
  print("Test 3 - Vectors oposats: $sim3 (esperat: -1.0) ${sim3 == -1.0 ? '✅' : '❌'}");
  
  print("");
}
```

---

### Exercici 4.3: Programa principal

!!! example "Enunciat"
    Crea el programa principal (`bin/main.dart`) que provi tot el sistema amb diferents conjunts de dades.

**Codi a implementar:**
```dart
import 'package:similaritat_cosinus/similaritat_cosinus.dart';
import 'dart:math';

void main() {
  print("🎬 PRÀCTICA: SISTEMA DE RECOMANACIÓ AMB SIMILARITAT COSINUS");
  print("=" * 60);
  print("");
  
  // ================================================================
  // Fase 1: Validar els càlculs matemàtics
  // ================================================================
  validarCalculs();
  
  // ================================================================
  // Fase 2: Prova amb dades petites
  // ================================================================
  print("📊 PROVA AMB DADES PETITES");
  print("=" * 40);
  
  List<List<double>> dadesPetites = obtenirDadesPetites();
  List<List<double>> usuarisPetits = transposarMatriu(dadesPetites);
  
  mostrarMatriu(dadesPetites, "Matriu d'avaluacions (5 pel·lícules × 4 usuaris):");
  
  print("Vectors d'usuaris (transposada):");
  for (int i = 0; i < usuarisPetits.length; i++) {
    print("Usuari $i: ${usuarisPetits[i]}");
  }
  print("");
  
  // Trobar usuaris similars per cada usuari
  print("🎯 USUARIS SIMILARS");
  print("=" * 40);
  for (int usuariId = 0; usuariId < usuarisPetits.length; usuariId++) {
    List<List<double>> resultats = trobarUsuarisSimilars(usuarisPetits, usuariId, 3);
    mostrarUsuarisSimilars(resultats, usuariId);
  }
  
  // Provar recomanacions
  print("🎬 RECOMANACIONS DE PEL·LÍCULES");
  print("=" * 40);
  for (int usuariId = 0; usuariId < usuarisPetits.length; usuariId++) {
    List<List<double>> recomanacions = recomanarPellicules(dadesPetites, usuariId, 3);
    if (recomanacions.isNotEmpty) {
      mostrarRecomanacions(recomanacions, usuariId);
    } else {
      print("L'usuari $usuariId ja ha valorat totes les pel·lícules!");
      print("");
    }
  }
  
  // ================================================================
  // Fase 3: Prova amb dades grans
  // ================================================================
  print("🚀 PROVA AMB DADES GRANS");
  print("=" * 40);
  
  List<List<double>> dadesGrans = obtenirDadesGrans();
  List<List<double>> usuarisGrans = transposarMatriu(dadesGrans);
  
  print("Dades generades: ${dadesGrans.length} pel·lícules × ${usuarisGrans.length} usuaris");
  print("");
  
  // Provar amb alguns usuaris de mostra
  List<int> usuarisProva = [0, 5, 12, 23];
  
  for (int usuariId in usuarisProva) {
    DateTime inici = DateTime.now();
    
    List<List<double>> resultats = trobarUsuarisSimilars(usuarisGrans, usuariId, 5);
    
    DateTime fi = DateTime.now();
    Duration durada = fi.difference(inici);
    
    print("⏱️  Temps de càlcul per usuari $usuariId: ${durada.inMilliseconds}ms");
    mostrarUsuarisSimilars(resultats, usuariId);
  }
  
  // ================================================================
  // Fase 4: Anàlisi de rendiment
  // ================================================================
  print("📈 ANÀLISI DE RENDIMENT");
  print("=" * 40);
  
  DateTime iniciTotal = DateTime.now();
  int totalUsuaris = usuarisGrans.length;
  int usuarisProcessats = 0;
  
  for (int i = 0; i < min(10, totalUsuaris); i++) {
    trobarUsuarisSimilars(usuarisGrans, i, 3);
    usuarisProcessats++;
  }
  
  DateTime fiTotal = DateTime.now();
  Duration duradaTotal = fiTotal.difference(iniciTotal);
  
  double tempsPerUsuari = duradaTotal.inMilliseconds / usuarisProcessats;
  
  print("Usuaris processats: $usuarisProcessats");
  print("Temps total: ${duradaTotal.inMilliseconds}ms");
  print("Temps per usuari: ${tempsPerUsuari.toStringAsFixed(2)}ms");
  print("");
  
  print("🎉 PRÀCTICA COMPLETADA AMB ÈXIT!");
}
```

!!! tip "Execució del programa"
```bash
    dart run bin/main.dart
```

---

## Validació i Testing

!!! success "Comprova el teu treball"
    Executa els tests per validar que tot funciona correctament:
```bash
    # Executar tots els tests
    dart test
    
    # Veure més detalls
    dart test --reporter expanded
    
    # Executar un grup específic
    dart test --name "Càlcul de norma"
```

!!! info "Tests disponibles"
    El fitxer `test/similaritat_cosinus_test.dart` inclou tests per:
    
    **Fase 1: Operacions bàsiques**
    
    - ✅ Càlcul de norma (5 tests)
    - ✅ Producte escalar (4 tests)
    - ✅ Similaritat cosinus (8 tests)
    
    **Fase 2: Operacions amb matrius**
    
    - ✅ Transposició de matrius (4 tests)
    - ✅ Extracció de files i columnes (4 tests)
    
    **Fase 3: Sistema de recomanació**
    
    - ✅ Trobar usuaris similars (5 tests)
    - ✅ Recomanar pel·lícules (5 tests)
    - ✅ Integració completa (1 test)
    
    **Tests de rendiment**
    
    - ✅ Vectors grans (2 tests)

!!! warning "Si els tests fallen"
    1. Llegeix el missatge d'error amb atenció
    2. Identifica quina funció està fallant
    3. Revisa la implementació d'aquesta funció
    4. Comprova els casos especials (vectors buits, divisió per zero, etc.)
    5. Usa `print()` per debugar valors intermitjos

---

## Conceptes apresos

!!! abstract "Resum de conceptes"
    Durant aquesta pràctica has après:
    
    **Matemàtiques:**
    
    - ✓ Càlcul de norma (magnitud) d'un vector
    - ✓ Producte escalar entre vectors
    - ✓ Similaritat cosinus i les seves propietats
    - ✓ Transposició de matrius
    - ✓ Càlculs ponderats amb pesos
    
    **Programació:**
    
    - ✓ Treballar amb arrays unidimensionals (List<double>)
    - ✓ Treballar amb arrays bidimensionals (List<List<double>>)
    - ✓ Bucles simples i imbricats (nested loops)
    - ✓ Gestió d'errors (ArgumentError, RangeError)
    - ✓ Ordenació d'arrays amb `.sort()`
    - ✓ Funcions que criden altres funcions (composició)
    - ✓ Validació de paràmetres d'entrada
    
    **Algorismes:**
    
    - ✓ Filtratge col·laboratiu (collaborative filtering)
    - ✓ Sistemes de recomanació basats en usuaris
    - ✓ Càlcul de puntuacions ponderades
    - ✓ Optimització i anàlisi de rendiment
    - ✓ Complexitat computacional O(n²)
    
    **Bones pràctiques:**
    
    - ✓ Documentació amb comentaris
    - ✓ Validació d'entrada de dades
    - ✓ Gestió d'errors adequada
    - ✓ Tests unitaris
    - ✓ Separació de codi en funcions petites
    - ✓ Reutilització de codi

---

## Exercicis d'ampliació

!!! note "Reptes opcionals"
    Si has completat tota la pràctica, intenta aquests reptes per aprofundir:

### Repte 1: Estadístiques d'usuaris ⭐

Implementa una funció `estadistiquesUsuari(matriuAvaluacions, usuariId)` que mostri:

- Nombre de pel·lícules valorades
- Puntuació mitjana de l'usuari
- Pel·lícula millor valorada
- Pel·lícula pitjor valorada
```dart
void estadistiquesUsuari(List<List<double>> matriuAvaluacions, int usuariId) {
  // TODO: Implementa aquesta funció
}
```

### Repte 2: Filtre per pel·lícules en comú ⭐⭐

Modifica `trobarUsuarisSimilars` per afegir un paràmetre opcional `minPelliculesComunes`:

- Només compara usuaris que hagin valorat almenys N pel·lícules en comú
- Això millora la qualitat de les recomanacions
```dart
List<List<double>> trobarUsuarisSimilarsAmbFiltre(
  List<List<double>> matriuUsuaris, 
  int usuariId, 
  int numResultats,
  {int minPelliculesComunes = 0}
) {
  // TODO: Implementa aquesta funció
}
```

### Repte 3: Altres mètriques de similaritat ⭐⭐⭐

Investiga i implementa altres mètriques de similaritat:

**Correlació de Pearson:**
```dart
double calcularCorrelacio Pearson(List<double> vectorA, List<double> vectorB) {
  // Mesura la correlació lineal entre dos vectors
  // Valor entre -1 i 1
}
```

**Distància Euclidiana:**
```dart
double calcularDistanciaEuclidiana(List<double> vectorA, List<double> vectorB) {
  // Mesura la distància geomètrica entre dos punts
  // Valor sempre positiu, 0 = idèntics
}
```

**Similaritat de Jaccard:**
```dart
double calcularSimilaritatJaccard(List<double> vectorA, List<double> vectorB) {
  // Mesura la similaritat entre conjunts
  // Només considera si els valors són > 0 o no
}
```

### Repte 4: Interfície interactiva ⭐⭐⭐⭐

Crea un programa interactiu que permeti:
```dart
void main() {
  while (true) {
    print("\n=== SISTEMA DE RECOMANACIÓ ===");
    print("1. Veure usuaris similars");
    print("2. Obtenir recomanacions");
    print("3. Afegir nova avaluació");
    print("4. Veure estadístiques");
    print("5. Sortir");
    
    // TODO: Implementa el menú interactiu
  }
}
```

### Repte 5: Optimització amb caché ⭐⭐⭐⭐⭐

Implementa un sistema de caché per evitar recalcular similaritats:
```dart
class CacheSimilaritats {
  Map<String, double> _cache = {};
  
  double getSimilaritat(int usuari1, int usuari2, List<List<double>> matriuUsuaris) {
    // Si ja està a la caché, retorna-la
    // Si no, calcula-la, guarda-la i retorna-la
  }
}
```

### Repte 6: Visualització gràfica ⭐⭐⭐⭐⭐

Investiga el paquet `charts_flutter` i crea visualitzacions:

- Gràfic de barres amb les similaritats
- Heatmap de la matriu d'avaluacions
- Diagrama de dispersió dels usuaris en 2D

---

## Referències i recursos

!!! info "Lectures recomanades"
    
    **Sistemes de recomanació:**
    
    - [Collaborative Filtering - Wikipedia](https://en.wikipedia.org/wiki/Collaborative_filtering)
    - [Recommender Systems - Coursera](https://www.coursera.org/learn/recommender-systems)
    - [Introduction to Recommender Systems](https://towardsdatascience.com/introduction-to-recommender-systems-6c66cf15ada)
    
    **Similaritat cosinus:**
    
    - [Cosine Similarity - Wikipedia](https://en.wikipedia.org/wiki/Cosine_similarity)
    - [Understanding Cosine Similarity](https://www.machinelearningplus.com/nlp/cosine-similarity/)
    
    **Àlgebra lineal:**
    
    - [Linear Algebra - Khan Academy](https://www.khanacademy.org/math/linear-algebra)
    - [3Blue1Brown - Essence of Linear Algebra](https://www.youtube.com/playlist?list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab)

!!! tip "Eines útils"
    
    **Per a Dart:**
    
    - [DartPad](https://dartpad.dev/) - Editor online de Dart
    - [Dart Documentation](https://dart.dev/guides) - Documentació oficial
    - [pub.dev](https://pub.dev/) - Repositori de paquets Dart
    - [Effective Dart](https://dart.dev/guides/language/effective-dart) - Guia d'estil
    
    **Per a visualització:**
    
    - [charts_flutter](https://pub.dev/packages/charts_flutter) - Gràfics
    - [fl_chart](https://pub.dev/packages/fl_chart) - Gràfics alternatius
    
    **Per a testing:**
    
    - [test package](https://pub.dev/packages/test) - Framework de testing
    - [mockito](https://pub.dev/packages/mockito) - Mocks per testing

!!! quote "Recursos addicionals"
    
    **Datasets reals per practicar:**
    
    - [MovieLens](https://grouplens.org/datasets/movielens/) - Avaluacions de pel·lícules
    - [Amazon Reviews](https://nijianmo.github.io/amazon/index.html) - Avaluacions de productes
    - [Book-Crossing](http://www2.informatik.uni-freiburg.de/~cziegler/BX/) - Avaluacions de llibres
    
    **Exemples de sistemes reals:**
    
    - Netflix: Sistema de recomanació de sèries i pel·lícules
    - Amazon: "Els clients que van comprar això també van comprar..."
    - Spotify: Recomanacions de música basades en els teus gustos
    - YouTube: Vídeos recomanats

---

## Checklist de la pràctica

!!! success "Comprova que has completat tot"
    
    **Fase 1: Operacions bàsiques amb vectors**
    
    - [ ] Exercici 1.1: `calcularNorma()` implementada i funcionant
    - [ ] Exercici 1.2: `calcularProducteEscalar()` implementada i funcionant
    - [ ] Exercici 1.3: `calcularSimilaritatCosinus()` implementada i funcionant
    - [ ] Tots els tests de la Fase 1 passen ✅
    
    **Fase 2: Operacions amb matrius**
    
    - [ ] Exercici 2.1: `transposarMatriu()` implementada i funcionant
    - [ ] Exercici 2.2: `obtenirFila()` implementada i funcionant
    - [ ] Exercici 2.2: `obtenirColumna()` implementada i funcionant
    - [ ] Tots els tests de la Fase 2 passen ✅
    
    **Fase 3: Sistema de recomanació**
    
    - [ ] Exercici 3.1: `trobarUsuarisSimilars()` implementada i funcionant
    - [ ] Exercici 3.2: `recomanarPellicules()` implementada i funcionant
    - [ ] Tots els tests de la Fase 3 passen ✅
    
    **Fase 4: Visualització i proves**
    
    - [ ] Exercici 4.1: Funcions d'utilitat implementades
    - [ ] Exercici 4.2: Funcions de dades implementades
    - [ ] Exercici 4.3: Programa principal implementat
    - [ ] El programa s'executa sense errors
    - [ ] L'output és llegible i entenedor
    
    **Testing i validació**
    
    - [ ] Tots els tests unitaris passen ✅
    - [ ] Les validacions amb casos coneguts són correctes
    - [ ] El programa funciona amb dades petites
    - [ ] El programa funciona amb dades grans
    - [ ] El rendiment és acceptable (<100ms per usuari)
    
    **Documentació**
    
    - [ ] El codi està comentat adequadament
    - [ ] Les funcions tenen documentació (///)
    - [ ] Has entès com funciona cada part del sistema
    - [ ] Pots explicar la similaritat cosinus
    - [ ] Pots explicar com funciona el sistema de recomanació

---

## Avaluació

!!! info "Criteris d'avaluació"
    
    **Funcionalitat (40%)**
    
    - Totes les funcions implementades correctament
    - Tots els tests passen
    - El programa s'executa sense errors
    - Els resultats són correctes
    
    **Qualitat del codi (30%)**
    
    - Codi net i llegible
    - Bon ús de variables i noms descriptius
    - Funcions ben estructurades
    - Gestió d'errors adequada
    - Comentaris útils
    
    **Comprensió (20%)**
    
    - Entendre els conceptes matemàtics
    - Capacitat d'explicar el funcionament
    - Resolució de problemes
    
    **Testing (10%)**
    
    - Tests executats correctament
    - Comprensió dels resultats dels tests
    - Validació amb diferents casos

---

## Preguntes freqüents (FAQ)

??? question "Per què la similaritat cosinus pot ser negativa?"
    La similaritat cosinus pot ser negativa quan els vectors apunten en direccions oposades.
    
    **Exemple:**
    - Usuari A valora alt: [5, 5, 0, 0]
    - Usuari B valora alt: [0, 0, 5, 5]
    
    Tenen gustos oposats! La similaritat serà propera a 0 o negativa.

??? question "Per què usem transposarMatriu()?"
    Perquè la matriu original té:
    - Files = Pel·lícules
    - Columnes = Usuaris
    
    Però per calcular similaritats entre usuaris necessitem:
    - Files = Usuaris
    - Columnes = Pel·lícules
    
    La transposició fa aquest canvi automàticament.

??? question "Què passa si un usuari no ha valorat cap pel·lícula?"
    El seu vector serà `[0, 0, 0, ...]` i la norma serà 0. La funció `calcularSimilaritatCosinus` retornarà 0.0 per evitar la divisió per zero.

??? question "Per què usem List.from() en obtenirFila()?"
    Per crear una **còpia** de la fila, no una referència. Si retornem directament `matriu[indiceFila]`, qualsevol modificació afectaria la matriu original.

??? question "Com puc optimitzar el rendiment?"
    Algunes opcions:
    
    1. **Caché de similaritats**: Guarda els càlculs en un Map
    2. **Paral·lelització**: Usa isolates de Dart
    3. **Matrius disperses**: Si molts valors són 0, usa una estructura especial
    4. **LSH (Locality Sensitive Hashing)**: Per datasets molt grans

??? question "Per què fem servir toDouble() i toInt()?"
    - `toDouble()`: Per convertir int a double (necessari per guardar en List<double>)
    - `toInt()`: Per convertir double a int quan ho necessitem per índexs

---

**Bona sort amb la pràctica! 🚀**

**Si tens dubtes, consulta amb el professor o revisa la documentació de Dart.**

---

*Pràctica creada per a l'assignatura de Programació - Sistemes de Recomanació*

*Versió 1.0 - 2024*
