# Setmana 2: Estructures de Control Condicionals

## Objectius d'aprenentatge
- Dominar l'estructura if-else
- Implementar decisions binàries i múltiples
- Utilitzar la sentència switch
- Combinar diferents estructures condicionals
- Validar entrades d'usuari

---

## Sessió 1-2: Sentència if-else

### 1. Estructura IF Simple

!!! note "Definició"
    L'estructura **if** permet executar un bloc de codi **només si** es compleix una condició.

```dart
void main() {
  int edat = 20;
  
  if (edat >= 18) {
    print('Ets major d\'edat');
  }
  
  print('Programa acabat');
}
```

**Sortida:**
```
Ets major d'edat
Programa acabat
```

---

### 2. Sintaxi de l'IF

```dart
if (condició) {
  // Codi que s'executa si la condició és certa
}
```

#### Exemple: Número positiu

```dart
import 'dart:io';

void main() {
  print('Introdueix un número:');
  int numero = int.parse(stdin.readLineSync()!);
  
  if (numero > 0) {
    print('El número és positiu');
  }
}
```

---

### 3. Múltiples Instruccions dins l'IF

```dart
import 'dart:io';

void main() {
  print('Preu del producte:');
  double preu = double.parse(stdin.readLineSync()!);
  
  if (preu > 100.0) {
    print('*** DESCOMPTE DEL 10% ***');
    double preuFinal = preu * 0.90;
    print('Preu original: ${preu.toStringAsFixed(2)}€');
    print('Preu amb descompte: ${preuFinal.toStringAsFixed(2)}€');
    print('Estalvis: ${(preu - preuFinal).toStringAsFixed(2)}€');
  }
  
  print('Gràcies per la teva compra!');
}
```

---

### 4. Estructura IF-ELSE

!!! note "Definició"
    L'estructura **if-else** permet executar un bloc si la condició és certa, i un bloc **diferent** si és falsa.

```dart
void main() {
  int numero = 7;
  
  if (numero % 2 == 0) {
    print('El número és parell');
  } else {
    print('El número és senar');
  }
}
```

#### Diagrama de flux

```
        ┌─────────────┐
        │  CONDICIÓ   │
        └──────┬──────┘
               │
          cert │ fals
               │   │
          ┌────▼───▼────┐
          │             │
    ┌─────▼──┐    ┌────▼─────┐
    │ACCIONS │    │ ACCIONS  │
    │  CERT  │    │   FALS   │
    └────────┘    └──────────┘
          │             │
          └──────┬──────┘
                 ▼
          ┌─────────────┐
          │  CONTINUA   │
          └─────────────┘
```

---

### 5. Comparació IF vs IF-ELSE

=== "Només IF"
    ```dart
    void main() {
      int edat = 16;
      
      if (edat >= 18) {
        print('Ets adult');
      }
      // Si edat < 18, no mostra res
    }
    ```

=== "IF-ELSE"
    ```dart
    void main() {
      int edat = 16;
      
      if (edat >= 18) {
        print('Ets adult');
      } else {
        print('Ets menor d\'edat');
      }
      // Sempre mostra alguna cosa
    }
    ```

---

### 6. Condicions Compostes

#### Amb AND (&&)

```dart
import 'dart:io';

void main() {
  print('Edat:');
  int edat = int.parse(stdin.readLineSync()!);
  
  print('Tens carnet? (true/false)');
  bool teCarnet = stdin.readLineSync()!.toLowerCase() == 'true';
  
  if (edat >= 18 && teCarnet) {
    print('Pots conduir!');
  } else {
    print('No pots conduir');
  }
}
```

#### Amb OR (||)

```dart
import 'dart:io';

void main() {
  print('Ets estudiant? (true/false)');
  bool esEstudiant = stdin.readLineSync()!.toLowerCase() == 'true';
  
  print('Ets pensionista? (true/false)');
  bool esPensionista = stdin.readLineSync()!.toLowerCase() == 'true';
  
  if (esEstudiant || esPensionista) {
    print('Tens un 20% de descompte!');
  } else {
    print('Preu normal');
  }
}
```

---

### 7. Operador Ternari

Dart ofereix una forma compacta per a decisions simples:

```dart
void main() {
  int edat = 20;
  
  // Forma llarga
  String resultat;
  if (edat >= 18) {
    resultat = 'Adult';
  } else {
    resultat = 'Menor';
  }
  
  // Forma curta (operador ternari)
  String resultat2 = (edat >= 18) ? 'Adult' : 'Menor';
  
  print(resultat2);
}
```

**Sintaxi:** `condició ? valorSiCert : valorSiFals`

---

## Sessió 3-4: Sentència switch

### 1. Què és Switch?

!!! note "Definició"
    **switch** avalua una expressió i executa el codi del cas que coincideixi.

### 2. Sintaxi Bàsica

```dart
void main() {
  int dia = 3;
  
  switch (dia) {
    case 1:
      print('Dilluns');
      break;
    case 2:
      print('Dimarts');
      break;
    case 3:
      print('Dimecres');
      break;
    case 4:
      print('Dijous');
      break;
    case 5:
      print('Divendres');
      break;
    case 6:
      print('Dissabte');
      break;
    case 7:
      print('Diumenge');
      break;
    default:
      print('Dia no vàlid');
  }
}
```

**Sortida:** `Dimecres`

---

### 3. Importància del break

!!! warning "Important"
    Cada cas ha de tenir `break` per evitar que continuï executant els casos següents.

```dart
// ❌ Sense break (caure al següent cas)
void main() {
  int opcio = 1;
  
  switch (opcio) {
    case 1:
      print('Opció 1');
      // Falta break!
    case 2:
      print('Opció 2');
      break;
  }
}
// Sortida: Opció 1
//          Opció 2 (no desitjat!)
```

```dart
// ✅ Amb break
void main() {
  int opcio = 1;
  
  switch (opcio) {
    case 1:
      print('Opció 1');
      break;
    case 2:
      print('Opció 2');
      break;
  }
}
// Sortida: Opció 1
```

---

### 4. Cas default

```dart
import 'dart:io';

void main() {
  print('Escull una opció (1-3):');
  int opcio = int.parse(stdin.readLineSync()!);
  
  switch (opcio) {
    case 1:
      print('Has escollit l\'opció 1');
      break;
    case 2:
      print('Has escollit l\'opció 2');
      break;
    case 3:
      print('Has escollit l\'opció 3');
      break;
    default:
      print('Opció no vàlida');
  }
}
```

---

### 5. Exemple: Calculadora

```dart
import 'dart:io';

void main() {
  print('Primer número:');
  double num1 = double.parse(stdin.readLineSync()!);
  
  print('Segon número:');
  double num2 = double.parse(stdin.readLineSync()!);
  
  print('Operació (+, -, *, /):');
  String operacio = stdin.readLineSync()!;
  
  double resultat;
  
  switch (operacio) {
    case '+':
      resultat = num1 + num2;
      print('Resultat: $resultat');
      break;
    case '-':
      resultat = num1 - num2;
      print('Resultat: $resultat');
      break;
    case '*':
      resultat = num1 * num2;
      print('Resultat: $resultat');
      break;
    case '/':
      if (num2 != 0) {
        resultat = num1 / num2;
        print('Resultat: $resultat');
      } else {
        print('Error: Divisió per zero');
      }
      break;
    default:
      print('Operació no vàlida');
  }
}
```

---

### 6. Switch amb Strings

```dart
import 'dart:io';

void main() {
  print('Idioma (ca/es/en):');
  String idioma = stdin.readLineSync()!.toLowerCase();
  
  switch (idioma) {
    case 'ca':
      print('Hola!');
      break;
    case 'es':
      print('¡Hola!');
      break;
    case 'en':
      print('Hello!');
      break;
    default:
      print('Idioma no suportat');
  }
}
```

---

## Sessió 5-6: Pràctica Integrada

### 1. Alternatives Niuades

```dart
import 'dart:io';

void main() {
  print('Edat:');
  int edat = int.parse(stdin.readLineSync()!);
  
  if (edat < 12) {
    print('Categoria: INFANTIL');
  } else {
    if (edat < 18) {
      print('Categoria: ADOLESCENT');
    } else {
      if (edat < 65) {
        print('Categoria: ADULT');
      } else {
        print('Categoria: SÈNIOR');
      }
    }
  }
}
```

---

### 2. Alternatives Encadenades (else if)

!!! tip "Millor pràctica"
    Usa `else if` en lloc de niuar múltiples `if-else`.

```dart
import 'dart:io';

void main() {
  print('Edat:');
  int edat = int.parse(stdin.readLineSync()!);
  
  if (edat < 12) {
    print('Categoria: INFANTIL');
  } else if (edat < 18) {
    print('Categoria: ADOLESCENT');
  } else if (edat < 65) {
    print('Categoria: ADULT');
  } else {
    print('Categoria: SÈNIOR');
  }
}
```

---

### 3. Qualificació de Notes

```dart
import 'dart:io';

void main() {
  print('Introdueix la nota (0-10):');
  double nota = double.parse(stdin.readLineSync()!);
  
  if (nota < 0 || nota > 10) {
    print('Nota no vàlida');
  } else if (nota < 5.0) {
    print('SUSPÈS');
  } else if (nota < 7.0) {
    print('APROVAT');
  } else if (nota < 9.0) {
    print('NOTABLE');
  } else {
    print('EXCEL·LENT');
  }
}
```

---

### 4. Validació d'Entrada

```dart
import 'dart:io';

void main() {
  print('Usuari:');
  String usuari = stdin.readLineSync()!;
  
  print('Contrasenya:');
  String contrasenya = stdin.readLineSync()!;
  
  const String USUARI_VALID = 'admin';
  const String PASSWORD_VALID = 'pass123';
  
  if (usuari == USUARI_VALID && contrasenya == PASSWORD_VALID) {
    print('✅ Accés permès');
    print('Benvingut al sistema!');
  } else {
    print('❌ Accés denegat');
    if (usuari != USUARI_VALID) {
      print('Usuari incorrecte');
    }
    if (contrasenya != PASSWORD_VALID) {
      print('Contrasenya incorrecta');
    }
  }
}
```

---

### 5. Càlcul de Tarifes

```dart
import 'dart:io';

void main() {
  print('Edat:');
  int edat = int.parse(stdin.readLineSync()!);
  
  print('Distància (km):');
  double distancia = double.parse(stdin.readLineSync()!);
  
  double preu;
  
  // Tarifa base segons edat
  if (edat < 12 || edat >= 65) {
    preu = 5.0;
  } else {
    preu = 10.0;
  }
  
  // Suplement per distància
  if (distancia > 100) {
    preu += 15.0;
  } else if (distancia > 50) {
    preu += 8.0;
  }
  
  print('Preu total: ${preu.toStringAsFixed(2)}€');
}
```

---

### 6. Joc: Pedra, Paper, Tisora

```dart
import 'dart:io';
import 'dart:math';

void main() {
  List<String> opcions = ['pedra', 'paper', 'tisora'];
  Random random = Random();
  
  print('Escull: pedra, paper o tisora');
  String jugador = stdin.readLineSync()!.toLowerCase();
  
  if (!opcions.contains(jugador)) {
    print('Opció no vàlida');
    return;
  }
  
  String ordinador = opcions[random.nextInt(3)];
  print('Ordinador: $ordinador');
  print('Tu: $jugador');
  
  if (jugador == ordinador) {
    print('EMPAT!');
  } else if (
    (jugador == 'pedra' && ordinador == 'tisora') ||
    (jugador == 'paper' && ordinador == 'pedra') ||
    (jugador == 'tisora' && ordinador == 'paper')
  ) {
    print('🎉 HAS GUANYAT!');
  } else {
    print('😢 HAS PERDUT!');
  }
}
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Què mostrarà?

```dart
void main() {
  int x = 10;
  int y = 5;
  
  if (x > 5) {
    if (y > 5) {
      print('A');
    } else {
      print('B');
    }
  } else {
    print('C');
  }
}
```

??? success "Solució"
    **B**
    
    - x = 10 > 5 → cert (entra al primer if)
    - y = 5 > 5 → fals (va al else)
    - Mostra "B"

---

### 🎯 Activitat 2: Troba l'error

```dart
void main() {
  int opcio = 2;
  
  switch (opcio) {
    case 1:
      print('Opció 1');
    case 2:
      print('Opció 2');
    default:
      print('Altres');
  }
}
```

??? success "Solució"
    Falten els `break`:
    
    ```dart
    void main() {
      int opcio = 2;
      
      switch (opcio) {
        case 1:
          print('Opció 1');
          break;
        case 2:
          print('Opció 2');
          break;
        default:
          print('Altres');
      }
    }
    ```

---

### 🎯 Activitat 3: Refactoritza

Millora aquest codi amb `else if`:

```dart
void main() {
  int nota = 7;
  
  if (nota >= 9) {
    print('Excel·lent');
  }
  if (nota >= 7 && nota < 9) {
    print('Notable');
  }
  if (nota >= 5 && nota < 7) {
    print('Aprovat');
  }
  if (nota < 5) {
    print('Suspès');
  }
}
```

??? success "Solució"
    ```dart
    void main() {
      int nota = 7;
      
      if (nota >= 9) {
        print('Excel·lent');
      } else if (nota >= 7) {
        print('Notable');
      } else if (nota >= 5) {
        print('Aprovat');
      } else {
        print('Suspès');
      }
    }
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Parell o senar

Programa que determini si un número és parell o senar.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Introdueix un número:');
      int numero = int.parse(stdin.readLineSync()!);
      
      if (numero % 2 == 0) {
        print('$numero és parell');
      } else {
        print('$numero és senar');
      }
    }
    ```

---

### Exercici 2: Any de traspàs

Determina si un any és de traspàs:
- Divisible per 4 i no per 100, O
- Divisible per 400

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Any:');
      int any = int.parse(stdin.readLineSync()!);
      
      bool esTraspas = (any % 4 == 0 && any % 100 != 0) || (any % 400 == 0);
      
      if (esTraspas) {
        print('$any és un any de traspàs');
      } else {
        print('$any no és un any de traspàs');
      }
    }
    ```

---

### Exercici 3: Major de tres números

Troba el major de tres números.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Primer número:');
      int num1 = int.parse(stdin.readLineSync()!);
      
      print('Segon número:');
      int num2 = int.parse(stdin.readLineSync()!);
      
      print('Tercer número:');
      int num3 = int.parse(stdin.readLineSync()!);
      
      int major;
      
      if (num1 >= num2 && num1 >= num3) {
        major = num1;
      } else if (num2 >= num1 && num2 >= num3) {
        major = num2;
      } else {
        major = num3;
      }
      
      print('El major és: $major');
    }
    ```

---

### Exercici 4: Menú de restaurant

Crea un menú amb switch.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('===== MENÚ =====');
      print('1. Amanida - 6€');
      print('2. Pizza - 9€');
      print('3. Pasta - 8€');
      print('4. Bistec - 15€');
      print('================');
      print('Tria una opció (1-4):');
      
      int opcio = int.parse(stdin.readLineSync()!);
      
      switch (opcio) {
        case 1:
          print('Has triat: Amanida');
          print('Preu: 6€');
          break;
        case 2:
          print('Has triat: Pizza');
          print('Preu: 9€');
          break;
        case 3:
          print('Has triat: Pasta');
          print('Preu: 8€');
          break;
        case 4:
          print('Has triat: Bistec');
          print('Preu: 15€');
          break;
        default:
          print('Opció no vàlida');
      }
    }
    ```

---

### Exercici 5: Classificador de triangles

Per tres costats, determina el tipus de triangle.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Costat 1:');
      double a = double.parse(stdin.readLineSync()!);
      
      print('Costat 2:');
      double b = double.parse(stdin.readLineSync()!);
      
      print('Costat 3:');
      double c = double.parse(stdin.readLineSync()!);
      
      // Comprovar si és un triangle vàlid
      if (a + b <= c || a + c <= b || b + c <= a) {
        print('No és un triangle vàlid');
      } else if (a == b && b == c) {
        print('Triangle EQUILÀTER');
      } else if (a == b || b == c || a == c) {
        print('Triangle ISÒSCELES');
      } else {
        print('Triangle ESCALÈ');
      }
    }
    ```

---

## 🏠 Deures

### Repte 1: IMC amb categories
Calcula l'IMC i classifica:
- < 18.5: Baix pes
- 18.5-24.9: Normal
- 25-29.9: Sobrepès
- ≥ 30: Obesitat

### Repte 2: Conversió de notes
Converteix notes numèriques (0-100) a lletres (A-F).

### Repte 3: MasterMind simplificat
Genera un número aleatori de 4 dígits i dona pistes.

### Repte 4: Menú complet
Crea un programa amb menú que ofereixi:
1. Calculadora
2. Conversor de temperatures
3. Any de traspàs
4. Sortir

### Repte 5: Validador de dates
Comprova si una data (dia, mes, any) és vàlida.

---

## 📝 Resum

!!! summary "Conceptes clau de la Setmana 2"
    **IF simple:**
    - ✅ Executa codi només si la condició és certa
    - ✅ Sintaxi: `if (condició) { ... }`
    
    **IF-ELSE:**
    - ✅ Dues branques: una per cert, una per fals
    - ✅ Sempre s'executa una de les dues
    
    **ELSE IF:**
    - ✅ Avalua múltiples condicions seqüencialment
    - ✅ Més llegible que niuar IF
    
    **SWITCH:**
    - ✅ Avalua una expressió contra múltiples casos
    - ✅ Necessita `break` en cada cas
    - ✅ `default` per a casos no previstos
    
    **Operador ternari:**
    - ✅ Forma compacta: `condició ? siCert : siFals`

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quan s'executa el bloc `else` d'un `if-else`?
    
    a) Sempre  
    b) Mai  
    c) Quan la condició és falsa  
    d) Quan la condició és certa

??? success "Resposta"
    **c) Quan la condició és falsa**

!!! question "Pregunta 2"
    Per què és important el `break` en un `switch`?
    
    a) No és important  
    b) Per evitar errors de compilació  
    c) Per evitar executar els casos següents  
    d) Per millorar el rendiment

??? success "Resposta"
    **c) Per evitar executar els casos següents**

!!! question "Pregunta 3"
    Quin operador lògic retorna cert si AMBDUES condicions són certes?
    
    a) `||`  
    b) `&&`  
    c) `!`  
    d) `==`

??? success "Resposta"
    **b) &&**

---

!!! success "Has completat la Setmana 2! 🎉"
    Ara domines les estructures condicionals. A la setmana 3 aprendràs sobre bucles i iteracions.
