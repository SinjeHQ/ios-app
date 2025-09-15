<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>README - UIMM Occitanie Prospects App</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; margin: 20px; color: #333; }
        h1, h2, h3 { color: #0056b3; }
        code { background-color: #f4f4f4; padding: 2px 5px; border-radius: 4px; }
        pre { background-color: #f4f4f4; padding: 10px; border-radius: 5px; overflow-x: auto; }
        ul { margin-left: 20px; }
        li { margin-bottom: 8px; }
        a { color: #0056b3; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>UIMM Occitanie – Application de collecte de prospects</h1>

    <h2>📌 Contexte</h2>
    <p>Application mobile Flutter développée pour les équipes de l'UIMM Occitanie afin de collecter rapidement les informations des étudiants lors de salons et événements. Les données sont stockées localement puis synchronisées automatiquement avec une base distante dès qu'une connexion Internet est disponible.</p>

    <h2>🎯 Objectifs</h2>
    <ul>
        <li>Collecter des informations sur les prospects étudiants.</li>
        <li>Fonctionner hors-ligne avec stockage sécurisé.</li>
        <li>Synchroniser automatiquement avec la base de données centrale.</li>
        <li>Afficher un historique de tous les prospects avec statut de synchronisation.</li>
    </ul>

    <h2>⚙️ Fonctionnalités</h2>
    <h3>Formulaire de saisie</h3>
    <ul>
        <li>Champs obligatoires : Nom, Prénom, Date de naissance, Email, Formation souhaitée.</li>
        <li>Champs optionnels : Téléphone, Ville, Niveau d'études, Commentaires.</li>
        <li>Consentement RGPD obligatoire avant soumission.</li>
        <li>Dropdown dynamique pour les formations récupérées via API.</li>
        <li>Validation des champs et feedback utilisateur après soumission.</li>
    </ul>

    <h3>Stockage et synchronisation</h3>
    <ul>
        <li>Stockage local via <code>Hive</code> pour fonctionnement hors-ligne.</li>
        <li>Transmission automatique vers une base MySQL via API PHP dès qu’une connexion est détectée.</li>
        <li>Affichage du statut de synchronisation dans l’historique.</li>
    </ul>

    <h3>Historique</h3>
    <ul>
        <li>Liste complète des prospects enregistrés.</li>
        <li>Chaque prospect est présenté sous forme d’élément déroulant avec son nom et prénom.</li>
        <li>Affichage des informations détaillées et du statut de synchronisation.</li>
    </ul>

    <h2>💻 Stack technique</h2>
    <ul>
        <li>Flutter & Dart</li>
        <li>Hive pour stockage local</li>
        <li>HTTP pour API REST vers MySQL</li>
        <li>Connectivity_plus pour détecter la connexion Internet</li>
        <li>PHP & MySQL pour la base distante (via PhpMyAdmin)</li>
        <li>Responsive design compatible iPhone / iPad</li>
    </ul>

    <h2>📂 Arborescence du projet</h2>
    <pre>
mon_app/
│
├─ lib/
│   ├─ main.dart
│   ├─ models/
│   │   └─ prospect.dart
│   ├─ screens/
│   │   ├─ home_screen.dart
│   │   ├─ form_screen.dart
│   │   └─ history_screen.dart
│   └─ services/
│       └─ sync_service.dart
├─ assets/
│   └─ images/logo_uimm.jpg
├─ pubspec.yaml
└─ README.md
    </pre>

    <h2>🚀 Installation</h2>
    <ol>
        <li>Cloner le dépôt : <code>git clone &lt;URL_DU_DEPOT&gt;</code></li>
        <li>Installer les dépendances : <code>flutter pub get</code></li>
        <li>Générer les fichiers Hive adapter : <code>flutter packages pub run build_runner build --delete-conflicting-outputs</code></li>
        <li>Lancer l’application : <code>flutter run</code></li>
    </ol>

    <h2>🔧 Déploiement</h2>
    <ul>
        <li>iOS : via TestFlight ou App Store Connect.</li>
        <li>Android : APK ou Google Play Store (optionnel).</li>
        <li>API PHP : héberger sur un serveur compatible avec MySQL / PhpMyAdmin.</li>
    </ul>

    <h2>📄 Documentation technique</h2>
    <ul>
        <li>Schéma de la base Hive pour le stockage local.</li>
        <li>API REST pour insertion et récupération des prospects : <code>insert_prospect.php</code></li>
        <li>JSON envoyé : <code>{"nom": "...", "prenom": "...", ...}</code></li>
    </ul>

    <h2>🎨 Design</h2>
    <ul>
        <li>Thème aux couleurs de l'école.</li>
        <li>Logo UIMM visible sur tous les écrans.</li>
        <li>UI fluide, optimisée pour saisie rapide sur iPhone/iPad.</li>
    </ul>

    <h2>🛡️ Sécurité et RGPD</h2>
    <ul>
        <li>Données locales chiffrées avec Hive.</li>
        <li>Communication avec le serveur via HTTPS uniquement.</li>
        <li>Consentement explicite obligatoire avant envoi.</li>
    </ul>

    <h2>📅 Planning prévisionnel</h2>
    <ul>
        <li>Analyse et conception : 2 séances de 1h40</li>
        <li>Développement Flutter/iOS : 5 séeances de 1h40</li>
        <li>Tests et validation : 2 séances de 1h40</li>
        <li>Déploiement TestFlight : 1 séances de 1h40</li>
    </ul>

</body>
</html>
