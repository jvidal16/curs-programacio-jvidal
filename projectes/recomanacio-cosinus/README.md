# Sistema de Recomanació amb Similaritat Cosinus

Projecte educatiu per aprendre sobre sistemes de recomanació utilitzant la similaritat cosinus.

## Descripció

Aquest projecte implementa un sistema de recomanació de pel·lícules basat en la similaritat cosinus entre usuaris. El sistema:

- Calcula la similaritat entre usuaris basant-se en les seves avaluacions
- Troba els usuaris més similars a un usuari donat
- Recomana pel·lícules basant-se en les preferències d'usuaris similars

## Conceptes matemàtics

### Similaritat Cosinus

La similaritat cosinus mesura l'angle entre dos vectors:
```
similaritat = (A · B) / (||A|| × ||B||)
```

On:
- `A · B` és el producte escalar dels vectors
- `||A||` i `||B||` són les normes (magnituds) dels vectors

### Valors de similaritat

- **1.0**: Vectors idèntics o proporcionals (molt similars)
- **0.0**: Vectors ortogonals (sense relació)
- **-1.0**: Vectors oposats (preferències oposades)

## Estructura del projecte
```
similaritat_cosinus/
├── bin/
│   └── main.dart          # Programa principal
├── lib/
│   └── similaritat_cosinus.dart  # Funcions del sistema
├── test/
│   └── similaritat_cosinus_test.dart  # Tests unitaris
├── pubspec.yaml           # Configuració del projecte
└── README.md             # Aquest fitxer
```

## Instal·lació

1. Assegura't de tenir [Dart SDK](https://dart.dev/get-dart) instal·lat
2. Clona o descarrega aquest projecte
3. Instal·la les dependències:
```bash
dart pub get
```

## Execució

### Executar el programa principal
```bash
dart run bin/main.dart
```

### Executar els tests
```bash
# Tots els tests
dart test

# Tests amb més detall
dart test --reporter expanded

# Tests amb cobertura
dart test --coverage=coverage
```

## Funcions principals

### Funcions matemàtiques bàsiques

- `calcularNorma(vector)`: Calcula la magnitud d'un vector
- `calcularProducteEscalar(vectorA, vectorB)`: Producte escalar entre vectors
- `calcularSimilaritatCosinus(vectorA, vectorB)`: Similaritat cosinus

### Operacions amb matrius

- `transposarMatriu(matriu)`: Canvia files per columnes
- `obtenirFila(matriu, index)`: Extreu una fila
- `obtenirColumna(matriu, index)`: Extreu una columna

### Sistema de recomanació

- `trobarUsuarisSimilars(matriuUsuaris, usuariId, numResultats)`: Troba usuaris similars
- `recomanarPellicules(matriuAvaluacions, usuariId, numRecomanacions)`: Recomana pel·lícules

## Exemple d'ús
```dart
import 'package:similaritat_cosinus/similaritat_cosinus.dart';

void main() {
  // Matriu d'avaluacions: 5 pel·lícules × 4 usuaris
  List<List<double>> avaluacions = [
    [5.0, 4.0, 1.0, 0.0], // Movie0
    [4.0, 5.0, 2.0, 1.0], // Movie1
    [1.0, 1.0, 5.0, 4.0], // Movie2
    [0.0, 2.0, 4.0, 5.0], // Movie3
    [2.0, 0.0, 3.0, 4.0], // Movie4
  ];
  
  // Transposar per obtenir vectors d'usuaris
  List<List<double>> usuaris = transposarMatriu(avaluacions);
  
  // Trobar usuaris similars a l'usuari 0
  List<List<double>> similars = trobarUsuarisSimilars(usuaris, 0, 3);
  
  for (var resultat in similars) {
    int usuariId = resultat[0].toInt();
    double similaritat = resultat[1];
    print("Usuari $usuariId: similaritat ${similaritat.toStringAsFixed(4)}");
  }
  
  // Recomanar pel·lícules
  List<List<double>> recomanacions = recomanarPellicules(avaluacions, 0, 3);
  
  for (var rec in recomanacions) {
    int pelliId = rec[0].toInt();
    double puntuacio = rec[1];
    print("Pel·lícula $pelliId: puntuació ${puntuacio.toStringAsFixed(2)}");
  }
}
```

## Exercicis per als estudiants

### Nivell bàsic

1. Modifica `obtenirDadesPetites()` per afegir més usuaris i pel·lícules
2. Canvia el número de recomanacions i observa els resultats
3. Experimenta amb diferents avaluacions i veu com canvien les similituds

### Nivell intermedi

4. Implementa una funció per trobar les pel·lícules més similars entre elles
5. Crea una funció que mostri les avaluacions d'un usuari específic
6. Implementa un filtre per només comparar usuaris amb N pel·lícules en comú

### Nivell avançat

7. Optimitza el càlcul per evitar recalcular similaritats
8. Implementa altres mètriques de similaritat (Pearson, Jaccard)
9. Crea un sistema de cache per les similaritats més utilitzades

## Autors

Projecte educatiu per a l'assignatura de Programació

## Llicència

MIT
