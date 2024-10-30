import 'package:debt_handling/src/pages/add-debt.page.dart';
import 'package:debt_handling/src/pages/home.page.dart';
import 'package:debt_handling/src/pages/infos.page.dart';
import 'package:debt_handling/src/services/debt-database.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DebtDatabaseService(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Debt Handling', routes: {
      '/': (context) => const HomePage(),
      '/infos': (context) => const InfosPage(),
      '/add-debt': (context) => const AddDebtPage(),
    });
  }
}
