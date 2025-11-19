# Programació amb Matrius en Dart

!!! info "Informació del Curs"
    Aquest curs està estructurat en 3 nivells progressius que cobreixen des dels conceptes fonamentals fins a projectes complets amb matrius en Dart.

## Nivell 1: Fonaments

!!! abstract "Durada"
    2-3 sessions

### Sessió 1: Creació i Manipulació de Matrius

#### 1.1 Creació de Matrius
```dart
void main() {
  // Matriu 3x3 inicialitzada amb zeros
  List<List<int>> matriu1 = List.generate(
    3, 
    (i) => List.filled(3, 0)
  );
  
  // Matriu 3x4 amb valors personalitzats
  List<List<int>> matriu2 = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12]
  ];
  
  // Matriu identitat 4x4
  List<List<int>> identitat = List.generate(
    4,
    (i) => List.generate(4, (j) => i == j ? 1 : 0)
  );
  
  imprimirMatriu(matriu2);
}

void imprimirMatriu(List<List<int>> m) {
  for (var fila in m) {
    print(fila.join('\t'));
  }
  print('---');
}
```

#### 1.2 Indexació i Accés
```dart
class Matriu {
  late List<List<double>> dades;
  late int files;
  late int columnes;
  
  Matriu(this.files, this.columnes, [double valorInicial = 0.0]) {
    dades = List.generate(
      files,
      (i) => List.filled(columnes, valorInicial)
    );
  }
  
  // Obtenir element
  double obtenir(int fila, int columna) {
    if (fila < 0 || fila >= files || columna < 0 || columna >= columnes) {
      throw RangeError('Índex fora de rang');
    }
    return dades[fila][columna];
  }
  
  // Establir element
  void establir(int fila, int columna, double valor) {
    if (fila < 0 || fila >= files || columna < 0 || columna >= columnes) {
      throw RangeError('Índex fora de rang');
    }
    dades[fila][columna] = valor;
  }
  
  // Obtenir fila completa
  List<double> obtenirFila(int fila) {
    return List.from(dades[fila]);
  }
  
  // Obtenir columna completa
  List<double> obtenirColumna(int columna) {
    return List.generate(files, (i) => dades[i][columna]);
  }
  
  // Obtenir submatriu
  Matriu submatriu(int filaInici, int columnaInici, int numFiles, int numColumnes) {
    Matriu sub = Matriu(numFiles, numColumnes);
    for (int i = 0; i < numFiles; i++) {
      for (int j = 0; j < numColumnes; j++) {
        sub.dades[i][j] = dades[filaInici + i][columnaInici + j];
      }
    }
    return sub;
  }
}
```

!!! example "Exercici 1.1: Matriu Màgica"
    Completar: Crear una funció que verifiqui si una matriu és màgica (totes les files, columnes i diagonals sumen el mateix)
```dart
    bool esMatriuMagica(List<List<int>> matriu) {
      int n = matriu.length;
      int sumaMagica = 0;
      
      // Calcular suma de la primera fila com a referència
      for (int j = 0; j < n; j++) {
        sumaMagica += matriu[0][j];
      }
      
      // TODO: Comprovar files
      // TODO: Comprovar columnes
      // TODO: Comprovar diagonal principal
      // TODO: Comprovar diagonal secundària
      
      return true; // Modificar segons resultat
    }
```

### Sessió 2: Recorreguts de Matrius

#### 2.1 Recorreguts Bàsics
```dart
class RecorregutsMatriu {
  // Recorregut per files
  static void recorrerPerFiles(List<List<int>> m) {
    print('Recorregut per files:');
    for (int i = 0; i < m.length; i++) {
      for (int j = 0; j < m[i].length; j++) {
        print('m[$i][$j] = ${m[i][j]}');
      }
    }
  }
  
  // Recorregut per columnes
  static void recorrerPerColumnes(List<List<int>> m) {
    print('Recorregut per columnes:');
    int files = m.length;
    int columnes = m[0].length;
    
    for (int j = 0; j < columnes; j++) {
      for (int i = 0; i < files; i++) {
        print('m[$i][$j] = ${m[i][j]}');
      }
    }
  }
  
  // Recorregut diagonal principal
  static List<int> obtenirDiagonalPrincipal(List<List<int>> m) {
    List<int> diagonal = [];
    int n = m.length < m[0].length ? m.length : m[0].length;
    
    for (int i = 0; i < n; i++) {
      diagonal.add(m[i][i]);
    }
    return diagonal;
  }
  
  // Recorregut diagonal secundària
  static List<int> obtenirDiagonalSecundaria(List<List<int>> m) {
    List<int> diagonal = [];
    int files = m.length;
    int columnes = m[0].length;
    int n = files < columnes ? files : columnes;
    
    for (int i = 0; i < n; i++) {
      diagonal.add(m[i][columnes - 1 - i]);
    }
    return diagonal;
  }
  
  // Recorregut en espiral
  static List<int> recorregutEspiral(List<List<int>> m) {
    List<int> resultat = [];
    int files = m.length;
    int columnes = m[0].length;
    int top = 0, bottom = files - 1;
    int left = 0, right = columnes - 1;
    
    while (top <= bottom && left <= right) {
      // Dreta
      for (int i = left; i <= right; i++) {
        resultat.add(m[top][i]);
      }
      top++;
      
      // Avall
      for (int i = top; i <= bottom; i++) {
        resultat.add(m[i][right]);
      }
      right--;
      
      // Esquerra
      if (top <= bottom) {
        for (int i = right; i >= left; i--) {
          resultat.add(m[bottom][i]);
        }
        bottom--;
      }
      
      // Amunt
      if (left <= right) {
        for (int i = bottom; i >= top; i--) {
          resultat.add(m[i][left]);
        }
        left++;
      }
    }
    
    return resultat;
  }
}
```

!!! example "Exercici 2.1: Recorregut en Ziga-Zaga"
    Completar: Recórrer la matriu en ziga-zaga. Primera fila d'esquerra a dreta, segona de dreta a esquerra, etc.
```dart
    List<int> recorregutZigZag(List<List<int>> matriu) {
      List<int> resultat = [];
      
      // TODO: Implementar recorregut
      // Pista: usar l'índex de fila per decidir la direcció
      
      return resultat;
    }
```

!!! example "Exercici 2.2: Buscar Element"
    Completar: Buscar un element en una matriu ordenada per files i columnes. Retornar les coordenades [fila, columna] o null si no es troba.
```dart
    List<int>? buscarEnMatriuOrdenada(List<List<int>> matriu, int objectiu) {
      // La matriu està ordenada: cada fila i columna estan en ordre creixent
      // TODO: Implementar cerca eficient (no O(n*m))
      // Pista: començar des d'una cantonada estratègica
      
      return null;
    }
```

### Sessió 3: Operacions Element a Element

#### 3.1 Operacions Aritmètiques
```dart
class OperacionsMatriu {
  // Suma de matrius
  static Matriu suma(Matriu a, Matriu b) {
    if (a.files != b.files || a.columnes != b.columnes) {
      throw ArgumentError('Les matrius han de tenir les mateixes dimensions');
    }
    
    Matriu resultat = Matriu(a.files, a.columnes);
    for (int i = 0; i < a.files; i++) {
      for (int j = 0; j < a.columnes; j++) {
        resultat.dades[i][j] = a.dades[i][j] + b.dades[i][j];
      }
    }
    return resultat;
  }
  
  // Producte per escalar
  static Matriu producteEscalar(Matriu m, double escalar) {
    Matriu resultat = Matriu(m.files, m.columnes);
    for (int i = 0; i < m.files; i++) {
      for (int j = 0; j < m.columnes; j++) {
        resultat.dades[i][j] = m.dades[i][j] * escalar;
      }
    }
    return resultat;
  }
  
  // Transposada
  static Matriu transposada(Matriu m) {
    Matriu resultat = Matriu(m.columnes, m.files);
    for (int i = 0; i < m.files; i++) {
      for (int j = 0; j < m.columnes; j++) {
        resultat.dades[j][i] = m.dades[i][j];
      }
    }
    return resultat;
  }
  
  // Aplicar funció a cada element
  static Matriu aplicarFuncio(Matriu m, double Function(double) funcio) {
    Matriu resultat = Matriu(m.files, m.columnes);
    for (int i = 0; i < m.files; i++) {
      for (int j = 0; j < m.columnes; j++) {
        resultat.dades[i][j] = funcio(m.dades[i][j]);
      }
    }
    return resultat;
  }
}
```

!!! example "Exercici 3.1: Normalització Min-Max"
    Completar: Normalitzar cada columna entre 0 i 1
```dart
    Matriu normalitzarMinMax(Matriu m) {
      Matriu resultat = Matriu(m.files, m.columnes);
      
      for (int j = 0; j < m.columnes; j++) {
        // TODO: Trobar min i max de la columna j
        double min = double.infinity;
        double max = double.negativeInfinity;
        
        // TODO: Aplicar normalització (valor - min) / (max - min)
      }
      
      return resultat;
    }
```

---

## Nivell 2: Problemes Dirigits

!!! abstract "Durada"
    3-4 sessions

### Sessió 4: Tres en Ratlla
```dart
class TresEnRatlla {
  static const int BUIT = 0;
  static const int JUGADOR_X = 1;
  static const int JUGADOR_O = 2;
  
  late List<List<int>> tauler;
  late int tornActual;
  
  TresEnRatlla() {
    tauler = List.generate(3, (_) => List.filled(3, BUIT));
    tornActual = JUGADOR_X;
  }
  
  bool ferJugada(int fila, int columna) {
    if (tauler[fila][columna] != BUIT) {
      return false;
    }
    
    tauler[fila][columna] = tornActual;
    tornActual = tornActual == JUGADOR_X ? JUGADOR_O : JUGADOR_X;
    return true;
  }
  
  int comprovarGuanyador() {
    // Comprovar files
    for (int i = 0; i < 3; i++) {
      if (tauler[i][0] != BUIT && 
          tauler[i][0] == tauler[i][1] && 
          tauler[i][1] == tauler[i][2]) {
        return tauler[i][0];
      }
    }
    
    // Comprovar columnes
    for (int j = 0; j < 3; j++) {
      if (tauler[0][j] != BUIT && 
          tauler[0][j] == tauler[1][j] && 
          tauler[1][j] == tauler[2][j]) {
        return tauler[0][j];
      }
    }
    
    // Comprovar diagonals
    if (tauler[1][1] != BUIT) {
      if (tauler[0][0] == tauler[1][1] && tauler[1][1] == tauler[2][2]) {
        return tauler[1][1];
      }
      if (tauler[0][2] == tauler[1][1] && tauler[1][1] == tauler[2][0]) {
        return tauler[1][1];
      }
    }
    
    return BUIT;
  }
  
  bool taulerPle() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (tauler[i][j] == BUIT) return false;
      }
    }
    return true;
  }
  
  void imprimirTauler() {
    print('\n   0   1   2');
    for (int i = 0; i < 3; i++) {
      String fila = '$i  ';
      for (int j = 0; j < 3; j++) {
        String simbol = tauler[i][j] == BUIT ? ' ' : 
                       tauler[i][j] == JUGADOR_X ? 'X' : 'O';
        fila += simbol;
        if (j < 2) fila += ' | ';
      }
      print(fila);
      if (i < 2) print('  -----------');
    }
  }
}
```

!!! example "Exercici 4.1: Minimax per IA"
```dart
    class IAMinimax {
      static const int MAX_DEPTH = 9;
      
      static List<int> millorJugada(List<List<int>> tauler, int jugador) {
        int millorPuntuacio = -1000;
        List<int> millorMoviment = [-1, -1];
        
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            if (tauler[i][j] == TresEnRatlla.BUIT) {
              // TODO: Implementar minimax
              // 1. Fer jugada temporal
              // 2. Calcular puntuació amb minimax
              // 3. Desfer jugada
              // 4. Actualitzar millor moviment si cal
            }
          }
        }
        
        return millorMoviment;
      }
      
      static int minimax(List<List<int>> tauler, int depth, bool esMaximitzant, int jugador) {
        // TODO: Implementar algoritme minimax
        // 1. Comprovar estat terminal (guanyador o empat)
        // 2. Si esMaximitzant, buscar màxim
        // 3. Si no, buscar mínim
        // 4. Retornar millor puntuació
        
        return 0;
      }
    }
```

### Sessió 5: Rotació i Transformació d'Imatges
```dart
class TransformacionsImatge {
  // Representem una imatge com matriu de píxels (0-255)
  
  // Rotar 90 graus en sentit horari
  static List<List<int>> rotar90Horari(List<List<int>> imatge) {
    int files = imatge.length;
    int columnes = imatge[0].length;
    List<List<int>> rotada = List.generate(
      columnes,
      (_) => List.filled(files, 0)
    );
    
    for (int i = 0; i < files; i++) {
      for (int j = 0; j < columnes; j++) {
        rotada[j][files - 1 - i] = imatge[i][j];
      }
    }
    
    return rotada;
  }
  
  // Efecte mirall horitzontal
  static List<List<int>> mirallHoritzontal(List<List<int>> imatge) {
    int files = imatge.length;
    int columnes = imatge[0].length;
    List<List<int>> mirall = List.generate(
      files,
      (i) => List.from(imatge[i])
    );
    
    for (int i = 0; i < files; i++) {
      for (int j = 0; j < columnes ~/ 2; j++) {
        int temp = mirall[i][j];
        mirall[i][j] = mirall[i][columnes - 1 - j];
        mirall[i][columnes - 1 - j] = temp;
      }
    }
    
    return mirall;
  }
  
  // Aplicar filtre de desenfocament (blur)
  static List<List<double>> aplicarBlur(List<List<int>> imatge) {
    int files = imatge.length;
    int columnes = imatge[0].length;
    List<List<double>> resultat = List.generate(
      files,
      (_) => List.filled(columnes, 0.0)
    );
    
    // Kernel de desenfocament 3x3
    List<List<double>> kernel = [
      [1/9, 1/9, 1/9],
      [1/9, 1/9, 1/9],
      [1/9, 1/9, 1/9]
    ];
    
    for (int i = 1; i < files - 1; i++) {
      for (int j = 1; j < columnes - 1; j++) {
        double suma = 0;
        for (int ki = -1; ki <= 1; ki++) {
          for (int kj = -1; kj <= 1; kj++) {
            suma += imatge[i + ki][j + kj] * kernel[ki + 1][kj + 1];
          }
        }
        resultat[i][j] = suma;
      }
    }
    
    return resultat;
  }
}
```

!!! example "Exercici 5.1: Detecció de Vores"
    Completar: Implementar detecció de vores amb filtre Sobel
```dart
    List<List<double>> detectarVores(List<List<int>> imatge) {
      // Kernels de Sobel
      List<List<int>> sobelX = [
        [-1, 0, 1],
        [-2, 0, 2],
        [-1, 0, 1]
      ];
      
      List<List<int>> sobelY = [
        [-1, -2, -1],
        [ 0,  0,  0],
        [ 1,  2,  1]
      ];
      
      int files = imatge.length;
      int columnes = imatge[0].length;
      List<List<double>> resultat = List.generate(
        files,
        (_) => List.filled(columnes, 0.0)
      );
      
      // TODO: Aplicar ambdós kernels i combinar resultats
      // magnitud = sqrt(gx^2 + gy^2)
      
      return resultat;
    }
```

### Sessió 6: Laberint i Cerca de Camins
```dart
class Laberint {
  static const int PARET = 1;
  static const int CAMI = 0;
  static const int VISITAT = 2;
  static const int SOLUCIO = 3;
  
  late List<List<int>> mapa;
  late int files;
  late int columnes;
  
  Laberint(this.mapa) {
    files = mapa.length;
    columnes = mapa[0].length;
  }
  
  // Buscar camí amb BFS (retorna el més curt)
  List<List<int>>? trobarCamiBFS(int filaInici, int colInici, int filaFi, int colFi) {
    if (mapa[filaInici][colInici] == PARET || mapa[filaFi][colFi] == PARET) {
      return null;
    }
    
    List<List<int>> direccions = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    List<List<bool>> visitat = List.generate(
      files,
      (_) => List.filled(columnes, false)
    );
    
    // Cua per BFS: [fila, columna, camí]
    List<dynamic> cua = [[filaInici, colInici, [[filaInici, colInici]]]];
    visitat[filaInici][colInici] = true;
    
    while (cua.isNotEmpty) {
      var actual = cua.removeAt(0);
      int fila = actual[0];
      int col = actual[1];
      List<List<int>> cami = actual[2];
      
      if (fila == filaFi && col == colFi) {
        return cami;
      }
      
      for (var dir in direccions) {
        int novaFila = fila + dir[0];
        int novaCol = col + dir[1];
        
        if (novaFila >= 0 && novaFila < files && 
            novaCol >= 0 && novaCol < columnes &&
            !visitat[novaFila][novaCol] && 
            mapa[novaFila][novaCol] != PARET) {
          
          visitat[novaFila][novaCol] = true;
          List<List<int>> nouCami = List.from(cami)..add([novaFila, novaCol]);
          cua.add([novaFila, novaCol, nouCami]);
        }
      }
    }
    
    return null;
  }
  
  // Generar laberint aleatori
  static List<List<int>> generarLaberint(int files, int columnes, double probabilitatParet) {
    var rng = DateTime.now().millisecondsSinceEpoch;
    List<List<int>> laberint = List.generate(files, (i) {
      return List.generate(columnes, (j) {
        if (i == 0 || i == files - 1 || j == 0 || j == columnes - 1) {
          return PARET; // Vores sempre són parets
        }
        // Pseudo-aleatori simple
        rng = (rng * 1103515245 + 12345) % (1 << 31);
        return (rng % 100) < (probabilitatParet * 100) ? PARET : CAMI;
      });
    });
    
    // Assegurar inici i final lliures
    laberint[1][1] = CAMI;
    laberint[files - 2][columnes - 2] = CAMI;
    
    return laberint;
  }
}
```

!!! example "Exercici 6.1: A* (A estrella)"
    Completar: Implementar cerca A* per trobar el camí òptim
```dart
    class AEstrella {
      static double heuristica(int x1, int y1, int x2, int y2) {
        // Distància Manhattan
        return (x1 - x2).abs() + (y1 - y2).abs().toDouble();
      }
      
      static List<List<int>>? trobarCami(List<List<int>> mapa, 
                                         int filaInici, int colInici, 
                                         int filaFi, int colFi) {
        // TODO: Implementar A*
        // 1. Usar priority queue (o llista ordenada)
        // 2. Mantenir costos g i f per cada node
        // 3. Usar heurística per guiar cerca
        // 4. Reconstruir camí des del final
        
        return null;
      }
    }
```

---

## Nivell 3: Projectes Complets

!!! abstract "Durada"
    4-5 sessions

### Sessió 7-8: Sistema de Recomanació
```dart
class SistemaRecomanacio {
  late List<List<double>> matriuUsuariProducte;
  late List<String> usuaris;
  late List<String> productes;
  
  SistemaRecomanacio(this.usuaris, this.productes) {
    int numUsuaris = usuaris.length;
    int numProductes = productes.length;
    
    // Inicialitzar amb -1 (no valorat)
    matriuUsuariProducte = List.generate(
      numUsuaris,
      (_) => List.filled(numProductes, -1.0)
    );
  }
  
  void afegirValoracio(String usuari, String producte, double valoracio) {
    int indexUsuari = usuaris.indexOf(usuari);
    int indexProducte = productes.indexOf(producte);
    
    if (indexUsuari != -1 && indexProducte != -1) {
      matriuUsuariProducte[indexUsuari][indexProducte] = valoracio;
    }
  }
  
  // Calcular similitud cosinus entre dos usuaris
  double similitudCosinus(int usuari1, int usuari2) {
    List<double> vec1 = matriuUsuariProducte[usuari1];
    List<double> vec2 = matriuUsuariProducte[usuari2];
    
    double dotProduct = 0;
    double norma1 = 0;
    double norma2 = 0;
    int comptador = 0;
    
    for (int i = 0; i < vec1.length; i++) {
      // Només considerar productes valorats per ambdós
      if (vec1[i] >= 0 && vec2[i] >= 0) {
        dotProduct += vec1[i] * vec2[i];
        norma1 += vec1[i] * vec1[i];
        norma2 += vec2[i] * vec2[i];
        comptador++;
      }
    }
    
    if (comptador == 0 || norma1 == 0 || norma2 == 0) {
      return 0;
    }
    
    return dotProduct / (sqrt(norma1) * sqrt(norma2));
  }
  
  // Buscar k usuaris més similars
  List<int> trobarUsuarisSimilars(int indexUsuari, int k) {
    List<MapEntry<int, double>> similituds = [];
    
    for (int i = 0; i < usuaris.length; i++) {
      if (i != indexUsuari) {
        double sim = similitudCosinus(indexUsuari, i);
        similituds.add(MapEntry(i, sim));
      }
    }
    
    // Ordenar per similitud descendent
    similituds.sort((a, b) => b.value.compareTo(a.value));
    
    // Retornar els k primers
    return similituds.take(k).map((e) => e.key).toList();
  }
  
  // Predir valoració per un producte
  double predirValoracio(String usuari, String producte) {
    int indexUsuari = usuaris.indexOf(usuari);
    int indexProducte = productes.indexOf(producte);
    
    if (indexUsuari == -1 || indexProducte == -1) {
      return 0;
    }
    
    // Si ja està valorat, retornar valoració
    if (matriuUsuariProducte[indexUsuari][indexProducte] >= 0) {
      return matriuUsuariProducte[indexUsuari][indexProducte];
    }
    
    // Trobar usuaris similars que han valorat aquest producte
    List<int> similars = trobarUsuarisSimilars(indexUsuari, 5);
    double sumaPonderada = 0;
    double sumaPesos = 0;
    
    for (int veí in similars) {
      double valoracioVeí = matriuUsuariProducte[veí][indexProducte];
      if (valoracioVeí >= 0) {
        double pes = similitudCosinus(indexUsuari, veí);
        sumaPonderada += valoracioVeí * pes;
        sumaPesos += pes.abs();
      }
    }
    
    if (sumaPesos == 0) {
      // Retornar mitjana global del producte
      double suma = 0;
      int comptador = 0;
      for (int i = 0; i < usuaris.length; i++) {
        if (matriuUsuariProducte[i][indexProducte] >= 0) {
          suma += matriuUsuariProducte[i][indexProducte];
          comptador++;
        }
      }
      return comptador > 0 ? suma / comptador : 2.5;
    }
    
    return sumaPonderada / sumaPesos;
  }
  
  // Generar recomanacions per un usuari
  List<String> recomanar(String usuari, int numRecomanacions) {
    int indexUsuari = usuaris.indexOf(usuari);
    if (indexUsuari == -1) return [];
    
    List<MapEntry<int, double>> prediccions = [];
    
    for (int i = 0; i < productes.length; i++) {
      // Només productes no valorats
      if (matriuUsuariProducte[indexUsuari][i] < 0) {
        double prediccio = predirValoracio(usuari, productes[i]);
        prediccions.add(MapEntry(i, prediccio));
      }
    }
    
    // Ordenar per predicció descendent
    prediccions.sort((a, b) => b.value.compareTo(a.value));
    
    // Retornar els millors productes
    return prediccions
        .take(numRecomanacions)
        .map((e) => productes[e.key])
        .toList();
  }
}

// Funció auxiliar per importar sqrt
double sqrt(double x) {
  if (x < 0) return 0;
  if (x == 0) return 0;
  
  double estimacio = x;
  double epsilon = 0.00001;
  
  while ((estimacio - x / estimacio).abs() > epsilon) {
    estimacio = (estimacio + x / estimacio) / 2;
  }
  
  return estimacio;
}
```

!!! example "Exercici 7.1: Factorització de Matrius"
    Completar: Implementar factorització de matrius simple per recomanacions
```dart
    class FactoritzacioMatrius {
      late List<List<double>> P; // Matriu usuaris x factors
      late List<List<double>> Q; // Matriu factors x productes
      late int numFactors;
      
      FactoritzacioMatrius(int numUsuaris, int numProductes, this.numFactors) {
        // Inicialitzar amb valors petits aleatoris
        P = List.generate(numUsuaris, (_) => 
          List.generate(numFactors, (_) => 0.1));
        Q = List.generate(numFactors, (_) => 
          List.generate(numProductes, (_) => 0.1));
      }
      
      void entrenar(List<List<double>> matriuValoracions, 
                    int iteracions, 
                    double learningRate, 
                    double regularitzacio) {
        // TODO: Implementar gradient descent
        // 1. Per cada iteració
        // 2. Per cada valoració coneguda
        // 3. Calcular error de predicció
        // 4. Actualitzar P i Q per minimitzar error
      }
      
      double predir(int usuari, int producte) {
        // TODO: Multiplicar vectors corresponents de P i Q
        return 0;
      }
    }
```

### Sessió 9-10: Anàlisi de Xarxes Socials
```dart
class XarxaSocial {
  late List<List<int>> matriuAdjacencia;
  late List<String> usuaris;
  
  XarxaSocial(this.usuaris) {
    int n = usuaris.length;
    matriuAdjacencia = List.generate(n, (_) => List.filled(n, 0));
  }
  
  void afegirAmistay(String usuari1, String usuari2) {
    int index1 = usuaris.indexOf(usuari1);
    int index2 = usuaris.indexOf(usuari2);
    
    if (index1 != -1 && index2 != -1) {
      matriuAdjacencia[index1][index2] = 1;
      matriuAdjacencia[index2][index1] = 1; // Graf no dirigit
    }
  }
  
  // Trobar amics d'un usuari
  List<String> obtenirAmics(String usuari) {
    int index = usuaris.indexOf(usuari);
    if (index == -1) return [];
    
    List<String> amics = [];
    for (int i = 0; i < usuaris.length; i++) {
      if (matriuAdjacencia[index][i] == 1) {
        amics.add(usuaris[i]);
      }
    }
    return amics;
  }
  
  // Suggerir amics (amics d'amics)
  List<String> suggerirAmics(String usuari) {
    int index = usuaris.indexOf(usuari);
    if (index == -1) return [];
    
    Map<String, int> puntuacions = {};
    
    // Per cada amic
    for (int i = 0; i < usuaris.length; i++) {
      if (matriuAdjacencia[index][i] == 1) {
        // Per cada amic de l'amic
        for (int j = 0; j < usuaris.length; j++) {
          if (matriuAdjacencia[i][j] == 1 && 
              j != index && 
              matriuAdjacencia[index][j] == 0) {
            // Incrementar puntuació del suggeriment
            puntuacions[usuaris[j]] = (puntuacions[usuaris[j]] ?? 0) + 1;
          }
        }
      }
    }
    
    // Ordenar per puntuació descendent
    var llista = puntuacions.entries.toList();
    llista.sort((a, b) => b.value.compareTo(a.value));
    
    return llista.map((e) => e.key).toList();
  }
  
  // Calcular centralitat de grau
  Map<String, int> centralitatGrau() {
    Map<String, int> centralitat = {};
    
    for (int i = 0; i < usuaris.length; i++) {
      int grau = 0;
      for (int j = 0; j < usuaris.length; j++) {
        grau += matriuAdjacencia[i][j];
      }
      centralitat[usuaris[i]] = grau;
    }
    
    return centralitat;
  }
  
  // Detectar comunitats amb Louvain simplificat
  List<List<String>> detectarComunitats() {
    // Implementació simplificada: agrupar per components connexes
    List<bool> visitat = List.filled(usuaris.length, false);
    List<List<String>> comunitats = [];
    
    for (int i = 0; i < usuaris.length; i++) {
      if (!visitat[i]) {
        List<String> comunitat = [];
        _dfs(i, visitat, comunitat);
        if (comunitat.isNotEmpty) {
          comunitats.add(comunitat);
        }
      }
    }
    
    return comunitats;
  }
  
  void _dfs(int node, List<bool> visitat, List<String> comunitat) {
    visitat[node] = true;
    comunitat.add(usuaris[node]);
    
    for (int i = 0; i < usuaris.length; i++) {
      if (matriuAdjacencia[node][i] == 1 && !visitat[i]) {
        _dfs(i, visitat, comunitat);
      }
    }
  }
  
  // Calcular PageRank simplificat
  Map<String, double> pageRank({int iteracions = 20, double damping = 0.85}) {
    int n = usuaris.length;
    List<double> rank = List.filled(n, 1.0 / n);
    List<double> nouRank = List.filled(n, 0.0);
    
    for (int iter = 0; iter < iteracions; iter++) {
      for (int i = 0; i < n; i++) {
        nouRank[i] = (1 - damping) / n;
        
        for (int j = 0; j < n; j++) {
          if (matriuAdjacencia[j][i] == 1) {
            int grauSortida = 0;
            for (int k = 0; k < n; k++) {
              grauSortida += matriuAdjacencia[j][k];
            }
            if (grauSortida > 0) {
              nouRank[i] += damping * rank[j] / grauSortida;
            }
          }
        }
      }
      rank = List.from(nouRank);
    }
    
    Map<String, double> resultat = {};
    for (int i = 0; i < n; i++) {
      resultat[usuaris[i]] = rank[i];
    }
    
    return resultat;
  }
}
```

!!! example "Exercici 9.1: Camí Més Curt (Dijkstra)"
    Completar: Implementar Dijkstra per trobar distància mínima entre usuaris
```dart
    class Dijkstra {
      static Map<String, int> distanciesMinimes(XarxaSocial xarxa, String origen) {
        // TODO: Implementar Dijkstra
        // 1. Inicialitzar distàncies a infinit excepte origen
        // 2. Usar cua de prioritat (o trobar mínim manualment)
        // 3. Relaxar arestes
        // 4. Retornar mapa de distàncies
        
        return {};
      }
    }
```

---

## Exercicis Addicionals de Repàs

!!! example "Exercici Final 1: Sudoku Solver"
```dart
    class SudokuSolver {
      static bool resoldreSuboku(List<List<int>> tauler) {
        // TODO: Implementar backtracking per resoldre Sudoku
        // 1. Trobar casella buida
        // 2. Provar números 1-9
        // 3. Verificar validesa (fila, columna, subcuadrícula)
        // 4. Recursió i backtrack si cal
        
        return false;
      }
      
      static bool esValid(List<List<int>> tauler, int fila, int col, int num) {
        // TODO: Verificar si num és vàlid a posició [fila][col]
        
        return false;
      }
    }
```

!!! example "Exercici Final 2: Compressió d'Imatge Simple"
```dart
    class CompressorImatge {
      static List<List<int>> comprimir(List<List<int>> imatge, int factor) {
        // TODO: Implementar compressió per blocs
        // 1. Dividir imatge en blocs de factor x factor
        // 2. Substituir cada bloc per la seva mitjana
        // 3. Retornar imatge comprimida
        
        return [];
      }
      
      static List<List<int>> descomprimir(List<List<int>> comprimida, int factor) {
        // TODO: Expandir cada píxel a bloc de factor x factor
        
        return [];
      }
    }
```

---

## Notes per al Professor

!!! note "Avaluació Recomanada"
    - **Exercicis pràctics (40%)**: Completar els exercicis TODOs
    - **Projecte individual (30%)**: Escollir un dels projectes complets
    - **Examen teòric (20%)**: Complexitat algorítmica i conceptes
    - **Participació (10%)**: Contribucions i ajuda entre companys

!!! tip "Recursos Addicionals"
    - **Debugger de matrius**: crear funció per visualitzar matrius en ASCII art
    - **Test unitaris**: afegir tests per cada exercici
    - **Benchmarking**: comparar rendiment de diferents algorismes

!!! info "Extensions Possibles"
    - **Paral·lelització**: Usar isolates de Dart per operacions costoses
    - **Visualització**: Integrar amb Flutter per interfície gràfica
    - **Persistència**: Guardar/carregar matrius en fitxers
    - **Optimització**: Implementar matrius disperses per estalviar memòria
