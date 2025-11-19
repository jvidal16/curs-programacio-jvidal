import 'package:similaritat_cosinus/similaritat_cosinus.dart';
import 'dart:math';

void main() {
  print("🎬 PRÀCTICA: SISTEMA DE RECOMANACIÓ AMB SIMILARITAT COSINUS");
  print("=" * 60);
  print("");
  
  // Fase 1: Validar els càlculs
  validarCalculs();
  
  // Fase 2: Prova amb dades petites
  print("📊 PROVA AMB DADES PETITES");
  print("=" * 40);
  
  List<List<double>> dadesPetites = obtenirDadesPetites();
  List<List<double>> usuarisPetits = transposarMatriu(dadesPetites);
  
  mostrarMatriu(dadesPetites, "Matriu d'avaluacions (5 pel·lícules × 4 usuaris):");
  
  print("Vectors d'usuaris (transposada):");
  for (int i = 0; i < usuarisPetits.length; i++) {
    print("Usuari $i: ${usuarisPetits[i]}");
  }
  print("");
  
  // Trobar usuaris similars per cada usuari
  for (int usuariId = 0; usuariId < usuarisPetits.length; usuariId++) {
    List<List<double>> resultats = trobarUsuarisSimilars(usuarisPetits, usuariId, 3);
    mostrarUsuarisSimilars(resultats, usuariId);
  }
  
  // Provar recomanacions
  print("🎯 RECOMANACIONS DE PEL·LÍCULES");
  print("=" * 40);
  for (int usuariId = 0; usuariId < usuarisPetits.length; usuariId++) {
    List<List<double>> recomanacions = recomanarPellicules(dadesPetites, usuariId, 3);
    if (recomanacions.isNotEmpty) {
      mostrarRecomanacions(recomanacions, usuariId);
    } else {
      print("L'usuari $usuariId ja ha valorat totes les pel·lícules!");
      print("");
    }
  }
  
  // Fase 3: Prova amb dades grans
  print("🚀 PROVA AMB DADES GRANS");
  print("=" * 40);
  
  List<List<double>> dadesGrans = obtenirDadesGrans();
  List<List<double>> usuarisGrans = transposarMatriu(dadesGrans);
  
  print("Dades generades: ${dadesGrans.length} pel·lícules × ${usuarisGrans.length} usuaris");
  print("");
  
  // Provar amb alguns usuaris de mostra
  List<int> usuarisProva = [0, 5, 12, 23];
  
  for (int usuariId in usuarisProva) {
    DateTime inici = DateTime.now();
    
    List<List<double>> resultats = trobarUsuarisSimilars(usuarisGrans, usuariId, 5);
    
    DateTime fi = DateTime.now();
    Duration durada = fi.difference(inici);
    
    print("⏱️  Temps de càlcul per usuari $usuariId: ${durada.inMilliseconds}ms");
    mostrarUsuarisSimilars(resultats, usuariId);
  }
  
  // Fase 4: Anàlisi de rendiment
  print("📈 ANÀLISI DE RENDIMENT");
  print("=" * 40);
  
  DateTime iniciTotal = DateTime.now();
  int totalUsuaris = usuarisGrans.length;
  int usuarisProcessats = 0;
  
  for (int i = 0; i < min(10, totalUsuaris); i++) {
    trobarUsuarisSimilars(usuarisGrans, i, 3);
    usuarisProcessats++;
  }
  
  DateTime fiTotal = DateTime.now();
  Duration duradaTotal = fiTotal.difference(iniciTotal);
  
  double tempsPerUsuari = duradaTotal.inMilliseconds / usuarisProcessats;
  
  print("Usuaris processats: $usuarisProcessats");
  print("Temps total: ${duradaTotal.inMilliseconds}ms");
  print("Temps per usuari: ${tempsPerUsuari.toStringAsFixed(2)}ms");
  print("");
  
  print("🎉 PRÀCTICA COMPLETADA AMB ÈXIT!");
}
