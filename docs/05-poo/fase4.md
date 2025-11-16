# 🎓 FASE 4: Conceptes Complementaris

## 📌 Objectius de la Fase

En aquesta fase final consolidaràs el teu coneixement de POO amb conceptes avançats:

- Comprendre les diferents relacions entre classes
- Aplicar principis SOLID per millor disseny
- Implementar patrons de disseny bàsics
- Escriure codi POO professional i mantenible

!!! info "Durada estimada"
    **18 hores** distribuïdes en sessions teòriques, pràctiques i projecte integrador

---

## 📚 Lliçó 7: Relacions entre Classes

### 🎯 Objectius d'Aprenentatge

Al finalitzar aquesta lliçó seràs capaç de:

- Identificar diferents tipus de relacions entre classes
- Implementar associació, agregació i composició
- Comprendre dependència entre classes
- Modelar relacions correctament segons el context

---

### 🔗 Tipus de Relacions

!!! info "4 Tipus Principals"
    **1. Associació** (uses-a): Una classe usa l'altra temporalment
    
    **2. Agregació** (has-a): Una classe conté l'altra, però tenen vida independent
    
    **3. Composició** (owns-a): Una classe conté l'altra, vida dependent
    
    **4. Dependència** (depends-on): Una classe depèn de l'altra per funcionar

---

### 1️⃣ Associació (uses-a)

!!! info "Definició"
    Una classe **usa** l'altra, però no la "posseeix". La relació és temporal.
    
    **Exemple:** Un professor ensenya a estudiants, però els estudiants existeixen independentment del professor.

```dart
class Student {
  String name;
  int studentId;
  
  Student(this.name, this.studentId);
  
  void attendClass(String className) {
    print('$name assisteix a $className');
  }
}

class Professor {
  String name;
  String department;
  
  Professor(this.name, this.department);
  
  // ASSOCIACIÓ: usa Student però no el "té"
  void teach(Student student, String subject) {
    print('$name ensenya $subject a ${student.name}');
    student.attendClass(subject);
  }
  
  void teachMultiple(List<Student> students, String subject) {
    print('\n=== Classe de $subject ===');
    for (Student student in students) {
      teach(student, subject);
    }
  }
}

void main() {
  Student s1 = Student('Anna', 1001);
  Student s2 = Student('Marc', 1002);
  Student s3 = Student('Laura', 1003);
  
  Professor prof = Professor('Dr. Smith', 'Matemàtiques');
  
  prof.teach(s1, 'Càlcul');
  prof.teachMultiple([s1, s2, s3], 'Àlgebra');
  
  // Els estudiants existeixen independentment del professor
}
```

!!! tip "Característiques"
    - Relació temporal (mentre dura el mètode)
    - Objectes independents
    - No hi ha propietat
    - Cardinalitat flexible (1-1, 1-N, N-N)

---

### 2️⃣ Agregació (has-a, vida independent)

!!! info "Definició"
    Una classe **té** l'altra com a part, però poden existir independentment.
    
    **Exemple:** Un equip té jugadors, però els jugadors poden existir sense l'equip.

```dart
class Player {
  String name;
  int number;
  String position;
  
  Player(this.name, this.number, this.position);
  
  void play() {
    print('$name (#$number) juga de $position');
  }
}

class Team {
  String name;
  List<Player> _players = [];
  
  Team(this.name);
  
  // AGREGACIÓ: els jugadors s'afegeixen, no es creen aquí
  void addPlayer(Player player) {
    _players.add(player);
    print('✓ ${player.name} s\'ha unit a $name');
  }
  
  void removePlayer(Player player) {
    _players.remove(player);
    print('✗ ${player.name} ha deixat $name');
  }
  
  void displayRoster() {
    print('\n=== Plantilla de $name ===');
    for (Player player in _players) {
      print('${player.number}. ${player.name} - ${player.position}');
    }
  }
  
  void playMatch() {
    print('\n🏀 $name està jugant!');
    for (Player player in _players) {
      player.play();
    }
  }
}

void main() {
  // Crear jugadors INDEPENDENTMENT
  Player p1 = Player('LeBron James', 23, 'Forward');
  Player p2 = Player('Stephen Curry', 30, 'Guard');
  Player p3 = Player('Kevin Durant', 35, 'Forward');
  
  // Crear equips
  Team lakers = Team('Lakers');
  Team warriors = Team('Warriors');
  
  // Afegir jugadors (AGREGACIÓ)
  lakers.addPlayer(p1);
  warriors.addPlayer(p2);
  warriors.addPlayer(p3);
  
  lakers.displayRoster();
  warriors.displayRoster();
  
  // Els jugadors poden canviar d'equip
  print('\n--- TRASPÀS ---');
  warriors.removePlayer(p3);
  lakers.addPlayer(p3);
  
  lakers.displayRoster();
  
  // Els jugadors encara existeixen si s'elimina l'equip
}
```

!!! tip "Característiques"
    - Els objectes "fills" poden existir sense el "pare"
    - Relació més dèbil que composició
    - Els objectes es passen com a paràmetres
    - Exemple: Equip-Jugador, Biblioteca-Llibre, Universitat-Professor

---

### 3️⃣ Composició (owns-a, vida dependent)

!!! info "Definició"
    Una classe **posseeix** l'altra i la seva vida depèn d'ella. Si es destrueix el "pare", es destrueixen els "fills".
    
    **Exemple:** Un cotxe té un motor. Si es destrueix el cotxe, el motor també.

```dart
class Engine {
  int horsepower;
  String type;
  bool isRunning = false;
  
  Engine(this.horsepower, this.type);
  
  void start() {
    isRunning = true;
    print('🚗 Motor $type engegat ($horsepower CV)');
  }
  
  void stop() {
    isRunning = false;
    print('🛑 Motor aturat');
  }
}

class Wheel {
  int size; // polzades
  String brand;
  
  Wheel(this.size, this.brand);
}

class Car {
  String brand;
  String model;
  
  // COMPOSICIÓ: el motor es crea DINS del cotxe
  late Engine engine;
  late List<Wheel> wheels;
  
  Car(this.brand, this.model, int engineHP, String engineType) {
    // El motor s'instancia AQUÍ (depèn del cotxe)
    engine = Engine(engineHP, engineType);
    
    // Les rodes també (vida dependent)
    wheels = [
      Wheel(18, 'Michelin'),
      Wheel(18, 'Michelin'),
      Wheel(18, 'Michelin'),
      Wheel(18, 'Michelin'),
    ];
    
    print('🚙 $brand $model creat amb motor $engineType');
  }
  
  void start() {
    print('\n🔑 Arrencant $brand $model...');
    engine.start();
    print('✅ Cotxe llest per conduir');
  }
  
  void stop() {
    engine.stop();
    print('🅿️ Cotxe aturat');
  }
  
  void displayInfo() {
    print('\n=== $brand $model ===');
    print('Motor: ${engine.type} - ${engine.horsepower} CV');
    print('Rodes: ${wheels[0].size}" ${wheels[0].brand}');
  }
}

void main() {
  Car myCar = Car('Toyota', 'Corolla', 140, 'Hybrid');
  
  myCar.displayInfo();
  myCar.start();
  myCar.stop();
  
  // Si myCar es destrueix, engine i wheels també
  // No podem fer: Engine e = myCar.engine; myCar = null;
  // perquè el motor només té sentit amb el cotxe
}
```

!!! tip "Característiques"
    - Vida dependent: pare es destrueix → fills també
    - Relació molt forta
    - Els objectes "fills" es creen dins del "pare"
    - Exemple: Casa-Habitació, Cotxe-Motor, Llibre-Capítol

---

### 4️⃣ Dependència (depends-on)

!!! info "Definició"
    Una classe necessita l'altra per funcionar, però no la "té" com a propietat.
    
    **Exemple:** Un mètode necessita un objecte com a paràmetre o variable local.

```dart
class EmailService {
  void sendEmail(String to, String subject, String body) {
    print('📧 Enviant email a $to');
    print('   Assumpte: $subject');
    print('   Cos: $body');
  }
}

class PaymentGateway {
  bool processPayment(double amount) {
    print('💳 Processant pagament de $amount€');
    return amount > 0;
  }
}

class Order {
  String orderId;
  double amount;
  String customerEmail;
  
  Order(this.orderId, this.amount, this.customerEmail);
  
  // DEPENDÈNCIA: usa EmailService i PaymentGateway
  // però NO els "té" com a propietats
  bool process(PaymentGateway gateway, EmailService emailer) {
    print('\n🛒 Processant comanda $orderId...');
    
    // Depèn de PaymentGateway
    if (!gateway.processPayment(amount)) {
      print('❌ Pagament fallit');
      return false;
    }
    
    // Depèn de EmailService
    emailer.sendEmail(
      customerEmail,
      'Comanda confirmada',
      'La teva comanda $orderId ha estat processada'
    );
    
    print('✅ Comanda completada');
    return true;
  }
}

void main() {
  // Crear serveis independents
  EmailService mailer = EmailService();
  PaymentGateway payment = PaymentGateway();
  
  // Crear comandes
  Order order1 = Order('ORD-001', 99.99, 'client@example.com');
  Order order2 = Order('ORD-002', 149.50, 'user@test.com');
  
  // Processar (DEPENDÈNCIA dels serveis)
  order1.process(payment, mailer);
  order2.process(payment, mailer);
}
```

!!! tip "Característiques"
    - Relació més dèbil
    - Objecte usat temporalment (paràmetre/variable local)
    - No hi ha propietat ni vida compartida
    - Facilita testing (pots passar mocks)

---

### 📊 Resum Visual

```
ASSOCIACIÓ (uses-a)
Professor ←--uses--→ Student
(temporal, independents)

AGREGACIÓ (has-a, independent)
Team ◇────→ Player
(el jugador pot existir sense l'equip)

COMPOSICIÓ (owns-a, dependent)
Car ◆────→ Engine
(el motor no existeix sense el cotxe)

DEPENDÈNCIA (depends-on)
Order ----→ PaymentGateway
(només com a paràmetre)
```

---

## 📚 Lliçó 8: Principis SOLID

### 🎯 Objectius d'Aprenentatge

Al finalitzar aquesta lliçó seràs capaç de:

- Comprendre els 5 principis SOLID
- Aplicar cada principi en el disseny de classes
- Identificar violacions dels principis
- Refactoritzar codi per seguir SOLID

---

### 🎨 Què són els Principis SOLID?

!!! info "SOLID"
    Acrònimo de 5 principis de disseny orientat a objectes per crear codi:
    
    - **Mantenible**: Fàcil de modificar
    - **Escalable**: Fàcil d'estendre
    - **Llegible**: Fàcil d'entendre
    - **Testable**: Fàcil de provar

---

### 1️⃣ S - Single Responsibility Principle (SRP)

!!! quote "Principi"
    **"Una classe ha de tenir una sola responsabilitat, un sol motiu per canviar"**

#### ❌ Violació del SRP

```dart
// Classe amb MÚLTIPLES responsabilitats
class User {
  String name;
  String email;
  
  User(this.name, this.email);
  
  // Responsabilitat 1: Validació
  bool validateEmail() {
    return email.contains('@');
  }
  
  // Responsabilitat 2: Persistència
  void saveToDatabase() {
    print('Guardant $name a la base de dades');
  }
  
  // Responsabilitat 3: Notificació
  void sendWelcomeEmail() {
    print('Enviant email de benvinguda a $email');
  }
  
  // Responsabilitat 4: Generació de reports
  String generateReport() {
    return 'Usuari: $name ($email)';
  }
}
```

!!! danger "Problemes"
    - Si canvia la BD → cal modificar User
    - Si canvia el sistema d'email → cal modificar User
    - Si canvia el format del report → cal modificar User
    - **Massa motius per canviar!**

#### ✅ Aplicant SRP

```dart
// Cada classe UNA responsabilitat
class User {
  String name;
  String email;
  
  User(this.name, this.email);
}

class EmailValidator {
  bool validate(String email) {
    return email.contains('@') && email.contains('.');
  }
}

class UserRepository {
  void save(User user) {
    print('💾 Guardant ${user.name} a la BD');
  }
  
  User? findByEmail(String email) {
    print('🔍 Buscant usuari amb email $email');
    return null;
  }
}

class EmailService {
  void sendWelcomeEmail(User user) {
    print('📧 Enviant benvinguda a ${user.email}');
  }
}

class UserReportGenerator {
  String generate(User user) {
    return '=== INFORME USUARI ===\n'
           'Nom: ${user.name}\n'
           'Email: ${user.email}';
  }
}
```

!!! success "Beneficis"
    - Cada classe té una responsabilitat clara
    - Canvis aïllats (modificar BD no afecta reports)
    - Més fàcil de testejar
    - Més reutilitzable

---

### 2️⃣ O - Open/Closed Principle (OCP)

!!! quote "Principi"
    **"Les classes han d'estar obertes per extensió, però tancades per modificació"**
    
    Pots afegir funcionalitat SENSE modificar codi existent.

#### ❌ Violació d'OCP

```dart
class DiscountCalculator {
  double calculate(String customerType, double amount) {
    // Cal MODIFICAR aquest codi per afegir nous tipus!
    if (customerType == 'regular') {
      return amount * 0.05; // 5%
    } else if (customerType == 'premium') {
      return amount * 0.10; // 10%
    } else if (customerType == 'vip') {
      return amount * 0.20; // 20%
    }
    return 0;
  }
}
```

!!! danger "Problema"
    Per afegir 'gold' → cal MODIFICAR el mètode existent!

#### ✅ Aplicant OCP

```dart
// Classe base tancada per modificació
abstract class Customer {
  String name;
  
  Customer(this.name);
  
  double getDiscount(double amount);
}

// Obertes per extensió
class RegularCustomer extends Customer {
  RegularCustomer(String name) : super(name);
  
  @override
  double getDiscount(double amount) {
    return amount * 0.05;
  }
}

class PremiumCustomer extends Customer {
  PremiumCustomer(String name) : super(name);
  
  @override
  double getDiscount(double amount) {
    return amount * 0.10;
  }
}

class VIPCustomer extends Customer {
  VIPCustomer(String name) : super(name);
  
  @override
  double getDiscount(double amount) {
    return amount * 0.20;
  }
}

// Afegir nous tipus SIN modificar codi existent!
class GoldCustomer extends Customer {
  GoldCustomer(String name) : super(name);
  
  @override
  double getDiscount(double amount) {
    return amount * 0.15;
  }
}

void main() {
  List<Customer> customers = [
    RegularCustomer('Anna'),
    PremiumCustomer('Marc'),
    VIPCustomer('Laura'),
    GoldCustomer('David'), // Nou tipus sense modificar res!
  ];
  
  double purchaseAmount = 100;
  
  for (Customer customer in customers) {
    double discount = customer.getDiscount(purchaseAmount);
    print('${customer.name}: ${discount.toStringAsFixed(2)}€ descompte');
  }
}
```

---

### 3️⃣ L - Liskov Substitution Principle (LSP)

!!! quote "Principi"
    **"Les subclasses han de poder substituir la classe base sense trencar el programa"**

#### ❌ Violació d'LSP

```dart
class Rectangle {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  void setWidth(double w) => width = w;
  void setHeight(double h) => height = h;
  
  double getArea() => width * height;
}

class Square extends Rectangle {
  Square(double side) : super(side, side);
  
  // Problema: canviar width també canvia height!
  @override
  void setWidth(double w) {
    width = w;
    height = w; // Trencar expectatives!
  }
  
  @override
  void setHeight(double h) {
    width = h;
    height = h;
  }
}

void main() {
  Rectangle rect = Square(5);
  rect.setWidth(10);
  rect.setHeight(20);
  
  print('Àrea: ${rect.getArea()}'); // Esperes 200, obtens 400!
  // LSP violat: Square no es comporta com Rectangle
}
```

#### ✅ Aplicant LSP

```dart
abstract class Shape {
  double getArea();
}

class Rectangle extends Shape {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  @override
  double getArea() => width * height;
}

class Square extends Shape {
  double side;
  
  Square(this.side);
  
  @override
  double getArea() => side * side;
}

// Ara Square i Rectangle són Shape, no hi ha herència problemàtica
```

---

### 4️⃣ I - Interface Segregation Principle (ISP)

!!! quote "Principi"
    **"Cap client ha de dependre de mètodes que no utilitza"**
    
    Millor moltes interfícies específiques que una de genèrica.

#### ❌ Violació d'ISP

```dart
abstract class Worker {
  void work();
  void eat();
  void sleep();
}

class Human implements Worker {
  @override
  void work() => print('Treballant...');
  
  @override
  void eat() => print('Menjant...');
  
  @override
  void sleep() => print('Dormint...');
}

class Robot implements Worker {
  @override
  void work() => print('Treballant 24/7...');
  
  @override
  void eat() => throw UnimplementedError('Els robots no mengen!');
  
  @override
  void sleep() => throw UnimplementedError('Els robots no dormen!');
}
```

!!! danger "Problema"
    Robot es veu forçat a implementar mètodes que no necessita!

#### ✅ Aplicant ISP

```dart
abstract class Workable {
  void work();
}

abstract class Eatable {
  void eat();
}

abstract class Sleepable {
  void sleep();
}

class Human implements Workable, Eatable, Sleepable {
  @override
  void work() => print('Treballant...');
  
  @override
  void eat() => print('Menjant...');
  
  @override
  void sleep() => print('Dormint...');
}

class Robot implements Workable {
  @override
  void work() => print('Treballant 24/7...');
  
  // No necessita eat() ni sleep()!
}
```

---

### 5️⃣ D - Dependency Inversion Principle (DIP)

!!! quote "Principi"
    **"Depèn d'abstraccions, no de concrecions"**
    
    Les classes haurien de dependre d'interfícies, no d'implementacions concretes.

#### ❌ Violació de DIP

```dart
class MySQLDatabase {
  void save(String data) {
    print('Guardant a MySQL: $data');
  }
}

class UserService {
  MySQLDatabase db = MySQLDatabase(); // Dependència concreta!
  
  void createUser(String name) {
    db.save(name);
    // Si vols canviar a PostgreSQL → cal modificar UserService!
  }
}
```

#### ✅ Aplicant DIP

```dart
// Abstracció
abstract class Database {
  void save(String data);
}

// Implementacions concretes
class MySQLDatabase implements Database {
  @override
  void save(String data) {
    print('💾 MySQL: $data');
  }
}

class PostgreSQLDatabase implements Database {
  @override
  void save(String data) {
    print('🐘 PostgreSQL: $data');
  }
}

class MongoDatabase implements Database {
  @override
  void save(String data) {
    print('🍃 MongoDB: $data');
  }
}

// Depèn de l'abstracció!
class UserService {
  Database db; // Interfície, no implementació
  
  UserService(this.db); // Injecció de dependència
  
  void createUser(String name) {
    db.save(name);
  }
}

void main() {
  // Fàcil canviar de BD sense modificar UserService!
  UserService service1 = UserService(MySQLDatabase());
  service1.createUser('Anna');
  
  UserService service2 = UserService(PostgreSQLDatabase());
  service2.createUser('Marc');
  
  UserService service3 = UserService(MongoDatabase());
  service3.createUser('Laura');
}
```

---

## 📚 Lliçó 9: Patrons de Disseny Bàsics

### 🎯 Objectius d'Aprenentatge

Al finalitzar aquesta lliçó seràs capaç de:

- Implementar el patró Singleton
- Utilitzar el patró Factory
- Aplicar el patró Strategy
- Comprendre el patró Observer

---

### 1️⃣ Singleton - Instància Única

!!! info "Propòsit"
    Garantir que una classe tingui **només una instància** i proporcionar un punt d'accés global.
    
    **Ús:** Configuració, Logger, Database Connection

```dart
class AppConfig {
  // Instància privada estàtica
  static AppConfig? _instance;
  
  // Propietats de configuració
  String appName;
  String version;
  Map<String, String> settings = {};
  
  // Constructor PRIVAT
  AppConfig._internal(this.appName, this.version) {
    print('🔧 Configuració inicialitzada');
  }
  
  // Mètode estàtic per obtenir la instància
  static AppConfig getInstance() {
    _instance ??= AppConfig._internal('MyApp', '1.0.0');
    return _instance!;
  }
  
  // O amb factory constructor
  factory AppConfig() {
    _instance ??= AppConfig._internal('MyApp', '1.0.0');
    return _instance!;
  }
  
  void setSetting(String key, String value) {
    settings[key] = value;
    print('⚙️ $key = $value');
  }
  
  String? getSetting(String key) {
    return settings[key];
  }
}

void main() {
  // Totes obtenen la MATEIXA instància
  AppConfig config1 = AppConfig.getInstance();
  AppConfig config2 = AppConfig.getInstance();
  AppConfig config3 = AppConfig();
  
  print('Són la mateixa instància? ${identical(config1, config2)}'); // true
  
  config1.setSetting('theme', 'dark');
  print('Theme a config2: ${config2.getSetting('theme')}'); // dark!
  print('Theme a config3: ${config3.getSetting('theme')}'); // dark!
}
```

---

### 2️⃣ Factory - Creació d'Objectes

!!! info "Propòsit"
    Crear objectes sense especificar la classe exacta. Delegar la creació a un mètode factory.
    
    **Ús:** Quan la creació té lògica complexa o múltiples variants

```dart
abstract class Shape {
  void draw();
  double getArea();
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  void draw() {
    print('🔵 Dibuixant cercle de radi $radius');
  }
  
  @override
  double getArea() {
    return 3.14159 * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  @override
  void draw() {
    print('🟦 Dibuixant rectangle ${width}x$height');
  }
  
  @override
  double getArea() {
    return width * height;
  }
}

class Triangle extends Shape {
  double base;
  double height;
  
  Triangle(this.base, this.height);
  
  @override
  void draw() {
    print('🔺 Dibuixant triangle base=$base, altura=$height');
  }
  
  @override
  double getArea() {
    return (base * height) / 2;
  }
}

// FACTORY
class ShapeFactory {
  // Mètode factory que decideix quina classe crear
  static Shape createShape(String type, List<double> dimensions) {
    switch (type.toLowerCase()) {
      case 'circle':
        return Circle(dimensions[0]);
      case 'rectangle':
        return Rectangle(dimensions[0], dimensions[1]);
      case 'triangle':
        return Triangle(dimensions[0], dimensions[1]);
      default:
        throw ArgumentError('Tipus de forma desconegut: $type');
    }
  }
}

void main() {
  // Crear formes sense saber la classe exacta
  List<Shape> shapes = [
    ShapeFactory.createShape('circle', [5.0]),
    ShapeFactory.createShape('rectangle', [4.0, 6.0]),
    ShapeFactory.createShape('triangle', [3.0, 4.0]),
  ];
  
  for (Shape shape in shapes) {
    shape.draw();
    print('   Àrea: ${shape.getArea().toStringAsFixed(2)}\n');
  }
}
```

---

### 3️⃣ Strategy - Algoritmes Intercanviables

!!! info "Propòsit"
    Definir una família d'algoritmes, encapsular-los i fer-los intercanviables.
    
    **Ús:** Quan tens diferents maneres de fer la mateixa cosa

```dart
// Estratègies d'ordenació
abstract class SortStrategy {
  void sort(List<int> data);
}

class BubbleSort implements SortStrategy {
  @override
  void sort(List<int> data) {
    print('🔄 Ordenant amb Bubble Sort...');
    // Implementació simplificada
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data.length - 1; j++) {
        if (data[j] > data[j + 1]) {
          int temp = data[j];
          data[j] = data[j + 1];
          data[j + 1] = temp;
        }
      }
    }
  }
}

class QuickSort implements SortStrategy {
  @override
  void sort(List<int> data) {
    print('⚡ Ordenant amb Quick Sort...');
    _quickSort(data, 0, data.length - 1);
  }
  
  void _quickSort(List<int> data, int low, int high) {
    if (low < high) {
      int pi = _partition(data, low, high);
      _quickSort(data, low, pi - 1);
      _quickSort(data, pi + 1, high);
    }
  }
  
  int _partition(List<int> data, int low, int high) {
    int pivot = data[high];
    int i = low - 1;
    
    for (int j = low; j < high; j++) {
      if (data[j] < pivot) {
        i++;
        int temp = data[i];
        data[i] = data[j];
        data[j] = temp;
      }
    }
    
    int temp = data[i + 1];
    data[i + 1] = data[high];
    data[high] = temp;
    
    return i + 1;
  }
}

class MergeSort implements SortStrategy {
  @override
  void sort(List<int> data) {
    print('🔀 Ordenant amb Merge Sort...');
    data.sort(); // Usar implementació de Dart per simplicitat
  }
}

// Context que usa l'estratègia
class DataSorter {
  SortStrategy? strategy;
  
  void setStrategy(SortStrategy newStrategy) {
    strategy = newStrategy;
    print('📝 Estratègia canviada a ${newStrategy.runtimeType}');
  }
  
  void sortData(List<int> data) {
    if (strategy == null) {
      print('❌ No hi ha estratègia definida');
      return;
    }
    
    print('\nDades originals: $data');
    strategy!.sort(data);
    print('Dades ordenades: $data');
  }
}

void main() {
  List<int> data1 = [64, 34, 25, 12, 22, 11, 90];
  List<int> data2 = [5, 2, 8, 1, 9];
  
  DataSorter sorter = DataSorter();
  
  // Canviar estratègia dinàmicament
  sorter.setStrategy(BubbleSort());
  sorter.sortData(List.from(data1));
  
  sorter.setStrategy(QuickSort());
  sorter.sortData(List.from(data2));
  
  sorter.setStrategy(MergeSort());
  sorter.sortData(List.from(data1));
}
```

---

### 4️⃣ Observer - Notificació d'Esdeveniments

!!! info "Propòsit"
    Definir una dependència 1-a-N on quan un objecte canvia d'estat, tots els seus dependents són notificats.
    
    **Ús:** Sistemes d'esdeveniments, UI reactiva, pub-sub

```dart
// Interfície Observer
abstract class Observer {
  void update(String message);
}

// Subject (Observable)
class NewsAgency {
  String _latestNews = '';
  List<Observer> _observers = [];
  
  void subscribe(Observer observer) {
    _observers.add(observer);
    print('✓ ${observer.runtimeType} subscrit');
  }
  
  void unsubscribe(Observer observer) {
    _observers.remove(observer);
    print('✗ ${observer.runtimeType} desubscrit');
  }
  
  void publishNews(String news) {
    print('\n📰 NOTÍCIA URGENT: $news');
    _latestNews = news;
    _notifyObservers();
  }
  
  void _notifyObservers() {
    for (Observer observer in _observers) {
      observer.update(_latestNews);
    }
  }
}

// Observers concrets
class EmailSubscriber implements Observer {
  String email;
  
  EmailSubscriber(this.email);
  
  @override
  void update(String message) {
    print('📧 Email a $email: Nova notícia - $message');
  }
}

class SMSSubscriber implements Observer {
  String phone;
  
  SMSSubscriber(this.phone);
  
  @override
  void update(String message) {
    print('📱 SMS a $phone: $message');
  }
}

class PushNotificationSubscriber implements Observer {
  String deviceId;
  
  PushNotificationSubscriber(this.deviceId);
  
  @override
  void update(String message) {
    print('🔔 Push a dispositiu $deviceId: $message');
  }
}

void main() {
  NewsAgency agency = NewsAgency();
  
  // Subscriure observers
  EmailSubscriber email1 = EmailSubscriber('user1@example.com');
  EmailSubscriber email2 = EmailSubscriber('user2@example.com');
  SMSSubscriber sms1 = SMSSubscriber('+34 600 123 456');
  PushNotificationSubscriber push1 = PushNotificationSubscriber('DEVICE-001');
  
  agency.subscribe(email1);
  agency.subscribe(email2);
  agency.subscribe(sms1);
  agency.subscribe(push1);
  
  // Publicar notícies (tots reben notificació)
  agency.publishNews('Descobriment científic important!');
  
  // Algú es desubscriu
  print('\n--- Un usuari es desubscriu ---');
  agency.unsubscribe(email2);
  
  agency.publishNews('Actualització del temps');
}
```

---

## ✍️ Autoavaluació FINAL - FASE 4

### Pregunta 1: Relacions entre Classes

!!! question "Identificació"
    Per cada exemple, identifica el tipus de relació i justifica:
    
    **a)** Un hospital té doctors. Els doctors poden treballar en diferents hospitals.
    
    **b)** Una casa té habitacions. Si destrueixes la casa, les habitacions desapareixen.
    
    **c)** Una comanda usa un servei de pagament per processar-se.
    
    **d)** Un professor ensenya estudiants durant una classe.

??? success "Resposta esperada"
    **a)** AGREGACIÓ - Els doctors poden existir independentment de l'hospital
    
    **b)** COMPOSICIÓ - Les habitacions tenen vida dependent de la casa
    
    **c)** DEPENDÈNCIA - La comanda només usa el servei temporalment
    
    **d)** ASSOCIACIÓ - Relació temporal mentre dura la classe

---

### Pregunta 2: Principis SOLID

!!! question "Identificació de violacions"
    Quin principi SOLID es viola en cada cas?
    
    **a)** Una classe `Report` que genera reports I els guarda a la BD I els envia per email.
    
    **b)** Per afegir un nou tipus de descompte, has de modificar el codi existent.
    
    **c)** Una interfície `Bird` amb `fly()`, però els pingüins no volen.
    
    **d)** Una classe que depèn directament de `MySQLDatabase` en lloc d'una interfície.

??? success "Resposta esperada"
    **a)** **SRP** (Single Responsibility) - Massa responsabilitats
    
    **b)** **OCP** (Open/Closed) - No obert per extensió
    
    **c)** **ISP** (Interface Segregation) - Interfície massa genèrica
    
    **d)** **DIP** (Dependency Inversion) - Depèn de concreció, no d'abstracció

---

### Pregunta 3: Patrons de Disseny

!!! question "Aplicació"
    **a)** Quin patró usaries per garantir que només hi ha una connexió a la BD?
    
    **b)** Quin patró usaries per crear diferents tipus de notificacions sense saber el tipus exacte?
    
    **c)** Quin patró usaries per canviar l'algoritme d'encriptació en runtime?
    
    **d)** Quin patró usaries per notificar múltiples subscriptors quan arriba un nou missatge?

??? success "Resposta esperada"
    **a)** **Singleton** - Una sola instància de connexió
    
    **b)** **Factory** - Creació d'objectes sense especificar classe
    
    **c)** **Strategy** - Algoritmes intercanviables
    
    **d)** **Observer** - Notificació 1-a-N

---

### Pregunta 4: Projecte Integrador

!!! question "Disseny complet"
    Dissenya un sistema de biblioteca amb:
    
    **Classes:**
    
    - `Book`, `Magazine`, `DVD` (hereten de `MediaItem`)
    - `Member` (usuari de la biblioteca)
    - `Loan` (préstec)
    
    **Relacions:**
    
    - Member-Loan (quina relació?)
    - Loan-MediaItem (quina relació?)
    
    **Aplica:**
    
    - SRP: separar responsabilitats
    - OCP: extensible per nous tipus de media
    - Factory: crear items segons tipus

??? example "Solució esquemàtica"
    ```dart
    // Classes base
    abstract class MediaItem {
      String title;
      bool available;
      // ...
    }
    
    class Book extends MediaItem { }
    class Magazine extends MediaItem { }
    class DVD extends MediaItem { }
    
    // Factory
    class MediaFactory {
      static MediaItem create(String type, Map<String, dynamic> data) {
        // ...
      }
    }
    
    // Usuari
    class Member {
      String name;
      List<Loan> activeLoans;
    }
    
    // Préstec (COMPOSICIÓ amb Member, ASSOCIACIÓ amb MediaItem)
    class Loan {
      Member member;      // Composició
      MediaItem item;     // Associació
      DateTime dueDate;
      
      bool isOverdue() {
        return DateTime.now().isAfter(dueDate);
      }
    }
    
    // Servei (SRP)
    class LoanService {
      void borrowItem(Member member, MediaItem item) {
        // ...
      }
      
      void returnItem(Loan loan) {
        // ...
      }
    }
    ```

---

### ✅ Checklist Final del Curs

**Fonaments:**

- [ ] Crear classes amb propietats i mètodes
- [ ] Aplicar encapsulació
- [ ] Validar dades

**Herència i Polimorfisme:**

- [ ] Crear jerarquies de classes
- [ ] Sobreescriure mètodes
- [ ] Utilitzar polimorfisme

**Abstracció:**

- [ ] Crear classes abstractes
- [ ] Implementar interfícies
- [ ] Aplicar composició

**Conceptes Avançats:**

- [ ] Identificar relacions entre classes
- [ ] Aplicar principis SOLID
- [ ] Implementar patrons bàsics
- [ ] Refactoritzar codi

!!! success "Objectiu final"
    **Marca almenys 12/16 ítems** per considerar que domines POO!

---

## 🎓 Resum del Curs Complet

!!! abstract "Has après"
    **FASE 1:** Classes, Objectes, Encapsulació
    
    **FASE 2:** Herència, Polimorfisme
    
    **FASE 3:** Classes Abstractes, Interfícies, Composició
    
    **FASE 4:** Relacions, SOLID, Patrons
    
    **Conceptes clau:**
    
    - Encapsulació per protegir dades
    - Herència per reutilitzar codi
    - Polimorfisme per flexibilitat
    - Abstracció per contractes
    - Composició per comportaments
    - SOLID per bon disseny
    - Patrons per solucions provades

---

## 🚀 Pròxims Passos

!!! tip "Per continuar aprenent"
    **1. Practica amb projectes reals:**
    
    - Sistema de gestió d'inventari
    - Xarxa social bàsica
    - Joc amb personatges i items
    
    **2. Explora conceptes avançats:**
    
    - Generics
    - Mixins
    - Extension methods
    - Programació asíncrona
    
    **3. Aprèn més patrons:**
    
    - Decorator
    - Adapter
    - Command
    - State
    
    **4. Testing:**
    
    - Unit tests
    - Mocks i Stubs
    - TDD (Test-Driven Development)

---

!!! quote "Reflexió final"
    **"Object-oriented programming is an exceptionally bad idea which could only have originated in California."** - Edsger Dijkstra
    
    ...però malgrat això, **és la base de la majoria del software modern**! 😄
    
    POO no és perfecta, però dominar-la et permet escriure codi organitzat, mantenible i escalable.
