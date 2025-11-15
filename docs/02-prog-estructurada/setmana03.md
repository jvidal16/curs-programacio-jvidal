# Setmana 3: Bucles i Iteracions

## Objectius d'aprenentatge
- Comprendre el concepte d'iteració
- Dominar el bucle for
- Utilitzar while i do-while
- Aplicar break i continue
- Implementar bucles niuats
- Resoldre problemes amb patrons i seqüències

---

## Sessió 1-2: Bucle for

### 1. Què és un Bucle?

!!! note "Definició"
    Un **bucle** és una estructura que permet executar un bloc de codi **múltiples vegades**.

### 2. Sintaxi del Bucle for

```dart
for (inicialització; condició; increment) {
  // Codi a repetir
}
```

**Components:**
- **Inicialització:** On comença el comptador
- **Condició:** Fins quan continua el bucle
- **Increment:** Com canvia el comptador

---

### 3. Exemple Bàsic

```dart
void main() {
  for (int i = 1; i <= 5; i++) {
    print('Iteració $i');
  }
}
```

**Sortida:**
```
Iteració 1
Iteració 2
Iteració 3
Iteració 4
Iteració 5
```

**Traça d'execució:**
1. `i = 1`, `i <= 5`? Sí → mostra "Iteració 1"
2. `i = 2`, `i <= 5`? Sí → mostra "Iteració 2"
3. `i = 3`, `i <= 5`? Sí → mostra "Iteració 3"
4. `i = 4`, `i <= 5`? Sí → mostra "Iteració 4"
5. `i = 5`, `i <= 5`? Sí → mostra "Iteració 5"
6. `i = 6`, `i <= 5`? No → surt del bucle

---

### 4. Números de l'1 al 100

```dart
void main() {
  for (int i = 1; i <= 100; i++) {
    print(i);
  }
}
```

---

### 5. Taula de Multiplicar

```dart
import 'dart:io';

void main() {
  print('Quin número vols multiplicar?');
  int numero = int.parse(stdin.readLineSync()!);
  
  print('\nTaula del $numero:');
  print('================');
  
  for (int i = 1; i <= 10; i++) {
    print('$numero x $i = ${numero * i}');
  }
}
```

**Sortida (per numero = 5):**
```
Taula del 5:
================
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
5 x 8 = 40
5 x 9 = 45
5 x 10 = 50
```

---

### 6. Suma dels Primers N Números

```dart
import 'dart:io';

void main() {
  print('Fins a quin número vols sumar?');
  int n = int.parse(stdin.readLineSync()!);
  
  int suma = 0;
  
  for (int i = 1; i <= n; i++) {
    suma += i;
  }
  
  print('La suma de 1 a $n és: $suma');
}
```

---

### 7. Números Parells

```dart
import 'dart:io';

void main() {
  print('Valor inicial:');
  int inici = int.parse(stdin.readLineSync()!);
  
  print('Valor final:');
  int final_ = int.parse(stdin.readLineSync()!);
  
  print('\nNúmeros parells de $inici a $final_:');
  
  for (int i = inici; i <= final_; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}
```

---

### 8. Comptador Decreixent

```dart
void main() {
  print('Compte enrere!');
  
  for (int i = 10; i >= 1; i--) {
    print(i);
  }
  
  print('🚀 Enlairament!');
}
```

---

### 9. Increment Personalitzat

```dart
void main() {
  print('Números de 3 en 3:');
  
  for (int i = 0; i <= 30; i += 3) {
    print(i);
  }
}
```

**Sortida:**
```
0
3
6
9
12
15
18
21
24
27
30
```

---

## Sessió 3-4: Bucles while i do-while

### 1. Bucle while

!!! note "Definició"
    **while** repeteix un bloc mentre la condició sigui certa. Avalua la condició **abans** d'executar.

**Sintaxi:**
```dart
while (condició) {
  // Codi a repetir
}
```

---

### 2. Exemple Bàsic while

```dart
void main() {
  int contador = 1;
  
  while (contador <= 5) {
    print('Comptador: $contador');
    contador++;
  }
}
```

**Sortida:**
```
Comptador: 1
Comptador: 2
Comptador: 3
Comptador: 4
Comptador: 5
```

---

### 3. Comparació for vs while

=== "for"
    ```dart
    void main() {
      for (int i = 1; i <= 5; i++) {
        print(i);
      }
    }
    ```
    **Usar quan:** Saps el nombre d'iteracions

=== "while"
    ```dart
    void main() {
      int i = 1;
      while (i <= 5) {
        print(i);
        i++;
      }
    }
    ```
    **Usar quan:** El nombre d'iteracions depèn d'una condició

---

### 4. Validació d'Entrada

```dart
import 'dart:io';

void main() {
  int numero = 0;
  
  while (numero <= 0) {
    print('Introdueix un número positiu:');
    numero = int.parse(stdin.readLineSync()!);
    
    if (numero <= 0) {
      print('❌ El número ha de ser positiu!');
    }
  }
  
  print('✅ Has introduït: $numero');
}
```

---

### 5. Joc: Endevinar Número

```dart
import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numeroSecret = random.nextInt(100) + 1; // 1-100
  int intents = 0;
  int endevina = 0;
  
  print('He pensat un número entre 1 i 100!');
  
  while (endevina != numeroSecret) {
    print('\nEndevina el número:');
    endevina = int.parse(stdin.readLineSync()!);
    intents++;
    
    if (endevina < numeroSecret) {
      print('📈 Més alt!');
    } else if (endevina > numeroSecret) {
      print('📉 Més baix!');
    } else {
      print('🎉 Correcte! Ho has aconseguit en $intents intents!');
    }
  }
}
```

---

### 6. Càlcul de Factorial

```dart
import 'dart:io';

void main() {
  print('Factorial de quin número?');
  int n = int.parse(stdin.readLineSync()!);
  
  int factorial = 1;
  int i = 1;
  
  while (i <= n) {
    factorial *= i;
    i++;
  }
  
  print('$n! = $factorial');
}
```

---

### 7. Seqüència de Fibonacci

```dart
import 'dart:io';

void main() {
  print('Quants números de Fibonacci vols?');
  int n = int.parse(stdin.readLineSync()!);
  
  int a = 0, b = 1;
  int contador = 0;
  
  print('\nSeqüència de Fibonacci:');
  
  while (contador < n) {
    print(a);
    int temp = a;
    a = b;
    b = temp + b;
    contador++;
  }
}
```

**Sortida (n=8):**
```
0
1
1
2
3
5
8
13
```

---

### 8. Bucle do-while

!!! note "Definició"
    **do-while** repeteix un bloc mentre la condició sigui certa. Avalua la condició **després** d'executar (mínim 1 iteració).

**Sintaxi:**
```dart
do {
  // Codi a repetir (executa almenys una vegada)
} while (condició);
```

---

### 9. Exemple do-while

```dart
import 'dart:io';

void main() {
  String resposta;
  
  do {
    print('\nVols continuar? (si/no)');
    resposta = stdin.readLineSync()!.toLowerCase();
    
    if (resposta == 'si') {
      print('Continuem!');
    }
  } while (resposta != 'no');
  
  print('Programa finalitzat.');
}
```

---

### 10. Diferència while vs do-while

=== "while"
    ```dart
    void main() {
      int i = 10;
      
      while (i < 5) {
        print('Dins del bucle');
        i++;
      }
      // No mostra res (condició falsa des del principi)
    }
    ```

=== "do-while"
    ```dart
    void main() {
      int i = 10;
      
      do {
        print('Dins del bucle');
        i++;
      } while (i < 5);
      // Mostra "Dins del bucle" una vegada
    }
    ```

---

### 11. Control de Bucles: break i continue

#### break: Surt del bucle

```dart
void main() {
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      break; // Surt del bucle
    }
    print(i);
  }
  print('Bucle acabat');
}
```

**Sortida:**
```
1
2
3
4
Bucle acabat
```

---

#### continue: Salta a la següent iteració

```dart
void main() {
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue; // Salta els parells
    }
    print(i);
  }
}
```

**Sortida:**
```
1
3
5
7
9
```

---

## Sessió 5-6: Pràctica Avançada

### 1. Bucles Niuats

!!! note "Definició"
    Un **bucle niuat** és un bucle dins d'un altre bucle.

```dart
void main() {
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print('i=$i, j=$j');
    }
  }
}
```

**Sortida:**
```
i=1, j=1
i=1, j=2
i=1, j=3
i=2, j=1
i=2, j=2
i=2, j=3
i=3, j=1
i=3, j=2
i=3, j=3
```

---

### 2. Taula de Multiplicar Completa

```dart
void main() {
  print('TAULES DE MULTIPLICAR DEL 1 AL 10');
  print('==================================\n');
  
  for (int i = 1; i <= 10; i++) {
    print('Taula del $i:');
    for (int j = 1; j <= 10; j++) {
      print('$i x $j = ${i * j}');
    }
    print('');
  }
}
```

---

### 3. Patrons amb Asteriscs

#### Triangle rectangle

```dart
import 'dart:io';

void main() {
  print('Altura del triangle:');
  int altura = int.parse(stdin.readLineSync()!);
  
  for (int i = 1; i <= altura; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('*');
    }
    print('');
  }
}
```

**Sortida (altura=5):**
```
*
**
***
****
*****
```

---

#### Piràmide

```dart
import 'dart:io';

void main() {
  print('Altura de la piràmide:');
  int altura = int.parse(stdin.readLineSync()!);
  
  for (int i = 1; i <= altura; i++) {
    // Espais
    for (int j = 1; j <= altura - i; j++) {
      stdout.write(' ');
    }
    // Asteriscs
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write('*');
    }
    print('');
  }
}
```

**Sortida (altura=5):**
```
    *
   ***
  *****
 *******
*********
```

---

#### Quadrat buit

```dart
import 'dart:io';

void main() {
  print('Mida del quadrat:');
  int mida = int.parse(stdin.readLineSync()!);
  
  for (int i = 1; i <= mida; i++) {
    for (int j = 1; j <= mida; j++) {
      if (i == 1 || i == mida || j == 1 || j == mida) {
        stdout.write('* ');
      } else {
        stdout.write('  ');
      }
    }
    print('');
  }
}
```

**Sortida (mida=5):**
```
* * * * * 
*       * 
*       * 
*       * 
* * * * * 
```

---

### 4. Números Primers

```dart
import 'dart:io';

void main() {
  print('Comprova si un número és primer:');
  int numero = int.parse(stdin.readLineSync()!);
  
  if (numero < 2) {
    print('$numero no és primer');
    return;
  }
  
  bool esPrimer = true;
  
  for (int i = 2; i <= numero ~/ 2; i++) {
    if (numero % i == 0) {
      esPrimer = false;
      break;
    }
  }
  
  if (esPrimer) {
    print('$numero és PRIMER');
  } else {
    print('$numero NO és primer');
  }
}
```

---

### 5. Descomposició en Factors Primers

```dart
import 'dart:io';

void main() {
  print('Número a descompondre:');
  int numero = int.parse(stdin.readLineSync()!);
  
  print('Factors primers de $numero:');
  
  int temp = numero;
  int divisor = 2;
  
  while (temp > 1) {
    while (temp % divisor == 0) {
      print(divisor);
      temp ~/= divisor;
    }
    divisor++;
  }
}
```

---

### 6. Joc MasterMind Simplificat

```dart
import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  List<int> codi = [];
  
  // Generar codi secret
  for (int i = 0; i < 4; i++) {
    codi.add(random.nextInt(6) + 1);
  }
  
  print('🎯 MASTERMIND');
  print('Endevina la combinació de 4 números (1-6)');
  print('Tens 10 intents\n');
  
  bool guanyat = false;
  int intents = 0;
  const int MAX_INTENTS = 10;
  
  while (!guanyat && intents < MAX_INTENTS) {
    intents++;
    print('Intent $intents/$MAX_INTENTS');
    
    List<int> prova = [];
    for (int i = 0; i < 4; i++) {
      stdout.write('Número ${i + 1}: ');
      prova.add(int.parse(stdin.readLineSync()!));
    }
    
    // Comprovar
    int correctes = 0;
    int posicioCorrecta = 0;
    
    for (int i = 0; i < 4; i++) {
      if (prova[i] == codi[i]) {
        posicioCorrecta++;
      } else if (codi.contains(prova[i])) {
        correctes++;
      }
    }
    
    if (posicioCorrecta == 4) {
      print('🎉 Has guanyat en $intents intents!');
      guanyat = true;
    } else {
      print('✓ Números correctes en posició: $posicioCorrecta');
      print('○ Números correctes però mal posicionats: $correctes\n');
    }
  }
  
  if (!guanyat) {
    print('😢 Has perdut! El codi era: $codi');
  }
}
```

---

## 💡 Activitats Pràctiques

### 🎯 Activitat 1: Què mostrarà?

```dart
void main() {
  int suma = 0;
  
  for (int i = 1; i <= 5; i++) {
    suma += i;
  }
  
  print(suma);
}
```

??? success "Solució"
    **15**
    
    suma = 0 + 1 + 2 + 3 + 4 + 5 = 15

---

### 🎯 Activitat 2: Troba l'error

```dart
void main() {
  int i = 1;
  
  while (i <= 5) {
    print(i);
  }
}
```

??? success "Solució"
    Bucle infinit! Falta incrementar `i`:
    
    ```dart
    void main() {
      int i = 1;
      
      while (i <= 5) {
        print(i);
        i++; // ← Faltava això
      }
    }
    ```

---

### 🎯 Activitat 3: Completa el bucle

Completa per mostrar números parells del 2 al 20:

```dart
void main() {
  for (int i = ____; i <= ____; i += ____) {
    print(i);
  }
}
```

??? success "Solució"
    ```dart
    void main() {
      for (int i = 2; i <= 20; i += 2) {
        print(i);
      }
    }
    ```

---

## 💻 Exercicis de Programació

### Exercici 1: Compte enrere personalitzat

Demana un número i fes un compte enrere fins a 0.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Número inicial:');
      int numero = int.parse(stdin.readLineSync()!);
      
      for (int i = numero; i >= 0; i--) {
        print(i);
      }
      
      print('🚀 Fi!');
    }
    ```

---

### Exercici 2: Mitjana de N números

Demana N números i calcula la mitjana.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Quants números?');
      int n = int.parse(stdin.readLineSync()!);
      
      double suma = 0;
      
      for (int i = 1; i <= n; i++) {
        print('Número $i:');
        suma += double.parse(stdin.readLineSync()!);
      }
      
      double mitjana = suma / n;
      print('Mitjana: ${mitjana.toStringAsFixed(2)}');
    }
    ```

---

### Exercici 3: Nombres de N a M

Mostra tots els números entre N i M (inclosos).

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Valor inicial:');
      int n = int.parse(stdin.readLineSync()!);
      
      print('Valor final:');
      int m = int.parse(stdin.readLineSync()!);
      
      for (int i = n; i <= m; i++) {
        print(i);
      }
    }
    ```

---

### Exercici 4: Potència

Calcula base^exponent sense usar pow().

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Base:');
      int base = int.parse(stdin.readLineSync()!);
      
      print('Exponent:');
      int exponent = int.parse(stdin.readLineSync()!);
      
      int resultat = 1;
      
      for (int i = 0; i < exponent; i++) {
        resultat *= base;
      }
      
      print('$base^$exponent = $resultat');
    }
    ```

---

### Exercici 5: Divisors d'un número

Mostra tots els divisors d'un número.

??? success "Solució"
    ```dart
    import 'dart:io';
    
    void main() {
      print('Número:');
      int numero = int.parse(stdin.readLineSync()!);
      
      print('Divisors de $numero:');
      
      for (int i = 1; i <= numero; i++) {
        if (numero % i == 0) {
          print(i);
        }
      }
    }
    ```

---

## 🏠 Deures

### Repte 1: Números perfectes
Un número perfecte és igual a la suma dels seus divisors (excepte ell mateix). Ex: 6 = 1 + 2 + 3. Comprova si un número és perfecte.

### Repte 2: Sèrie harmònica
Calcula la suma: 1 + 1/2 + 1/3 + ... + 1/n

### Repte 3: Números Armstrong
Un número Armstrong de 3 dígits és igual a la suma dels cubs dels seus dígits. Ex: 153 = 1³ + 5³ + 3³

### Repte 4: Patró de diamant
Dibuixa un diamant amb asteriscs d'altura N.

### Repte 5: Calculadora persistent
Crea una calculadora que continuï fins que l'usuari esculli sortir.

---

## 📝 Resum

!!! summary "Conceptes clau de la Setmana 3"
    **Bucle for:**
    - ✅ Usar quan saps el nombre d'iteracions
    - ✅ Sintaxi: `for (init; condició; increment) { }`
    
    **Bucle while:**
    - ✅ Avalua condició abans d'executar
    - ✅ Usar quan el nombre d'iteracions depèn d'una condició
    
    **Bucle do-while:**
    - ✅ Executa almenys una vegada
    - ✅ Avalua condició després d'executar
    
    **Control de flux:**
    - ✅ `break`: Surt del bucle
    - ✅ `continue`: Salta a la següent iteració
    
    **Bucles niuats:**
    - ✅ Bucle dins d'un altre bucle
    - ✅ Útils per patrons i matrius

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quantes vegades s'executa aquest bucle?
    ```dart
    for (int i = 0; i < 10; i += 2) {
      print(i);
    }
    ```
    
    a) 5  
    b) 10  
    c) 20  
    d) Infinites

??? success "Resposta"
    **a) 5 vegades** (0, 2, 4, 6, 8)

!!! question "Pregunta 2"
    Quina diferència hi ha entre while i do-while?
    
    a) Cap  
    b) do-while s'executa almenys una vegada  
    c) while és més ràpid  
    d) do-while no existeix en Dart

??? success "Resposta"
    **b) do-while s'executa almenys una vegada**

!!! question "Pregunta 3"
    Què fa `break` dins d'un bucle?
    
    a) Pausa el bucle  
    b) Reinicia el bucle  
    c) Surt del bucle  
    d) No fa res

??? success "Resposta"
    **c) Surt del bucle**

---

!!! success "Has completat la Setmana 3! 🎉"
    Ara domines els bucles i iteracions. A la setmana 4 aprendràs sobre funcions.
