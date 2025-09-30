import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import '../models/prospect.dart';

class SyncService {
  // Remplace localhost par l'IP de ta machine si tu testes sur émulateur Android
  static const String apiUrl = 'http://localhost:3000/prospects';

  static Future<void> syncProspects() async {
    final box = Hive.box<Prospect>('prospects');
    final unsyncedProspects = box.values.where((p) => !p.isSynced).toList();

    for (final prospect in unsyncedProspects) {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'nom': prospect.nom,
            'prenom': prospect.prenom,
            'date_naissance': prospect.dateNaissance.toIso8601String(),
            'email': prospect.email,
            'formation_souhaitee': prospect.formation,
            'telephone': prospect.telephone,
            'ville': prospect.ville,
            'code_postal': '', // À compléter si tu as ce champ
            'niveau_etudes': prospect.niveauEtudes,
            'observations': prospect.commentaires,
            'consentement_rgpd': prospect.consentementRGPD ? 1 : 0,
          }),
        );

        if (response.statusCode == 200) {
          // Mise à jour du prospect pour indiquer qu'il est synchronisé
          final index = box.values.toList().indexOf(prospect);
          final updatedProspect = prospect.copyWith(isSynced: true);
          await box.putAt(index, updatedProspect);
          print('Prospect ${prospect.nom} synchronisé avec succès.');
        } else {
          print('Erreur API : ${response.statusCode} ${response.body}');
        }
      } catch (e) {
        print('Erreur réseau : $e');
        // En cas d'erreur réseau, on arrête la synchro pour réessayer plus tard
        break;
      }
    }
  }
}
