# 🏗️ FASE 1: Fonaments de POO

## 📌 Objectius de la Fase

En aquesta primera fase aprendràs els conceptes fonamentals de la Programació Orientada a Objectes:

- Comprendre què són les classes i els objectes
- Dominar l'encapsulació i la protecció de dades
- Identificar les limitacions de la programació procedural
- Refactoritzar codi procedural a orientat a objectes

!!! info "Durada estimada"
    **8 hores** distribuïdes en sessions pràctiques amb exercicis

---

## 📚 Lliçó 1: Classes, Objectes i Encapsulació

### 🎯 Objectius d'Aprenentatge

Al finalitzar aquesta lliçó seràs capaç de:

- Definir classes amb propietats i mètodes
- Crear objectes (instàncies) a partir de classes
- Aplicar encapsulació per protegir dades
- Validar dades mitjançant constructors
- Utilitzar getters i setters adequadament

---

### 📖 Context: Sistema de Seguiment d'Activitat Física

Desenvoluparem un sistema per registrar i analitzar activitats físiques com córrer, nedar o fer ciclisme, similar a aplicacions com Strava o Fitbit.

---

### 🔴 Part 1: Programació Procedural (Què NO fer)

#### Implementació amb variables globals

```dart
// Variables globals per emmagatzemar les activitats
List<String> activityTypes = [];
List<double> distances = [];
List<int> durations = [];
List<DateTime> dates = [];

void main() {
  addActivity('Córrer', 5.2, 32, DateTime(2024, 11, 15));
  addActivity('Nedar', 1.5, 45, DateTime(2024, 11, 16));
  
  displayAllActivities();
  displayStatistics();
}

void addActivity(String type, double distance, int duration, DateTime date) {
  activityTypes.add(type);
  distances.add(distance);
  durations.add(duration);
  dates.add(date);
}

void displayAllActivities() {
  for (int i = 0; i < activityTypes.length; i++) {
    print('${i + 1}. ${activityTypes[i]} - ${distances[i]} km - '
          '${durations[i]} min');
  }
}

double getTotalDistance() {
  double total = 0;
  for (int i = 0; i < distances.length; i++) {
    total += distances[i];
  }
  return total;
}

void displayStatistics() {
  print('Total activitats: ${activityTypes.length}');
  print('Distància total: ${getTotalDistance()} km');
}
```

---

### ⚠️ Part 2: Problemes de la Programació Procedural

!!! danger "Problema 1: Variables Globals"
    **Exposició descontrolada de dades**
    
    ```dart
    // Qualsevol part del codi pot modificar aquestes variables
    List<String> activityTypes = [];
    List<double> distances = [];
    
    // Algú podria fer això per error:
    activityTypes.add('Córrer');
    // Oblida afegir distance!
    // → Les llistes tenen longituds diferents → ERRORS
    ```

!!! danger "Problema 2: Dades Disperses"
    **Informació relacionada separada**
    
    Les dades d'una mateixa activitat estan repartides:
    ```dart
    activityTypes[0] = 'Córrer'
    distances[0]     = 5.2
    durations[0]     = 32
    dates[0]         = DateTime(2024, 11, 15)
    ```
    
    **Riscos:**
    
    - Difícil mantenir sincronitzades
    - Errors en inserir/eliminar elements
    - No hi ha garantia que els índexs coincideixin

!!! danger "Problema 3: Manca de Validació"
    **No hi ha control sobre les dades**
    
    ```dart
    // Tot això seria vàlid però incorrecte:
    addActivity('', -5.0, -10, DateTime(2025, 1, 1)); // ❌
    addActivity('XYZ', 0, 0, DateTime.now()); // ❌
    
    // Modificació directa sense control:
    distances[0] = -100; // ❌ Hauria de ser impossible!
    ```

!!! danger "Problema 4: Acoblament Fort"
    **Funcions dependents de variables globals**
    
    ```dart
    double getAverageSpeed(int index) {
      if (durations[index] == 0) return 0;
      double hours = durations[index] / 60;
      return distances[index] / hours;
    }
    ```
    
    **Problemes:**
    
    - Depèn de variables globals
    - Risc d'errors amb índexs
    - Impossible testejar de forma aïllada

!!! danger "Problema 5: Codi Duplicat"
    **Patrón repetit per cada càlcul**
    
    ```dart
    double getTotalDistance() {
      double total = 0;
      for (int i = 0; i < distances.length; i++) {
        total += distances[i];
      }
      return total;
    }
    
    int getTotalDuration() {
      int total = 0;
      for (int i = 0; i < durations.length; i++) {
        total += durations[i];
      }
      return total;
    }
    ```

---

### ✅ Part 3: Solució amb POO

#### 🎓 Conceptes Fonamentals

!!! info "Què és una Classe?"
    Una **classe** és una plantilla o pla que defineix:
    
    - **Propietats** (atributs, dades)
    - **Mètodes** (comportaments, funcions)
    
    **Analogia:** Una classe és com el plànol d'una casa. Defineix com serà la casa però no és la casa en si.

!!! info "Què és un Objecte?"
    Un **objecte** és una instància concreta d'una classe amb valors específics.
    
    **Analogia:** Un objecte és una casa real construïda seguint el plànol. Pots construir moltes cases (objectes) amb el mateix plànol (classe).

!!! info "Què és l'Encapsulació?"
    L'**encapsulació** consisteix en:
    
    - Agrupar dades i mètodes relacionats dins d'una classe
    - Protegir les dades marcant-les com a privades
    - Controlar l'accés mitjançant mètodes públics (getters/setters)
    
    **Beneficis:**
    
    - Protecció de dades
    - Validació centralitzada
    - Canvis interns sense afectar l'exterior

---

### 💻 Part 4: Implementació POO

#### Classe Activity

```dart
class Activity {
  // Propietats PRIVADES (encapsulació amb _)
  String _type;
  double _distance;
  int _duration;
  DateTime _date;
  
  // Constructor amb validació
  Activity(this._type, this._distance, this._duration, this._date) {
    _validateType(_type);
    _validateDistance(_distance);
    _validateDuration(_duration);
  }
  
  // Getters (accés CONTROLAT de lectura)
  String get type => _type;
  double get distance => _distance;
  int get duration => _duration;
  DateTime get date => _date;
  
  // Mètodes de validació PRIVATS
  void _validateType(String type) {
    if (type.trim().isEmpty) {
      throw ArgumentError('El tipus d\'activitat no pot estar buit');
    }
  }
  
  void _validateDistance(double distance) {
    if (distance <= 0) {
      throw ArgumentError('La distància ha de ser positiva');
    }
  }
  
  void _validateDuration(int duration) {
    if (duration <= 0) {
      throw ArgumentError('La duració ha de ser positiva');
    }
  }
  
  // Mètode per calcular velocitat (comportament de l'objecte)
  double getAverageSpeed() {
    double hours = _duration / 60;
    return _distance / hours;
  }
  
  // Representació textual de l'objecte
  @override
  String toString() {
    return '$_type - $_distance km - $_duration min - '
           '${_date.toString().split(' ')[0]} - '
           'Velocitat: ${getAverageSpeed().toStringAsFixed(2)} km/h';
  }
}
```

!!! success "Avantatges de la Classe Activity"
    ✅ **Dades protegides**: Propietats privades amb `_`
    
    ✅ **Validació automàtica**: Al constructor
    
    ✅ **Cohesió**: Tot el relacionat amb Activity està junt
    
    ✅ **Mètodes associats**: `getAverageSpeed()` pertany a Activity

---

#### Classe FitnessTracker

```dart
class FitnessTracker {
  // Llista PRIVADA d'activitats
  final List<Activity> _activities = [];
  
  // Getter que retorna còpia immutable (només lectura)
  List<Activity> get activities => List.unmodifiable(_activities);
  
  // Afegir activitat amb gestió d'errors
  void addActivity(String type, double distance, int duration, DateTime date) {
    try {
      Activity activity = Activity(type, distance, duration, date);
      _activities.add(activity);
      print('✓ Activitat afegida: $type - $distance km');
    } catch (e) {
      print('✗ Error: ${e.toString()}');
    }
  }
  
  // Calcular distància total
  double getTotalDistance() {
    return _activities.fold(0.0, (sum, activity) => sum + activity.distance);
  }
  
  // Calcular duració total
  int getTotalDuration() {
    return _activities.fold(0, (sum, activity) => sum + activity.duration);
  }
  
  // Nombre d'activitats
  int getActivityCount() {
    return _activities.length;
  }
  
  // Distància mitjana
  double getAverageDistance() {
    if (_activities.isEmpty) return 0.0;
    return getTotalDistance() / _activities.length;
  }
  
  // Mostrar totes les activitats
  void displayAllActivities() {
    if (_activities.isEmpty) {
      print('No hi ha activitats registrades');
      return;
    }
    
    for (int i = 0; i < _activities.length; i++) {
      print('${i + 1}. ${_activities[i]}');
    }
  }
  
  // Filtrar per tipus
  void displayActivitiesByType(String type) {
    List<Activity> filtered = _activities
        .where((activity) => activity.type.toLowerCase() == type.toLowerCase())
        .toList();
    
    if (filtered.isEmpty) {
      print('No s\'han trobat activitats de tipus: $type');
      return;
    }
    
    for (Activity activity in filtered) {
      print(activity);
    }
  }
  
  // Estadístiques
  void displayStatistics() {
    print('Total d\'activitats: ${getActivityCount()}');
    print('Distància total: ${getTotalDistance().toStringAsFixed(2)} km');
    print('Temps total: ${getTotalDuration()} min');
    
    if (_activities.isNotEmpty) {
      print('Distància mitjana: ${getAverageDistance().toStringAsFixed(2)} km');
    }
  }
}
```

---

#### Programa Principal

```dart
void main() {
  // Crear OBJECTE del tracker
  FitnessTracker tracker = FitnessTracker();
  
  // Afegir activitats
  tracker.addActivity('Córrer', 5.2, 32, DateTime(2024, 11, 15));
  tracker.addActivity('Nedar', 1.5, 45, DateTime(2024, 11, 16));
  tracker.addActivity('Ciclisme', 20.0, 60, DateTime(2024, 11, 16));
  
  // Provar validacions
  print('\n--- Validacions ---');
  tracker.addActivity('', 5.0, 30, DateTime.now()); // Error
  tracker.addActivity('Córrer', -5.0, 30, DateTime.now()); // Error
  
  // Mostrar activitats
  print('\n=== ACTIVITATS ===');
  tracker.displayAllActivities();
  
  // Estadístiques
  print('\n=== ESTADÍSTIQUES ===');
  tracker.displayStatistics();
}
```

---

### 📊 Comparació Final

| Aspecte | Procedural | POO |
|---------|------------|-----|
| **Organització** | Variables globals disperses | Objectes cohesionats |
| **Validació** | ❌ Cap | ✅ Al constructor |
| **Protecció** | ❌ Dades públiques | ✅ Dades privades |
| **Errors** | ⚠️ Llistes desincronitzades | ✅ Impossible per disseny |
| **Mantenibilitat** | ⚠️ Difícil | ✅ Fàcil |
| **Reutilització** | ⚠️ Baixa | ✅ Alta |

---

## 🎯 Exercicis Pràctics

### Exercici 1: Afegir Calories

!!! question "Enunciat"
    Modifica la classe `Activity` per incloure les calories cremades en cada activitat.
    
    **Requisits:**
    
    - Propietat privada `_calories`
    - Validació: no pot ser negatiu
    - Getter per accedir-hi
    - Actualitzar `toString()`

??? tip "Ajuda"
    Segueix el mateix patró que les altres propietats:
    
    1. Afegeix `int _calories;` com a propietat
    2. Afegeix-la al constructor
    3. Crea `_validateCalories(int calories)`
    4. Afegeix `int get calories => _calories;`

??? example "Solució"
    ```dart
    class Activity {
      String _type;
      double _distance;
      int _duration;
      DateTime _date;
      int _calories;
      
      Activity(this._type, this._distance, this._duration, 
               this._date, this._calories) {
        _validateType(_type);
        _validateDistance(_distance);
        _validateDuration(_duration);
        _validateCalories(_calories);
      }
      
      int get calories => _calories;
      
      void _validateCalories(int calories) {
        if (calories < 0) {
          throw ArgumentError('Les calories no poden ser negatives');
        }
      }
      
      @override
      String toString() {
        return '$_type - $_distance km - $_duration min - '
               '${_date.toString().split(' ')[0]} - '
               'Velocitat: ${getAverageSpeed().toStringAsFixed(2)} km/h - '
               '$_calories kcal';
      }
    }
    ```

---

### Exercici 2: Calcular Calories Totals

!!! question "Enunciat"
    Afegeix un mètode a `FitnessTracker` per calcular el total de calories cremades de totes les activitats.

??? example "Solució"
    ```dart
    int getTotalCalories() {
      return _activities.fold(0, (sum, activity) => sum + activity.calories);
    }
    ```

---

### Exercici 3: Activitat Més Llarga

!!! question "Enunciat"
    Crea un mètode `getLongestActivity()` que retorni l'activitat amb més distància recorreguda.
    
    **Nota:** Retorna `Activity?` (pot ser null si no hi ha activitats)

??? example "Solució"
    ```dart
    Activity? getLongestActivity() {
      if (_activities.isEmpty) return null;
      
      Activity longest = _activities[0];
      for (Activity activity in _activities) {
        if (activity.distance > longest.distance) {
          longest = activity;
        }
      }
      return longest;
    }
    
    // Ús:
    void displayLongestActivity() {
      Activity? longest = getLongestActivity();
      if (longest != null) {
        print('Activitat més llarga: ${longest}');
      } else {
        print('No hi ha activitats registrades');
      }
    }
    ```

---

### Exercici 4: Setter amb Validació

!!! question "Enunciat"
    Afegeix un setter per permetre modificar la distància d'una activitat, però NOMÉS si la nova distància és vàlida (positiva).
    
    **Pista:** Utilitza `set distance(double value)`

??? example "Solució"
    ```dart
    class Activity {
      // ... (propietats existents)
      
      // Setter amb validació
      set distance(double value) {
        _validateDistance(value);
        _distance = value;
      }
    }
    
    // Ús:
    void main() {
      Activity run = Activity('Córrer', 5.0, 30, DateTime.now(), 300);
      
      print('Distància inicial: ${run.distance} km');
      
      run.distance = 7.5; // ✅ Vàlid
      print('Nova distància: ${run.distance} km');
      
      // run.distance = -3; // ❌ Llançaria ArgumentError
    }
    ```

---

## 📝 Resum de Conceptes Clau

!!! abstract "Conceptes apresos"
    **Classe**
    
    - Plantilla que defineix propietats i mètodes
    - Es defineix amb `class NomClasse { }`
    
    **Objecte**
    
    - Instància concreta d'una classe
    - Es crea amb `NomClasse objecte = NomClasse();`
    
    **Encapsulació**
    
    - Propietats privades: prefix `_`
    - Control d'accés: getters i setters
    - Validació al constructor
    
    **Avantatges de POO**
    
    - ✅ Codi organitzat i cohesionat
    - ✅ Dades protegides
    - ✅ Validació automàtica
    - ✅ Reutilització
    - ✅ Mantenibilitat

---

## ✍️ Autoavaluació FASE 1

### Pregunta 1: Conceptes Bàsics

!!! question "Definicions"
    **a)** Què és una classe? Explica-ho amb les teves paraules i dona un exemple.
    
    **b)** Quina diferència hi ha entre una classe i un objecte?
    
    **c)** Pots crear múltiples objectes d'una mateixa classe? Dona un exemple.

??? success "Resposta esperada"
    **a)** Una classe és com una plantilla o pla que defineix les característiques (propietats) i comportaments (mètodes) d'un tipus d'entitat. Per exemple, la classe `Cotxe` podria definir propietats com color, marca, model i mètodes com accelerar() o frenar().
    
    **b)** La classe és la plantilla/pla, mentre que l'objecte és una instància concreta amb valors específics. Per exemple, `Cotxe` és la classe, però `meuCotxe = Cotxe('vermell', 'Toyota')` és un objecte específic.
    
    **c)** Sí! Pots crear tants objectes com vulguis:
    ```dart
    Cotxe cotxe1 = Cotxe('vermell', 'Toyota');
    Cotxe cotxe2 = Cotxe('blau', 'Honda');
    Cotxe cotxe3 = Cotxe('negre', 'Ford');
    ```

---

### Pregunta 2: Encapsulació

!!! question "Protecció de dades"
    **a)** Per què utilitzem el prefix `_` davant de les propietats?
    
    **b)** Què significa que una propietat sigui "privada"?
    
    **c)** Com accedim a propietats privades des de fora de la classe?

??? success "Resposta esperada"
    **a)** El prefix `_` marca la propietat com a privada en Dart, cosa que impedeix l'accés directe des de fora de la classe.
    
    **b)** Una propietat privada només pot ser accedida i modificada des de dins de la pròpia classe, no des de fora.
    
    **c)** Mitjançant getters (per llegir) i setters (per modificar), que ens permeten controlar l'accés i afegir validacions:
    ```dart
    String get type => _type;
    set distance(double value) {
      _validateDistance(value);
      _distance = value;
    }
    ```

---

### Pregunta 3: Validació

!!! question "Control de dades"
    Observa aquest codi:
    
    ```dart
    class Persona {
      String nom;
      int edat;
      
      Persona(this.nom, this.edat);
    }
    
    void main() {
      Persona p = Persona('', -5);
    }
    ```
    
    **a)** Quins problemes té aquest codi?
    
    **b)** Com el millорaries utilitzant encapsulació i validació?

??? success "Resposta esperada"
    **a)** Problemes:
    
    - Les propietats són públiques (no hi ha encapsulació)
    - No hi ha validació: es permet nom buit i edat negativa
    - Qualsevol pot modificar les propietats directament
    
    **b)** Versió millorada:
    ```dart
    class Persona {
      String _nom;
      int _edat;
      
      Persona(this._nom, this._edat) {
        if (_nom.trim().isEmpty) {
          throw ArgumentError('El nom no pot estar buit');
        }
        if (_edat < 0 || _edat > 150) {
          throw ArgumentError('Edat invàlida');
        }
      }
      
      String get nom => _nom;
      int get edat => _edat;
    }
    ```

---

### Pregunta 4: Pràctica

!!! question "Implementació"
    Crea una classe `Llibre` amb les següents característiques:
    
    **Propietats privades:**
    
    - títol (String)
    - autor (String)
    - pàgines (int)
    - preu (double)
    
    **Requisits:**
    
    - Constructor amb validació
    - Getters per totes les propietats
    - Mètode `aplicarDescompte(double percentatge)` que retorna el preu amb descompte
    - Mètode `toString()` per mostrar la informació del llibre
    
    **Validacions:**
    
    - Títol i autor no poden estar buits
    - Pàgines ha de ser > 0
    - Preu ha de ser >= 0

??? example "Solució"
    ```dart
    class Llibre {
      String _titol;
      String _autor;
      int _pagines;
      double _preu;
      
      Llibre(this._titol, this._autor, this._pagines, this._preu) {
        if (_titol.trim().isEmpty) {
          throw ArgumentError('El títol no pot estar buit');
        }
        if (_autor.trim().isEmpty) {
          throw ArgumentError('L\'autor no pot estar buit');
        }
        if (_pagines <= 0) {
          throw ArgumentError('El número de pàgines ha de ser positiu');
        }
        if (_preu < 0) {
          throw ArgumentError('El preu no pot ser negatiu');
        }
      }
      
      String get titol => _titol;
      String get autor => _autor;
      int get pagines => _pagines;
      double get preu => _preu;
      
      double aplicarDescompte(double percentatge) {
        if (percentatge < 0 || percentatge > 100) {
          throw ArgumentError('El percentatge ha d\'estar entre 0 i 100');
        }
        return _preu * (1 - percentatge / 100);
      }
      
      @override
      String toString() {
        return '"$_titol" de $_autor - $_pagines pàg. - $_preu€';
      }
    }
    
    // Ús:
    void main() {
      Llibre llibre = Llibre('El Quixot', 'Cervantes', 863, 25.50);
      print(llibre);
      print('Amb 20% descompte: ${llibre.aplicarDescompte(20)}€');
    }
    ```

---

### Pregunta 5: Anàlisi de Codi

!!! question "Trobant errors"
    Troba i explica tots els problemes d'aquest codi:
    
    ```dart
    class Compte {
      double saldo;
      
      Compte(this.saldo);
      
      void ingressar(double quantitat) {
        saldo = saldo + quantitat;
      }
      
      void retirar(double quantitat) {
        saldo = saldo - quantitat;
      }
    }
    
    void main() {
      Compte c = Compte(100);
      c.saldo = -500; // Modificació directa
      c.retirar(200); // Ara saldo = -700
    }
    ```

??? success "Resposta esperada"
    **Problemes detectats:**
    
    1. **Manca d'encapsulació**: `saldo` és públic, es pot modificar directament
    2. **No hi ha validacions**: Es permet saldo inicial negatiu
    3. **ingressar() no valida**: Podria ingressar quantitats negatives
    4. **retirar() no controla**: Permet deixar el compte en negatiu sense límit
    5. **Accés directe**: `c.saldo = -500` no hauria de ser possible
    
    **Versió correcta:**
    ```dart
    class Compte {
      double _saldo;
      
      Compte(this._saldo) {
        if (_saldo < 0) {
          throw ArgumentError('El saldo inicial no pot ser negatiu');
        }
      }
      
      double get saldo => _saldo;
      
      void ingressar(double quantitat) {
        if (quantitat <= 0) {
          throw ArgumentError('La quantitat a ingressar ha de ser positiva');
        }
        _saldo += quantitat;
      }
      
      bool retirar(double quantitat) {
        if (quantitat <= 0) {
          throw ArgumentError('La quantitat a retirar ha de ser positiva');
        }
        if (quantitat > _saldo) {
          print('Saldo insuficient');
          return false;
        }
        _saldo -= quantitat;
        return true;
      }
    }
    ```

---

### ✅ Checklist d'Autoavaluació

Marca els conceptes que domines:

- [ ] Sé crear una classe amb propietats i mètodes
- [ ] Entenc la diferència entre classe i objecte
- [ ] Puc crear múltiples objectes d'una classe
- [ ] Utilitzo propietats privades amb `_`
- [ ] Sé crear getters per accedir a propietats
- [ ] Sé crear setters amb validació
- [ ] Valido les dades al constructor
- [ ] Utilitzo mètodes privats per validacions
- [ ] Entenc els beneficis de l'encapsulació
- [ ] Puc refactoritzar codi procedural a POO

!!! success "Objectiu"
    **Hauríes de marcar almenys 8/10 ítems** abans de passar a la FASE 2.
    
    Si tens dubtes en algun concepte, repassa els exemples i exercicis!

---

## 🚀 Següent Pas

Un cop dominada la Fase 1, estàs preparat/da per:

**FASE 2: Herència i Polimorfisme**

- Crear jerarquies de classes
- Reutilitzar codi mitjançant herència
- Implementar comportaments polimòrfics

---

!!! tip "Consell final"
    La clau de POO és **pensar en termes d'objectes del món real**. Cada classe hauria de representar una entitat concreta amb responsabilitats clares i ben definides.
