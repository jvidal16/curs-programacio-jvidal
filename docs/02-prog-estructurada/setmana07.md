# Setmana 7: Projecte Final i Repàs

## Objectius d'aprenentatge
- Consolidar tots els coneixements adquirits
- Aplicar conceptes en projectes complets
- Desenvolupar habilitats de resolució de problemes
- Practicar bones pràctiques de programació
- Crear aplicacions funcionals i completes

---

## Sessió 1-2: Repàs Integrat

### 1. Resum de Conceptes Clau

#### Variables i Tipus de Dades
```dart
// Tipus bàsics
int edat = 25;
double altura = 1.75;
String nom = 'Anna';
bool esActiu = true;

// Constants
const double PI = 3.14159;
final String dataActual = DateTime.now().toString();
```

---

#### Estructures Condicionals
```dart
// if-else
if (edat >= 18) {
  print('Major d\'edat');
} else {
  print('Menor d\'edat');
}

// switch
switch (dia) {
  case 1:
    print('Dilluns');
    break;
  case 2:
    print('Dimarts');
    break;
  default:
    print('Altre dia');
}
```

---

#### Bucles
```dart
// for
for (int i = 0; i < 10; i++) {
  print(i);
}

// while
int i = 0;
while (i < 10) {
  print(i);
  i++;
}

// do-while
do {
  print(i);
  i++;
} while (i < 10);
```

---

#### Funcions
```dart
// Funció amb retorn
int sumar(int a, int b) {
  return a + b;
}

// Funció void
void mostrarMissatge(String text) {
  print(text);
}

// Paràmetres opcionals
void saludar(String nom, [String? tractament]) {
  if (tractament != null) {
    print('Hola $tractament $nom');
  } else {
    print('Hola $nom');
  }
}

// Paràmetres amb nom
void crearUsuari({required String nom, int? edat}) {
  print('Usuari: $nom');
  if (edat != null) print('Edat: $edat');
}
```

---

#### Llistes
```dart
// Declaració
List<int> numeros = [1, 2, 3, 4, 5];

// Operacions
numeros.add(6);
numeros.remove(3);
numeros.sort();

// Recorregut
for (int num in numeros) {
  print(num);
}
```

---

#### Matrius
```dart
// Declaració
List<List<int>> matriu = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

// Accés
print(matriu[1][2]); // 6

// Recorregut
for (int i = 0; i < matriu.length; i++) {
  for (int j = 0; j < matriu[i].length; j++) {
    print(matriu[i][j]);
  }
}
```

---

### 2. Exercicis de Repàs

#### Exercici 1: Gestió d'Inventari

```dart
import 'dart:io';

class Producte {
  String nom;
  double preu;
  int quantitat;
  
  Producte(this.nom, this.preu, this.quantitat);
  
  @override
  String toString() {
    return '$nom - ${preu}€ (Stock: $quantitat)';
  }
}

void main() {
  List<Producte> inventari = [];
  bool continuar = true;
  
  while (continuar) {
    print('\n=== GESTIÓ D\'INVENTARI ===');
    print('1. Afegir producte');
    print('2. Llistar productes');
    print('3. Actualitzar stock');
    print('4. Eliminar producte');
    print('5. Valor total inventari');
    print('6. Sortir');
    print('Opció:');
    
    int opcio = int.parse(stdin.readLineSync()!);
    
    switch (opcio) {
      case 1:
        print('Nom del producte:');
        String nom = stdin.readLineSync()!;
        
        print('Preu:');
        double preu = double.parse(stdin.readLineSync()!);
        
        print('Quantitat:');
        int quantitat = int.parse(stdin.readLineSync()!);
        
        inventari.add(Producte(nom, preu, quantitat));
        print('✅ Producte afegit');
        break;
        
      case 2:
        if (inventari.isEmpty) {
          print('No hi ha productes');
        } else {
          print('\n=== INVENTARI ===');
          for (int i = 0; i < inventari.length; i++) {
            print('$i. ${inventari[i]}');
          }
        }
        break;
        
      case 3:
        if (inventari.isEmpty) {
          print('No hi ha productes');
        } else {
          print('Índex del producte:');
          int index = int.parse(stdin.readLineSync()!);
          
          if (index >= 0 && index < inventari.length) {
            print('Nova quantitat:');
            int novaQuantitat = int.parse(stdin.readLineSync()!);
            inventari[index].quantitat = novaQuantitat;
            print('✅ Stock actualitzat');
          } else {
            print('❌ Índex invàlid');
          }
        }
        break;
        
      case 4:
        if (inventari.isEmpty) {
          print('No hi ha productes');
        } else {
          print('Índex del producte a eliminar:');
          int index = int.parse(stdin.readLineSync()!);
          
          if (index >= 0 && index < inventari.length) {
            inventari.removeAt(index);
            print('✅ Producte eliminat');
          } else {
            print('❌ Índex invàlid');
          }
        }
        break;
        
      case 5:
        double valorTotal = 0;
        for (var producte in inventari) {
          valorTotal += producte.preu * producte.quantitat;
        }
        print('Valor total: ${valorTotal.toStringAsFixed(2)}€');
        break;
        
      case 6:
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

#### Exercici 2: Sistema de Reserva de Seients

```dart
import 'dart:io';

void mostrarSeients(List<List<String>> seients) {
  print('\n=== SALA DE CINEMA ===');
  print('    1  2  3  4  5  6  7  8  9 10');
  
  for (int i = 0; i < seients.length; i++) {
    stdout.write('${String.fromCharCode(65 + i)}   ');
    for (int j = 0; j < seients[i].length; j++) {
      stdout.write('${seients[i][j]}  ');
    }
    print('');
  }
  print('\nO = Lliure  X = Ocupat');
}

int comptarLliures(List<List<String>> seients) {
  int lliures = 0;
  for (var fila in seients) {
    for (var seient in fila) {
      if (seient == 'O') lliures++;
    }
  }
  return lliures;
}

void main() {
  // Sala 6x10
  List<List<String>> seients = List.generate(
    6,
    (i) => List.filled(10, 'O')
  );
  
  bool continuar = true;
  
  while (continuar) {
    mostrarSeients(seients);
    print('\nSeients lliures: ${comptarLliures(seients)}');
    
    print('\n1. Reservar seient');
    print('2. Cancel·lar reserva');
    print('3. Sortir');
    print('Opció:');
    
    int opcio = int.parse(stdin.readLineSync()!);
    
    if (opcio == 1 || opcio == 2) {
      print('Fila (A-F):');
      String filaChar = stdin.readLineSync()!.toUpperCase();
      
      if (filaChar.length != 1 || 
          filaChar.codeUnitAt(0) < 65 || 
          filaChar.codeUnitAt(0) > 70) {
        print('❌ Fila invàlida');
        continue;
      }
      
      int fila = filaChar.codeUnitAt(0) - 65;
      
      print('Seient (1-10):');
      int seient = int.parse(stdin.readLineSync()!) - 1;
      
      if (seient < 0 || seient >= 10) {
        print('❌ Seient invàlid');
        continue;
      }
      
      if (opcio == 1) {
        if (seients[fila][seient] == 'O') {
          seients[fila][seient] = 'X';
          print('✅ Seient reservat');
        } else {
          print('❌ Seient ja ocupat');
        }
      } else {
        if (seients[fila][seient] == 'X') {
          seients[fila][seient] = 'O';
          print('✅ Reserva cancel·lada');
        } else {
          print('❌ Seient no estava reservat');
        }
      }
    } else if (opcio == 3) {
      continuar = false;
    }
  }
}
```

---

## Sessió 3-4: Projecte Final (Part 1)

### Opcions de Projecte

#### Opció 1: Hundir la Flota

**Descripció:** Joc clàssic de batalla naval amb tauler 10x10.

**Funcionalitats:**
- Tauler 10x10
- Col·locar vaixells (portaavions, cuirassat, destructor, etc.)
- Torn del jugador i de l'ordinador
- Comprovar impactes i enfonsaments
- Comptador de moviments

**Estructura:**
```dart
import 'dart:io';
import 'dart:math';

class Vaixell {
  String nom;
  int mida;
  List<List<int>> posicions;
  int impactes;
  
  Vaixell(this.nom, this.mida) 
    : posicions = [], 
      impactes = 0;
  
  bool estaEnfonsat() => impactes >= mida;
}

void main() {
  // Crear taulers
  List<List<String>> taulerJugador = crearTauler();
  List<List<String>> taulerOrdinador = crearTauler();
  List<List<bool>> minesJugador = crearMines();
  List<List<bool>> minesOrdinador = crearMines();
  
  // Col·locar vaixells
  List<Vaixell> vaixellsJugador = [];
  List<Vaixell> vaixellsOrdinador = [];
  
  // Bucle principal del joc
  bool jocAcabat = false;
  while (!jocAcabat) {
    // Torn jugador
    // Torn ordinador
    // Comprovar guanyador
  }
}
```

---

#### Opció 2: Agenda de Contactes

**Descripció:** Aplicació per gestionar contactes amb múltiples camps.

**Funcionalitats:**
- Afegir contactes (nom, telèfon, email, adreça)
- Llistar tots els contactes
- Cercar per nom
- Editar contacte
- Eliminar contacte
- Guardar/carregar de fitxer (opcional)

**Estructura:**
```dart
import 'dart:io';

class Contacte {
  String nom;
  String telefon;
  String email;
  String? adreca;
  
  Contacte({
    required this.nom,
    required this.telefon,
    required this.email,
    this.adreca
  });
  
  @override
  String toString() {
    String info = '=== $nom ===\n';
    info += 'Telèfon: $telefon\n';
    info += 'Email: $email\n';
    if (adreca != null) info += 'Adreça: $adreca\n';
    return info;
  }
}

void main() {
  List<Contacte> agenda = [];
  
  // Menú principal
  bool continuar = true;
  while (continuar) {
    mostrarMenu();
    int opcio = llegirOpcio();
    
    switch (opcio) {
      case 1:
        afegirContacte(agenda);
        break;
      case 2:
        llistarContactes(agenda);
        break;
      case 3:
        cercarContacte(agenda);
        break;
      // ... més opcions
    }
  }
}
```

---

#### Opció 3: Sistema de Notes Escolars

**Descripció:** Gestió completa de notes d'alumnes per assignatures.

**Funcionalitats:**
- Matriu alumnes × assignatures
- Afegir/editar notes
- Calcular mitjanes per alumne
- Calcular mitjanes per assignatura
- Estadístiques (millor/pitjor nota, suspesos, etc.)
- Generar informe

**Estructura:**
```dart
import 'dart:io';

class Alumne {
  String nom;
  List<double?> notes;
  
  Alumne(this.nom, int numAssignatures) 
    : notes = List.filled(numAssignatures, null);
  
  double? calcularMitjana() {
    List<double> notesValides = notes.whereType<double>().toList();
    if (notesValides.isEmpty) return null;
    
    double suma = 0;
    for (double nota in notesValides) {
      suma += nota;
    }
    return suma / notesValides.length;
  }
}

void main() {
  List<String> assignatures = [
    'Matemàtiques',
    'Llengua',
    'Anglès',
    'Ciències',
    'Història'
  ];
  
  List<Alumne> alumnes = [];
  
  // Menú principal
  bool continuar = true;
  while (continuar) {
    print('\n=== GESTIÓ DE NOTES ===');
    print('1. Afegir alumne');
    print('2. Introduir nota');
    print('3. Veure notes alumne');
    print('4. Mitjana assignatura');
    print('5. Informe complet');
    print('6. Sortir');
    
    // ... implementació
  }
}
```

---

#### Opció 4: Simulador de Carrera de Cotxes

**Descripció:** Simulació d'una carrera amb múltiples cotxes.

**Funcionalitats:**
- 5 cotxes competint
- Circuit de 100 metres
- Velocitats aleatòries per torn
- Accidents/problemes mecànics aleatoris
- Animació de la carrera
- Classificació final

**Estructura:**
```dart
import 'dart:io';
import 'dart:math';

class Cotxe {
  String nom;
  int posicio;
  bool actiu;
  
  Cotxe(this.nom) : posicio = 0, actiu = true;
  
  void avançar() {
    if (!actiu) return;
    
    Random random = Random();
    
    // Possibilitat d'avaria (5%)
    if (random.nextInt(100) < 5) {
      actiu = false;
      return;
    }
    
    // Avançar entre 1 i 5 metres
    posicio += random.nextInt(5) + 1;
  }
}

void mostrarCarrera(List<Cotxe> cotxes, int meta) {
  print('\n' + '=' * 60);
  for (Cotxe cotxe in cotxes) {
    stdout.write('${cotxe.nom.padRight(10)} ');
    
    if (!cotxe.actiu) {
      stdout.write('💥 AVARIA');
    } else {
      int espais = (cotxe.posicio * 40 ~/ meta).clamp(0, 40);
      stdout.write(' ' * espais + '🏎️ ');
    }
    
    print(' (${cotxe.posicio}m)');
  }
  print('=' * 60);
  print('Meta: ${meta}m');
}

void main() {
  const int META = 100;
  
  List<Cotxe> cotxes = [
    Cotxe('Ferrari'),
    Cotxe('McLaren'),
    Cotxe('Mercedes'),
    Cotxe('Red Bull'),
    Cotxe('Alpine')
  ];
  
  print('🏁 SIMULADOR DE CARRERA 🏁');
  print('Prem Enter per començar...');
  stdin.readLineSync();
  
  bool carreraAcabada = false;
  int torn = 0;
  
  while (!carreraAcabada) {
    torn++;
    print('\n--- TORN $torn ---');
    
    // Tots els cotxes avancen
    for (Cotxe cotxe in cotxes) {
      cotxe.avançar();
    }
    
    // Mostrar estat
    mostrarCarrera(cotxes, META);
    
    // Comprovar si algú ha arribat
    for (Cotxe cotxe in cotxes) {
      if (cotxe.posicio >= META && cotxe.actiu) {
        carreraAcabada = true;
      }
    }
    
    sleep(Duration(milliseconds: 500));
  }
  
  // Classificació final
  cotxes.sort((a, b) => b.posicio.compareTo(a.posicio));
  
  print('\n🏆 CLASSIFICACIÓ FINAL 🏆');
  for (int i = 0; i < cotxes.length; i++) {
    print('${i + 1}. ${cotxes[i].nom} - ${cotxes[i].posicio}m ${!cotxes[i].actiu ? "(Avariat)" : ""}');
  }
}
```

---

## Sessió 5-6: Projecte Final (Part 2)

### Guia de Desenvolupament

#### 1. Planificació

!!! tip "Abans de programar"
    - ✅ Llegeix tots els requisits
    - ✅ Fes un esquema de les funcions necessàries
    - ✅ Decideix quines estructures de dades usar
    - ✅ Divideix el projecte en parts petites

---

#### 2. Desenvolupament Iteratiu

**Fase 1: Estructura bàsica**
- Crear el menú principal
- Implementar sortida del programa

**Fase 2: Funcionalitat core**
- Afegir les funcions principals
- Provar cada funció individualment

**Fase 3: Funcions addicionals**
- Afegir validacions
- Gestió d'errors
- Millorar la interfície

**Fase 4: Poliment**
- Revisar el codi
- Afegir comentaris
- Provar casos límit

---

#### 3. Bones Pràctiques

```dart
// ✅ Noms descriptius
void calcularMitjanaNotes(List<double> notes) { ... }

// ❌ Noms poc clars
void calc(List<double> n) { ... }

// ✅ Funcions petites i específiques
double calcularMitjana(List<double> numeros) {
  if (numeros.isEmpty) return 0;
  return numeros.reduce((a, b) => a + b) / numeros.length;
}

bool esApprovat(double nota) {
  return nota >= 5.0;
}

// ✅ Comentaris útils
// Calcula la mitjana ignorant la nota més baixa
double mitjanaSenseMinim(List<double> notes) { ... }

// ✅ Validar entrades
int llegirNumero(String missatge, int min, int max) {
  int? numero;
  do {
    print(missatge);
    numero = int.tryParse(stdin.readLineSync() ?? '');
    
    if (numero == null || numero < min || numero > max) {
      print('❌ Valor invàlid');
      numero = null;
    }
  } while (numero == null);
  
  return numero;
}
```

---

### Checklist del Projecte

!!! success "Abans de lliurar"
    - [ ] El programa compila sense errors
    - [ ] Totes les funcionalitats funcionen
    - [ ] S'han provat casos extrems
    - [ ] El codi té comentaris clars
    - [ ] Els noms de variables són descriptius
    - [ ] No hi ha codi duplicat
    - [ ] La interfície és clara i fàcil d'usar
    - [ ] S'han gestionat els possibles errors

---

### Presentació del Projecte

#### Què incloure:

1. **Demostració**
   - Mostrar totes les funcionalitats
   - Provar casos normals i extrems

2. **Explicació del codi**
   - Parts més interessants
   - Decisions de disseny
   - Dificultats trobades

3. **Millores futures**
   - Què afegiríeu si tinguéssiu més temps
   - Què heu après

---

## Reptes Extra

### Repte 1: Sistema de Votació

Crea un sistema complet de votació amb:
- Registre de candidats
- Emissió de vots
- Recompte automàtic
- Estadístiques
- Prevenció de vots duplicats

---

### Repte 2: Joc de Memory

- Tauler 4x4 amb parelles de números/símbols
- Revelar dues cartes per torn
- Comprovar coincidències
- Comptador de moviments
- Sistema de puntuació

---

### Repte 3: Calculadora de Matrius

- Suma de matrius
- Multiplicació de matrius
- Transposada
- Determinant (2x2 i 3x3)
- Inversa (2x2)

---

### Repte 4: Gestor de Biblioteca

- Catàleg de llibres
- Préstecs i devolucions
- Cercar per títol/autor
- Llibres disponibles/prestats
- Historial de préstecs

---

### Repte 5: Snake (Serpent)

- Tauler de joc
- Control de la serpent
- Menjar per créixer
- Col·lisions (parets i propi cos)
- Puntuació

---

## 📝 Resum del Curs

!!! summary "Has après"
    **Setmana 1: Fonaments**
    - ✅ Variables i tipus de dades
    - ✅ Operadors
    - ✅ Entrada/sortida
    - ✅ Constants
    
    **Setmana 2: Condicionals**
    - ✅ if, else, else if
    - ✅ switch
    - ✅ Operadors lògics
    - ✅ Validacions
    
    **Setmana 3: Bucles**
    - ✅ for, while, do-while
    - ✅ break i continue
    - ✅ Bucles niuats
    - ✅ Patrons
    
    **Setmana 4: Funcions**
    - ✅ Declaració i crida
    - ✅ Paràmetres i retorn
    - ✅ Recursivitat
    - ✅ Modularització
    
    **Setmana 5: Llistes**
    - ✅ Arrays unidimensionals
    - ✅ Mètodes de llistes
    - ✅ Algoritmes de cerca
    - ✅ Ordenació
    
    **Setmana 6: Matrius**
    - ✅ Arrays bidimensionals
    - ✅ Operacions amb matrius
    - ✅ Aplicacions pràctiques
    - ✅ Jocs amb taulers
    
    **Setmana 7: Projecte**
    - ✅ Integració de conceptes
    - ✅ Desenvolupament complet
    - ✅ Bones pràctiques
    - ✅ Resolució de problemes

---

## 🎓 Propers Passos

### 1. Aprofundeix en Dart

- **Col·leccions avançades:** Sets, Maps
- **Programació orientada a objectes:** Classes, herència
- **Gestió d'errors:** try-catch, exceptions
- **Programació asíncrona:** Future, async/await
- **Streams:** Fluxos de dades

---

### 2. Aprèn Flutter

Si vols crear aplicacions mòbils:
- **Widgets bàsics**
- **Layouts i disseny**
- **Gestió d'estat**
- **Navegació**
- **Connexió amb APIs**

---

### 3. Projectes per Practicar

1. **App de ToDo:** Gestió de tasques
2. **Calculadora visual:** Amb interfície gràfica
3. **Joc de cartes:** Memòria, Solitari
4. **App del temps:** Consumint una API
5. **Xat simple:** Amb sockets

---

### 4. Recursos Recomanats

**Documentació:**
- [dart.dev](https://dart.dev)
- [api.dart.dev](https://api.dart.dev)
- [flutter.dev](https://flutter.dev)

**Pràctica:**
- [Exercism - Dart Track](https://exercism.org/tracks/dart)
- [LeetCode](https://leetcode.com)
- [HackerRank](https://www.hackerrank.com/domains/algorithms)

**Comunitat:**
- [r/dartlang](https://reddit.com/r/dartlang)
- [r/FlutterDev](https://reddit.com/r/FlutterDev)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/dart)

---

## 🏆 Avaluació Final

### Criteris d'Avaluació

| Criteri | Pes | Descripció |
|---------|-----|------------|
| **Funcionalitat** | 40% | El programa fa el que s'espera |
| **Codi net** | 25% | Llegibilitat, noms descriptius |
| **Eficiència** | 15% | Bon ús d'estructures de dades |
| **Gestió d'errors** | 10% | Validacions i casos extrems |
| **Creativitat** | 10% | Funcionalitats extra, disseny |

---

### Rúbrica Detallada

#### Excel·lent (9-10)
- Totes les funcionalitats implementades perfectament
- Codi molt net i ben organitzat
- Gestió excel·lent d'errors
- Funcionalitats extra creatives

#### Notable (7-8)
- La majoria de funcionalitats funcionen bé
- Codi net i llegible
- Gestió adequada d'errors
- Algun detall extra

#### Aprovat (5-6)
- Funcionalitats bàsiques implementades
- Codi funcional encara que millorable
- Gestió bàsica d'errors

#### Suspès (0-4)
- Funcionalitats incompletes o amb errors
- Codi desorganitzat
- Errors no gestionats

---

## 🎉 Enhorabona!

!!! success "Has completat el curs de Dart!"
    Has après els fonaments de la programació amb Dart i estàs preparat per:
    
    - 🚀 Crear les teves pròpies aplicacions
    - 📱 Començar amb Flutter per apps mòbils
    - 💻 Desenvolupar projectes més complexos
    - 🌐 Explorar desenvolupament web amb Dart
    
    **Recorda:** La programació s'aprèn programant. Segueix practicant i creant projectes!

---

## 📋 Checklist de Finalització

!!! tip "Abans d'acabar el curs"
    - [ ] He completat tots els exercicis setmanals
    - [ ] He realitzat el projecte final
    - [ ] Comprenc tots els conceptes fonamentals
    - [ ] He provat diferents algorismes
    - [ ] Puc crear programes simples de forma autònoma
    - [ ] Sé on trobar documentació quan necessito ajuda
    - [ ] He explorat els recursos addicionals
    - [ ] Tinc idees per a propers projectes

---

## 💬 Feedback i Millora Contínua

### Autoavaluació

**Respon honestament:**

1. Quin tema t'ha costat més?
2. Quin projecte t'ha agradat més?
3. Què canviaries del curs?
4. Quins temes t'agradaria aprofundir?
5. Et sents preparat per continuar?

---

### Consells Finals

!!! tip "Per continuar progressant"
    1. **Practica cada dia:** Encara que siguin 30 minuts
    2. **Llegeix codi d'altres:** Aprèn de projectes open source
    3. **Fes projectes personals:** Crea alguna cosa que t'interessi
    4. **Participa en comunitats:** Pregunta i ajuda altres
    5. **No tinguis por d'equivocar-te:** Els errors són part de l'aprenentatge
    6. **Documenta el teu aprenentatge:** Blog, GitHub, notes
    7. **Fixa't objectius:** Petit pas a petit pas

---

## 🌟 Cita de Motivació

> "El viatge de mil milles comença amb un sol pas."
> — Lao Tzu

> "La millor manera de predir el futur és inventar-lo."
> — Alan Kay

> "El codi és poesia."
> — Wordpress motto

---

## 📬 Contacte i Suport

Si tens dubtes o necessites ajuda:

1. Revisa la documentació oficial de Dart
2. Busca a Stack Overflow
3. Pregunta a les comunitats de Reddit
4. Consulta amb companys de classe
5. Practica amb exercicis online

---

!!! success "Molt bé! 🎊"
    Has arribat al final del curs de Dart. Ara ets capaç de crear programes complets i estructurats. El camí de l'aprenentatge continua, però ja tens una base sòlida.
    
    **Segueix programant i gaudeix del viatge! 🚀**

---

## 🎯 Repte Final del Mes

Després d'acabar el curs, intenta crear durant el proper mes:

- **Setmana 1:** Millora el teu projecte final amb noves funcionalitats
- **Setmana 2:** Crea un joc nou des de zero
- **Setmana 3:** Desenvolupa una aplicació d'utilitat (calculadora, conversor, etc.)
- **Setmana 4:** Explora Flutter i crea la teva primera app mòbil

**Comparteix els teus progressos amb la comunitat! 💪**
