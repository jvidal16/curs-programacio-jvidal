# 🎨 FASE 3: Abstracció i Interfícies

## 📌 Objectius de la Fase

En aquesta fase aprendràs tècniques avançades de disseny orientat a objectes:

- Crear contractes mitjançant classes abstractes
- Definir capacitats amb interfícies
- Escollir entre herència i composició
- Dissenyar arquitectures flexibles i mantenibles

!!! info "Durada estimada"
    **14 hores** distribuïdes en sessions teòriques i projectes pràctics

---

## 📚 Lliçó 4: Classes Abstractes - Contractes Obligatoris

### 🎯 Objectius d'Aprenentatge

Al finalitzar aquesta lliçó seràs capaç de:

- Definir classes abstractes amb `abstract class`
- Crear mètodes abstractes (sense implementació)
- Combinar mètodes abstractes i concrets
- Comprendre quan utilitzar classes abstractes
- Forçar implementacions en subclasses

---

### 📖 Context: Sistema de Pagaments

Desenvoluparem un sistema per processar diferents tipus de pagaments: targeta de crèdit, PayPal, transferència bancària i criptomonedes.

---

### 🤔 Problema amb Herència Normal

```dart
class PaymentMethod {
  String _name;
  
  PaymentMethod(this._name);
  
  String get name => _name;
  
  // Problema: implementació buida o genèrica
  bool processPayment(double amount) {
    print('Processant pagament...');
    return true; // ❌ Massa genèric!
  }
  
  bool validatePayment() {
    return true; // ❌ No valida res realment!
  }
}

class CreditCard extends PaymentMethod {
  CreditCard() : super('Credit Card');
  
  // Potser oblido implementar processPayment!
  // El codi compila però no fa res útil
}
```

!!! danger "Problemes"
    **Amb herència normal:**
    
    - No hi ha garantia que les subclasses implementin els mètodes
    - Implementacions buides o generals no són útils
    - Es poden crear instàncies de la classe base (no té sentit)
    - No hi ha "obligació" d'implementar mètodes crítics

---

### ✅ Solució: Classes Abstractes

!!! info "Què és una Classe Abstracta?"
    Una **classe abstracta** és una classe que:
    
    - **NO es pot instanciar** directament
    - Pot contenir **mètodes abstractes** (sense implementació)
    - Pot contenir **mètodes concrets** (amb implementació)
    - Obliga les subclasses a implementar els mètodes abstractes
    
    **Analogia:** És com un contracte que diu "qui m'hereti HAURÀ DE implementar aquests mètodes".

---

### 💻 Implementació amb Classe Abstracta

```dart
// Classe ABSTRACTA - no es pot instanciar
abstract class PaymentMethod {
  String _name;
  
  PaymentMethod(this._name);
  
  String get name => _name;
  
  // Mètode ABSTRACTE - sense implementació
  // Les subclasses HAURAN d'implementar-lo
  bool processPayment(double amount);
  
  // Mètode ABSTRACTE - obligatori a les subclasses
  bool validatePayment();
  
  // Mètode CONCRET - implementació compartida
  void displayPaymentInfo(double amount) {
    print('═══════════════════════════');
    print('Mètode de pagament: $_name');
    print('Import: ${amount.toStringAsFixed(2)}€');
    print('═══════════════════════════');
  }
  
  // Mètode CONCRET que usa els abstractes
  bool executePayment(double amount) {
    print('\n🔄 Iniciant pagament amb $_name...');
    
    if (!validatePayment()) {
      print('❌ Validació fallida');
      return false;
    }
    
    displayPaymentInfo(amount);
    
    if (processPayment(amount)) {
      print('✅ Pagament completat amb èxit');
      return true;
    } else {
      print('❌ Error en processar el pagament');
      return false;
    }
  }
}
```

!!! tip "Observacions"
    - `abstract class` → no es pot fer `PaymentMethod()`
    - Mètodes sense implementació → acaben amb `;`
    - Mètodes concrets → poden usar els abstractes
    - Les subclasses **HAURAN** d'implementar els abstractes

---

### 💳 Implementacions Concretes

```dart
class CreditCardPayment extends PaymentMethod {
  String _cardNumber;
  String _cvv;
  String _expiryDate;
  
  CreditCardPayment(this._cardNumber, this._cvv, this._expiryDate) 
      : super('Targeta de Crèdit');
  
  // OBLIGATORI: implementar mètode abstracte
  @override
  bool validatePayment() {
    print('🔍 Validant targeta...');
    
    // Validació simple del número de targeta
    if (_cardNumber.length != 16) {
      print('  ❌ Número de targeta invàlid');
      return false;
    }
    
    // Validar CVV
    if (_cvv.length != 3) {
      print('  ❌ CVV invàlid');
      return false;
    }
    
    print('  ✓ Targeta vàlida');
    return true;
  }
  
  // OBLIGATORI: implementar mètode abstracte
  @override
  bool processPayment(double amount) {
    print('💳 Processant pagament amb targeta...');
    print('  Targeta: **** **** **** ${_cardNumber.substring(12)}');
    
    // Simulació de processament
    if (amount > 5000) {
      print('  ⚠️ Import superior a límit diari');
      return false;
    }
    
    return true;
  }
}

class PayPalPayment extends PaymentMethod {
  String _email;
  String _password;
  
  PayPalPayment(this._email, this._password) 
      : super('PayPal');
  
  @override
  bool validatePayment() {
    print('🔍 Validant compte PayPal...');
    
    if (!_email.contains('@')) {
      print('  ❌ Email invàlid');
      return false;
    }
    
    if (_password.length < 8) {
      print('  ❌ Contrasenya massa curta');
      return false;
    }
    
    print('  ✓ Credencials vàlides');
    return true;
  }
  
  @override
  bool processPayment(double amount) {
    print('💰 Processant pagament via PayPal...');
    print('  Compte: $_email');
    print('  Redirigint a PayPal...');
    
    return true;
  }
}

class BankTransferPayment extends PaymentMethod {
  String _iban;
  String _bankName;
  
  BankTransferPayment(this._iban, this._bankName) 
      : super('Transferència Bancària');
  
  @override
  bool validatePayment() {
    print('🔍 Validant compte bancari...');
    
    if (_iban.length < 20) {
      print('  ❌ IBAN invàlid');
      return false;
    }
    
    print('  ✓ IBAN vàlid');
    return true;
  }
  
  @override
  bool processPayment(double amount) {
    print('🏦 Processant transferència bancària...');
    print('  Banc: $_bankName');
    print('  IBAN: $_iban');
    print('  ⏱️ La transferència pot trigar 1-3 dies laborables');
    
    return true;
  }
}

class CryptoPayment extends PaymentMethod {
  String _walletAddress;
  String _cryptocurrency;
  
  CryptoPayment(this._walletAddress, this._cryptocurrency) 
      : super('Criptomoneda');
  
  @override
  bool validatePayment() {
    print('🔍 Validant wallet de criptomoneda...');
    
    if (_walletAddress.length < 26) {
      print('  ❌ Adreça de wallet invàlida');
      return false;
    }
    
    print('  ✓ Wallet $_cryptocurrency vàlida');
    return true;
  }
  
  @override
  bool processPayment(double amount) {
    print('₿ Processant pagament en $_cryptocurrency...');
    print('  Wallet: ${_walletAddress.substring(0, 10)}...');
    print('  🔐 Esperant confirmació a la blockchain...');
    
    return true;
  }
}
```

---

### 📝 Programa d'Exemple

```dart
void main() {
  // ❌ Això donaria ERROR de compilació:
  // PaymentMethod payment = PaymentMethod('test');
  // No es poden instanciar classes abstractes!
  
  // Crear diferents mètodes de pagament
  List<PaymentMethod> paymentMethods = [
    CreditCardPayment('1234567890123456', '123', '12/25'),
    PayPalPayment('user@example.com', 'securepass123'),
    BankTransferPayment('ES1234567890123456789012', 'BBVA'),
    CryptoPayment('1A2B3C4D5E6F7G8H9I0J1K2L3M4N', 'Bitcoin'),
  ];
  
  double amount = 150.00;
  
  // Processar pagament amb cada mètode
  for (PaymentMethod method in paymentMethods) {
    bool success = method.executePayment(amount);
    print('');
  }
  
  // Provar amb targeta invàlida
  print('\n========== PROVA AMB DADES INVÀLIDES ==========');
  CreditCardPayment invalidCard = CreditCardPayment('123', '12', '12/25');
  invalidCard.executePayment(50.00);
}
```

!!! example "Sortida (fragment)"
    ```
    🔄 Iniciant pagament amb Targeta de Crèdit...
    🔍 Validant targeta...
      ✓ Targeta vàlida
    ═══════════════════════════
    Mètode de pagament: Targeta de Crèdit
    Import: 150.00€
    ═══════════════════════════
    💳 Processant pagament amb targeta...
      Targeta: **** **** **** 3456
    ✅ Pagament completat amb èxit
    ```

---

### 🔑 Conceptes Clau

!!! info "Mètodes Abstractes vs Concrets"
    **Mètode Abstracte:**
    ```dart
    bool processPayment(double amount); // Sense implementació
    ```
    
    - Només signatura
    - Acaba amb `;`
    - Les subclasses HAURAN d'implementar-lo
    
    **Mètode Concret:**
    ```dart
    void displayPaymentInfo(double amount) {
      // Té implementació
    }
    ```
    
    - Té implementació completa
    - Les subclasses l'hereten
    - Les subclasses poden sobreescriure'l (opcional)

!!! info "Quan Utilitzar Classes Abstractes"
    Utilitza una classe abstracta quan:
    
    - ✅ Vols compartir codi comú entre subclasses
    - ✅ Necessites forçar que es defineixin certs mètodes
    - ✅ No té sentit crear instàncies de la classe base
    - ✅ Vols definir un "contracte" amb implementacions parcials
    
    **Exemple:** `PaymentMethod` és abstract perquè no té sentit un "pagament genèric", però sí que comparteix lògica comuna.

---

## 📚 Lliçó 5: Interfícies - Capacitats Reutilitzables

### 🎯 Objectius d'Aprenentatge

Al finalitzar aquesta lliçó seràs capaç de:

- Definir interfícies amb `implements`
- Implementar múltiples interfícies
- Comprendre la diferència entre `extends` i `implements`
- Utilitzar interfícies com a "capacitats"
- Identificar relacions "pot fer" (can-do)

---

### 📖 Context: Sistema Multimèdia

Diferents tipus de contingut multimèdia tenen diferents capacitats:

- **AudioBook**: es pot reproduir 🎵 i descarregar 📥
- **EBook**: es pot descarregar 📥 i compartir 📤
- **DVD**: es pot reproduir 🎵
- **Magazine**: es pot compartir 📤

!!! question "Problema"
    No tots els items tenen les mateixes capacitats. Com modelar això amb herència?
    
    - Si posem `play()` a `MediaItem` → les revistes no es reprodueixen!
    - Si fem subclasses → massa combinacions (PlayableDownloadable, etc.)

---

### ✅ Solució: Interfícies

!!! info "Què és una Interfície?"
    Una **interfície** és un contracte pur que defineix:
    
    - **QUÈ** ha de fer una classe (signatures de mètodes)
    - **NO COM** ho fa (no té implementació)
    
    **Diferència amb classe abstracta:**
    
    - Interfície: 0% implementació (contracte pur)
    - Classe abstracta: implementació parcial
    
    **Relació:** "pot fer" (can-do) → capacitats

!!! warning "En Dart"
    Dart no té la paraula clau `interface`. En el seu lloc, **qualsevol classe pot actuar com a interfície** utilitzant `implements`.

---

### 💻 Definició d'Interfícies

```dart
// "Interfície" Playable (en realitat és una classe abstracta pura)
abstract class Playable {
  void play();
  void pause();
  void stop();
  Duration getDuration();
}

abstract class Downloadable {
  Future<void> download();
  double getFileSize(); // en MB
  bool isDownloaded();
}

abstract class Shareable {
  String getShareLink();
  void share(String platform);
}
```

!!! tip "Millor pràctica"
    Encara que Dart permet usar qualsevol classe com a interfície, és recomanable crear classes abstractes pures (només mètodes abstractes) per simular interfícies.

---

### 📱 Implementació amb Interfícies

```dart
// Classe base (del sistema anterior)
abstract class MediaItem {
  String _title;
  String _creator;
  int _year;
  bool _available;
  
  MediaItem(this._title, this._creator, this._year) 
      : _available = true;
  
  String get title => _title;
  String get creator => _creator;
  int get year => _year;
  bool get available => _available;
  
  void borrow() {
    if (_available) {
      _available = false;
      print('✓ Has agafat: $_title');
    } else {
      print('✗ No disponible: $_title');
    }
  }
  
  void returnItem() {
    _available = true;
    print('✓ Has retornat: $_title');
  }
}

// AudioBook: Playable + Downloadable
class AudioBook extends MediaItem implements Playable, Downloadable {
  Duration _duration;
  double _fileSizeMB;
  bool _downloaded;
  bool _isPlaying;
  
  AudioBook(String title, String author, int year, this._duration, this._fileSizeMB) 
      : _downloaded = false,
        _isPlaying = false,
        super(title, author, year);
  
  // Implementació de Playable
  @override
  void play() {
    if (!_downloaded) {
      print('❌ Cal descarregar l\'audiobook primer');
      return;
    }
    _isPlaying = true;
    print('▶️  Reproduint: $title');
  }
  
  @override
  void pause() {
    if (_isPlaying) {
      _isPlaying = false;
      print('⏸️  Pausat: $title');
    }
  }
  
  @override
  void stop() {
    _isPlaying = false;
    print('⏹️  Aturat: $title');
  }
  
  @override
  Duration getDuration() {
    return _duration;
  }
  
  // Implementació de Downloadable
  @override
  Future<void> download() async {
    print('📥 Descarregant $_title...');
    await Future.delayed(Duration(seconds: 2)); // Simular descàrrega
    _downloaded = true;
    print('✅ Descàrrega completada: $title');
  }
  
  @override
  double getFileSize() {
    return _fileSizeMB;
  }
  
  @override
  bool isDownloaded() {
    return _downloaded;
  }
}

// EBook: Downloadable + Shareable
class EBook extends MediaItem implements Downloadable, Shareable {
  int _pages;
  double _fileSizeMB;
  bool _downloaded;
  
  EBook(String title, String author, int year, this._pages, this._fileSizeMB) 
      : _downloaded = false,
        super(title, author, year);
  
  // Implementació de Downloadable
  @override
  Future<void> download() async {
    print('📥 Descarregant ebook $_title...');
    await Future.delayed(Duration(seconds: 1));
    _downloaded = true;
    print('✅ Ebook descarregat: $title');
  }
  
  @override
  double getFileSize() {
    return _fileSizeMB;
  }
  
  @override
  bool isDownloaded() {
    return _downloaded;
  }
  
  // Implementació de Shareable
  @override
  String getShareLink() {
    return 'https://library.com/ebooks/${title.replaceAll(' ', '-').toLowerCase()}';
  }
  
  @override
  void share(String platform) {
    print('📤 Compartint "$title" a $platform');
    print('   Link: ${getShareLink()}');
  }
}

// DVDMedia: només Playable
class DVDMedia extends MediaItem implements Playable {
  Duration _duration;
  bool _isPlaying;
  
  DVDMedia(String title, String director, int year, this._duration) 
      : _isPlaying = false,
        super(title, director, year);
  
  @override
  void play() {
    _isPlaying = true;
    print('▶️  Reproduint DVD: $title');
  }
  
  @override
  void pause() {
    if (_isPlaying) {
      _isPlaying = false;
      print('⏸️  DVD pausat: $title');
    }
  }
  
  @override
  void stop() {
    _isPlaying = false;
    print('⏹️  DVD aturat: $title');
  }
  
  @override
  Duration getDuration() {
    return _duration;
  }
}
```

---

### 🎭 Polimorfisme amb Interfícies

```dart
void main() async {
  // Crear items amb diferents capacitats
  AudioBook audio = AudioBook(
    'Harry Potter',
    'J.K. Rowling',
    1997,
    Duration(hours: 8, minutes: 25),
    450.5
  );
  
  EBook ebook = EBook(
    '1984',
    'George Orwell',
    1949,
    328,
    2.5
  );
  
  DVDMedia dvd = DVDMedia(
    'Inception',
    'Christopher Nolan',
    2010,
    Duration(hours: 2, minutes: 28)
  );
  
  // Llista de PLAYABLES (diferents tipus!)
  print('=== REPRODUÏBLES ===');
  List<Playable> playableItems = [audio, dvd];
  
  for (Playable item in playableItems) {
    if (item is AudioBook && !item.isDownloaded()) {
      await item.download();
    }
    item.play();
    print('Duració: ${item.getDuration()}\n');
  }
  
  // Llista de DOWNLOADABLES
  print('\n=== DESCARREGABLES ===');
  List<Downloadable> downloadableItems = [audio, ebook];
  
  for (Downloadable item in downloadableItems) {
    if (!item.isDownloaded()) {
      await item.download();
    }
    print('Mida: ${item.getFileSize()} MB\n');
  }
  
  // Llista de SHAREABLES
  print('\n=== COMPARTIBLES ===');
  List<Shareable> shareableItems = [ebook];
  
  for (Shareable item in shareableItems) {
    item.share('Twitter');
    print('');
  }
}
```

!!! success "Flexibilitat de les Interfícies"
    Observa com:
    
    - `AudioBook` apareix en llistes de `Playable` I `Downloadable`
    - Cada llista agrupa items per **capacitat**, no per tipus
    - Un objecte pot tenir múltiples "rols"
    - Molt més flexible que herència múltiple!

---

### 🔑 Conceptes Clau

!!! info "extends vs implements"
    **`extends` (Herència):**
    ```dart
    class Book extends MediaItem { }
    ```
    
    - Herència d'implementació
    - Només pots estendre UNA classe
    - Heretes codi (propietats i mètodes)
    - Relació: "és un" (is-a)
    
    **`implements` (Interfície):**
    ```dart
    class AudioBook implements Playable, Downloadable { }
    ```
    
    - Contracte pur (has d'implementar tots els mètodes)
    - Pots implementar MÚLTIPLES interfícies
    - No heretes codi
    - Relació: "pot fer" (can-do)

!!! info "Múltiples Interfícies"
    ```dart
    class AudioBook extends MediaItem 
        implements Playable, Downloadable {
      // HAURÀ d'implementar TOTS els mètodes de:
      // - Playable: play(), pause(), stop(), getDuration()
      // - Downloadable: download(), getFileSize(), isDownloaded()
    }
    ```
    
    **Avantatge:** Una classe pot tenir múltiples capacitats!

---

## 📚 Lliçó 6: Composició vs Herència

### 🎯 Objectius d'Aprenentatge

Al finalitzar aquesta lliçó seràs capaç de:

- Identificar els límits de l'herència
- Aplicar composició per crear comportaments flexibles
- Comprendre "favor composition over inheritance"
- Utilitzar Strategy Pattern bàsic
- Canviar comportaments en temps d'execució

---

### 🔴 Problema: L'Herència es Torna Rígida

#### Context: Personatges de Videojoc

```dart
// Jerarquia amb herència
abstract class Character {
  String name;
  int health;
  
  Character(this.name, this.health);
  
  void attack();
}

class Warrior extends Character {
  Warrior(String name) : super(name, 100);
  
  @override
  void attack() {
    print('$name ataca amb espasa! ⚔️');
  }
}

class Mage extends Character {
  Mage(String name) : super(name, 80);
  
  @override
  void attack() {
    print('$name llança bola de foc! 🔥');
  }
}

class Archer extends Character {
  Archer(String name) : super(name, 90);
  
  @override
  void attack() {
    print('$name dispara fletxa! 🏹');
  }
}
```

!!! danger "I si vull un Guerrer-Mag?"
    **Problemes:**
    
    - No puc heretar de `Warrior` i `Mage` alhora
    - Hauria de crear `WarriorMage`, `ArcherMage`, `WarriorArcher`...
    - Amb 5 tipus → 25 combinacions! 😱
    - No puc canviar comportament en runtime
    - Jerarquia rígida i explosió de classes

---

### ✅ Solució: Composició

!!! info "Principi: Favor Composition Over Inheritance"
    **"Prefereix la composició a l'herència"**
    
    En lloc de:
    
    - Warrior **és un** Character (herència)
    
    Fes servir:
    
    - Character **té un** AttackBehavior (composició)
    
    **Relació:** "has-a" en lloc de "is-a"

---

### 💻 Implementació amb Composició

```dart
// Definir COMPORTAMENTS com a interfícies
abstract class AttackBehavior {
  void attack(String characterName);
}

abstract class DefenseBehavior {
  void defend(String characterName);
}

// Implementacions concretes d'atac
class SwordAttack implements AttackBehavior {
  @override
  void attack(String characterName) {
    print('$characterName ataca amb espasa! ⚔️ (30 damage)');
  }
}

class MagicAttack implements AttackBehavior {
  @override
  void attack(String characterName) {
    print('$characterName llança bola de foc! 🔥 (50 damage)');
  }
}

class BowAttack implements AttackBehavior {
  @override
  void attack(String characterName) {
    print('$characterName dispara fletxa! 🏹 (35 damage)');
  }
}

// Implementacions concretes de defensa
class ShieldDefense implements DefenseBehavior {
  @override
  void defend(String characterName) {
    print('$characterName aixeca l\'escut! 🛡️ (-20 damage rebut)');
  }
}

class DodgeDefense implements DefenseBehavior {
  @override
  void defend(String characterName) {
    print('$characterName esquiva! 💨 (-40 damage rebut)');
  }
}

class MagicShield implements DefenseBehavior {
  @override
  void defend(String characterName) {
    print('$characterName crea escut màgic! ✨ (-30 damage rebut)');
  }
}

// Personatge amb COMPOSICIÓ
class Character {
  String name;
  int health;
  
  // Comportaments COMPOSATS (has-a)
  AttackBehavior? attackBehavior;
  DefenseBehavior? defenseBehavior;
  
  Character(this.name, this.health, {this.attackBehavior, this.defenseBehavior});
  
  // Delegar a l'objecte de comportament
  void attack() {
    if (attackBehavior != null) {
      attackBehavior!.attack(name);
    } else {
      print('$name no té atac definit');
    }
  }
  
  void defend() {
    if (defenseBehavior != null) {
      defenseBehavior!.defend(name);
    } else {
      print('$name no té defensa definida');
    }
  }
  
  // Canviar comportament en RUNTIME!
  void setAttackBehavior(AttackBehavior behavior) {
    attackBehavior = behavior;
    print('💡 $name ha après un nou atac!');
  }
  
  void setDefenseBehavior(DefenseBehavior behavior) {
    defenseBehavior = behavior;
    print('💡 $name ha après una nova defensa!');
  }
}
```

---

### 🎮 Exemple d'Ús

```dart
void main() {
  // Crear personatges amb DIFERENTS combinacions
  Character warrior = Character(
    'Aragorn',
    100,
    attackBehavior: SwordAttack(),
    defenseBehavior: ShieldDefense(),
  );
  
  Character mage = Character(
    'Gandalf',
    80,
    attackBehavior: MagicAttack(),
    defenseBehavior: MagicShield(),
  );
  
  Character archer = Character(
    'Legolas',
    90,
    attackBehavior: BowAttack(),
    defenseBehavior: DodgeDefense(),
  );
  
  // Usar comportaments
  print('=== COMBAT ===');
  warrior.attack();
  warrior.defend();
  print('');
  
  mage.attack();
  mage.defend();
  print('');
  
  archer.attack();
  archer.defend();
  print('');
  
  // Canviar comportament en RUNTIME!
  print('=== ARAGORN TROBA UNA ESPASA MÀGICA ===');
  warrior.setAttackBehavior(MagicAttack());
  warrior.attack();
  print('');
  
  // Crear un Guerrer-Mag (combinació!)
  print('=== PERSONATGE HÍBRID ===');
  Character hybrid = Character(
    'Elric',
    95,
    attackBehavior: MagicAttack(),
    defenseBehavior: ShieldDefense(),
  );
  
  hybrid.attack();
  hybrid.defend();
}
```

!!! example "Sortida"
    ```
    === COMBAT ===
    Aragorn ataca amb espasa! ⚔️ (30 damage)
    Aragorn aixeca l'escut! 🛡️ (-20 damage rebut)
    
    Gandalf llança bola de foc! 🔥 (50 damage)
    Gandalf crea escut màgic! ✨ (-30 damage rebut)
    
    Legolas dispara fletxa! 🏹 (35 damage)
    Legolas esquiva! 💨 (-40 damage rebut)
    
    === ARAGORN TROBA UNA ESPASA MÀGICA ===
    💡 Aragorn ha après un nou atac!
    Aragorn llança bola de foc! 🔥 (50 damage)
    
    === PERSONATGE HÍBRID ===
    Elric llança bola de foc! 🔥 (50 damage)
    Elric aixeca l'escut! 🛡️ (-20 damage rebut)
    ```

---

### 🔑 Comparació Final

| Aspecte | Herència | Composició |
|---------|----------|------------|
| **Relació** | "és un" (is-a) | "té un" (has-a) |
| **Flexibilitat** | ❌ Rígida | ✅ Molt flexible |
| **Combinacions** | ❌ Explosió de classes | ✅ Il·limitades |
| **Runtime** | ❌ No canvia | ✅ Canvia dinàmicament |
| **Reutilització** | ⚠️ Vertical (jerarquia) | ✅ Horizontal (mix & match) |
| **Quan usar** | Relació clara "és un" | Comportaments variables |

!!! tip "Regla Pràctica"
    **Usa Herència quan:**
    
    - Hi ha una relació clara "és un"
    - La jerarquia és estable
    - Vols compartir implementació
    
    **Usa Composició quan:**
    
    - Necessites combinar comportaments
    - Els comportaments canvien en runtime
    - Vols màxima flexibilitat

---

## 🎯 Exercicis Pràctics

### Exercici 1: Sistema de Notificacions

!!! question "Enunciat"
    Crea un sistema de notificacions amb classe abstracta `NotificationService`.
    
    **Mètodes abstractes:**
    
    - `send(String message, String recipient)`
    - `validate(String recipient)`
    
    **Mètode concret:**
    
    - `sendNotification(String message, String recipient)` que usa els anteriors
    
    **Implementacions:**
    
    - `EmailNotification`
    - `SMSNotification`
    - `PushNotification`

??? example "Solució"
    ```dart
    abstract class NotificationService {
      String _serviceName;
      
      NotificationService(this._serviceName);
      
      String get serviceName => _serviceName;
      
      bool send(String message, String recipient);
      bool validate(String recipient);
      
      bool sendNotification(String message, String recipient) {
        print('\n📨 Enviant notificació via $_serviceName...');
        
        if (!validate(recipient)) {
          print('❌ Destinatari invàlid: $recipient');
          return false;
        }
        
        if (send(message, recipient)) {
          print('✅ Notificació enviada amb èxit');
          return true;
        } else {
          print('❌ Error en enviar notificació');
          return false;
        }
      }
    }
    
    class EmailNotification extends NotificationService {
      EmailNotification() : super('Email');
      
      @override
      bool validate(String recipient) {
        return recipient.contains('@') && recipient.contains('.');
      }
      
      @override
      bool send(String message, String recipient) {
        print('📧 Enviant email a $recipient');
        print('   Missatge: $message');
        return true;
      }
    }
    
    class SMSNotification extends NotificationService {
      SMSNotification() : super('SMS');
      
      @override
      bool validate(String recipient) {
        return recipient.length >= 9 && 
               RegExp(r'^[0-9]+$').hasMatch(recipient);
      }
      
      @override
      bool send(String message, String recipient) {
        print('📱 Enviant SMS a +34 $recipient');
        print('   Missatge: $message');
        return true;
      }
    }
    
    class PushNotification extends NotificationService {
      PushNotification() : super('Push');
      
      @override
      bool validate(String recipient) {
        return recipient.length > 10; // Device token
      }
      
      @override
      bool send(String message, String recipient) {
        print('🔔 Enviant push al dispositiu ${recipient.substring(0, 10)}...');
        print('   Missatge: $message');
        return true;
      }
    }
    ```

---

### Exercici 2: Vehicles amb Capacitats

!!! question "Enunciat"
    Crea interfícies `Drivable`, `Flyable` i `Floatable` amb mètodes adequats.
    
    **Implementa:**
    
    - `Car`: només Drivable
    - `Boat`: Floatable i pot ser Drivable
    - `Amphibious Vehicle`: Drivable i Floatable
    - `Flying Car`: Drivable i Flyable

??? example "Solució"
    ```dart
    abstract class Drivable {
      void drive();
      double getMaxSpeed();
    }
    
    abstract class Flyable {
      void takeOff();
      void land();
      double getMaxAltitude();
    }
    
    abstract class Floatable {
      void sail();
      bool canDiveSafely();
    }
    
    class Car implements Drivable {
      String model;
      
      Car(this.model);
      
      @override
      void drive() {
        print('🚗 $model conduint per carretera');
      }
      
      @override
      double getMaxSpeed() {
        return 200.0; // km/h
      }
    }
    
    class Boat implements Floatable {
      String name;
      
      Boat(this.name);
      
      @override
      void sail() {
        print('⛵ $name navegant pel mar');
      }
      
      @override
      bool canDiveSafely() {
        return false;
      }
    }
    
    class AmphibiousVehicle implements Drivable, Floatable {
      String model;
      
      AmphibiousVehicle(this.model);
      
      @override
      void drive() {
        print('🚙 $model conduint per terra');
      }
      
      @override
      double getMaxSpeed() {
        return 80.0;
      }
      
      @override
      void sail() {
        print('🚤 $model navegant per aigua');
      }
      
      @override
      bool canDiveSafely() {
        return false;
      }
    }
    
    class FlyingCar implements Drivable, Flyable {
      String model;
      
      FlyingCar(this.model);
      
      @override
      void drive() {
        print('🚗 $model conduint (mode terra)');
      }
      
      @override
      double getMaxSpeed() {
        return 150.0;
      }
      
      @override
      void takeOff() {
        print('🛫 $model enlairant-se!');
      }
      
      @override
      void land() {
        print('🛬 $model aterrant');
      }
      
      @override
      double getMaxAltitude() {
        return 3000.0; // metres
      }
    }
    ```

---

## ✍️ Autoavaluació FASE 3

### Pregunta 1: Classes Abstractes

!!! question "Conceptes teòrics"
    **a)** Quina diferència hi ha entre una classe abstracta i una classe normal?
    
    **b)** Es pot crear una instància d'una classe abstracta? Per què?
    
    **c)** Pot una classe abstracta tenir mètodes concrets (amb implementació)?

??? success "Resposta esperada"
    **a)** Una classe abstracta pot tenir mètodes sense implementació (abstractes) que obliguen les subclasses a implementar-los. Una classe normal ha de tenir tots els mètodes implementats.
    
    **b)** No, no es pot instanciar una classe abstracta. Només serveix com a plantilla per a subclasses. Això té sentit perquè normalment representa un concepte massa genèric per existir per si sol.
    
    **c)** Sí! Aquest és un dels avantatges: pot tenir mètodes concrets (implementació compartida) i mètodes abstractes (contracte obligatori).

---

### Pregunta 2: Interfícies vs Classes Abstractes

!!! question "Comparació"
    Completa la taula:
    
    | | Interfície | Classe Abstracta |
    |---|---|---|
    | Implementació | ? | ? |
    | Múltiples | ? | ? |
    | Paraula clau | ? | ? |
    | Relació | ? | ? |

??? success "Resposta esperada"
    | | Interfície | Classe Abstracta |
    |---|---|---|
    | **Implementació** | 0% (contracte pur) | Parcial (mix) |
    | **Múltiples** | Sí (múltiples interfícies) | No (herència simple) |
    | **Paraula clau** | `implements` | `extends` |
    | **Relació** | "pot fer" (can-do) | "és un" (is-a) |

---

### Pregunta 3: Pràctica amb Abstracció

!!! question "Implementació"
    Crea una classe abstracta `Shape` amb:
    
    - Mètode abstracte: `calculateArea()`
    - Mètode abstracte: `calculatePerimeter()`
    - Mètode concret: `display()` que mostra àrea i perímetre
    
    Implementa `Circle` i `Rectangle`.

??? example "Solució"
    ```dart
    abstract class Shape {
      String name;
      
      Shape(this.name);
      
      double calculateArea();
      double calculatePerimeter();
      
      void display() {
        print('=== $name ===');
        print('Àrea: ${calculateArea().toStringAsFixed(2)}');
        print('Perímetre: ${calculatePerimeter().toStringAsFixed(2)}');
      }
    }
    
    class Circle extends Shape {
      double radius;
      
      Circle(this.radius) : super('Cercle');
      
      @override
      double calculateArea() {
        return 3.14159 * radius * radius;
      }
      
      @override
      double calculatePerimeter() {
        return 2 * 3.14159 * radius;
      }
    }
    
    class Rectangle extends Shape {
      double width;
      double height;
      
      Rectangle(this.width, this.height) : super('Rectangle');
      
      @override
      double calculateArea() {
        return width * height;
      }
      
      @override
      double calculatePerimeter() {
        return 2 * (width + height);
      }
    }
    ```

---

### Pregunta 4: Composició

!!! question "Disseny"
    Per què la composició és més flexible que l'herència? Dona un exemple concret.

??? success "Resposta esperada"
    La composició és més flexible perquè:
    
    1. **Combinacions il·limitades**: Pots combinar comportaments sense crear classes noves
    2. **Canvis en runtime**: Pots canviar comportament durant l'execució
    3. **No jerarquies rígides**: Evites explosió de subclasses
    
    **Exemple:**
    
    Amb herència: `Warrior`, `Mage`, `WarriorMage`, `ArcherMage`... (explosió!)
    
    Amb composició:
    ```dart
    Character hero = Character('Hero', 100);
    hero.setAttackBehavior(SwordAttack());
    hero.setDefenseBehavior(MagicShield());
    // Guerrer amb defensa màgica!
    
    // Més tard, canvia:
    hero.setAttackBehavior(MagicAttack());
    // Ara és mag!
    ```

---

### ✅ Checklist d'Autoavaluació

- [ ] Entenc què és una classe abstracta
- [ ] Sé crear mètodes abstractes i concrets
- [ ] Comprenc quan usar classes abstractes
- [ ] Sé implementar múltiples interfícies
- [ ] Entenc `extends` vs `implements`
- [ ] Identifico capacitats que són millor com interfícies
- [ ] Comprenc "favor composition over inheritance"
- [ ] Puc implementar composició en lloc d'herència
- [ ] Sé canviar comportaments en runtime
- [ ] Puc decidir entre herència, interfícies o composició

!!! success "Objectiu"
    **Marca almenys 8/10** abans de passar a la FASE 4!

---

## 🚀 Següent Pas

**FASE 4: Conceptes Complementaris**

- Relacions entre classes
- Principis SOLID
- Patrons de disseny bàsics

---

!!! quote "Recordatori"
    **"Favor composition over inheritance"** - Gang of Four
    
    La composició ofereix més flexibilitat que l'herència. Usa herència per relacions "és un" clares, i composició per comportaments variables.
