# 🔎 Debt Handling - Gestion de dettes

| ![Pape THIAM](https://avatars.githubusercontent.com/u/97792012?v=4) |
| :-----------------------------------------------------------------: |
|                             Pape THIAM                              |
|                              22009010                               |
|               [@mayel15](https://github.com/mayel15)                |
|                    papemayeldiagne.thiam@uphf.fr                    |

# 📱 Demo de l'application

# 🧰 Technos utilisées

<a href="https://dart.dev" target="_blank" rel="noreferrer"> <img src="./readme-images/dart.svg" alt="dart" width="100" height="100"/> </a> <a href="https://flutter.dev" target="_blank" rel="noreferrer"> <img src="./readme-images/flutter.svg" alt="flutter" width="100" height="100"/> </a>

# ➕ More

- [provider](https://pub.dev/packages/syncfusion_flutter_datepicker)
- [path_provider](https://pub.dev/packages/path_provider)
- [http](https://pub.dev/packages/http)
- [filter_list](https://pub.dev/packages/filter_list)

# 🧐 Description du projet et choix d'implémentation

## 📄 Description du projet

`Debt Handling` est une application de gestion de dettes pour aider les utilisateurs à suivre et gérer leurs dettes de manière efficace. Chaque utilisateur aura une base de données local où ses données seront sauvegarder. Ainsi, l'utilisation de l'application n'aura pas besoin de connexion internet.
Voici une liste de fonctionnalités que tu pourrais implémenter pour rendre l'application utile et conviviale :

- ajouter, modifier, supprimer une dette (à rembourser, ou à encaisser) avec des informations comme le montant de la dette (avec plusieurs devises possibles), la personne concernée (possibilité de choisir depuis l'annuaire téléphoniquen ou des personnes qui existent déjà dans l'app ou entrer manuellement), la date de l'échéance (avec ou sans la date de d'emprunt ou de prêt), et uen note facultatif
- payer (ou rembourser une dette) une dette que je dois avec la possibilité de payer la totalité ou un pourcentage
- encaisser une dette qu'on me doit avec la possibilité d'encaisser la totalité ou un pourcentage
- avoir l'historique des paiements ou remboursement pour chaque personne
- avoir la liste des dettes à rembourser ou à encaisser avec les dates d'échéance (si c'était)
- mettre en emphase les dettes arrivées à écheances et pas payés / remboursés

## ⚙️ Choix d'implémentation

### Utilisation de l'API SNCF (Objets Trouvés)

### Stockage local avec des fichiers

Pour le stockage de la date de dernière consultation, un `fichier` est utilisé en local pour la sauvegarder (lecture et écriture) lorsque l'application est lancée. Cependant `shared_preferences` pourrait être utiliser pour faire la même tâche.

### Gestion des états avec Provider

`Provider` est utilisé pour gérer les états de l'application de manière efficace. Il permet une séparation claire des responsabilités entre les différentes parties de l'application, facilitant la mise à jour dynamique de l'interface lorsque les données changent (nouveaux objets trouvés, filtres, etc.).

# Cloner le projet

- Pré-requis: Vous devez avoir un émulateur `android (avec Android Studio)` ou un émulateur `ios (avec Xcode)` et le `SDK flutter` installé sur votre ordinateur avec les versions suivantes de préférence :

  - `Flutter v3.24.1`
  - `Dart v3.5.1`

- Cloner le projet avec `git clone https://github.com/mayel15/sncf_found_objects.git`

- Aller dans le répertoire du projet

- Installer les dépendances avec `flutter packages get` ou `flutter pub add`

- Lancer l'application et consulter les objets trouvés 🥳
