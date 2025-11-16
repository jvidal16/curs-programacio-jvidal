# 🎓 Guió Progressiu: Conceptes Fonamentals de POO

## 📌 Visió General del Curs

**Objectiu:** Dominar els 4 pilars de la POO i conceptes avançats utilitzant exemples pràctics progressius.

**Estratègia pedagògica:** 
- Començar amb codi procedural → identificar problemes → refactoritzar a POO
- Cada concepte es construeix sobre l'anterior
- Exemples del món real amb validacions i casos pràctics

---

## 🗺️ Mapa del Curs

```
FASE 1: Fonaments
    └─ Classes i Objectes
    └─ Encapsulació

FASE 2: Reutilització
    └─ Herència
    └─ Polimorfisme

FASE 3: Disseny Avançat
    └─ Abstracció
    └─ Interfícies
    └─ Composició vs Herència

FASE 4: Conceptes Complementaris
    └─ Relacions entre classes
    └─ Patrons bàsics
```

---

## 📚 FASE 1: Fonaments de POO

### Lliçó 1: Classes i Objectes + Encapsulació
**✅ JA DESENVOLUPADA** (Fitness Tracking)

**Conceptes coberts:**
- Variables globals vs propietats d'instància
- Constructor i validació
- Getters i propietats privades
- Mètodes d'instància
- Múltiples objectes d'una mateixa classe

**Exercici final:** Sistema de fitness tracking complet

---

## 📚 FASE 2: Herència i Polimorfisme

### Lliçó 2: Herència - Especialització de Classes

**🎯 Objectiu:** Evitar duplicació de codi creant jerarquies de classes

#### Progressió:

**2.1. Problema amb codi duplicat**
```
Context: Sistema de biblioteca
- Llibres, Revistes, DVDs tenen propietats comunes
- Codi repetit: títol, autor/director, any, disponibilitat
```

**2.2. Conceptes a introduir:**
- Classe base (superclasse/pare) vs classe derivada (subclasse/filla)
- Paraula clau `extends`
- Constructor de la classe pare: `super()`
- Sobreescriptura de mètodes: `@override`
- Tipus de relació: "és un" (is-a)

**2.3. Exemple pràctic:**
```dart
Classe base: MediaItem
  ├─ Classe derivada: Book
  ├─ Classe derivada: Magazine
  └─ Classe derivada: DVD
```

**2.4. Conceptes clau:**
- Propietats heretades
- Mètodes heretats
- Propietats específiques de cada subclasse
- Accés a membres `protected` (si aplica)
- Ordre de crida dels constructors

**Exercici:** Ampliar amb més tipus de media (AudioBook, EBook, etc.)

---

### Lliçó 3: Polimorfisme - Múltiples Formes

**🎯 Objectiu:** Tractar objectes de diferents classes de manera uniforme

#### Progressió:

**3.1. Motivació:**
```
Problema: Calcular preu de lloguer diferent per cada tipus de media
- Els llibres es lloguen per dies
- Les revistes tenen preu fix
- Els DVDs tenen tarifa per dies + recàrrec
```

**3.2. Conceptes a introduir:**
- Mètodes polimòrfics (mateix nom, diferent implementació)
- Sobreescriptura vs sobrecàrrega
- Tipus en temps de compilació vs temps d'execució
- Crida dinàmica de mètodes (dynamic dispatch)

**3.3. Exemple pràctic:**
```dart
List<MediaItem> inventory = [];
// Afegir Books, Magazines, DVDs
// Cridar calculateRentalPrice() per cada un
// → cada objecte executa la seva pròpia versió
```

**3.4. Demostracions:**
- Llistes heterogènies (diferents tipus, mateixa base)
- Tractar tots els objectes de manera uniforme
- Comportament específic per tipus

**Exercici:** Afegir mètode `getDescription()` polimòrfic per cada tipus

---

## 📚 FASE 3: Abstracció i Interfícies

### Lliçó 4: Classes Abstractes - Plantilles Obligatòries

**🎯 Objectiu:** Definir contractes que les subclasses han de complir

#### Progressió:

**4.1. Problema:**
```
Context: Sistema de pagaments
- Diferents mètodes: targeta, PayPal, transferència, criptomoneda
- Tots han de tenir: processPayment(), validatePayment()
- Però cada un ho fa diferent
```

**4.2. Conceptes a introduir:**
- Classe abstracta: `abstract class`
- Mètodes abstractes (sense implementació)
- Mètodes concrets (amb implementació compartida)
- No es poden instanciar classes abstractes
- Obligació de implementar mètodes abstractes

**4.3. Exemple pràctic:**
```dart
abstract class PaymentMethod
  ├─ CreditCardPayment
  ├─ PayPalPayment
  ├─ BankTransferPayment
  └─ CryptoPayment
```

**4.4. Comparació:**
- Herència normal vs classe abstracta
- Quan utilitzar cadascuna
- Mètodes concrets compartits

**Exercici:** Sistema de notificacions (Email, SMS, Push) amb classe abstracta

---

### Lliçó 5: Interfícies - Contractes Purs

**🎯 Objectiu:** Definir capacitats que classes no relacionades poden compartir

#### Progressió:

**5.1. Problema:**
```
Context: Sistema multimedial
- Alguns items es poden reproduir (Playable): DVD, AudioBook
- Alguns es poden descarregar (Downloadable): EBook, AudioBook
- Alguns es poden compartir (Shareable): tots
- Un AudioBook és Playable I Downloadable
```

**5.2. Conceptes a introduir:**
- Interfície: contracte pur (només signatures)
- Paraula clau `implements`
- Múltiples interfícies (vs herència simple)
- Tipus de relació: "pot fer" (can-do)
- Diferència entre `extends` i `implements`

**5.3. Exemple pràctic:**
```dart
interface Playable {
  void play();
  void pause();
  void stop();
}

interface Downloadable {
  void download();
  double getFileSize();
}

class AudioBook extends MediaItem 
    implements Playable, Downloadable {
  // Ha d'implementar tots els mètodes
}
```

**5.4. Conceptes clau:**
- Una classe pot implementar múltiples interfícies
- Interfícies com a "capacitats" o "rols"
- Polimorfisme amb interfícies
- Segregació d'interfícies (no fer interfícies massa grans)

**Exercici:** Sistema de vehicles (Drivable, Flyable, Floatable)

---

### Lliçó 6: Composició vs Herència

**🎯 Objectiu:** Saber quan utilitzar herència i quan composició

#### Progressió:

**6.1. Problema amb herència excessiva:**
```
Context: Personatges de videojoc
Problema de "diamond problem" o jerarquies rígides:

Character
├─ Warrior (pot atacar)
├─ Mage (pot fer màgia)
└─ Healer (pot curar)

Però què passa si vols un WarriorMage? 🤔
```

**6.2. Solució amb composició:**
```dart
class Character {
  AttackBehavior? attackBehavior;
  MagicBehavior? magicBehavior;
  HealingBehavior? healingBehavior;
}

// Combinar comportaments a voluntat
```

**6.3. Conceptes a introduir:**
- "Favor composition over inheritance"
- "Has-a" vs "Is-a"
- Flexibilitat de la composició
- Strategy Pattern (introducció bàsica)

**6.4. Comparació:**
```
Herència:
  ✅ Relació "és un"
  ✅ Compartir implementació
  ❌ Jerarquies rígides
  ❌ No es pot canviar en runtime

Composició:
  ✅ Flexibilitat màxima
  ✅ Canviar comportament en runtime
  ✅ Evitar jerarquies complexes
  ❌ Més objectes i referències
```

**Exercici:** Sistema d'armes intercambiables per personatges

---

## 📚 FASE 4: Conceptes Complementaris

### Lliçó 7: Relacions entre Classes

**🎯 Objectiu:** Entendre com les classes interactuen

#### Conceptes:

**7.1. Tipus de relacions:**

**Associació** (uses-a)
```dart
class Professor {
  void teach(Student student) { }
}
```

**Agregació** (has-a, vida independent)
```dart
class Team {
  List<Player> players; // Els players existeixen sense el team
}
```

**Composició** (owns-a, vida dependent)
```dart
class Car {
  Engine engine; // L'engine no existeix sense el car
}
```

**Dependència** (usa temporalment)
```dart
class OrderProcessor {
  void process(Order order, PaymentService payment) { }
}
```

**7.2. Exemple integrador:**
```
Context: Sistema universitari
- University HAS Departments (agregació)
- Department HAS Courses (composició)
- Professor TEACHES Students (associació)
- Course REQUIRES TextBook (dependència)
```

**Exercici:** Modelar un sistema d'hospital amb aquestes relacions

---

### Lliçó 8: Principis SOLID (Introducció Bàsica)

**🎯 Objectiu:** Escriure codi POO mantenible i escalable

#### Conceptes bàsics:

**S - Single Responsibility Principle**
- Una classe = una responsabilitat
- Exemple: Separar validació de persistència

**O - Open/Closed Principle**
- Obert per extensió, tancat per modificació
- Exemple: Usar herència/interfícies en lloc de modificar codi existent

**L - Liskov Substitution Principle**
- Les subclasses han de poder substituir la classe base
- Exemple: Rectangle vs Square problem

**I - Interface Segregation Principle**
- Interfícies petites i específiques
- Exemple: Millor tenir Printable, Scannable que AllInOnePrinter

**D - Dependency Inversion Principle**
- Dependre d'abstraccions, no de concrecions
- Exemple: Usar interfícies en lloc de classes concretes

**Exercici:** Refactoritzar codi existent aplicant SOLID

---

### Lliçó 9: Patrons de Disseny Bàsics

**🎯 Objectiu:** Solucions reutilitzables a problemes comuns

#### Patrons a introduir:

**9.1. Singleton**
- Una única instància
- Exemple: Configuració global, Database connection

**9.2. Factory**
- Crear objectes sense especificar la classe exacta
- Exemple: ShapeFactory crea Circle, Square, Triangle

**9.3. Strategy**
- Algoritmes intercanviables
- Exemple: Diferents algoritmes d'ordenació

**9.4. Observer**
- Notificar canvis a múltiples objectes
- Exemple: Sistema d'esdeveniments, UI reactiva

**Exercici:** Implementar un sistema amb 2-3 patrons combinats

---

### Lliçó 10: Millors Pràctiques i Convencions

**🎯 Objectiu:** Escriure codi POO professional

#### Conceptes:

**10.1. Nomenclatura:**
- Classes: PascalCase (`UserAccount`)
- Mètodes/propietats: camelCase (`getUserName()`)
- Constants: UPPER_CASE (`MAX_USERS`)
- Privades: prefix `_` (`_internalData`)

**10.2. Organització:**
- Propietats → Constructor → Getters/Setters → Mètodes públics → Mètodes privats
- Agrupar funcionalitat relacionada

**10.3. Documentació:**
- Comentaris de classe i mètodes públics
- Exemples d'ús
- Paràmetres i retorn

**10.4. Testing:**
- Tests unitaris per cada classe
- Mock objects per dependències
- Test de casos límit

**Exercici:** Code review d'un projecte complet aplicant bones pràctiques

---

## 🎯 Projecte Final Integrador

### E-Commerce System

**Objectiu:** Aplicar TOTS els conceptes apresos

**Requisits:**

1. **Herència:**
   - Product (base) → PhysicalProduct, DigitalProduct, Service

2. **Polimorfisme:**
   - Càlcul de preu diferent per tipus
   - Càlcul d'enviament diferent

3. **Interfícies:**
   - Purchasable, Reviewable, Returnable

4. **Composició:**
   - ShoppingCart conté CartItems
   - Order conté OrderItems

5. **Abstracció:**
   - PaymentProcessor (abstracta)
   - ShippingMethod (abstracta)

6. **Relacions:**
   - Customer-Order (associació)
   - Order-OrderItem (composició)
   - Product-Inventory (agregació)

7. **Patrons:**
   - Factory: ProductFactory
   - Singleton: CartManager
   - Observer: OrderStatusNotifier

**Funcionalitats:**
- Afegir/eliminar productes del carret
- Processar comandes
- Aplicar descomptes
- Gestionar inventari
- Sistema de reviews
- Historial de comandes
- Múltiples mètodes de pagament i enviament

---

## 📊 Avaluació Progressiva

### Per cada lliçó:

**Teoria (30%):**
- Explicar conceptes amb paraules pròpies
- Dibuixar diagrames de classes
- Comparar alternatives

**Pràctica (50%):**
- Implementar exercicis progressius
- Refactoritzar codi existent
- Debug i resolució de problemes

**Projecte (20%):**
- Mini-projecte aplicant els conceptes
- Code review entre companys

---

## 🔄 Metodologia d'Ensenyament

### Per cada concepte nou:

1. **Motivació** (10 min)
   - Problema del món real
   - Limitacions de l'approach anterior

2. **Concepte teòric** (15 min)
   - Definició
   - Sintaxi
   - Diagrames

3. **Exemple guiat** (20 min)
   - Live coding
   - Explicació pas a pas

4. **Pràctica individual** (30 min)
   - Exercicis progressius
   - Suport personalitzat

5. **Review col·lectiva** (15 min)
   - Comparar solucions
   - Identificar millores

6. **Consolidació** (10 min)
   - Resum conceptes clau
   - Relació amb lliçons anteriors

---

## 📅 Distribució Temporal Suggerida

**Curs intensiu (6-7 setmanes):**

| Setmana | Contingut | Hores |
|---------|-----------|-------|
| 1 | Classes, Objectes, Encapsulació | 8h |
| 2 | Herència | 6h |
| 3 | Polimorfisme + Revisió | 6h |
| 4 | Classes Abstractes + Interfícies | 8h |
| 5 | Composició + Relacions | 6h |
| 6 | SOLID + Patrons bàsics | 8h |
| 7 | Projecte Final | 10h |

**Total:** ~52 hores

---

## 🛠️ Recursos i Materials

### Per cada lliçó:

- **Document teòric** (Markdown per MkDocs)
- **Codi d'exemple** complet i comentat
- **Exercicis** amb solucions progressives
- **Diagrames** UML de classes
- **Tests** unitaris d'exemple
- **Checklist** d'autoavaluació

### Recursos generals:

- Repositori de codi
- Glossari de termes
- Cheat sheets
- Col·lecció de patrons
- Referències externes

---

## ✅ Checklist de Conceptes Coberts

**Fonamentals:**
- [ ] Classes i objectes
- [ ] Encapsulació
- [ ] Herència
- [ ] Polimorfisme
- [ ] Abstracció

**Avançats:**
- [ ] Classes abstractes
- [ ] Interfícies
- [ ] Composició vs herència
- [ ] Relacions entre classes

**Complementaris:**
- [ ] Principis SOLID
- [ ] Patrons de disseny
- [ ] Millors pràctiques
- [ ] Testing de POO

---

## 🎓 Resultat Esperat

A final del curs, l'estudiant serà capaç de:

✅ Dissenyar jerarquies de classes coherents
✅ Aplicar herència i polimorfisme adequadament
✅ Utilitzar interfícies per definir contractes
✅ Escollir entre composició i herència
✅ Identificar i aplicar patrons bàsics
✅ Escriure codi POO mantenible i escalable
✅ Refactoritzar codi procedural a POO
✅ Documentar i testejar classes correctament

---

## 📌 Notes Finals

**Èmfasi en:**
- Progressió gradual (no fer salts conceptuals)
- Exemples del món real sempre
- Comparar "abans" vs "després"
- Validacions i gestió d'errors
- Bones pràctiques des del principi

**Evitar:**
- Sobrecàrrega de teoria sense pràctica
- Exemples massa abstractes o acadèmics
- Introducir massa patrons avançats
- Saltar conceptes fonamentals

**Clau de l'èxit:**
- Cada concepte nou resol un problema concret
- Sempre mostrar el "per què" abans del "com"
- Exercicis progressius amb feedback immediat
- Projectes realistes i motivadors
