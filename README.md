# UIMM Occitanie – Application de collecte de prospects

## 📌 Contexte
Application mobile Flutter développée pour les équipes de l'UIMM Occitanie afin de collecter rapidement les informations des étudiants lors de salons et événements. Les données sont stockées localement puis synchronisées automatiquement avec une base distante dès qu'une connexion Internet est disponible.

## 🎯 Objectifs
- Collecter des informations sur les prospects étudiants.
- Fonctionner hors-ligne avec stockage sécurisé.
- Synchroniser automatiquement avec la base de données centrale.
- Afficher un historique de tous les prospects avec statut de synchronisation.

## ⚙️ Fonctionnalités

### Formulaire de saisie
- Champs obligatoires : Nom, Prénom, Date de naissance, Email, Formation souhaitée.
- Champs optionnels : Téléphone, Ville, Niveau d'études, Commentaires.
- Consentement RGPD obligatoire avant soumission.
- Dropdown dynamique pour les formations récupérées via API.
- Validation des champs et feedback utilisateur après soumission.

### Stockage et synchronisation
- Stockage local via `Hive` pour fonctionnement hors-ligne.
- Transmission automatique vers une base MySQL via API PHP dès qu’une connexion est détectée.
- Affichage du statut de synchronisation dans l’historique.

### Historique
- Liste complète des prospects enregistrés.
- Chaque prospect est présenté sous forme d’élément déroulant avec son nom et prénom.
- Affichage des informations détaillées et du statut de synchronisation.

## 💻 Stack technique
- Flutter & Dart
- Hive pour stockage local
- HTTP pour API REST vers MySQL
- Connectivity_plus pour détecter la connexion Internet
- PHP & MySQL pour la base distante (via PhpMyAdmin)
- Responsive design compatible iPhone / iPad

## 📂 Arborescence du projet
```
mon_app/
│
├─ lib/
│ ├─ main.dart
│ ├─ models/
│ │ └─ prospect.dart
│ ├─ screens/
│ │ ├─ home_screen.dart
│ │ ├─ form_screen.dart
│ │ └─ history_screen.dart
│ └─ services/
│ └─ sync_service.dart
├─ assets/
│ └─ images/logo_uimm.jpg
├─ pubspec.yaml
└─ README.md
```
## 🚀 Installation
- Cloner le dépôt :  
   ```bash
   git clone <URL_DU_DEPOT>
- Installer les dépendances :

bash
Copier le code
flutter pub get
- Générer les fichiers Hive adapter :

bash
Copier le code
flutter packages pub run build_runner build --delete-conflicting-outputs
- Lancer l’application :

bash
Copier le code
flutter run
## 🔧 Déploiement
- iOS : via TestFlight ou App Store Connect.

- Android : APK ou Google Play Store (optionnel).

- API PHP : héberger sur un serveur compatible avec MySQL / PhpMyAdmin.

## 📄 Documentation technique
- Schéma de la base Hive pour le stockage local.

- API REST pour insertion et récupération des prospects : insert_prospect.php

- JSON envoyé :
```
{
  "nom": "...",
  "prenom": "...",
  "dateNaissance": "...",
  "email": "...",
  "formation": "...",
  "telephone": "...",
  "ville": "...",
  "niveauEtudes": "...",
  "commentaires": "...",
  "consentementRGPD": true
}
```
## 🎨 Design
- Thème aux couleurs de l'école.

- Logo UIMM visible sur tous les écrans.

- UI fluide, optimisée pour saisie rapide sur iPhone/iPad.

## 🛡️ Sécurité et RGPD
- Données locales chiffrées avec Hive.

- Communication avec le serveur via HTTPS uniquement.

- Consentement explicite obligatoire avant envoi.

## 📅 Planning prévisionnel
- Analyse et conception : 2 séances de 1h40

- Développement Flutter/iOS : 5 séances de 1h40

- Tests et validation : 2 séances de 1h40

- Déploiement TestFlight : 1 séance de 1h40