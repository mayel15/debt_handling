// import 'package:filter_list/filter_list.dart';
import 'package:debt_handling/src/components/debt-card.widget.dart';
import 'package:debt_handling/src/models/debt.model.dart';
import 'package:debt_handling/src/services/debt-database.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddModifyDebtPage extends StatefulWidget {
  const AddModifyDebtPage({super.key});

  @override
  _AddModifyDebtState createState() => _AddModifyDebtState();
}

class _AddModifyDebtState extends State<AddModifyDebtPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dettes'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(217, 217, 217, 217),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ajouter une dette",
                style: TextStyle(fontSize: 25),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type de dette',
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Montant',
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Devise'),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Personne',
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Echeance',
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusColor: Colors.black,
                  fillColor: Colors.black,
                  labelText: 'Note',
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {},
                child: const Text('Ajouter'),
              )),
        ],
      ),
    );
  }
}
