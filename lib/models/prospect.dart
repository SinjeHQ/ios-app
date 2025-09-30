import 'package:hive/hive.dart';

part 'prospect.g.dart'; // fichier généré automatiquement

@HiveType(typeId: 0)
class Prospect extends HiveObject {
  @HiveField(0)
  String nom;

  @HiveField(1)
  String prenom;

  @HiveField(2)
  DateTime dateNaissance;

  @HiveField(3)
  String email;

  @HiveField(4)
  String? telephone;

  @HiveField(5)
  String? ville;

  @HiveField(6)
  String? niveauEtudes;

  @HiveField(7)
  String formation;

  @HiveField(8)
  String? commentaires;

  @HiveField(9)
  bool consentementRGPD;

  @HiveField(10)
  bool isSynced; // Indique si le prospect est synchronisé avec l'API

  Prospect({
    required this.nom,
    required this.prenom,
    required this.dateNaissance,
    required this.email,
    this.telephone,
    this.ville,
    this.niveauEtudes,
    required this.formation,
    this.commentaires,
    required this.consentementRGPD,
    this.isSynced = false,
  });

  Prospect copyWith({
    String? nom,
    String? prenom,
    DateTime? dateNaissance,
    String? email,
    String? telephone,
    String? ville,
    String? niveauEtudes,
    String? formation,
    String? commentaires,
    bool? consentementRGPD,
    bool? isSynced,
  }) {
    return Prospect(
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      dateNaissance: dateNaissance ?? this.dateNaissance,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      ville: ville ?? this.ville,
      niveauEtudes: niveauEtudes ?? this.niveauEtudes,
      formation: formation ?? this.formation,
      commentaires: commentaires ?? this.commentaires,
      consentementRGPD: consentementRGPD ?? this.consentementRGPD,
      isSynced: isSynced ?? this.isSynced,
    );
  }
}
