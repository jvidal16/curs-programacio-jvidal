# Setmana 1: Introducció a Dart i Sintaxi Bàsica

## Objectius d'aprenentatge
- Conèixer què és Dart i per a què serveix
- Instal·lar i configurar l'entorn de desenvolupament
- Comprendre l'estructura bàsica d'un programa Dart
- Treballar amb variables i tipus de dades
- Utilitzar operadors i entrada/sortida de dades
- Aplicar constants i bones pràctiques

---

## Sessió 1-2: Introducció i Instal·lació

### 1. Què és Dart?

!!! note "Definició"
    **Dart** és un llenguatge de programació modern, desenvolupat per Google, optimitzat per crear aplicacions ràpides en qualsevol plataforma.

#### Característiques principals

- 🚀 **Ràpid:** Compilat a codi natiu per a alt rendiment
- 🎯 **Tipat fort:** Detecta errors abans d'executar
- 🌐 **Multiplataforma:** Mòbil, web, escriptori i backend
- 💙 **Flutter:** El framework més popular per a apps mòbils usa Dart

#### Història breu

- 2011: Google presenta Dart
- 2015: Llançament de Flutter
- 2018: Dart 2.0 amb millores significatives
- Actualitat: Un dels llenguatges amb més creixement

---

### 2. Instal·lació de l'Entorn

=== "DartPad (Online) - Recomanat per començar"
    
    **Avantatges:**
    - ✅ No cal instal·lar res
    - ✅ Funciona al navegador
    - ✅ Ideal per aprendre
    
    **Com accedir:**
    1. Obre [dartpad.dev](https://dartpad.dev)
    2. Ja pots començar a programar!
    
    ```dart
    void main() {
      print('Hola des de DartPad!');
    }
    ```

=== "VS Code (Recomanat per projectes)"
    
    **Passos d'instal·lació:**
    
    1. **Instal·la Dart SDK:**
       - Descarrega de [dart.dev](https://dart.dev/get-dart)
       - Segueix les instruccions per al teu sistema operatiu
    
    2. **Instal·la VS Code:**
       - Descarrega de [code.visualstudio.com](https://code.visualstudio.com)
    
    3. **Instal·la l'extensió de Dart:**
       - Obre VS Code
       - Ves a Extensions (Ctrl+Shift+X)
       - Cerca "Dart"
       - Instal·la l'extensió oficial
    
    4. **Verifica la instal·lació:**
       ```bash
       dart --version
       ```

---

### 3. Primer Programa: "Hola Món"

```dart
void main() {
  print('Hola Món!');
}
```

**Anàlisi del codi:**

- `void main()` → Funció principal (punt d'entrada del programa)
- `{` i `}` → Delimiten el bloc de codi
- `print()` → Funció per mostrar text a la consola
- `;` → Finalitza cada instrucció

!!! tip "Consell"
    Cada programa Dart **ha de tenir** una funció `main()`. És des d'on comença l'execució.

---

### 4. Estructura Bàsica d'un Programa

```dart
// Comentari d'una sola línia

/* 
   Comentari
   de múltiples
   línies
*/

void main() {
  // Instruccions del programa
  print('Primera instrucció');
  print('Segona instrucció');
}
```

#### Tipus de comentaris

| Tipus | Sintaxi | Ús |
|-------|---------|-----|
| Línia | `// comentari` | Explicacions curtes |
| Bloc | `/* comentari */` | Explicacions llargues |
| Documentació | `/// comentari` | Documentar funcions/classes |

---

### 5. Funció print()

La funció `print()` mostra informació a la consola.

```dart
void main() {
  print('Text simple');
  print(42);
  print(3.14);
  print(true);
  
  // Múltiples valors (concatenació)
  print('Tinc ' + '20' + ' anys');
}
```

**Sortida:**
```
Text simple
42
3.14
true
Tinc 20 anys
```

---

## Sessió 3-4: Variables i Tipus de Dades

### 1. Què és una Variable?

!!! note "Definició"
    Una **variable** és un espai de memòria amb un nom que emmagatzema un valor que pot canviar durant l'execució del programa.

```dart
void main() {
  var nom = 'Anna';        // Variable amb tipus inferit
  print(nom);
  
  nom = 'Maria';           // Podem canviar el valor
  print(nom);
}
```

---

### 2. Declaració de Variables

=== "Amb var (tipus inferit)"
    
    ```dart
    void main() {
      var edat = 20;           // Dart infereix que és int
      var nom = 'Joan';        // Dart infereix que és String
      var altura = 1.75;       // Dart infereix que és double
      var esEstudiant = true;  // Dart infereix que és bool
      
      print(edat);
      print(nom);
      print(altura);
      print(esEstudiant);
    }
    ```

=== "Amb tipus explícit"
    
    ```dart
    void main() {
      int edat = 20;
      String nom = 'Joan';
      double altura = 1.75;
      bool esEstudiant = true;
      
      print(edat);
      print(nom);
      print(altura);
      print(esEstudiant);
    }
    ```

!!! tip "Quan usar cada forma?"
    - **var:** Quan el tipus és obvi pel valor assignat
    - **Tipus explícit:** Per més claredat o quan declarem sense valor inicial

---

### 3. Tipus de Dades Bàsics

#### 3.1 Números Enters (int)

```dart
void main() {
  int edat = 25;
  int anyNaixement = 1998;
  int temperatura = -5;
  
  print('Edat: $edat');
  print('Any: $anyNaixement');
  print('Temperatura: $temperatura°C');
}
```

#### 3.2 Números Decimals (double)

```dart
void main() {
  double altura = 1.75;
  double pes = 68.5;
  double pi = 3.14159;
  
  print('Altura: $altura m');
  print('Pes: $pes kg');
  print('Pi: $pi');
}
```

#### 3.3 Text (String)

```dart
void main() {
  String nom = 'Anna';
  String cognom = "García";
  String frase = 'Hola, com estàs?';
  
  // Strings multilínia
  String poema = '''
    Roses són vermelles,
    Violetes són blaves,
    Dart és genial!
  ''';
  
  print(nom);
  print(frase);
  print(poema);
}
```

!!! info "Cometes simples vs dobles"
    En Dart, `'text'` i `"text"` són equivalents. Per convenció, s'usen cometes simples.

#### 3.4 Booleans (bool)

```dart
void main() {
  bool esMajorEdat = true;
  bool faFred = false;
  bool teCarnet = true;
  
  print('És major d\'edat: $esMajorEdat');
  print('Fa fred: $faFred');
  print('Té carnet: $teCarnet');
}
```

---

### 4. Interpolació de Cadenes

Dart permet inserir variables dins de Strings de forma elegant:

```dart
void main() {
  String nom = 'Carla';
  int edat = 22;
  double altura = 1.68;
  
  // Amb $variable
  print('Em dic $nom');
  
  // Amb ${expressió}
  print('Tinc $edat anys');
  print('L\'any que ve tindré ${edat + 1} anys');
  print('La meva altura és $altura metres');
  
  // Expressions més complexes
  print('La meva altura en cm: ${altura * 100} cm');
}
```

**Sortida:**
```
Em dic Carla
Tinc 22 anys
L'any que ve tindré 23 anys
La meva altura és 1.68 metres
La meva altura en cm: 168.0 cm
```

---

### 5. Operadors Aritmètics

```dart
void main() {
  int a = 10;
  int b = 3;
  
  print('Suma: ${a + b}');           // 13
  print('Resta: ${a - b}');          // 7
  print('Multiplicació: ${a * b}');  // 30
  print('Divisió: ${a / b}');        // 3.333...
  print('Divisió entera: ${a ~/ b}'); // 3
  print('Mòdul (residu): ${a % b}'); // 1
  
  // Increment i decrement
  int contador = 5;
  contador++;  // Ara val 6
  contador--;  // Ara val 5
  print('Comptador: $contador');
}
```

#### Taula d'operadors

| Operador | Operació | Exemple | Resultat |
|----------|----------|---------|----------|
| `+` | Suma | `5 + 3` | `8` |
| `-` | Resta | `5 - 3` | `2` |
| `*` | Multiplicació | `5 * 3` | `15` |
| `/` | Divisió | `5 / 2` | `2.5` |
| `~/` | Divisió entera | `5 ~/ 2` | `2` |
| `%` | Mòdul | `5 % 2` | `1` |

---

### 6. Operadors Relacionals

```dart
void main() {
  int x = 10;
  int y = 5;
  
  print('x == y: ${x == y}');  // false
  print('x != y: ${x != y}');  // true
  print('x > y: ${x > y}');    // true
  print('x < y: ${x < y}');    // false
  print('x >= y: ${x >= y}');  // true
  print('x <= y: ${x <= y}');  // false
}
```

| Operador | Significat | Exemple | Resultat |
|----------|------------|---------|----------|
| `==` | Igual | `5 == 5` | `true` |
| `!=` | Diferent | `5 != 3` | `true` |
| `>` | Major | `5 > 3` | `true` |
| `<` | Menor | `5 < 3` | `false` |
| `>=` | Major o igual | `5 >= 5` | `true` |
| `<=` | Menor o igual | `5 <= 3` | `false` |

---

### 7. Operadors Lògics

```dart
void main() {
  bool teSol = true;
  bool faCaldor = true;
  bool plou = false;
  
  // AND (&&) - Totes han de ser certes
  print('Sol I calor: ${teSol && faCaldor}');  // true
  print('Sol I pluja: ${teSol && plou}');      // false
  
  // OR (||) - Almenys una ha de ser certa
  print('Sol O pluja: ${teSol || plou}');      // true
  print('Calor O pluja: ${faCaldor || plou}'); // true
  
  // NOT (!) - Inverteix el valor
  print('No plou: ${!plou}');                  // true
  print('No té sol: ${!teSol}');               // false
}
```

| Operador | Significat | Exemple | Resultat |
|----------|------------|---------|----------|
| `&&` | AND (I) | `true && false` | `false` |
| `||` | OR (O) | `true || false` | `true` |
| `!` | NOT (NO) | `!true` | `false` |

---

### 8. Entrada de Dades

Per llegir dades de l'usuari, utilitzem `stdin.readLineSync()`:

```dart
import 'dart:io';

void main() {
  print('Com et dius?');
  String? nom = stdin.readLineSync();
  
  print('Quants anys tens?');
  String? edatText = stdin.readLineSync();
  int edat = int.parse(edatText!);
  
  print('\nHola $nom!');
  print('Tens $edat anys.');
}
```

!!! warning "Important"
    - Cal `import 'dart:io';` al principi
    - `readLineSync()` retorna `String?` (pot ser null)
    - Usa `int.parse()` per convertir a enter
    - Usa `double.parse()` per convertir a decimal
    - El `!` indica que estem segurs que no és null

---

### 9. Conversió de Tipus

```dart
import 'dart:io';

void main() {
  // String a int
  String textEdat = '25';
  int edat = int.parse(textEdat);
  print('Edat: $edat');
  
  // String a double
  String textAltura = '1.75';
  double altura = double.parse(textAltura);
  print('Altura: $altura');
  
  // int a String
  int numero = 42;
  String textNumero = numero.toString();
  print('Text: $textNumero');
  
  // double a String
  double pi = 3.14159;
  String textPi = pi.toString();
  print('Pi: $textPi');
  
  // double a int (trunca decimals)
  double decimal = 3.99;
  int enter = decimal.toInt();
  print('Enter: $enter');  // 3
}
```

---

## Sessió 5-6: Constants i Pràctica

### 1. Constants: final vs const

#### 1.1 Constants amb final

```dart
void main() {
  final String nom = 'Anna';
  final int anyNaixement = 2000;
  final double pi = 3.14159;
  
  print(nom);
  print(anyNaixement);
  print(pi);
  
  // nom = 'Maria';  ❌ ERROR: No es pot modificar
}
```

!!! info "final"
    - El valor s'assigna en temps d'execució
    - No es pot reassignar després
    - Pot dependre de càlculs

#### 1.2 Constants amb const

```dart
void main() {
  const double PI = 3.14159;
  const int DIES_SETMANA = 7;
  const String EMPRESA = 'TechCorp';
  
  print('Pi: $PI');
  print('Dies: $DIES_SETMANA');
  print('Empresa: $EMPRESA');
  
  // PI = 3.14;  ❌ ERROR: No es pot modificar
}
```

!!! info "const"
    - El valor ha de ser conegut en temps de compilació
    - Més eficient que final
    - Per a valors realment constants

#### Comparació final vs const

=== "final"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Nom?');
      final String nom = stdin.readLineSync()!;
      // ✅ OK: El valor es determina en execució
      
      print('Hola $nom!');
    }
    ```

=== "const"
    ```dart
    void main() {
      const double PI = 3.14159;
      const int MAX_INTENTS = 3;
      // ✅ OK: Valors coneguts abans d'executar
      
      print('Pi: $PI');
      print('Màxim intents: $MAX_INTENTS');
    }
    ```

---

### 2. Bones Pràctiques de Nomenclatura

#### 2.1 Variables i funcions: camelCase

```dart
void main() {
  // ✅ Correcte
  String nomComplet = 'Anna García';
  int edatUsuari = 25;
  double preuTotal = 99.99;
  bool esMajorEdat = true;
  
  // ❌ Incorrecte
  String Nom_Complet = 'Anna';
  int edat_usuari = 25;
}
```

#### 2.2 Constants: UPPER_CASE

```dart
void main() {
  // ✅ Correcte
  const double PI = 3.14159;
  const int MAX_VALOR = 100;
  const String NOM_EMPRESA = 'TechCorp';
  
  // ❌ Incorrecte
  const double pi = 3.14159;
  const int maxValor = 100;
}
```

#### 2.3 Noms descriptius

```dart
void main() {
  // ✅ Noms clars i descriptius
  int edatUsuari = 25;
  double preuAmbIVA = 121.0;
  bool tePermisConduir = true;
  String correuElectronic = 'anna@example.com';
  
  // ❌ Noms poc clars
  int e = 25;
  double p = 121.0;
  bool b = true;
  String c = 'anna@example.com';
}
```

---

### 3. Debug Bàsic i Errors Comuns

#### Error 1: Oblidar el punt i coma

```dart
// ❌ Incorrecte
void main() {
  print('Hola')  // Falta ;
  print('Adéu')
}

// ✅ Correcte
void main() {
  print('Hola');
  print('Adéu');
}
```

#### Error 2: Tipus incompatibles

```dart
// ❌ Incorrecte
void main() {
  int edat = '25';  // String en lloc d'int
}

// ✅ Correcte
void main() {
  int edat = 25;
  // O
  int edat = int.parse('25');
}
```

#### Error 3: Variable no inicialitzada

```dart
// ❌ Incorrecte
void main() {
  int edat;
  print(edat);  // Error: variable no inicialitzada
}

// ✅ Correcte
void main() {
  int edat = 0;
  print(edat);
}
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Analitza el codi

Què mostrarà aquest programa?

```dart
void main() {
  String nom = 'Marc';
  int edat = 20;
  
  print('Hola $nom');
  print('Tens $edat anys');
  print('L\'any que ve tindràs ${edat + 1} anys');
}
```

??? success "Solució"
    ```
    Hola Marc
    Tens 20 anys
    L'any que ve tindràs 21 anys
    ```

---

### 🎯 Activitat 2: Troba els errors

Aquest codi té 4 errors. Troba'ls i corregeix-los:

```dart
void main() {
  String nom = Marc;
  int edat = '25';
  print('Hola' + nom)
  print('Edat: $edat');
```

??? success "Solució"
    ```dart
    void main() {
      String nom = 'Marc';           // 1. Falten cometes
      int edat = 25;                 // 2. 25 ha de ser enter, no String
      print('Hola $nom');           // 3. Falta ; i usar interpolació
      print('Edat: $edat');
    }                                 // 4. Faltava tancar }
    ```

---

### 🎯 Activitat 3: Completa el codi

```dart
void main() {
  // Declara una variable per l'edat
  _____ edat = 18;
  
  // Declara una constant per al màxim d'intents
  _____ MAX_INTENTS = 3;
  
  // Mostra un missatge amb interpolació
  print('Tens _____ anys');
}
```

??? success "Solució"
    ```dart
    void main() {
      int edat = 18;
      const int MAX_INTENTS = 3;
      print('Tens $edat anys');
    }
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Dades personals

Programa que demani nom i edat, i mostri un missatge personalitzat.

**Exemple d'execució:**
```
Com et dius?
> Anna
Quants anys tens?
> 22
---
Hola Anna!
Tens 22 anys.
```

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Com et dius?');
      String? nom = stdin.readLineSync();
      
      print('Quants anys tens?');
      String? edatText = stdin.readLineSync();
      int edat = int.parse(edatText!);
      
      print('---');
      print('Hola $nom!');
      print('Tens $edat anys.');
    }
    ```

---

### Exercici 2: Calculadora bàsica

Programa que demani dos números i mostri suma, resta, multiplicació i divisió.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Primer número:');
      String? num1Text = stdin.readLineSync();
      double num1 = double.parse(num1Text!);
      
      print('Segon número:');
      String? num2Text = stdin.readLineSync();
      double num2 = double.parse(num2Text!);
      
      print('\n--- RESULTATS ---');
      print('Suma: ${num1 + num2}');
      print('Resta: ${num1 - num2}');
      print('Multiplicació: ${num1 * num2}');
      print('Divisió: ${num1 / num2}');
    }
    ```

---

### Exercici 3: Conversor de temperatures

Programa que converteixi Celsius a Fahrenheit.

**Fórmula:** `F = C * 9/5 + 32`

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Temperatura en Celsius:');
      String? celsiusText = stdin.readLineSync();
      double celsius = double.parse(celsiusText!);
      
      double fahrenheit = celsius * 9 / 5 + 32;
      
      print('$celsius°C = $fahrenheit°F');
    }
    ```

---

### Exercici 4: Àrea i perímetre

Programa que calculi l'àrea i perímetre d'un rectangle.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Base del rectangle:');
      String? baseText = stdin.readLineSync();
      double base = double.parse(baseText!);
      
      print('Altura del rectangle:');
      String? alturaText = stdin.readLineSync();
      double altura = double.parse(alturaText!);
      
      double area = base * altura;
      double perimetre = 2 * (base + altura);
      
      print('\n--- RESULTATS ---');
      print('Àrea: $area');
      print('Perímetre: $perimetre');
    }
    ```

---

### Exercici 5: Càlcul d'IVA

Programa que calculi el preu amb IVA (21%).

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      const double IVA = 0.21;
      
      print('Preu del producte (sense IVA):');
      String? preuText = stdin.readLineSync();
      double preuBase = double.parse(preuText!);
      
      double importIVA = preuBase * IVA;
      double preuFinal = preuBase + importIVA;
      
      print('\n--- FACTURA ---');
      print('Preu base: ${preuBase.toStringAsFixed(2)}€');
      print('IVA (21%): ${importIVA.toStringAsFixed(2)}€');
      print('Total: ${preuFinal.toStringAsFixed(2)}€');
    }
    ```

---

### Exercici 6: Àrea d'un cercle

Calcula l'àrea d'un cercle donat el radi.

**Fórmula:** `A = π * r²`

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      const double PI = 3.14159;
      
      print('Radi del cercle:');
      String? radiText = stdin.readLineSync();
      double radi = double.parse(radiText!);
      
      double area = PI * radi * radi;
      
      print('Àrea del cercle: ${area.toStringAsFixed(2)}');
    }
    ```

---

## 🏠 Deures

### Repte 1: Descompte per volum
Programa que calculi el preu final aplicant descomptes:
- Menys de 10 unitats: sense descompte
- 10-50 unitats: 10% descompte
- Més de 50 unitats: 20% descompte

### Repte 2: Conversor complet
Programa que converteixi:
1. Metres a quilòmetres
2. Quilograms a grams
3. Hores a minuts

### Repte 3: Mitjana de 3 notes
Demana 3 notes i calcula la mitjana.

### Repte 4: Velocitat mitjana
Calcula la velocitat mitjana donada la distància (km) i el temps (hores).

**Fórmula:** `v = d / t`

### Repte 5: Conversor de divisa
Converteix euros a dòlars (1€ = 1.10$)

---

## 📝 Resum

!!! summary "Conceptes clau de la Setmana 1"
    **Introducció:**
    - ✅ Dart és un llenguatge modern de Google
    - ✅ Funció `main()` és el punt d'entrada
    - ✅ `print()` mostra informació per consola
    
    **Variables i Tipus:**
    - ✅ `int`: números enters
    - ✅ `double`: números decimals
    - ✅ `String`: text
    - ✅ `bool`: veritat/fals
    - ✅ Interpolació amb `$variable` o `${expressió}`
    
    **Operadors:**
    - ✅ Aritmètics: `+`, `-`, `*`, `/`, `~/`, `%`
    - ✅ Relacionals: `==`, `!=`, `>`, `<`, `>=`, `<=`
    - ✅ Lògics: `&&`, `||`, `!`
    
    **Constants:**
    - ✅ `final`: valor assignat en execució
    - ✅ `const`: valor conegut en compilació
    
    **Entrada/Sortida:**
    - ✅ `stdin.readLineSync()` per llegir
    - ✅ `int.parse()` i `double.parse()` per convertir

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quin és el punt d'entrada d'un programa Dart?
    
    a) `void start()`  
    b) `void main()`  
    c) `void begin()`  
    d) `void run()`

??? success "Resposta"
    **b) void main()**  
    Tot programa Dart comença executant la funció `main()`.

!!! question "Pregunta 2"
    Quin tipus de dada és `3.14`?
    
    a) int  
    b) String  
    c) double  
    d) num

??? success "Resposta"
    **c) double**  
    Els números amb decimals són de tipus `double`.

!!! question "Pregunta 3"
    Com s'interpola una variable en un String?
    
    a) `"Hola" + nom`  
    b) `"Hola $nom"`  
    c) `"Hola {nom}"`  
    d) `"Hola %nom"`

??? success "Resposta"
    **b) "Hola $nom"**  
    Dart usa el símbol `$` per interpolar variables.

!!! question "Pregunta 4"
    Quina diferència hi ha entre `final` i `const`?
    
    a) Cap, són iguals  
    b) `final` s'assigna en execució, `const` en compilació  
    c) `const` s'assigna en execució, `final` en compilació  
    d) `final` és per enters, `const` per decimals

??? success "Resposta"
    **b) final s'assigna en execució, const en compilació**  
    `final` pot dependre de càlculs, `const` ha de ser un valor fix conegut abans.

!!! question "Pregunta 5"
    Quin operador dóna el residu d'una divisió?
    
    a) `/`  
    b) `~/`  
    c) `%`  
    d) `\\`

??? success "Resposta"
    **c) %**  
    L'operador mòdul `%` retorna el residu de la divisió.

---

## 🎓 Recursos Addicionals

### Documentació oficial
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [DartPad](https://dartpad.dev) - Editor online
- [Dart API Reference](https://api.dart.dev)

### Pràctica addicional
- [Exercism - Dart Track](https://exercism.org/tracks/dart)
- [Dart Tutorial - W3Schools](https://www.w3adda.com/dart-tutorial)

### Comunitat
- [r/dartlang](https://reddit.com/r/dartlang) - Comunitat Reddit
- [Dart Community](https://dart.dev/community)

---

!!! success "Has completat la Setmana 1! 🎉"
    Ara ja coneixes els fonaments de Dart. A la setmana 2 aprendràs sobre estructures de control condicionals (if-else).
