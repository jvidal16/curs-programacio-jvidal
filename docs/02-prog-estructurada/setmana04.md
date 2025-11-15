# Setmana 4: Funcions

## Objectius d'aprenentatge
- Comprendre el concepte de funció
- Crear i cridar funcions
- Treballar amb paràmetres i valors de retorn
- Utilitzar paràmetres opcionals i amb nom
- Aplicar recursivitat
- Modularitzar el codi

---

## Sessió 1-2: Funcions Bàsiques

### 1. Què és una Funció?

!!! note "Definició"
    Una **funció** és un bloc de codi reutilitzable que realitza una tasca específica.

**Avantatges:**
- 🔄 **Reutilització:** Escriu una vegada, usa múltiples vegades
- 📦 **Modularitat:** Divideix el codi en peces petites
- 🐛 **Mantenibilitat:** Més fàcil trobar i corregir errors
- 📖 **Llegibilitat:** Codi més clar i organitzat

---

### 2. Anatomia d'una Funció

```dart
tipusRetorn nomFuncio(parametres) {
  // Cos de la funció
  return valor; // Si retorna alguna cosa
}
```

**Components:**
- **Tipus de retorn:** Tipus de dada que retorna (o `void` si no retorna res)
- **Nom:** Identificador de la funció (camelCase)
- **Paràmetres:** Entrades de la funció (opcionals)
- **Cos:** Codi que s'executa
- **return:** Valor que retorna (si aplica)

---

### 3. Funció Sense Paràmetres ni Retorn

```dart
void saludar() {
  print('Hola!');
  print('Benvingut al programa');
}

void main() {
  saludar(); // Crida a la funció
  saludar(); // Podem cridar-la múltiples vegades
}
```

**Sortida:**
```
Hola!
Benvingut al programa
Hola!
Benvingut al programa
```

---

### 4. Funció amb Paràmetres

```dart
void saludarPersona(String nom) {
  print('Hola $nom!');
  print('Com estàs?');
}

void main() {
  saludarPersona('Anna');
  saludarPersona('Marc');
  saludarPersona('Laura');
}
```

**Sortida:**
```
Hola Anna!
Com estàs?
Hola Marc!
Com estàs?
Hola Laura!
Com estàs?
```

---

### 5. Múltiples Paràmetres

```dart
void mostrarDades(String nom, int edat, String ciutat) {
  print('=== FITXA PERSONAL ===');
  print('Nom: $nom');
  print('Edat: $edat anys');
  print('Ciutat: $ciutat');
  print('====================\n');
}

void main() {
  mostrarDades('Anna', 25, 'Barcelona');
  mostrarDades('Joan', 30, 'València');
}
```

---

### 6. Funcions amb Retorn

```dart
int sumar(int a, int b) {
  int resultat = a + b;
  return resultat;
}

void main() {
  int total = sumar(5, 3);
  print('5 + 3 = $total');
  
  // També podem usar-ho directament
  print('10 + 20 = ${sumar(10, 20)}');
}
```

---

### 7. Àmbit de Variables (Scope)

!!! info "Regles de scope"
    - Variables dins d'una funció només existeixen dins d'aquesta funció
    - Variables fora de funcions (globals) són accessibles a tot arreu

```dart
int global = 100; // Variable global

void funcio1() {
  int local = 50; // Variable local
  print('Dins funcio1:');
  print('Local: $local');
  print('Global: $global');
}

void funcio2() {
  // print(local); ❌ ERROR: local no existeix aquí
  print('Dins funcio2:');
  print('Global: $global'); // ✅ OK: global és accessible
}

void main() {
  funcio1();
  funcio2();
  // print(local); ❌ ERROR: local no existeix al main
}
```

---

### 8. Exemples Pràctics

#### Càlcul d'àrea d'un cercle

```dart
import 'dart:math';

double calcularAreaCercle(double radi) {
  return pi * radi * radi;
}

void main() {
  double radi = 5.0;
  double area = calcularAreaCercle(radi);
  print('Àrea del cercle: ${area.toStringAsFixed(2)}');
}
```

---

#### Determinar si és parell

```dart
bool esParell(int numero) {
  return numero % 2 == 0;
}

void main() {
  print('4 és parell? ${esParell(4)}');    // true
  print('7 és parell? ${esParell(7)}');    // false
  print('100 és parell? ${esParell(100)}'); // true
}
```

---

#### Conversor de temperatura

```dart
double celsiusAFahrenheit(double celsius) {
  return celsius * 9 / 5 + 32;
}

double fahrenheitACelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

void main() {
  double tempC = 25.0;
  double tempF = celsiusAFahrenheit(tempC);
  print('$tempC°C = ${tempF.toStringAsFixed(1)}°F');
  
  double tempF2 = 77.0;
  double tempC2 = fahrenheitACelsius(tempF2);
  print('$tempF2°F = ${tempC2.toStringAsFixed(1)}°C');
}
```

---

## Sessió 3-4: Paràmetres Avançats i Recursivitat

### 1. Paràmetres Opcionals Posicionals

```dart
void saludar(String nom, [String? tractament]) {
  if (tractament != null) {
    print('Hola $tractament $nom');
  } else {
    print('Hola $nom');
  }
}

void main() {
  saludar('Anna');           // Hola Anna
  saludar('Joan', 'Sr.');    // Hola Sr. Joan
}
```

---

### 2. Paràmetres amb Valor per Defecte

```dart
void mostrarMissatge(String text, [int repeticions = 1]) {
  for (int i = 0; i < repeticions; i++) {
    print(text);
  }
}

void main() {
  mostrarMissatge('Hola');        // Mostra 1 vegada
  mostrarMissatge('Adéu', 3);     // Mostra 3 vegades
}
```

---

### 3. Paràmetres amb Nom (Named Parameters)

```dart
void crearUsuari({
  required String nom,
  required String email,
  int? edat,
  String? ciutat
}) {
  print('=== NOU USUARI ===');
  print('Nom: $nom');
  print('Email: $email');
  if (edat != null) print('Edat: $edat');
  if (ciutat != null) print('Ciutat: $ciutat');
}

void main() {
  crearUsuari(
    nom: 'Anna',
    email: 'anna@example.com',
    edat: 25,
    ciutat: 'Barcelona'
  );
  
  crearUsuari(
    email: 'joan@example.com',
    nom: 'Joan'
  );
}
```

---

### 4. Funcions com a Expressions

Per a funcions curtes, podem usar la sintaxi de fletxa:

```dart
// Forma normal
int sumar(int a, int b) {
  return a + b;
}

// Forma curta (arrow function)
int sumar2(int a, int b) => a + b;

bool esPositiu(int n) => n > 0;

String saludar(String nom) => 'Hola $nom!';

void main() {
  print(sumar2(5, 3));
  print(esPositiu(-5));
  print(saludar('Anna'));
}
```

---

### 5. Recursivitat: Introducció

!!! note "Definició"
    Una funció **recursiva** és una funció que es crida a si mateixa.

**Components essencials:**
1. **Cas base:** Condició d'aturada
2. **Cas recursiu:** Crida a si mateixa amb un problema més petit

---

### 6. Factorial Recursiu

```dart
int factorial(int n) {
  // Cas base
  if (n <= 1) {
    return 1;
  }
  // Cas recursiu
  return n * factorial(n - 1);
}

void main() {
  print('5! = ${factorial(5)}'); // 120
  print('0! = ${factorial(0)}'); // 1
  print('7! = ${factorial(7)}'); // 5040
}
```

**Traça d'execució de factorial(5):**
```
factorial(5) = 5 * factorial(4)
factorial(4) = 4 * factorial(3)
factorial(3) = 3 * factorial(2)
factorial(2) = 2 * factorial(1)
factorial(1) = 1  ← Cas base
Retornant: 2 * 1 = 2
Retornant: 3 * 2 = 6
Retornant: 4 * 6 = 24
Retornant: 5 * 24 = 120
```

---

### 7. Fibonacci Recursiu

```dart
int fibonacci(int n) {
  // Casos base
  if (n <= 0) return 0;
  if (n == 1) return 1;
  
  // Cas recursiu
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  print('Seqüència de Fibonacci:');
  for (int i = 0; i < 10; i++) {
    print('fibonacci($i) = ${fibonacci(i)}');
  }
}
```

---

### 8. Potència Recursiva

```dart
int potencia(int base, int exponent) {
  // Cas base
  if (exponent == 0) return 1;
  
  // Cas recursiu
  return base * potencia(base, exponent - 1);
}

void main() {
  print('2^5 = ${potencia(2, 5)}');
  print('3^4 = ${potencia(3, 4)}');
  print('5^0 = ${potencia(5, 0)}');
}
```

---

### 9. Suma de Dígits Recursiva

```dart
int sumaDigits(int n) {
  // Cas base
  if (n < 10) return n;
  
  // Cas recursiu
  return (n % 10) + sumaDigits(n ~/ 10);
}

void main() {
  print('Suma dígits de 123: ${sumaDigits(123)}'); // 6
  print('Suma dígits de 456: ${sumaDigits(456)}'); // 15
  print('Suma dígits de 999: ${sumaDigits(999)}'); // 27
}
```

---

## Sessió 5-6: Pràctica Integrada

### 1. Validació de Dades

```dart
import 'dart:io';

int llegirEnter(String missatge, int min, int max) {
  int? numero;
  
  do {
    print(missatge);
    String? input = stdin.readLineSync();
    numero = int.tryParse(input ?? '');
    
    if (numero == null || numero < min || numero > max) {
      print('❌ Valor invàlid. Ha de ser entre $min i $max');
      numero = null;
    }
  } while (numero == null);
  
  return numero;
}

void main() {
  int edat = llegirEnter('Edat (0-120):', 0, 120);
  print('✅ Edat vàlida: $edat');
}
```

---

### 2. Menú amb Funcions

```dart
import 'dart:io';

void mostrarMenu() {
  print('\n=== CALCULADORA ===');
  print('1. Sumar');
  print('2. Restar');
  print('3. Multiplicar');
  print('4. Dividir');
  print('5. Sortir');
  print('==================');
}

double sumar(double a, double b) => a + b;
double restar(double a, double b) => a - b;
double multiplicar(double a, double b) => a * b;
double dividir(double a, double b) => b != 0 ? a / b : 0;

void main() {
  bool continuar = true;
  
  while (continuar) {
    mostrarMenu();
    
    print('Opció:');
    int opcio = int.parse(stdin.readLineSync()!);
    
    if (opcio >= 1 && opcio <= 4) {
      print('Primer número:');
      double num1 = double.parse(stdin.readLineSync()!);
      
      print('Segon número:');
      double num2 = double.parse(stdin.readLineSync()!);
      
      double resultat;
      
      switch (opcio) {
        case 1:
          resultat = sumar(num1, num2);
          print('Resultat: $num1 + $num2 = $resultat');
          break;
        case 2:
          resultat = restar(num1, num2);
          print('Resultat: $num1 - $num2 = $resultat');
          break;
        case 3:
          resultat = multiplicar(num1, num2);
          print('Resultat: $num1 * $num2 = $resultat');
          break;
        case 4:
          if (num2 != 0) {
            resultat = dividir(num1, num2);
            print('Resultat: $num1 / $num2 = $resultat');
          } else {
            print('❌ Error: Divisió per zero');
          }
          break;
      }
    } else if (opcio == 5) {
      continuar = false;
      print('Adéu!');
    } else {
      print('❌ Opció no vàlida');
    }
  }
}
```

---

### 3. Calculadora Científica

```dart
import 'dart:math';
import 'dart:io';

double arrelQuadrada(double n) => sqrt(n);
double potenciaQuadrada(double n) => n * n;
double potenciaCubica(double n) => n * n * n;
double valorAbsolut(double n) => n.abs();

void main() {
  print('Número:');
  double num = double.parse(stdin.readLineSync()!);
  
  print('\n=== RESULTATS ===');
  print('Arrel quadrada: ${arrelQuadrada(num).toStringAsFixed(2)}');
  print('Quadrat: ${potenciaQuadrada(num)}');
  print('Cub: ${potenciaCubica(num)}');
  print('Valor absolut: ${valorAbsolut(num)}');
}
```

---

### 4. Joc de Blackjack Simplificat

```dart
import 'dart:io';
import 'dart:math';

int repartirCarta() {
  return Random().nextInt(11) + 1; // 1-11
}

int calcularPunts(List<int> cartes) {
  return cartes.reduce((a, b) => a + b);
}

void mostrarCartes(List<int> cartes, String jugador) {
  print('$jugador: $cartes → Total: ${calcularPunts(cartes)}');
}

void main() {
  List<int> cartesJugador = [repartirCarta(), repartirCarta()];
  List<int> cartesBanca = [repartirCarta(), repartirCarta()];
  
  print('🎰 BLACKJACK SIMPLIFICAT');
  print('=======================\n');
  
  // Torn del jugador
  bool continuar = true;
  while (continuar) {
    mostrarCartes(cartesJugador, 'Les teves cartes');
    
    if (calcularPunts(cartesJugador) > 21) {
      print('💥 T\'has passat! Has perdut.');
      return;
    }
    
    print('Vols una altra carta? (s/n)');
    String resposta = stdin.readLineSync()!.toLowerCase();
    
    if (resposta == 's') {
      cartesJugador.add(repartirCarta());
    } else {
      continuar = false;
    }
  }
  
  // Torn de la banca
  print('\n--- TORN DE LA BANCA ---');
  while (calcularPunts(cartesBanca) < 17) {
    cartesBanca.add(repartirCarta());
  }
  
  // Resultats
  print('\n=== RESULTATS FINALS ===');
  mostrarCartes(cartesJugador, 'Tu');
  mostrarCartes(cartesBanca, 'Banca');
  
  int puntsJugador = calcularPunts(cartesJugador);
  int puntsBanca = calcularPunts(cartesBanca);
  
  if (puntsBanca > 21) {
    print('🎉 Has guanyat! La banca s\'ha passat.');
  } else if (puntsJugador > puntsBanca) {
    print('🎉 Has guanyat!');
  } else if (puntsJugador < puntsBanca) {
    print('😢 Has perdut.');
  } else {
    print('🤝 Empat!');
  }
}
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Què retornarà?

```dart
int multiplicar(int a, int b) {
  return a * b;
}

void main() {
  int x = multiplicar(3, 4);
  int y = multiplicar(x, 2);
  print(y);
}
```

??? success "Solució"
    **24**
    
    - x = 3 * 4 = 12
    - y = 12 * 2 = 24

---

### 🎯 Activitat 2: Troba l'error

```dart
void mostrarSuma(int a, int b) {
  int suma = a + b;
}

void main() {
  mostrarSuma(5, 3);
  print(suma);
}
```

??? success "Solució"
    `suma` només existeix dins de `mostrarSuma`. Solucions:
    
    1. Retornar el valor:
    ```dart
    int calcularSuma(int a, int b) {
      return a + b;
    }
    
    void main() {
      int suma = calcularSuma(5, 3);
      print(suma);
    }
    ```
    
    2. Mostrar dins la funció:
    ```dart
    void mostrarSuma(int a, int b) {
      int suma = a + b;
      print(suma);
    }
    
    void main() {
      mostrarSuma(5, 3);
    }
    ```

---

### 🎯 Activitat 3: Completa la funció

```dart
bool ___________(int n) {
  return ____________;
}

void main() {
  print(esNegatiu(-5));  // true
  print(esNegatiu(10));  // false
}
```

??? success "Solució"
    ```dart
    bool esNegatiu(int n) {
      return n < 0;
    }
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Màxim de dos números

Funció que retorni el major de dos números.

??? success "Solució"
    ```dart
    int maxim(int a, int b) {
      return (a > b) ? a : b;
    }
    
    void main() {
      print('Màxim de 5 i 8: ${maxim(5, 8)}');
      print('Màxim de 12 i 7: ${maxim(12, 7)}');
    }
    ```

---

### Exercici 2: Temperatura ideal

Funció que determini si una temperatura està en el rang ideal (18-24°C).

??? success "Solució"
    ```dart
    bool temperaturaIdeal(double temp) {
      return temp >= 18 && temp <= 24;
    }
    
    void main() {
      print('20°C és ideal? ${temperaturaIdeal(20)}');
      print('10°C és ideal? ${temperaturaIdeal(10)}');
      print('30°C és ideal? ${temperaturaIdeal(30)}');
    }
    ```

---

### Exercici 3: Càlcul d'IMC

Funció que calculi l'IMC i una altra que el classifiqui.

??? success "Solució"
    ```dart
    double calcularIMC(double pes, double altura) {
      return pes / (altura * altura);
    }
    
    String classificarIMC(double imc) {
      if (imc < 18.5) return 'Baix pes';
      if (imc < 25) return 'Pes normal';
      if (imc < 30) return 'Sobrepès';
      return 'Obesitat';
    }
    
    void main() {
      double imc = calcularIMC(70, 1.75);
      print('IMC: ${imc.toStringAsFixed(2)}');
      print('Classificació: ${classificarIMC(imc)}');
    }
    ```

---

### Exercici 4: Suma recursiva

Suma dels primers N números naturals de forma recursiva.

??? success "Solució"
    ```dart
    int sumaRecursiva(int n) {
      if (n <= 0) return 0;
      return n + sumaRecursiva(n - 1);
    }
    
    void main() {
      print('Suma 1 a 10: ${sumaRecursiva(10)}'); // 55
      print('Suma 1 a 5: ${sumaRecursiva(5)}');   // 15
    }
    ```

---

### Exercici 5: Comprovar palíndrom

Funció recursiva que comprovi si un número és palíndrom.

??? success "Solució"
    ```dart
    String invertirString(String s) {
      if (s.length <= 1) return s;
      return s[s.length - 1] + invertirString(s.substring(0, s.length - 1));
    }
    
    bool esPalindrom(int n) {
      String s = n.toString();
      return s == invertirString(s);
    }
    
    void main() {
      print('121 és palíndrom? ${esPalindrom(121)}');
      print('123 és palíndrom? ${esPalindrom(123)}');
      print('12321 és palíndrom? ${esPalindrom(12321)}');
    }
    ```

---

## 🏠 Deures

### Repte 1: Conversor complet
Crea funcions per convertir entre diferents unitats (km↔milles, kg↔lliures, etc.)

### Repte 2: Generador de contrasenya
Funció que generi una contrasenya aleatòria de longitud N.

### Repte 3: Torre de Hanoi
Implementa la solució recursiva de la Torre de Hanoi.

### Repte 4: Número d'Armstrong
Funció que comprovi si un número és un número d'Armstrong.

### Repte 5: Sistema de menú modular
Crea un programa amb múltiples funcions organitzades en un menú.

---

## 📝 Resum

!!! summary "Conceptes clau de la Setmana 4"
    **Funcions bàsiques:**
    - ✅ Blocs de codi reutilitzables
    - ✅ Milloren modularitat i mantenibilitat
    - ✅ Sintaxi: `tipus nom(params) { ... }`
    
    **Paràmetres:**
    - ✅ Posicionals: ordre importa
    - ✅ Opcionals: entre `[]`
    - ✅ Amb nom: entre `{}`
    - ✅ Per defecte: amb `=`
    
    **Retorn:**
    - ✅ `void`: no retorna res
    - ✅ `return`: retorna un valor
    
    **Recursivitat:**
    - ✅ Funció que es crida a si mateixa
    - ✅ Necessita cas base i cas recursiu
    
    **Arrow functions:**
    - ✅ Sintaxi curta: `=>` per funcions simples

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Què significa `void` en una funció?
    
    a) És una paraula reservada sense significat  
    b) La funció no retorna cap valor  
    c) La funció no té paràmetres  
    d) La funció és recursiva

??? success "Resposta"
    **b) La funció no retorna cap valor**

!!! question "Pregunta 2"
    Què és un paràmetre amb nom?
    
    a) Un paràmetre obligatori  
    b) Un paràmetre que s'anomena igual que la funció  
    c) Un paràmetre entre `{}`  
    d) Un paràmetre que sempre té valor per defecte

??? success "Resposta"
    **c) Un paràmetre entre {}**

!!! question "Pregunta 3"
    Què necessita una funció recursiva?
    
    a) Només un cas base  
    b) Només un cas recursiu  
    c) Un cas base i un cas recursiu  
    d) Cap condició especial

??? success "Resposta"
    **c) Un cas base i un cas recursiu**

---

!!! success "Has completat la Setmana 4! 🎉"
    Ara domines les funcions i la modularització. A la setmana 5 aprendràs sobre llistes (arrays unidimensionals).
