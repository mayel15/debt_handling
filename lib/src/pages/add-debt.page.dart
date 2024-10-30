import 'package:debt_handling/src/models/debt.model.dart';
import 'package:debt_handling/src/services/debt-database.service.dart';
import 'package:flutter/material.dart';

class AddDebtPage extends StatefulWidget {
  const AddDebtPage({super.key});

  @override
  _AddDebtPageState createState() => _AddDebtPageState();
}

class _AddDebtPageState extends State<AddDebtPage> {
  final _formKey = GlobalKey<FormState>();
  final DebtDatabaseService debtDatabaseService = DebtDatabaseService();

  // Vars for Form
  String? _selectedDebtType;
  String? _selectedCurrency;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _personFullNameController =
      TextEditingController();
  DateTime? _selectedDeadlineDate;

  // List for Selection Value
  final List<String> _debtTypes = ["à rembourser", "à encaisser"];
  final List<String> _currencies = ["EUR", "XOF", "USD"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une dette"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // DebtType field
              DropdownButtonFormField<String>(
                value: _selectedDebtType,
                onChanged: (value) => setState(() => _selectedDebtType = value),
                items: _debtTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: "Type de Dette",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null
                    ? "Veuillez sélectionner un type de dette"
                    : null,
              ),
              const SizedBox(height: 16),

              // amount debt field
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Montant",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer le montant";
                  }
                  if (double.tryParse(value) == null) {
                    return "Veuillez entrer un nombre valide";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // currency field
              DropdownButtonFormField<String>(
                value: _selectedCurrency,
                onChanged: (value) => setState(() => _selectedCurrency = value),
                items: _currencies.map((currency) {
                  return DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: "Devise",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null ? "Veuillez sélectionner une devise" : null,
              ),
              const SizedBox(height: 16),

              // person's full name field
              TextFormField(
                controller: _personFullNameController,
                decoration: const InputDecoration(
                  labelText: "Nom complet de la personne",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer le nom complet";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Deadline date field
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );
                  // print("Picked date: $_selectedDeadlineDate");
                  // print("Picked date: $_selectedDeadlineDate");

                  if (pickedDate != null) {
                    setState(() => _selectedDeadlineDate = pickedDate);
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: _selectedDeadlineDate != null
                          ? "${_selectedDeadlineDate!.day}/${_selectedDeadlineDate!.month}/${_selectedDeadlineDate!.year}"
                          : "Date d'échéance",
                      border: const OutlineInputBorder(),
                      hintText: _selectedDeadlineDate != null
                          ? "${_selectedDeadlineDate!.day}/${_selectedDeadlineDate!.month}/${_selectedDeadlineDate!.year}"
                          : "Sélectionnez la date",
                    ),
                    validator: (value) => _selectedDeadlineDate == null
                        ? "Veuillez sélectionner une date d'échéance"
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Submit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // add debt
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Dette ajoutée avec succès')),
                    );
                    DebtModel debt = DebtModel(
                        id: DateTime.now().toString(),
                        debtType: _selectedDebtType! == _debtTypes.first
                            ? DebtType.TO_PAY
                            : DebtType.TO_RECEIVE,
                        personFullName: _personFullNameController.text,
                        amount: double.parse(_amountController.text),
                        currency: _selectedCurrency!,
                        deadlineDate: _selectedDeadlineDate!,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now());
                    await debtDatabaseService.addDebt(debt);

                    Navigator.pushNamed(context, '/');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Ajouter",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
