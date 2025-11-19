import 'dart:math';

// =============================================================================
// FUNCIONS BÀSIQUES AMB VECTORS (arrays de double)
// =============================================================================

/// Calcula la norma (magnitud) d'un vector
double calcularNorma(List<double> vector) {
  double sumaQuadrats = 0.0;
  for (int i = 0; i < vector.length; i++) {
    sumaQuadrats += vector[i] * vector[i];
  }
  return sqrt(sumaQuadrats);
}

/// Calcula el producte escalar entre dos vectors
double calcularProducteEscalar(List<double> vectorA, List<double> vectorB) {
  if (vectorA.length != vectorB.length) {
    throw ArgumentError("Els vectors han de tenir la mateixa longitud");
  }
  
  double resultat = 0.0;
  for (int i = 0; i < vectorA.length; i++) {
    resultat += vectorA[i] * vectorB[i];
  }
  return resultat;
}

/// Calcula la similaritat cosinus entre dos vectors
double calcularSimilaritatCosinus(List<double> vectorA, List<double> vectorB) {
  if (vectorA.length != vectorB.length) {
    throw ArgumentError("Els vectors han de tenir la mateixa longitud");
  }
  
  double normaA = calcularNorma(vectorA);
  double normaB = calcularNorma(vectorB);
  
  if (normaA == 0 || normaB == 0) {
    return 0.0;
  }
  
  double producteEscalar = calcularProducteEscalar(vectorA, vectorB);
  return producteEscalar / (normaA * normaB);
}

// =============================================================================
// OPERACIONS AMB MATRIUS (arrays 2D)
// =============================================================================

/// Transposa una matriu (canvia files per columnes)
List<List<double>> transposarMatriu(List<List<double>> matriu) {
  if (matriu.isEmpty) {
    return [];
  }
  
  int numFiles = matriu.length;
  int numColumnes = matriu[0].length;
  
  List<List<double>> transposada = [];
  
  for (int j = 0; j < numColumnes; j++) {
    List<double> novaFila = [];
    for (int i = 0; i < numFiles; i++) {
      novaFila.add(matriu[i][j]);
    }
    transposada.add(novaFila);
  }
  
  return transposada;
}

/// Extreu una fila d'una matriu
List<double> obtenirFila(List<List<double>> matriu, int indiceFila) {
  if (indiceFila < 0 || indiceFila >= matriu.length) {
    throw RangeError("Índex de fila fora de rang");
  }
  return List.from(matriu[indiceFila]);
}

/// Extreu una columna d'una matriu
List<double> obtenirColumna(List<List<double>> matriu, int indiceColumna) {
  if (matriu.isEmpty) {
    return [];
  }
  
  if (indiceColumna < 0 || indiceColumna >= matriu[0].length) {
    throw RangeError("Índex de columna fora de rang");
  }
  
  List<double> columna = [];
  for (int i = 0; i < matriu.length; i++) {
    columna.add(matriu[i][indiceColumna]);
  }
  return columna;
}

// =============================================================================
// SISTEMA DE RECOMANACIÓ
// =============================================================================

/// Troba els usuaris més similars a un usuari donat
/// 
/// Paràmetres:
/// - matriuUsuaris: cada fila és un usuari, cada columna una pel·lícula
/// - usuariId: índex de l'usuari de referència
/// - numResultats: nombre d'usuaris similars a retornar
/// 
/// Retorna: array amb [usuariId, similaritat] ordenat per similaritat
List<List<double>> trobarUsuarisSimilars(
  List<List<double>> matriuUsuaris, 
  int usuariId, 
  int numResultats
) {
  if (usuariId < 0 || usuariId >= matriuUsuaris.length) {
    throw RangeError("usuariId fora de rang");
  }
  
  List<List<double>> resultats = [];
  List<double> usuariReferencia = matriuUsuaris[usuariId];
  
  // Calcular similaritat amb tots els altres usuaris
  for (int altreUsuariId = 0; altreUsuariId < matriuUsuaris.length; altreUsuariId++) {
    if (altreUsuariId == usuariId) continue;
    
    List<double> usuariComparar = matriuUsuaris[altreUsuariId];
    double similaritat = calcularSimilaritatCosinus(usuariReferencia, usuariComparar);
    
    // Guardar com [usuariId, similaritat]
    resultats.add([altreUsuariId.toDouble(), similaritat]);
  }
  
  // Ordenar per similaritat (columna 1) de forma descendent
  resultats.sort((a, b) => b[1].compareTo(a[1]));
  
  // Retornar només els primers numResultats
  if (resultats.length > numResultats) {
    return resultats.sublist(0, numResultats);
  }
  return resultats;
}

/// Recomana pel·lícules a un usuari basant-se en usuaris similars
/// 
/// Retorna: array amb [pelliId, puntuacioEstimada] ordenat per puntuació
List<List<double>> recomanarPellicules(
  List<List<double>> matriuAvaluacions,
  int usuariId,
  int numRecomanacions
) {
  if (matriuAvaluacions.isEmpty) {
    return [];
  }
  
  int numPellicules = matriuAvaluacions.length;
  int numUsuaris = matriuAvaluacions[0].length;
  
  if (usuariId < 0 || usuariId >= numUsuaris) {
    throw RangeError("usuariId fora de rang");
  }
  
  // Transposar per obtenir vectors d'usuaris
  List<List<double>> matriuUsuaris = transposarMatriu(matriuAvaluacions);
  
  // Trobar usuaris similars
  List<List<double>> usuarisSimilars = trobarUsuarisSimilars(matriuUsuaris, usuariId, 5);
  
  // Calcular puntuacions per cada pel·lícula
  List<List<double>> puntuacionsPellicules = [];
  
  for (int pelliId = 0; pelliId < numPellicules; pelliId++) {
    // Si l'usuari ja ha valorat aquesta pel·lícula, saltar-la
    if (matriuAvaluacions[pelliId][usuariId] > 0) {
      continue;
    }
    
    double puntuacioTotal = 0.0;
    double pesTotal = 0.0;
    
    // Ponderar les avaluacions dels usuaris similars
    for (int i = 0; i < usuarisSimilars.length; i++) {
      int altreUsuariId = usuarisSimilars[i][0].toInt();
      double similaritat = usuarisSimilars[i][1];
      double avaluacio = matriuAvaluacions[pelliId][altreUsuariId];
      
      if (avaluacio > 0) {
        puntuacioTotal += avaluacio * similaritat;
        pesTotal += similaritat;
      }
    }
    
    if (pesTotal > 0) {
      double puntuacioEstimada = puntuacioTotal / pesTotal;
      // Guardar com [pelliId, puntuacioEstimada]
      puntuacionsPellicules.add([pelliId.toDouble(), puntuacioEstimada]);
    }
  }
  
  // Ordenar per puntuació estimada (columna 1) de forma descendent
  puntuacionsPellicules.sort((a, b) => b[1].compareTo(a[1]));
  
  // Retornar només les primeres numRecomanacions
  if (puntuacionsPellicules.length > numRecomanacions) {
    return puntuacionsPellicules.sublist(0, numRecomanacions);
  }
  return puntuacionsPellicules;
}

// =============================================================================
// DADES DE PROVA
// =============================================================================

List<List<double>> obtenirDadesPetites() {
  return [
    // User0, User1, User2, User3
    [5.0, 4.0, 1.0, 0.0], // Movie0
    [4.0, 5.0, 2.0, 1.0], // Movie1
    [1.0, 1.0, 5.0, 4.0], // Movie2
    [0.0, 2.0, 4.0, 5.0], // Movie3
    [2.0, 0.0, 3.0, 4.0], // Movie4
  ];
}

List<List<double>> obtenirDadesGrans() {
  Random rng = Random(42);
  List<List<double>> dades = [];
  
  int numUsuaris = 50;
  int numPelLicules = 100;
  
  for (int i = 0; i < numPelLicules; i++) {
    List<double> avaluacions = [];
    for (int j = 0; j < numUsuaris; j++) {
      double avaluacio = rng.nextDouble() < 0.7 ? rng.nextDouble() * 5 : 0.0;
      avaluacions.add(double.parse(avaluacio.toStringAsFixed(1)));
    }
    dades.add(avaluacions);
  }
  
  return dades;
}

// =============================================================================
// FUNCIONS D'UTILITAT PER MOSTRAR RESULTATS
// =============================================================================

void mostrarUsuarisSimilars(List<List<double>> resultats, int usuariReferencia) {
  print("🎯 Usuaris més similars a l'usuari $usuariReferencia:");
  print("=" * 50);
  
  for (int i = 0; i < resultats.length; i++) {
    int usuariId = resultats[i][0].toInt();
    double similaritat = resultats[i][1];
    String barra = "█" * (similaritat * 20).round();
    
    print("${i + 1}. Usuari $usuariId - Similaritat: ${similaritat.toStringAsFixed(4)}");
    print("   $barra");
  }
  print("");
}

void mostrarRecomanacions(List<List<double>> recomanacions, int usuariId) {
  print("🎬 Recomanacions per a l'usuari $usuariId:");
  print("=" * 50);
  
  for (int i = 0; i < recomanacions.length; i++) {
    int pelliId = recomanacions[i][0].toInt();
    double puntuacio = recomanacions[i][1];
    String estrelles = "⭐" * puntuacio.round();
    
    print("${i + 1}. Pel·lícula $pelliId - "
          "Puntuació estimada: ${puntuacio.toStringAsFixed(2)} $estrelles");
  }
  print("");
}

void mostrarMatriu(List<List<double>> matriu, String titol) {
  print(titol);
  print("-" * 40);
  for (int i = 0; i < matriu.length; i++) {
    String fila = "Fila $i: [";
    for (int j = 0; j < matriu[i].length; j++) {
      fila += matriu[i][j].toStringAsFixed(1);
      if (j < matriu[i].length - 1) fila += ", ";
    }
    fila += "]";
    print(fila);
  }
  print("");
}

void validarCalculs() {
  print("🔍 VALIDANT ELS CÀLCULS...");
  print("=" * 50);
  
  // Test 1: Vectors idèntics han de tenir similaritat 1.0
  List<double> vector1 = [1.0, 2.0, 3.0];
  List<double> vector2 = [1.0, 2.0, 3.0];
  double sim1 = calcularSimilaritatCosinus(vector1, vector2);
  print("Test 1 - Vectors idèntics: $sim1 (esperat: 1.0) ${sim1 == 1.0 ? '✅' : '❌'}");
  
  // Test 2: Vectors ortogonals han de tenir similaritat 0.0
  List<double> vector3 = [1.0, 0.0];
  List<double> vector4 = [0.0, 1.0];
  double sim2 = calcularSimilaritatCosinus(vector3, vector4);
  print("Test 2 - Vectors ortogonals: $sim2 (esperat: 0.0) ${sim2 == 0.0 ? '✅' : '❌'}");
  
  // Test 3: Vectors oposats han de tenir similaritat -1.0
  List<double> vector5 = [1.0, 0.0];
  List<double> vector6 = [-1.0, 0.0];
  double sim3 = calcularSimilaritatCosinus(vector5, vector6);
  print("Test 3 - Vectors oposats: $sim3 (esperat: -1.0) ${sim3 == -1.0 ? '✅' : '❌'}");
  
  print("");
}
