import 'package:test/test.dart';
import 'package:similaritat_cosinus/similaritat_cosinus.dart';

void main() {
  // =============================================================================
  // TESTS DE FUNCIONS BÀSIQUES
  // =============================================================================
  
  group('Càlcul de norma', () {
    test('Vector unitari té norma 1', () {
      List<double> vector = [1.0, 0.0, 0.0];
      expect(calcularNorma(vector), equals(1.0));
    });
    
    test('Vector [3, 4] té norma 5', () {
      List<double> vector = [3.0, 4.0];
      expect(calcularNorma(vector), equals(5.0));
    });
    
    test('Vector buit té norma 0', () {
      List<double> vector = [];
      expect(calcularNorma(vector), equals(0.0));
    });
    
    test('Vector de zeros té norma 0', () {
      List<double> vector = [0.0, 0.0, 0.0];
      expect(calcularNorma(vector), equals(0.0));
    });
    
    test('Norma és sempre positiva o zero', () {
      List<double> vector = [-3.0, -4.0];
      expect(calcularNorma(vector), equals(5.0));
    });
  });

  group('Producte escalar', () {
    test('Producte escalar bàsic', () {
      List<double> v1 = [1.0, 2.0, 3.0];
      List<double> v2 = [4.0, 5.0, 6.0];
      // 1*4 + 2*5 + 3*6 = 4 + 10 + 18 = 32
      expect(calcularProducteEscalar(v1, v2), equals(32.0));
    });
    
    test('Producte escalar de vectors ortogonals és 0', () {
      List<double> v1 = [1.0, 0.0];
      List<double> v2 = [0.0, 1.0];
      expect(calcularProducteEscalar(v1, v2), equals(0.0));
    });
    
    test('Error si vectors de longitud diferent', () {
      List<double> v1 = [1.0, 2.0];
      List<double> v2 = [1.0, 2.0, 3.0];
      expect(
        () => calcularProducteEscalar(v1, v2),
        throwsA(isA<ArgumentError>())
      );
    });
    
    test('Producte escalar és commutatiu', () {
      List<double> v1 = [2.0, 3.0, 4.0];
      List<double> v2 = [5.0, 6.0, 7.0];
      expect(
        calcularProducteEscalar(v1, v2),
        equals(calcularProducteEscalar(v2, v1))
      );
    });
  });

  group('Similaritat cosinus', () {
    test('Vectors idèntics tenen similaritat 1.0', () {
      List<double> v1 = [1.0, 2.0, 3.0];
      List<double> v2 = [1.0, 2.0, 3.0];
      expect(calcularSimilaritatCosinus(v1, v2), equals(1.0));
    });
    
    test('Vectors proporcionals tenen similaritat 1.0', () {
      List<double> v1 = [1.0, 2.0, 3.0];
      List<double> v2 = [2.0, 4.0, 6.0];
      expect(calcularSimilaritatCosinus(v1, v2), closeTo(1.0, 0.0001));
    });
    
    test('Vectors ortogonals tenen similaritat 0.0', () {
      List<double> v1 = [1.0, 0.0];
      List<double> v2 = [0.0, 1.0];
      expect(calcularSimilaritatCosinus(v1, v2), equals(0.0));
    });
    
    test('Vectors oposats tenen similaritat -1.0', () {
      List<double> v1 = [1.0, 0.0];
      List<double> v2 = [-1.0, 0.0];
      expect(calcularSimilaritatCosinus(v1, v2), equals(-1.0));
    });
    
    test('Vector zero retorna 0', () {
      List<double> v1 = [0.0, 0.0];
      List<double> v2 = [1.0, 2.0];
      expect(calcularSimilaritatCosinus(v1, v2), equals(0.0));
    });
    
    test('Similaritat està entre -1 i 1', () {
      List<double> v1 = [2.5, 3.7, 1.2];
      List<double> v2 = [4.1, 0.8, 5.3];
      double sim = calcularSimilaritatCosinus(v1, v2);
      expect(sim, greaterThanOrEqualTo(-1.0));
      expect(sim, lessThanOrEqualTo(1.0));
    });
    
    test('Similaritat és simètrica', () {
      List<double> v1 = [1.5, 2.3, 4.1];
      List<double> v2 = [3.2, 1.7, 2.8];
      expect(
        calcularSimilaritatCosinus(v1, v2),
        equals(calcularSimilaritatCosinus(v2, v1))
      );
    });
    
    test('Error si vectors de longitud diferent', () {
      List<double> v1 = [1.0, 2.0];
      List<double> v2 = [1.0, 2.0, 3.0];
      expect(
        () => calcularSimilaritatCosinus(v1, v2),
        throwsA(isA<ArgumentError>())
      );
    });
  });

  // =============================================================================
  // TESTS D'OPERACIONS AMB MATRIUS
  // =============================================================================
  
  group('Transposició de matriu', () {
    test('Matriu 2x3 es transposa a 3x2', () {
      List<List<double>> matriu = [
        [1.0, 2.0, 3.0],
        [4.0, 5.0, 6.0],
      ];
      
      List<List<double>> transposada = transposarMatriu(matriu);
      
      expect(transposada.length, equals(3));
      expect(transposada[0].length, equals(2));
      expect(transposada[0], equals([1.0, 4.0]));
      expect(transposada[1], equals([2.0, 5.0]));
      expect(transposada[2], equals([3.0, 6.0]));
    });
    
    test('Matriu buida retorna matriu buida', () {
      List<List<double>> matriu = [];
      expect(transposarMatriu(matriu), isEmpty);
    });
    
    test('Doble transposició retorna la matriu original', () {
      List<List<double>> matriu = [
        [1.0, 2.0],
        [3.0, 4.0],
        [5.0, 6.0],
      ];
      
      List<List<double>> dobleTransposada = 
          transposarMatriu(transposarMatriu(matriu));
      
      expect(dobleTransposada, equals(matriu));
    });
    
    test('Matriu quadrada es transposa correctament', () {
      List<List<double>> matriu = [
        [1.0, 2.0],
        [3.0, 4.0],
      ];
      
      List<List<double>> transposada = transposarMatriu(matriu);
      
      expect(transposada, equals([
        [1.0, 3.0],
        [2.0, 4.0],
      ]));
    });
  });

  group('Obtenir fila i columna', () {
    late List<List<double>> matriu;
    
    setUp(() {
      matriu = [
        [1.0, 2.0, 3.0],
        [4.0, 5.0, 6.0],
        [7.0, 8.0, 9.0],
      ];
    });
    
    test('Obtenir fila correctament', () {
      expect(obtenirFila(matriu, 0), equals([1.0, 2.0, 3.0]));
      expect(obtenirFila(matriu, 1), equals([4.0, 5.0, 6.0]));
      expect(obtenirFila(matriu, 2), equals([7.0, 8.0, 9.0]));
    });
    
    test('Obtenir columna correctament', () {
      expect(obtenirColumna(matriu, 0), equals([1.0, 4.0, 7.0]));
      expect(obtenirColumna(matriu, 1), equals([2.0, 5.0, 8.0]));
      expect(obtenirColumna(matriu, 2), equals([3.0, 6.0, 9.0]));
    });
    
    test('Error si índex de fila fora de rang', () {
      expect(() => obtenirFila(matriu, -1), throwsA(isA<RangeError>()));
      expect(() => obtenirFila(matriu, 3), throwsA(isA<RangeError>()));
    });
    
    test('Error si índex de columna fora de rang', () {
      expect(() => obtenirColumna(matriu, -1), throwsA(isA<RangeError>()));
      expect(() => obtenirColumna(matriu, 3), throwsA(isA<RangeError>()));
    });
  });

  // =============================================================================
  // TESTS DEL SISTEMA DE RECOMANACIÓ
  // =============================================================================
  
  group('Trobar usuaris similars', () {
    late List<List<double>> dadesTest;
    late List<List<double>> usuarisTest;
    
    setUp(() {
      dadesTest = [
        [5.0, 4.0, 1.0, 0.0], // Movie0
        [4.0, 5.0, 2.0, 1.0], // Movie1
        [1.0, 1.0, 5.0, 4.0], // Movie2
        [0.0, 2.0, 4.0, 5.0], // Movie3
        [2.0, 0.0, 3.0, 4.0], // Movie4
      ];
      usuarisTest = transposarMatriu(dadesTest);
    });
    
    test('Troba usuaris similars correctament', () {
      List<List<double>> resultats = trobarUsuarisSimilars(usuarisTest, 0, 2);
      
      expect(resultats.length, equals(2));
      expect(resultats[0].length, equals(2));  // [usuariId, similaritat]
      
      // Primer element és usuariId (com a double)
      expect(resultats[0][0], isA<double>());
      // Segon element és similaritat
      expect(resultats[0][1], isA<double>());
      
      // Els resultats han d'estar ordenats per similaritat descendent
      if (resultats.length > 1) {
        expect(resultats[0][1], greaterThanOrEqualTo(resultats[1][1]));
      }
    });
    
    test('No inclou el propi usuari als resultats', () {
      int usuariId = 1;
      List<List<double>> resultats = trobarUsuarisSimilars(usuarisTest, usuariId, 5);
      
      for (var resultat in resultats) {
        int idResultat = resultat[0].toInt();
        expect(idResultat, isNot(equals(usuariId)));
      }
    });
    
    test('Error si usuariId fora de rang', () {
      expect(
        () => trobarUsuarisSimilars(usuarisTest, 10, 3),
        throwsA(isA<RangeError>())
      );
      
      expect(
        () => trobarUsuarisSimilars(usuarisTest, -1, 3),
        throwsA(isA<RangeError>())
      );
    });
    
    test('Retorna menys resultats si no hi ha prou usuaris', () {
      List<List<double>> resultats = trobarUsuarisSimilars(usuarisTest, 0, 100);
      
      // Només hi ha 3 altres usuaris (4 total - 1)
      expect(resultats.length, equals(3));
    });
    
    test('Les similaritats estan entre -1 i 1', () {
      List<List<double>> resultats = trobarUsuarisSimilars(usuarisTest, 0, 3);
      
      for (var resultat in resultats) {
        double similaritat = resultat[1];
        expect(similaritat, greaterThanOrEqualTo(-1.0));
        expect(similaritat, lessThanOrEqualTo(1.0));
      }
    });
  });

  group('Recomanar pel·lícules', () {
    late List<List<double>> dadesTest;
    
    setUp(() {
      dadesTest = [
        [5.0, 4.0, 1.0, 0.0], // Movie0
        [4.0, 5.0, 2.0, 1.0], // Movie1
        [1.0, 1.0, 5.0, 4.0], // Movie2
        [0.0, 2.0, 4.0, 5.0], // Movie3
        [2.0, 0.0, 3.0, 4.0], // Movie4
      ];
    });
    
    test('Recomana pel·lícules correctament', () {
      List<List<double>> recomanacions = recomanarPellicules(dadesTest, 0, 3);
      
      expect(recomanacions, isA<List<List<double>>>());
      
      // Cada recomanació és [pelliId, puntuacio]
      for (var rec in recomanacions) {
        expect(rec.length, equals(2));
        expect(rec[0], isA<double>());  // pelliId
        expect(rec[1], isA<double>());  // puntuacio
      }
    });
    
    test('No recomana pel·lícules ja valorades', () {
      int usuariId = 0;
      List<List<double>> recomanacions = recomanarPellicules(dadesTest, usuariId, 10);
      
      for (var rec in recomanacions) {
        int pelliId = rec[0].toInt();
        // L'usuari no hauria d'haver valorat aquesta pel·lícula
        expect(dadesTest[pelliId][usuariId], equals(0.0));
      }
    });
    
    test('Les recomanacions estan ordenades per puntuació', () {
      List<List<double>> recomanacions = recomanarPellicules(dadesTest, 0, 5);
      
      for (int i = 0; i < recomanacions.length - 1; i++) {
        expect(
          recomanacions[i][1],
          greaterThanOrEqualTo(recomanacions[i + 1][1])
        );
      }
    });
    
    test('Error si usuariId fora de rang', () {
      expect(
        () => recomanarPellicules(dadesTest, 10, 3),
        throwsA(isA<RangeError>())
      );
    });
    
    test('Retorna array buit per matriu buida', () {
      List<List<double>> matriuBuida = [];
      List<List<double>> recomanacions = recomanarPellicules(matriuBuida, 0, 3);
      expect(recomanacions, isEmpty);
    });
  });

  // =============================================================================
  // TESTS D'INTEGRACIÓ
  // =============================================================================
  
  group('Sistema complet', () {
    test('Workflow complet: dades -> usuaris similars -> recomanacions', () {
      // 1. Obtenir dades
      List<List<double>> dades = obtenirDadesPetites();
      expect(dades, isNotEmpty);
      
      // 2. Transposar
      List<List<double>> usuaris = transposarMatriu(dades);
      expect(usuaris.length, equals(dades[0].length));
      
      // 3. Trobar usuaris similars
      List<List<double>> similars = trobarUsuarisSimilars(usuaris, 0, 3);
      expect(similars, isNotEmpty);
      
      // 4. Recomanar pel·lícules
      List<List<double>> recomanacions = recomanarPellicules(dades, 0, 3);
      // Pot estar buit si l'usuari ha valorat tot
      expect(recomanacions, isA<List<List<double>>>());
    });
  });

  // =============================================================================
  // TESTS DE RENDIMENT
  // =============================================================================
  
  group('Rendiment', () {
    test('Càlcul amb vectors grans és eficient', () {
      List<double> vectorGran1 = List.generate(1000, (i) => i.toDouble());
      List<double> vectorGran2 = List.generate(1000, (i) => (1000 - i).toDouble());
      
      DateTime inici = DateTime.now();
      calcularSimilaritatCosinus(vectorGran1, vectorGran2);
      DateTime fi = DateTime.now();
      
      Duration durada = fi.difference(inici);
      
      // Ha de completar-se en menys d'1 segon
      expect(durada.inMilliseconds, lessThan(1000));
    }, timeout: Timeout(Duration(seconds: 2)));
    
    test('Trobar usuaris similars amb molts usuaris', () {
      List<List<double>> dadesGrans = obtenirDadesGrans();
      List<List<double>> usuarisGrans = transposarMatriu(dadesGrans);
      
      DateTime inici = DateTime.now();
      trobarUsuarisSimilars(usuarisGrans, 0, 5);
      DateTime fi = DateTime.now();
      
      Duration durada = fi.difference(inici);
      
      // Ha de completar-se en menys de 5 segons
      expect(durada.inMilliseconds, lessThan(5000));
    }, timeout: Timeout(Duration(seconds: 10)));
  });
}
