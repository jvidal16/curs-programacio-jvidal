# Setmana 5: Arrays Unidimensionals (Llistes)

## Objectius d'aprenentatge
- Comprendre el concepte de llista
- Declarar i inicialitzar llistes
- Accedir i modificar elements
- Utilitzar mètodes de llistes
- Recórrer llistes amb bucles
- Implementar algoritmes amb llistes

---

## Sessió 1-2: Introducció a les Llistes

### 1. Què és una Llista?

!!! note "Definició"
    Una **llista** (o array) és una estructura de dades que emmagatzema múltiples valors del **mateix tipus** en una sola variable.

**Característiques:**
- 📦 Emmagatzema múltiples elements
- 🔢 Elements accessibles per índex (comença en 0)
- 📏 Té una longitud (nombre d'elements)
- 🎯 Tots els elements del mateix tipus

---

### 2. Declaració i Inicialització

#### Declaració amb valors inicials

```dart
void main() {
  // Llista d'enters
  List<int> numeros = [1, 2, 3, 4, 5];
  
  // Llista de textos
  List<String> noms = ['Anna', 'Marc', 'Laura'];
  
  // Llista de decimals
  List<double> preus = [9.99, 19.99, 29.99];
  
  // Llista de booleans
  List<bool> valors = [true, false, true, true];
  
  print(numeros);
  print(noms);
}
```

**Sortida:**
```
[1, 2, 3, 4, 5]
[Anna, Marc, Laura]
```

---

#### Llista buida

```dart
void main() {
  // Llista buida amb tipus
  List<int> numeros = [];
  
  // O usant el constructor
  List<String> noms = List.empty(growable: true);
  
  print('Llista buida: $numeros');
}
```

---

#### Llista amb longitud fixa

```dart
void main() {
  // Llista de 5 elements (inicialment null)
  List<int?> numeros = List.filled(5, null);
  
  // Llista de 3 elements amb valor 0
  List<int> zeros = List.filled(3, 0);
  
  print(zeros); // [0, 0, 0]
}
```

---

### 3. Accés a Elements

Els índexs comencen en **0**:

```dart
void main() {
  List<String> dies = ['Dilluns', 'Dimarts', 'Dimecres', 'Dijous', 'Divendres'];
  
  // Accedir a elements
  print('Primer dia: ${dies[0]}');     // Dilluns
  print('Tercer dia: ${dies[2]}');     // Dimecres
  print('Últim dia: ${dies[4]}');      // Divendres
  
  // També podem usar índex negatiu des del final
  print('Últim: ${dies[dies.length - 1]}');
}
```

**Diagrama:**
```
índex:    0         1         2         3         4
dies:  [Dilluns | Dimarts | Dimecres | Dijous | Divendres]
```

---

### 4. Modificar Elements

```dart
void main() {
  List<int> numeros = [10, 20, 30, 40, 50];
  
  print('Original: $numeros');
  
  // Modificar un element
  numeros[0] = 100;
  numeros[2] = 300;
  
  print('Modificat: $numeros');
}
```

**Sortida:**
```
Original: [10, 20, 30, 40, 50]
Modificat: [100, 20, 300, 40, 50]
```

---

### 5. Propietats de les Llistes

```dart
void main() {
  List<int> numeros = [10, 20, 30, 40, 50];
  
  // Longitud
  print('Longitud: ${numeros.length}');
  
  // Està buida?
  print('Està buida? ${numeros.isEmpty}');
  
  // No està buida?
  print('Té elements? ${numeros.isNotEmpty}');
  
  // Primer i últim element
  print('Primer: ${numeros.first}');
  print('Últim: ${numeros.last}');
}
```

**Sortida:**
```
Longitud: 5
Està buida? false
Té elements? true
Primer: 10
Últim: 50
```

---

### 6. Recorregut amb Bucle for

```dart
void main() {
  List<int> numeros = [10, 20, 30, 40, 50];
  
  // Amb índex
  for (int i = 0; i < numeros.length; i++) {
    print('Element $i: ${numeros[i]}');
  }
}
```

**Sortida:**
```
Element 0: 10
Element 1: 20
Element 2: 30
Element 3: 40
Element 4: 50
```

---

### 7. Recorregut amb for-in

```dart
void main() {
  List<String> fruites = ['Poma', 'Plàtan', 'Taronja', 'Maduixa'];
  
  // for-in (més senzill quan no necessitem l'índex)
  for (String fruita in fruites) {
    print('M\'agrada la $fruita');
  }
}
```

**Sortida:**
```
M'agrada la Poma
M'agrada la Plàtan
M'agrada la Taronja
M'agrada la Maduixa
```

---

### 8. Trobar Màxim i Mínim

```dart
import 'dart:io';

void main() {
  List<int> numeros = [45, 12, 78, 23, 91, 34];
  
  int maxim = numeros[0];
  int minim = numeros[0];
  
  for (int numero in numeros) {
    if (numero > maxim) {
      maxim = numero;
    }
    if (numero < minim) {
      minim = numero;
    }
  }
  
  print('Màxim: $maxim');
  print('Mínim: $minim');
}
```

---

### 9. Comptar Elements Parells i Senars

```dart
void main() {
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  int parells = 0;
  int senars = 0;
  
  for (int numero in numeros) {
    if (numero % 2 == 0) {
      parells++;
    } else {
      senars++;
    }
  }
  
  print('Parells: $parells');
  print('Senars: $senars');
}
```

---

## Sessió 3-4: Mètodes de Llistes

### 1. Afegir Elements

```dart
void main() {
  List<String> noms = ['Anna', 'Marc'];
  
  print('Inicial: $noms');
  
  // Afegir al final
  noms.add('Laura');
  print('Després d\'afegir Laura: $noms');
  
  // Afegir múltiples elements
  noms.addAll(['Joan', 'Maria']);
  print('Després d\'afegir més: $noms');
  
  // Inserir en una posició específica
  noms.insert(1, 'Pere');
  print('Després d\'inserir Pere: $noms');
}
```

**Sortida:**
```
Inicial: [Anna, Marc]
Després d'afegir Laura: [Anna, Marc, Laura]
Després d'afegir més: [Anna, Marc, Laura, Joan, Maria]
Després d'inserir Pere: [Anna, Pere, Marc, Laura, Joan, Maria]
```

---

### 2. Eliminar Elements

```dart
void main() {
  List<int> numeros = [10, 20, 30, 40, 50];
  
  print('Inicial: $numeros');
  
  // Eliminar per valor
  numeros.remove(30);
  print('Després d\'eliminar 30: $numeros');
  
  // Eliminar per índex
  numeros.removeAt(0);
  print('Després d\'eliminar índex 0: $numeros');
  
  // Eliminar l'últim
  numeros.removeLast();
  print('Després d\'eliminar l\'últim: $numeros');
  
  // Esborrar tot
  numeros.clear();
  print('Després de clear: $numeros');
}
```

---

### 3. Cercar Elements

```dart
void main() {
  List<String> fruites = ['Poma', 'Plàtan', 'Taronja', 'Maduixa'];
  
  // Conté un element?
  print('Conté Plàtan? ${fruites.contains('Plàtan')}');
  print('Conté Pera? ${fruites.contains('Pera')}');
  
  // Posició d'un element
  print('Posició de Taronja: ${fruites.indexOf('Taronja')}');
  print('Posició de Pera: ${fruites.indexOf('Pera')}'); // -1 si no existeix
}
```

---

### 4. Ordenar Llistes

```dart
void main() {
  List<int> numeros = [45, 12, 78, 23, 91, 34];
  List<String> noms = ['Marc', 'Anna', 'Zoe', 'Berta'];
  
  print('Números originals: $numeros');
  numeros.sort();
  print('Números ordenats: $numeros');
  
  print('\nNoms originals: $noms');
  noms.sort();
  print('Noms ordenats: $noms');
}
```

**Sortida:**
```
Números originals: [45, 12, 78, 23, 91, 34]
Números ordenats: [12, 23, 34, 45, 78, 91]

Noms originals: [Marc, Anna, Zoe, Berta]
Noms ordenats: [Anna, Berta, Marc, Zoe]
```

---

### 5. Invertir l'Ordre

```dart
void main() {
  List<int> numeros = [1, 2, 3, 4, 5];
  
  print('Original: $numeros');
  
  List<int> invertit = numeros.reversed.toList();
  print('Invertit: $invertit');
}
```

---

### 6. Subllistes

```dart
void main() {
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Obtenir una subllista (des de índex inici fins final-1)
  List<int> subllista = numeros.sublist(2, 5);
  print('Subllista (2 a 5): $subllista'); // [3, 4, 5]
  
  // Primers 3 elements
  List<int> primers = numeros.sublist(0, 3);
  print('Primers 3: $primers');
}
```

---

## Sessió 5-6: Algorismes amb Llistes

### 1. Suma i Mitjana

```dart
import 'dart:io';

void main() {
  print('Quants números vols introduir?');
  int n = int.parse(stdin.readLineSync()!);
  
  List<double> numeros = [];
  
  for (int i = 0; i < n; i++) {
    print('Número ${i + 1}:');
    numeros.add(double.parse(stdin.readLineSync()!));
  }
  
  // Calcular suma
  double suma = 0;
  for (double num in numeros) {
    suma += num;
  }
  
  // Calcular mitjana
  double mitjana = suma / numeros.length;
  
  print('\n=== RESULTATS ===');
  print('Números: $numeros');
  print('Suma: $suma');
  print('Mitjana: ${mitjana.toStringAsFixed(2)}');
}
```

---

### 2. Gestió de Notes

```dart
import 'dart:io';

void main() {
  List<double> notes = [];
  bool continuar = true;
  
  while (continuar) {
    print('\n=== GESTIÓ DE NOTES ===');
    print('1. Afegir nota');
    print('2. Mostrar notes');
    print('3. Calcular mitjana');
    print('4. Eliminar nota');
    print('5. Sortir');
    print('Opció:');
    
    int opcio = int.parse(stdin.readLineSync()!);
    
    switch (opcio) {
      case 1:
        print('Nota (0-10):');
        double nota = double.parse(stdin.readLineSync()!);
        if (nota >= 0 && nota <= 10) {
          notes.add(nota);
          print('✅ Nota afegida');
        } else {
          print('❌ Nota invàlida');
        }
        break;
        
      case 2:
        if (notes.isEmpty) {
          print('No hi ha notes');
        } else {
          print('Notes: $notes');
        }
        break;
        
      case 3:
        if (notes.isEmpty) {
          print('No hi ha notes per calcular');
        } else {
          double suma = 0;
          for (double nota in notes) {
            suma += nota;
          }
          print('Mitjana: ${(suma / notes.length).toStringAsFixed(2)}');
        }
        break;
        
      case 4:
        if (notes.isEmpty) {
          print('No hi ha notes per eliminar');
        } else {
          print('Índex a eliminar (0-${notes.length - 1}):');
          int index = int.parse(stdin.readLineSync()!);
          if (index >= 0 && index < notes.length) {
            notes.removeAt(index);
            print('✅ Nota eliminada');
          } else {
            print('❌ Índex invàlid');
          }
        }
        break;
        
      case 5:
        continuar = false;
        print('Adéu!');
        break;
        
      default:
        print('❌ Opció no vàlida');
    }
  }
}
```

---

### 3. Eliminar Duplicats

```dart
void main() {
  List<int> numeros = [1, 2, 2, 3, 4, 4, 4, 5, 6, 6];
  
  print('Original: $numeros');
  
  // Usar Set per eliminar duplicats
  List<int> senseD uplicats = numeros.toSet().toList();
  
  print('Sense duplicats: $senseDuplicats');
}
```

---

### 4. Fusionar Dues Llistes Ordenades

```dart
List<int> fusionarOrdenades(List<int> llista1, List<int> llista2) {
  List<int> resultat = [];
  int i = 0, j = 0;
  
  while (i < llista1.length && j < llista2.length) {
    if (llista1[i] < llista2[j]) {
      resultat.add(llista1[i]);
      i++;
    } else {
      resultat.add(llista2[j]);
      j++;
    }
  }
  
  // Afegir elements restants
  while (i < llista1.length) {
    resultat.add(llista1[i]);
    i++;
  }
  
  while (j < llista2.length) {
    resultat.add(llista2[j]);
    j++;
  }
  
  return resultat;
}

void main() {
  List<int> llista1 = [1, 3, 5, 7, 9];
  List<int> llista2 = [2, 4, 6, 8, 10];
  
  List<int> fusionada = fusionarOrdenades(llista1, llista2);
  
  print('Llista 1: $llista1');
  print('Llista 2: $llista2');
  print('Fusionada: $fusionada');
}
```

---

### 5. Cerca Seqüencial

```dart
int cercaSeq uencial(List<int> llista, int valor) {
  for (int i = 0; i < llista.length; i++) {
    if (llista[i] == valor) {
      return i; // Retorna la posició
    }
  }
  return -1; // No trobat
}

void main() {
  List<int> numeros = [45, 12, 78, 23, 91, 34];
  
  int valor = 78;
  int posicio = cercaSequencial(numeros, valor);
  
  if (posicio != -1) {
    print('$valor trobat a la posició $posicio');
  } else {
    print('$valor no trobat');
  }
}
```

---

### 6. Cerca Binària

!!! info "Cerca Binària"
    Només funciona amb llistes **ordenades**. És molt més ràpida que la cerca seqüencial.

```dart
int cercaBinaria(List<int> llista, int valor) {
  int esquerra = 0;
  int dreta = llista.length - 1;
  
  while (esquerra <= dreta) {
    int mig = (esquerra + dreta) ~/ 2;
    
    if (llista[mig] == valor) {
      return mig;
    } else if (llista[mig] < valor) {
      esquerra = mig + 1;
    } else {
      dreta = mig - 1;
    }
  }
  
  return -1;
}

void main() {
  List<int> numeros = [12, 23, 34, 45, 78, 91]; // Ordenada!
  
  int valor = 45;
  int posicio = cercaBinaria(numeros, valor);
  
  if (posicio != -1) {
    print('$valor trobat a la posició $posicio');
  } else {
    print('$valor no trobat');
  }
}
```

---

### 7. Filtrar Elements

```dart
void main() {
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Filtrar només parells
  List<int> parells = numeros.where((n) => n % 2 == 0).toList();
  
  // Filtrar només majors que 5
  List<int> majors = numeros.where((n) => n > 5).toList();
  
  print('Original: $numeros');
  print('Parells: $parells');
  print('Majors que 5: $majors');
}
```

---

### 8. Transformar Elements (map)

```dart
void main() {
  List<int> numeros = [1, 2, 3, 4, 5];
  
  // Duplicar cada element
  List<int> duplicats = numeros.map((n) => n * 2).toList();
  
  // Elevar al quadrat
  List<int> quadrats = numeros.map((n) => n * n).toList();
  
  print('Original: $numeros');
  print('Duplicats: $duplicats');
  print('Quadrats: $quadrats');
}
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Què mostrarà?

```dart
void main() {
  List<int> numeros = [10, 20, 30, 40, 50];
  numeros[2] = 300;
  numeros.add(60);
  print(numeros.length);
}
```

??? success "Solució"
    **6**
    
    - Modifica l'element 2: [10, 20, 300, 40, 50]
    - Afegeix 60: [10, 20, 300, 40, 50, 60]
    - Longitud: 6

---

### 🎯 Activitat 2: Troba l'error

```dart
void main() {
  List<int> numeros = [1, 2, 3];
  print(numeros[3]);
}
```

??? success "Solució"
    **Error: Índex fora de rang**
    
    La llista té índexs 0, 1, 2. L'índex 3 no existeix.
    
    Correcte:
    ```dart
    print(numeros[2]); // Últim element
    ```

---

### 🎯 Activitat 3: Completa el codi

```dart
void main() {
  List<int> numeros = [5, 10, 15, 20, 25];
  
  int suma = 0;
  for (_____ num in _____) {
    suma _____ num;
  }
  
  print(suma);
}
```

??? success "Solució"
    ```dart
    for (int num in numeros) {
      suma += num;
    }
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Invertir llista manualment

Sense usar `.reversed`, crea una funció que inverteixi una llista.

??? success "Solució"
    ```dart
    List<int> invertir(List<int> llista) {
      List<int> invertida = [];
      for (int i = llista.length - 1; i >= 0; i--) {
        invertida.add(llista[i]);
      }
      return invertida;
    }
    
    void main() {
      List<int> original = [1, 2, 3, 4, 5];
      List<int> invertida = invertir(original);
      print('Original: $original');
      print('Invertida: $invertida');
    }
    ```

---

### Exercici 2: Comptar ocurrències

Compta quantes vegades apareix un valor en una llista.

??? success "Solució"
    ```dart
    int comptarOcurrencies(List<int> llista, int valor) {
      int comptador = 0;
      for (int num in llista) {
        if (num == valor) {
          comptador++;
        }
      }
      return comptador;
    }
    
    void main() {
      List<int> numeros = [1, 2, 3, 2, 4, 2, 5];
      int valor = 2;
      print('El $valor apareix ${comptarOcurrencies(numeros, valor)} vegades');
    }
    ```

---

### Exercici 3: Segona posició d'un element

Troba la segona ocurrència d'un valor.

??? success "Solució"
    ```dart
    int segonaOcurrencia(List<int> llista, int valor) {
      int comptador = 0;
      for (int i = 0; i < llista.length; i++) {
        if (llista[i] == valor) {
          comptador++;
          if (comptador == 2) {
            return i;
          }
        }
      }
      return -1;
    }
    
    void main() {
      List<int> numeros = [1, 2, 3, 2, 4, 2, 5];
      print('Segona ocurrència de 2: ${segonaOcurrencia(numeros, 2)}');
    }
    ```

---

### Exercici 4: Desplaçar elements

Desplaça tots els elements una posició a la dreta.

??? success "Solució"
    ```dart
    List<int> desplacarDreta(List<int> llista) {
      if (llista.isEmpty) return llista;
      
      int ultim = llista.last;
      List<int> nova = [ultim];
      
      for (int i = 0; i < llista.length - 1; i++) {
        nova.add(llista[i]);
      }
      
      return nova;
    }
    
    void main() {
      List<int> original = [1, 2, 3, 4, 5];
      List<int> desplaçada = desplacarDreta(original);
      print('Original: $original');
      print('Desplaçada: $desplaçada'); // [5, 1, 2, 3, 4]
    }
    ```

---

### Exercici 5: Intersecció de dues llistes

Troba els elements comuns entre dues llistes.

??? success "Solució"
    ```dart
    List<int> interseccio(List<int> llista1, List<int> llista2) {
      List<int> comuns = [];
      
      for (int num in llista1) {
        if (llista2.contains(num) && !comuns.contains(num)) {
          comuns.add(num);
        }
      }
      
      return comuns;
    }
    
    void main() {
      List<int> llista1 = [1, 2, 3, 4, 5];
      List<int> llista2 = [3, 4, 5, 6, 7];
      
      List<int> comuns = interseccio(llista1, llista2);
      print('Llista 1: $llista1');
      print('Llista 2: $llista2');
      print('Intersecció: $comuns'); // [3, 4, 5]
    }
    ```

---

## 🏠 Deures

### Repte 1: Sistema de votació
Crea un sistema que permeti votar opcions i mostri resultats.

### Repte 2: Estadístiques de llista
Calcula: mitjana, mediana, moda, rang i desviació estàndard.

### Repte 3: Rotació de llista
Rota una llista N posicions a la dreta o esquerra.

### Repte 4: Ordenació bombolla
Implementa l'algoritme bubble sort.

### Repte 5: Joc de memòria
Crea un joc on l'usuari ha de memoritzar una seqüència de números.

---

## 📝 Resum

!!! summary "Conceptes clau de la Setmana 5"
    **Llistes:**
    - ✅ Col·lecció ordenada d'elements del mateix tipus
    - ✅ Índexs comencen en 0
    - ✅ Longitud dinàmica (poden créixer/decreixer)
    
    **Operacions bàsiques:**
    - ✅ Accés: `llista[index]`
    - ✅ Modificar: `llista[index] = valor`
    - ✅ Afegir: `.add()`, `.insert()`
    - ✅ Eliminar: `.remove()`, `.removeAt()`
    
    **Recorregut:**
    - ✅ for amb índex
    - ✅ for-in
    
    **Mètodes útils:**
    - ✅ `.length`, `.isEmpty`, `.isNotEmpty`
    - ✅ `.sort()`, `.reversed`
    - ✅ `.contains()`, `.indexOf()`
    - ✅ `.where()`, `.map()`

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin és l'índex del primer element d'una llista?
    
    a) 1  
    b) 0  
    c) -1  
    d) Depèn de la llista

??? success "Resposta"
    **b) 0** - Els índexs sempre comencen en 0

!!! question "Pregunta 2"
    Com s'afegeix un element al final d'una llista?
    
    a) `.insert()`  
    b) `.add()`  
    c) `.push()`  
    d) `.append()`

??? success "Resposta"
    **b) .add()** - Afegeix un element al final

!!! question "Pregunta 3"
    Quina cerca és més ràpida en llistes ordenades?
    
    a) Seqüencial  
    b) Binària  
    c) Són igual de ràpides  
    d) Depèn de la mida

??? success "Resposta"
    **b) Binària** - Molt més ràpida en llistes ordenades

---

!!! success "Has completat la Setmana 5! 🎉"
    Ara domines les llistes unidimensionals. A la setmana 6 aprendràs sobre matrius (arrays bidimensionals).
