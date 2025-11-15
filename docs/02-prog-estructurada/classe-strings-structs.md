# Classe: Cadenes de Text (Strings) i Tipus de Dades Complexes

## Objectius d'aprenentatge
- Dominar les operacions amb cadenes de text (String)
- Utilitzar els mètodes principals de String
- Comprendre el concepte de struct (classes en Dart)
- Treballar amb enumeracions (enum)
- Comparar structs de C amb classes de Dart

---

## 1. Cadenes de Text (String)

!!! note "Definició"
    Un **String** és una seqüència de caràcters. En Dart, podem crear strings amb cometes simples `'` o dobles `"`.

### Creació de strings

```dart
void main() {
  String nom = 'Maria';
  String ciutat = "Barcelona";
  String missatge = '''Això és un 
  string multilínia''';
  
  print(nom);        // Maria
  print(ciutat);     // Barcelona
  print(missatge);
}
```

---

## 2. Operacions Bàsiques amb Strings

### 2.1 Concatenació

```dart
void main() {
  String nom = 'Joan';
  String cognom = 'Garcia';
  
  // Concatenació amb +
  String nomComplet = nom + ' ' + cognom;
  print(nomComplet);  // Joan Garcia
  
  // Interpolació (recomanat)
  String salutacio = 'Hola, $nom!';
  print(salutacio);  // Hola, Joan!
  
  // Interpolació amb expressions
  int edat = 25;
  print('L\'any que ve tindràs ${edat + 1} anys');
}
```

### 2.2 Accés a caràcters

```dart
void main() {
  String paraula = 'Dart';
  
  // Accedir per índex (comença en 0)
  print(paraula[0]);     // D
  print(paraula[3]);     // t
  
  // Longitud
  print(paraula.length); // 4
}
```

---

## 3. Taula Resum de Mètodes de String

| Mètode | Descripció | Exemple |
|--------|------------|---------|
| `length` | Retorna la longitud del string | `'Hola'.length` → 4 |
| `isEmpty` | Comprova si està buit | `''.isEmpty` → true |
| `isNotEmpty` | Comprova si NO està buit | `'Hola'.isNotEmpty` → true |
| `toUpperCase()` | Converteix a majúscules | `'hola'.toUpperCase()` → 'HOLA' |
| `toLowerCase()` | Converteix a minúscules | `'HOLA'.toLowerCase()` → 'hola' |
| `trim()` | Elimina espais al principi i final | `'  text  '.trim()` → 'text' |
| `trimLeft()` | Elimina espais a l'esquerra | `'  text'.trimLeft()` → 'text' |
| `trimRight()` | Elimina espais a la dreta | `'text  '.trimRight()` → 'text' |
| `contains()` | Comprova si conté un substring | `'Hola món'.contains('món')` → true |
| `startsWith()` | Comprova si comença amb... | `'Hola'.startsWith('Ho')` → true |
| `endsWith()` | Comprova si acaba amb... | `'Hola'.endsWith('la')` → true |
| `indexOf()` | Retorna la posició de la primera ocurrència | `'Hola'.indexOf('l')` → 2 |
| `lastIndexOf()` | Retorna la posició de l'última ocurrència | `'Anna'.lastIndexOf('n')` → 2 |
| `substring()` | Extreu una part del string | `'Hola'.substring(0, 2)` → 'Ho' |
| `split()` | Divideix el string en una llista | `'a,b,c'.split(',')` → ['a', 'b', 'c'] |
| `replaceAll()` | Reemplaça totes les ocurrències | `'Hola món'.replaceAll('o', '0')` → 'H0la m0n' |
| `replaceFirst()` | Reemplaça la primera ocurrència | `'Hola món'.replaceFirst('o', '0')` → 'H0la món' |
| `padLeft()` | Omple amb caràcters a l'esquerra | `'7'.padLeft(3, '0')` → '007' |
| `padRight()` | Omple amb caràcters a la dreta | `'7'.padRight(3, '0')` → '700' |
| `compareTo()` | Compara alfabèticament | `'a'.compareTo('b')` → -1 |

---

## 4. Exemples Pràctics amb Strings

### Exemple 1: Validació d'email

```dart
void main() {
  String email = 'usuari@exemple.com';
  
  if (email.contains('@') && email.endsWith('.com')) {
    print('Email vàlid');
  } else {
    print('Email invàlid');
  }
}
```

### Exemple 2: Formatació de text

```dart
void main() {
  String text = '  Dart és genial!  ';
  
  // Netejar espais
  String netejat = text.trim();
  print(netejat);  // Dart és genial!
  
  // Convertir a majúscules
  String majuscules = netejat.toUpperCase();
  print(majuscules);  // DART ÉS GENIAL!
  
  // Reemplaçar paraules
  String modificat = netejat.replaceAll('genial', 'fantàstic');
  print(modificat);  // Dart és fantàstic!
}
```

### Exemple 3: Dividir text

```dart
void main() {
  String frase = 'poma,pera,plàtan,taronja';
  
  // Dividir per comes
  List<String> fruites = frase.split(',');
  
  print('Número de fruites: ${fruites.length}');
  for (String fruita in fruites) {
    print('- $fruita');
  }
  
  // Sortida:
  // Número de fruites: 4
  // - poma
  // - pera
  // - plàtan
  // - taronja
}
```

---

## 5. Tipus de Dades Complexes: Struct vs Classes

### 5.1 Què és un Struct? (Llenguatge C)

!!! info "Struct en C"
    Un **struct** en C és una estructura que agrupa diferents variables relacionades sota un mateix nom.

```c
// Exemple en llenguatge C
#include <stdio.h>
#include <string.h>

struct Persona {
    char nom[50];
    int edat;
    float altura;
};

int main() {
    // Crear una instància
    struct Persona persona1;
    
    // Assignar valors
    strcpy(persona1.nom, "Joan");
    persona1.edat = 25;
    persona1.altura = 1.75;
    
    // Mostrar valors
    printf("Nom: %s\n", persona1.nom);
    printf("Edat: %d\n", persona1.edat);
    printf("Altura: %.2f\n", persona1.altura);
    
    return 0;
}
```

**Característiques del struct en C:**
- Agrupa dades relacionades
- No té mètodes (funcions pròpies)
- És un tipus de dada passiva (només emmagatzema dades)

---

### 5.2 Classes en Dart (Equivalent a Struct)

!!! note "Classes en Dart"
    Dart no té structs, però utilitza **classes** que són molt més potents. Una classe pot contenir tant dades com mètodes.

```dart
class Persona {
  // Propietats (dades)
  String nom;
  int edat;
  double altura;
  
  // Constructor
  Persona(this.nom, this.edat, this.altura);
  
  // Mètode (funció pròpia de la classe)
  void mostrarInfo() {
    print('Nom: $nom');
    print('Edat: $edat');
    print('Altura: $altura m');
  }
}

void main() {
  // Crear una instància
  Persona persona1 = Persona('Joan', 25, 1.75);
  
  // Cridar el mètode
  persona1.mostrarInfo();
  
  // Accedir directament a les propietats
  print('\nEdad en 5 anys: ${persona1.edat + 5}');
}
```

### 5.3 Comparació: Struct C vs Classe Dart

| Característica | Struct (C) | Classe (Dart) |
|----------------|------------|---------------|
| Agrupa dades | ✅ Sí | ✅ Sí |
| Pot tenir mètodes | ❌ No | ✅ Sí |
| Constructor | ❌ No | ✅ Sí |
| Herència | ❌ No | ✅ Sí |
| Encapsulació | ❌ Limitada | ✅ Completa |
| Ús | Dades passives | Objectes complets |

---

## 6. Exemples Pràctics amb Classes

### Exemple 1: Classe Cotxe

```dart
class Cotxe {
  String marca;
  String model;
  int any;
  
  Cotxe(this.marca, this.model, this.any);
  
  // Mètode per calcular l'antiguitat
  int antiguitat() {
    return 2024 - any;
  }
  
  // Mètode per mostrar informació
  void mostrar() {
    print('$marca $model ($any)');
    print('Antiguitat: ${antiguitat()} anys');
  }
}

void main() {
  Cotxe cotxe1 = Cotxe('Toyota', 'Corolla', 2018);
  Cotxe cotxe2 = Cotxe('BMW', 'X5', 2022);
  
  cotxe1.mostrar();
  print('');
  cotxe2.mostrar();
}
```

### Exemple 2: Classe Rectangle

```dart
class Rectangle {
  double base;
  double altura;
  
  Rectangle(this.base, this.altura);
  
  // Mètode per calcular l'àrea
  double area() {
    return base * altura;
  }
  
  // Mètode per calcular el perímetre
  double perimetre() {
    return 2 * (base + altura);
  }
  
  void mostrarInfo() {
    print('Rectangle de ${base}x$altura');
    print('Àrea: ${area()}');
    print('Perímetre: ${perimetre()}');
  }
}

void main() {
  Rectangle rect = Rectangle(5.0, 3.0);
  rect.mostrarInfo();
}
```

---

## 7. Enumeracions (enum)

!!! note "Què és un enum?"
    Un **enum** (enumeració) és un tipus especial que representa un conjunt fix de valors constants.

### 7.1 Sintaxi bàsica

```dart
enum DiaDeLaSetmana {
  dilluns,
  dimarts,
  dimecres,
  dijous,
  divendres,
  dissabte,
  diumenge
}

void main() {
  DiaDeLaSetmana avui = DiaDeLaSetmana.dimarts;
  
  print(avui);  // DiaDeLaSetmana.dimarts
  
  // Comprovar valors
  if (avui == DiaDeLaSetmana.dimarts) {
    print('Avui és dimarts!');
  }
}
```

### 7.2 Enum amb switch

```dart
enum Estacio {
  primavera,
  estiu,
  tardor,
  hivern
}

void descriureEstacio(Estacio estacio) {
  switch (estacio) {
    case Estacio.primavera:
      print('Temperatura agradable, flors');
      break;
    case Estacio.estiu:
      print('Calor, vacances');
      break;
    case Estacio.tardor:
      print('Fulles cauen, pluja');
      break;
    case Estacio.hivern:
      print('Fred, neu');
      break;
  }
}

void main() {
  descriureEstacio(Estacio.estiu);
}
```

### 7.3 Exemples pràctics amb enum

#### Exemple 1: Nivells de log

```dart
enum NivellLog {
  debug,
  info,
  warning,
  error
}

void log(String missatge, NivellLog nivell) {
  String prefix;
  
  switch (nivell) {
    case NivellLog.debug:
      prefix = '[DEBUG]';
      break;
    case NivellLog.info:
      prefix = '[INFO]';
      break;
    case NivellLog.warning:
      prefix = '[WARNING]';
      break;
    case NivellLog.error:
      prefix = '[ERROR]';
      break;
  }
  
  print('$prefix $missatge');
}

void main() {
  log('Aplicació iniciada', NivellLog.info);
  log('Possible problema', NivellLog.warning);
  log('Error crític!', NivellLog.error);
}
```

#### Exemple 2: Estats d'un pedido

```dart
enum EstatPedido {
  pendent,
  processat,
  enviat,
  lliurat,
  cancel·lat
}

class Pedido {
  int id;
  EstatPedido estat;
  
  Pedido(this.id, this.estat);
  
  void canviarEstat(EstatPedido nouEstat) {
    print('Pedido $id: ${estat.name} → ${nouEstat.name}');
    estat = nouEstat;
  }
  
  bool potCancelar() {
    return estat == EstatPedido.pendent || 
           estat == EstatPedido.processat;
  }
}

void main() {
  Pedido pedido = Pedido(12345, EstatPedido.pendent);
  
  pedido.canviarEstat(EstatPedido.processat);
  pedido.canviarEstat(EstatPedido.enviat);
  
  if (pedido.potCancelar()) {
    print('Pots cancel·lar el pedido');
  } else {
    print('No pots cancel·lar el pedido');
  }
}
```

---

## 8. Combinant Classes i Enums

```dart
enum TipusVehicle {
  cotxe,
  moto,
  camio
}

class Vehicle {
  String matricula;
  TipusVehicle tipus;
  double preuPerHora;
  
  Vehicle(this.matricula, this.tipus, this.preuPerHora);
  
  double calcularPreu(int hores) {
    double preu = preuPerHora * hores;
    
    // Descompte per camions
    if (tipus == TipusVehicle.camio && hores > 24) {
      preu = preu * 0.85;  // 15% de descompte
    }
    
    return preu;
  }
  
  void mostrarInfo() {
    print('Matrícula: $matricula');
    print('Tipus: ${tipus.name}');
    print('Preu/hora: $preuPerHora€');
  }
}

void main() {
  Vehicle v1 = Vehicle('1234ABC', TipusVehicle.cotxe, 2.5);
  Vehicle v2 = Vehicle('5678DEF', TipusVehicle.camio, 5.0);
  
  v1.mostrarInfo();
  print('Cost 3 hores: ${v1.calcularPreu(3)}€\n');
  
  v2.mostrarInfo();
  print('Cost 30 hores: ${v2.calcularPreu(30)}€');
}
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Manipulació de strings

Donada la cadena `text = "  DART és GENIAL  "`:

1. Elimina els espais
2. Converteix-la a minúscules
3. Reemplaça "genial" per "fantàstic"
4. Compta quantes vegades apareix la lletra 'a'

??? success "Solució"
    ```dart
    void main() {
      String text = "  DART és GENIAL  ";
      
      // 1. Eliminar espais
      String netejat = text.trim();
      print(netejat);  // "DART és GENIAL"
      
      // 2. Minúscules
      String minus = netejat.toLowerCase();
      print(minus);  // "dart és genial"
      
      // 3. Reemplaçar
      String modificat = minus.replaceAll('genial', 'fantàstic');
      print(modificat);  // "dart és fantàstic"
      
      // 4. Comptar 'a'
      int comptador = 0;
      for (int i = 0; i < modificat.length; i++) {
        if (modificat[i] == 'a') comptador++;
      }
      print('Aparicions de "a": $comptador');  // 3
    }
    ```

---

### 🎯 Activitat 2: Crear una classe

Crea una classe `Llibre` amb:
- Propietats: títol, autor, pàgines
- Un constructor
- Un mètode que mostri la informació
- Un mètode que retorni si és un llibre llarg (més de 300 pàgines)

??? success "Solució"
    ```dart
    class Llibre {
      String titol;
      String autor;
      int pagines;
      
      Llibre(this.titol, this.autor, this.pagines);
      
      void mostrarInfo() {
        print('Títol: $titol');
        print('Autor: $autor');
        print('Pàgines: $pagines');
      }
      
      bool esLlarg() {
        return pagines > 300;
      }
    }
    
    void main() {
      Llibre llibre1 = Llibre('El Quixot', 'Cervantes', 1200);
      llibre1.mostrarInfo();
      
      if (llibre1.esLlarg()) {
        print('És un llibre llarg!');
      }
    }
    ```

---

### 🎯 Activitat 3: Treballant amb enums

Crea un enum `Prioritat` amb valors: baixa, mitjana, alta. Després crea una classe `Tasca` que tingui un títol i una prioritat.

??? success "Solució"
    ```dart
    enum Prioritat {
      baixa,
      mitjana,
      alta
    }
    
    class Tasca {
      String titol;
      Prioritat prioritat;
      
      Tasca(this.titol, this.prioritat);
      
      void mostrar() {
        print('Tasca: $titol');
        print('Prioritat: ${prioritat.name}');
      }
    }
    
    void main() {
      Tasca tasca1 = Tasca('Estudiar Dart', Prioritat.alta);
      Tasca tasca2 = Tasca('Netejar habitació', Prioritat.baixa);
      
      tasca1.mostrar();
      print('');
      tasca2.mostrar();
    }
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Validador de DNI

Crea un programa que validi un DNI espanyol (8 dígits + 1 lletra). Ha de comprovar:
- Longitud de 9 caràcters
- Els primers 8 són números
- L'últim és una lletra

??? success "Solució"
    ```dart
    void main() {
      String dni = '12345678Z';
      
      bool esValid = true;
      
      // Comprovar longitud
      if (dni.length != 9) {
        esValid = false;
      }
      
      // Comprovar primers 8 caràcters són números
      for (int i = 0; i < 8; i++) {
        if (!['0','1','2','3','4','5','6','7','8','9'].contains(dni[i])) {
          esValid = false;
        }
      }
      
      // Comprovar últim caràcter és lletra
      String ultimCaracter = dni[8].toUpperCase();
      if (!'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.contains(ultimCaracter)) {
        esValid = false;
      }
      
      if (esValid) {
        print('DNI vàlid');
      } else {
        print('DNI invàlid');
      }
    }
    ```

---

### Exercici 2: Classe Compte Bancari

Crea una classe `CompteBancari` amb:
- Propietats: titular, saldo
- Mètode `ingressar(quantitat)`
- Mètode `retirar(quantitat)` (només si hi ha prou saldo)
- Mètode `consultarSaldo()`

??? success "Solució"
    ```dart
    class CompteBancari {
      String titular;
      double saldo;
      
      CompteBancari(this.titular, this.saldo);
      
      void ingressar(double quantitat) {
        if (quantitat > 0) {
          saldo += quantitat;
          print('Ingressats $quantitat€. Nou saldo: $saldo€');
        }
      }
      
      void retirar(double quantitat) {
        if (quantitat > 0 && quantitat <= saldo) {
          saldo -= quantitat;
          print('Retirats $quantitat€. Nou saldo: $saldo€');
        } else {
          print('Operació no permesa');
        }
      }
      
      void consultarSaldo() {
        print('Saldo de $titular: $saldo€');
      }
    }
    
    void main() {
      CompteBancari compte = CompteBancari('Maria', 1000.0);
      
      compte.consultarSaldo();
      compte.ingressar(500);
      compte.retirar(200);
      compte.consultarSaldo();
    }
    ```

---

### Exercici 3: Sistema de reserves

Crea un enum `EstatReserva` (confirmada, pendent, cancel·lada) i una classe `Reserva` amb:
- Propietats: nom del client, estat, número de persones
- Mètode per canviar l'estat
- Mètode per mostrar la informació

??? success "Solució"
    ```dart
    enum EstatReserva {
      confirmada,
      pendent,
      cancelada
    }
    
    class Reserva {
      String nomClient;
      EstatReserva estat;
      int numPersones;
      
      Reserva(this.nomClient, this.estat, this.numPersones);
      
      void canviarEstat(EstatReserva nouEstat) {
        estat = nouEstat;
        print('Estat actualitzat a: ${estat.name}');
      }
      
      void mostrarInfo() {
        print('Client: $nomClient');
        print('Persones: $numPersones');
        print('Estat: ${estat.name}');
      }
    }
    
    void main() {
      Reserva reserva = Reserva('Joan Garcia', EstatReserva.pendent, 4);
      
      reserva.mostrarInfo();
      print('');
      
      reserva.canviarEstat(EstatReserva.confirmada);
      reserva.mostrarInfo();
    }
    ```

---

## 🏠 Deures

1. **Comptador de vocals:** Crea una funció que compti quantes vocals té un string.

2. **Classe Estudiant:** Crea una classe amb nom, notes (llista) i un mètode per calcular la mitjana.

3. **Enum colors:** Crea un enum amb colors i una classe `Semàfor` que canviï d'estat.

4. **Palindrom:** Funció que comprovi si un string és palíndrom (es llegeix igual al dret i al revés).

5. **Classe Producte:** Amb nom, preu, stock. Mètodes per vendre (redueix stock) i reposar.

---

## 📝 Resum

!!! summary "Conceptes clau"
    **Strings:**
    - ✅ Tipus de dada per text
    - ✅ Interpolació amb `$variable` i `${expressió}`
    - ✅ Mètodes: `length`, `toUpperCase()`, `toLowerCase()`, `trim()`, `split()`, etc.
    
    **Classes (equivalent a struct):**
    - ✅ Agrupen dades i mètodes relacionats
    - ✅ Tenen constructor
    - ✅ Més potents que structs de C
    
    **Enums:**
    - ✅ Conjunt fix de valors constants
    - ✅ Útils per representar estats o categories
    - ✅ S'usen amb switch o comparacions

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin mètode utilitzaries per convertir "hola" a "HOLA"?
    
    a) `uppercase()`  
    b) `toUpper()`  
    c) `toUpperCase()`  
    d) `capitalize()`

??? success "Resposta"
    **c) toUpperCase()**  
    És el mètode correcte en Dart.

!!! question "Pregunta 2"
    Quina és la principal diferència entre un struct de C i una classe de Dart?
    
    a) Les classes no poden tenir dades  
    b) Els structs no poden tenir mètodes  
    c) Les classes són més lentes  
    d) No hi ha diferència

??? success "Resposta"
    **b) Els structs no poden tenir mètodes**  
    Els structs de C són estructures passives, mentre que les classes de Dart poden tenir mètodes.

!!! question "Pregunta 3"
    Per a què serveix un enum?
    
    a) Per crear números  
    b) Per representar un conjunt fix de valors  
    c) Per fer bucles  
    d) Per crear strings

??? success "Resposta"
    **b) Per representar un conjunt fix de valors**  
    Els enums són ideals per estats, categories o opcions predefinides.

!!! question "Pregunta 4"
    Quin és el resultat de `'Hola món'.split(' ')`?
    
    a) `'Hola món'`  
    b) `['Hola', 'món']`  
    c) `'Holamón'`  
    d) Error

??? success "Resposta"
    **b) ['Hola', 'món']**  
    `split()` divideix el string i retorna una llista.
