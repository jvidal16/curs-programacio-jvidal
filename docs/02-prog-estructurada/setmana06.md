# Setmana 6: Arrays Bidimensionals (Matrius)

## Objectius d'aprenentatge
- Comprendre el concepte de matriu
- Declarar i inicialitzar matrius
- Accedir i modificar elements
- Recórrer matrius amb bucles niuats
- Implementar operacions amb matrius
- Aplicar matrius en problemes pràctics

---

## Sessió 1-2: Introducció a Matrius

### 1. Què és una Matriu?

!!! note "Definició"
    Una **matriu** és una estructura de dades bidimensional que organitza elements en **files** i **columnes**.

**Visualització:**
```
        Col 0   Col 1   Col 2
File 0 [  10  |  20  |  30  ]
File 1 [  40  |  50  |  60  ]
File 2 [  70  |  80  |  90  ]
```

**Característiques:**
- 📊 Taula de dades en 2 dimensions
- 🔢 Accés mitjançant [fila][columna]
- 📦 Tots els elements del mateix tipus
- 🎯 Útil per taulers, taules, imatges

---

### 2. Declaració i Inicialització

#### Matriu amb valors inicials

```dart
void main() {
  // Matriu 3x3
  List<List<int>> matriu = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  print(matriu);
}
```

**Sortida:**
```
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

---

#### Matriu buida amb mida fixa

```dart
void main() {
  int files = 3;
  int columnes = 4;
  
  // Crear matriu buida
  List<List<int>> matriu = List.generate(
    files,
    (i) => List.filled(columnes, 0)
  );
  
  print(matriu);
}
```

**Sortida:**
```
[[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
```

---

### 3. Accés a Elements

```dart
void main() {
  List<List<int>> matriu = [
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90]
  ];
  
  // Accedir a elements
  print('Element [0][0]: ${matriu[0][0]}'); // 10
  print('Element [1][2]: ${matriu[1][2]}'); // 60
  print('Element [2][1]: ${matriu[2][1]}'); // 80
  
  // Primera fila completa
  print('Primera fila: ${matriu[0]}');
}
```

**Diagrama d'índexs:**
```
      [0]  [1]  [2]
[0] [ 10,  20,  30 ]
[1] [ 40,  50,  60 ]
[2] [ 70,  80,  90 ]
```

---

### 4. Modificar Elements

```dart
void main() {
  List<List<int>> matriu = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  print('Original:');
  print(matriu);
  
  // Modificar elements
  matriu[0][0] = 100;
  matriu[1][1] = 500;
  matriu[2][2] = 900;
  
  print('\nModificat:');
  print(matriu);
}
```

---

### 5. Dimensions de la Matriu

```dart
void main() {
  List<List<int>> matriu = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12]
  ];
  
  int files = matriu.length;
  int columnes = matriu[0].length;
  
  print('Files: $files');
  print('Columnes: $columnes');
  print('Total elements: ${files * columnes}');
}
```

---

### 6. Omplir una Matriu

```dart
import 'dart:io';

void main() {
  print('Nombre de files:');
  int files = int.parse(stdin.readLineSync()!);
  
  print('Nombre de columnes:');
  int columnes = int.parse(stdin.readLineSync()!);
  
  // Crear matriu buida
  List<List<int>> matriu = List.generate(
    files,
    (i) => List.filled(columnes, 0)
  );
  
  // Omplir amb valors de l'usuari
  for (int i = 0; i < files; i++) {
    for (int j = 0; j < columnes; j++) {
      print('Element [$i][$j]:');
      matriu[i][j] = int.parse(stdin.readLineSync()!);
    }
  }
  
  // Mostrar matriu
  print('\nMatriu:');
  for (var fila in matriu) {
    print(fila);
  }
}
```

---

### 7. Mostrar Matriu en Format Taula

```dart
void mostrarMatriu(List<List<int>> matriu) {
  print('\n=== MATRIU ===');
  for (int i = 0; i < matriu.length; i++) {
    for (int j = 0; j < matriu[i].length; j++) {
      // Formatear amb espais
      stdout.write('${matriu[i][j].toString().padLeft(4)} ');
    }
    print('');
  }
  print('==============');
}

void main() {
  List<List<int>> matriu = [
    [1, 2, 3],
    [40, 50, 60],
    [700, 800, 900]
  ];
  
  mostrarMatriu(matriu);
}
```

**Sortida:**
```
=== MATRIU ===
   1    2    3 
  40   50   60 
 700  800  900 
==============
```

---

### 8. Recorregut amb Bucles Niuats

```dart
void main() {
  List<List<int>> matriu = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  print('Recorregut per files:');
  for (int i = 0; i < matriu.length; i++) {
    for (int j = 0; j < matriu[i].length; j++) {
      print('[$i][$j] = ${matriu[i][j]}');
    }
  }
}
```

---

### 9. Suma de Tots els Elements

```dart
int sumaMatriu(List<List<int>> matriu) {
  int suma = 0;
  
  for (int i = 0; i < matriu.length; i++) {
    for (int j = 0; j < matriu[i].length; j++) {
      suma += matriu[i][j];
    }
  }
  
  return suma;
}

void main() {
  List<List<int>> matriu = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  int total = sumaMatriu(matriu);
  print('Suma total: $total'); // 45
}
```

---

## Sessió 3-4: Operacions amb Matrius

### 1. Transposada d'una Matriu

!!! note "Transposada"
    La transposada intercanvia files per columnes.

```dart
List<List<int>> transposada(List<List<int>> matriu) {
  int files = matriu.length;
  int columnes = matriu[0].length;
  
  // Crear matriu transposada (columnes x files)
  List<List<int>> trans = List.generate(
    columnes,
    (i) => List.filled(files, 0)
  );
  
  for (int i = 0; i < files; i++) {
    for (int j = 0; j < columnes; j++) {
      trans[j][i] = matriu[i][j];
    }
  }
  
  return trans;
}

void main() {
  List<List<int>> matriu = [
    [1, 2, 3],
    [4, 5, 6]
  ];
  
  print('Original:');
  for (var fila in matriu) {
    print(fila);
  }
  
  List<List<int>> trans = transposada(matriu);
  
  print('\nTransposada:');
  for (var fila in trans) {
    print(fila);
  }
}
```

**Sortida:**
```
Original:
[1, 2, 3]
[4, 5, 6]

Transposada:
[1, 4]
[2, 5]
[3, 6]
```

---

### 2. Suma de Dues Matrius

```dart
List<List<int>>? sumarMatrius(List<List<int>> m1, List<List<int>> m2) {
  // Comprovar dimensions
  if (m1.length != m2.length || m1[0].length != m2[0].length) {
    print('❌ Les matrius han de tenir les mateixes dimensions');
    return null;
  }
  
  int files = m1.length;
  int columnes = m1[0].length;
  
  List<List<int>> resultat = List.generate(
    files,
    (i) => List.filled(columnes, 0)
  );
  
  for (int i = 0; i < files; i++) {
    for (int j = 0; j < columnes; j++) {
      resultat[i][j] = m1[i][j] + m2[i][j];
    }
  }
  
  return resultat;
}

void main() {
  List<List<int>> m1 = [
    [1, 2, 3],
    [4, 5, 6]
  ];
  
  List<List<int>> m2 = [
    [7, 8, 9],
    [10, 11, 12]
  ];
  
  List<List<int>>? suma = sumarMatrius(m1, m2);
  
  if (suma != null) {
    print('Resultat:');
    for (var fila in suma) {
      print(fila);
    }
  }
}
```

---

### 3. Trobar Màxim i Mínim

```dart
void main() {
  List<List<int>> matriu = [
    [45, 12, 78],
    [23, 91, 34],
    [67, 56, 89]
  ];
  
  int maxim = matriu[0][0];
  int minim = matriu[0][0];
  int maxI = 0, maxJ = 0;
  int minI = 0, minJ = 0;
  
  for (int i = 0; i < matriu.length; i++) {
    for (int j = 0; j < matriu[i].length; j++) {
      if (matriu[i][j] > maxim) {
        maxim = matriu[i][j];
        maxI = i;
        maxJ = j;
      }
      if (matriu[i][j] < minim) {
        minim = matriu[i][j];
        minI = i;
        minJ = j;
      }
    }
  }
  
  print('Màxim: $maxim a la posició [$maxI][$maxJ]');
  print('Mínim: $minim a la posició [$minI][$minJ]');
}
```

---

### 4. Diagonal Principal

!!! info "Diagonal Principal"
    Elements on l'índex de fila és igual a l'índex de columna: [0][0], [1][1], [2][2]...

```dart
void main() {
  List<List<int>> matriu = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  print('Diagonal principal:');
  for (int i = 0; i < matriu.length; i++) {
    print(matriu[i][i]);
  }
  
  // Suma de la diagonal
  int suma = 0;
  for (int i = 0; i < matriu.length; i++) {
    suma += matriu[i][i];
  }
  
  print('Suma diagonal: $suma');
}
```

---

### 5. Diagonal Secundària

!!! info "Diagonal Secundària"
    Elements on fila + columna = n-1: [0][2], [1][1], [2][0]

```dart
void main() {
  List<List<int>> matriu = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  int n = matriu.length;
  
  print('Diagonal secundària:');
  for (int i = 0; i < n; i++) {
    print(matriu[i][n - 1 - i]);
  }
}
```

---

### 6. Cercar Element

```dart
List<int>? cercarElement(List<List<int>> matriu, int valor) {
  for (int i = 0; i < matriu.length; i++) {
    for (int j = 0; j < matriu[i].length; j++) {
      if (matriu[i][j] == valor) {
        return [i, j];
      }
    }
  }
  return null;
}

void main() {
  List<List<int>> matriu = [
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90]
  ];
  
  int valor = 50;
  List<int>? posicio = cercarElement(matriu, valor);
  
  if (posicio != null) {
    print('$valor trobat a [${posicio[0]}][${posicio[1]}]');
  } else {
    print('$valor no trobat');
  }
}
```

---

## Sessió 5-6: Aplicacions Pràctiques

### 1. Taula de Multiplicar

```dart
void main() {
  const int mida = 10;
  
  // Crear matriu 10x10
  List<List<int>> taula = List.generate(
    mida,
    (i) => List.generate(mida, (j) => (i + 1) * (j + 1))
  );
  
  // Mostrar taula
  print('TAULA DE MULTIPLICAR (1-10)');
  print('============================');
  
  // Capçalera
  stdout.write('   ');
  for (int i = 1; i <= mida; i++) {
    stdout.write('${i.toString().padLeft(4)} ');
  }
  print('\n' + '-' * 55);
  
  // Files
  for (int i = 0; i < mida; i++) {
    stdout.write('${(i + 1).toString().padLeft(2)} |');
    for (int j = 0; j < mida; j++) {
      stdout.write('${taula[i][j].toString().padLeft(4)} ');
    }
    print('');
  }
}
```

---

### 2. Joc del Tres en Ratlla

```dart
import 'dart:io';

void mostrarTauler(List<List<String>> tauler) {
  print('\n  0   1   2');
  for (int i = 0; i < 3; i++) {
    stdout.write('$i ');
    for (int j = 0; j < 3; j++) {
      stdout.write(tauler[i][j]);
      if (j < 2) stdout.write(' | ');
    }
    print('');
    if (i < 2) print('  ---------');
  }
  print('');
}

bool comprovarGuanyador(List<List<String>> tauler, String jugador) {
  // Files
  for (int i = 0; i < 3; i++) {
    if (tauler[i][0] == jugador && 
        tauler[i][1] == jugador && 
        tauler[i][2] == jugador) {
      return true;
    }
  }
  
  // Columnes
  for (int j = 0; j < 3; j++) {
    if (tauler[0][j] == jugador && 
        tauler[1][j] == jugador && 
        tauler[2][j] == jugador) {
      return true;
    }
  }
  
  // Diagonals
  if (tauler[0][0] == jugador && 
      tauler[1][1] == jugador && 
      tauler[2][2] == jugador) {
    return true;
  }
  
  if (tauler[0][2] == jugador && 
      tauler[1][1] == jugador && 
      tauler[2][0] == jugador) {
    return true;
  }
  
  return false;
}

void main() {
  List<List<String>> tauler = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ];
  
  String jugadorActual = 'X';
  int moviments = 0;
  bool jocAcabat = false;
  
  print('🎮 TRES EN RATLLA');
  
  while (!jocAcabat && moviments < 9) {
    mostrarTauler(tauler);
    
    print('Torn del jugador $jugadorActual');
    print('Fila (0-2):');
    int fila = int.parse(stdin.readLineSync()!);
    
    print('Columna (0-2):');
    int columna = int.parse(stdin.readLineSync()!);
    
    // Comprovar si la casella està buida
    if (fila >= 0 && fila < 3 && columna >= 0 && columna < 3) {
      if (tauler[fila][columna] == ' ') {
        tauler[fila][columna] = jugadorActual;
        moviments++;
        
        // Comprovar guanyador
        if (comprovarGuanyador(tauler, jugadorActual)) {
          mostrarTauler(tauler);
          print('🎉 Ha guanyat el jugador $jugadorActual!');
          jocAcabat = true;
        } else {
          // Canviar jugador
          jugadorActual = (jugadorActual == 'X') ? 'O' : 'X';
        }
      } else {
        print('❌ Casella ocupada!');
      }
    } else {
      print('❌ Posició invàlida!');
    }
  }
  
  if (!jocAcabat) {
    mostrarTauler(tauler);
    print('🤝 Empat!');
  }
}
```

---

### 3. Cinema: Reserva de Seients

```dart
import 'dart:io';

void mostrarSeients(List<List<String>> seients) {
  print('\n=== CINEMA ===');
  print('  1 2 3 4 5 6 7 8');
  
  for (int i = 0; i < seients.length; i++) {
    stdout.write('${String.fromCharCode(65 + i)} ');
    for (int j = 0; j < seients[i].length; j++) {
      stdout.write('${seients[i][j]} ');
    }
    print('');
  }
  
  print('\nLlegenda: O = Lliure, X = Ocupat');
}

void main() {
  // Crear sala 5x8 (5 files, 8 columnes)
  List<List<String>> seients = List.generate(
    5,
    (i) => List.filled(8, 'O')
  );
  
  bool continuar = true;
  
  while (continuar) {
    mostrarSeients(seients);
    
    print('\n1. Reservar seient');
    print('2. Cancel·lar reserva');
    print('3. Sortir');
    print('Opció:');
    
    int opcio = int.parse(stdin.readLineSync()!);
    
    if (opcio == 1 || opcio == 2) {
      print('Fila (A-E):');
      String filaChar = stdin.readLineSync()!.toUpperCase();
      int fila = filaChar.codeUnitAt(0) - 65;
      
      print('Columna (1-8):');
      int columna = int.parse(stdin.readLineSync()!) - 1;
      
      if (fila >= 0 && fila < 5 && columna >= 0 && columna < 8) {
        if (opcio == 1) {
          if (seients[fila][columna] == 'O') {
            seients[fila][columna] = 'X';
            print('✅ Seient reservat');
          } else {
            print('❌ Seient ja ocupat');
          }
        } else {
          if (seients[fila][columna] == 'X') {
            seients[fila][columna] = 'O';
            print('✅ Reserva cancel·lada');
          } else {
            print('❌ Seient no estava reservat');
          }
        }
      } else {
        print('❌ Posició invàlida');
      }
    } else if (opcio == 3) {
      continuar = false;
    }
  }
}
```

---

### 4. Busca Mines Simplificat

```dart
import 'dart:io';
import 'dart:math';

void crearTauler(List<List<String>> tauler, List<List<bool>> mines, int numMines) {
  Random random = Random();
  int mines Posades = 0;
  
  while (minesPosades < numMines) {
    int fila = random.nextInt(tauler.length);
    int col = random.nextInt(tauler[0].length);
    
    if (!mines[fila][col]) {
      mines[fila][col] = true;
      minesPosades++;
    }
  }
}

void mostrarTauler(List<List<String>> tauler) {
  print('\n  1 2 3 4 5');
  for (int i = 0; i < tauler.length; i++) {
    stdout.write('${i + 1} ');
    for (int j = 0; j < tauler[i].length; j++) {
      stdout.write('${tauler[i][j]} ');
    }
    print('');
  }
}

void main() {
  const int files = 5;
  const int cols = 5;
  const int numMines = 5;
  
  List<List<String>> tauler = List.generate(
    files,
    (i) => List.filled(cols, '■')
  );
  
  List<List<bool>> mines = List.generate(
    files,
    (i) => List.filled(cols, false)
  );
  
  crearTauler(tauler, mines, numMines);
  
  print('💣 BUSCA MINES');
  print('Hi ha $numMines mines amagades!');
  
  int moviments = 0;
  int minesDescobertess = 0;
  bool perdut = false;
  
  while (!perdut && minesTrobades < numMines) {
    mostrarTauler(tauler);
    
    print('\nFila (1-5):');
    int fila = int.parse(stdin.readLineSync()!) - 1;
    
    print('Columna (1-5):');
    int col = int.parse(stdin.readLineSync()!) - 1;
    
    if (fila >= 0 && fila < files && col >= 0 && cols) {
      if (tauler[fila][col] == '■') {
        moviments++;
        
        if (mines[fila][col]) {
          tauler[fila][col] = '💣';
          minesTrobades++;
          print('✅ Has trobat una mina! ($minesTrobades/$numMines)');
        } else {
          tauler[fila][col] = ' ';
          print('❌ Buit!');
        }
      } else {
        print('⚠️  Ja has descobert aquesta casella');
      }
    } else {
      print('❌ Posició invàlida');
    }
  }
  
  // Mostrar tauler final
  for (int i = 0; i < files; i++) {
    for (int j = 0; j < cols; j++) {
      if (mines[i][j]) {
        tauler[i][j] = '💣';
      }
    }
  }
  
  mostrarTauler(tauler);
  print('\n🎉 Has trobat totes les mines en $moviments moviments!');
}
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Què mostrarà?

```dart
void main() {
  List<List<int>> m = [
    [1, 2, 3],
    [4, 5, 6]
  ];
  
  print(m[1][2]);
  print(m.length);
  print(m[0].length);
}
```

??? success "Solució"
    ```
    6
    2
    3
    ```
    - m[1][2] = 6
    - m.length = 2 files
    - m[0].length = 3 columnes

---

### 🎯 Activitat 2: Completa el codi

```dart
void main() {
  List<List<int>> m = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  int suma = 0;
  for (int i = 0; i < _____; i++) {
    suma += m[i][_____];
  }
  
  print(suma); // Ha de mostrar 15 (diagonal)
}
```

??? success "Solució"
    ```dart
    for (int i = 0; i < m.length; i++) {
      suma += m[i][i];
    }
    ```

---

### 🎯 Activitat 3: Troba l'error

```dart
void main() {
  List<List<int>> m = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];
  
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      print(m[i][j]);
    }
  }
}
```

??? success "Solució"
    Els límits dels bucles estan invertits:
    
    ```dart
    for (int i = 0; i < 3; i++) {      // 3 files
      for (int j = 0; j < 2; j++) {    // 2 columnes
        print(m[i][j]);
      }
    }
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Matriu identitat

Crea una matriu identitat de mida N (1s a la diagonal, 0s a la resta).

??? success "Solució"
    ```dart
    List<List<int>> matriuIdentitat(int n) {
      List<List<int>> identitat = List.generate(
        n,
        (i) => List.filled(n, 0)
      );
      
      for (int i = 0; i < n; i++) {
        identitat[i][i] = 1;
      }
      
      return identitat;
    }
    
    void main() {
      var m = matriuIdentitat(4);
      for (var fila in m) {
        print(fila);
      }
    }
    ```

---

### Exercici 2: És simètrica?

Comprova si una matriu és simètrica (igual a la seva transposada).

??? success "Solució"
    ```dart
    bool esSimetrica(List<List<int>> matriu) {
      int n = matriu.length;
      
      // Ha de ser quadrada
      if (n != matriu[0].length) return false;
      
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
          if (matriu[i][j] != matriu[j][i]) {
            return false;
          }
        }
      }
      
      return true;
    }
    
    void main() {
      List<List<int>> m1 = [
        [1, 2, 3],
        [2, 4, 5],
        [3, 5, 6]
      ];
      
      print('És simètrica? ${esSimetrica(m1)}');
    }
    ```

---

### Exercici 3: Suma per files i columnes

Calcula la suma de cada fila i cada columna.

??? success "Solució"
    ```dart
    void sumesFilesColumnes(List<List<int>> matriu) {
      int files = matriu.length;
      int cols = matriu[0].length;
      
      print('Suma per files:');
      for (int i = 0; i < files; i++) {
        int suma = 0;
        for (int j = 0; j < cols; j++) {
          suma += matriu[i][j];
        }
        print('Fila $i: $suma');
      }
      
      print('\nSuma per columnes:');
      for (int j = 0; j < cols; j++) {
        int suma = 0;
        for (int i = 0; i < files; i++) {
          suma += matriu[i][j];
        }
        print('Columna $j: $suma');
      }
    }
    
    void main() {
      List<List<int>> m = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      
      sumesFilesColumnes(m);
    }
    ```

---

## 🏠 Deures

### Repte 1: Multiplicació de matrius
Implementa la multiplicació de dues matrius.

### Repte 2: Espiral
Ompli una matriu en forma d'espiral.

### Repte 3: Sudoku validator
Comprova si un Sudoku és vàlid.

### Repte 4: Joc de la vida (Conway)
Implementa una iteració del Game of Life.

### Repte 5: Batalla naval
Crea un joc complet de batalla naval.

---

## 📝 Resum

!!! summary "Conceptes clau de la Setmana 6"
    **Matrius:**
    - ✅ Estructura bidimensional (files × columnes)
    - ✅ Accés: `matriu[fila][columna]`
    - ✅ Declaració: `List<List<tipus>>`
    
    **Recorregut:**
    - ✅ Bucles niuats (for dins de for)
    - ✅ Bucle extern → files
    - ✅ Bucle intern → columnes
    
    **Operacions:**
    - ✅ Transposada, suma, cerca
    - ✅ Diagonals (principal i secundària)
    - ✅ Màxim, mínim, suma total
    
    **Aplicacions:**
    - ✅ Taulers de joc
    - ✅ Taules de dades
    - ✅ Representació d'espais 2D

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Com s'accedeix a l'element de la fila 2, columna 3?
    
    a) `matriu[3][2]`  
    b) `matriu[2][3]`  
    c) `matriu(2, 3)`  
    d) `matriu.get(2, 3)`

??? success "Resposta"
    **b) matriu[2][3]** - Sempre [fila][columna]

!!! question "Pregunta 2"
    Quants elements té una matriu 4x5?
    
    a) 9  
    b) 20  
    c) 4  
    d) 5

??? success "Resposta"
    **b) 20** - 4 files × 5 columnes = 20 elements

!!! question "Pregunta 3"
    Quina és la diagonal principal d'una matriu 3x3?
    
    a) [0][0], [0][1], [0][2]  
    b) [0][0], [1][1], [2][2]  
    c) [2][0], [1][1], [0][2]  
    d) [0][2], [1][2], [2][2]

??? success "Resposta"
    **b) [0][0], [1][1], [2][2]** - On fila == columna

---

!!! success "Has completat la Setmana 6! 🎉"
    Ara domines les matrius. A la setmana 7 consolidaràs tots els coneixements amb un projecte final!
