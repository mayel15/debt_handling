import 'package:flutter/material.dart';

class InfosPage extends StatelessWidget {
  const InfosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("À propos de l'application"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Debt Handling",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // App description
            Text(
              "Debt Handling est une application de gestion de dettes pour aider les utilisateurs à suivre et gérer leurs dettes de manière efficace. Chaque utilisateur a une base de données locale où ses données seront sauvegardées. Ainsi, l'utilisation de l'application n'a pas besoin de connexion internet. Vous pouvez facilement enregistrer, visualiser et gérer vos dettes pour garder une trace de chaque emprunt (dette à rembourser) ou prêt (dette à encaisser) en toute simplicité.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              "Développée par :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),

            Text(
              "Pape THIAM (alias Mayel)",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),

            Text(
              "Linkedin : ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),

            SelectableText(
              "https://www.linkedin.com/in/pape-mayel-diagne-thiam/",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
            ),
            Spacer(),

            Text(
              "Fait avec ❤️ par @mayel_pape (X/Twitter)",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
