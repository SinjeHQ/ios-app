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
