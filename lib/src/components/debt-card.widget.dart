import 'package:debt_handling/src/models/debt.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DebtCard extends StatelessWidget {
  final DebtModel item;

  const DebtCard({
    super.key,
    required this.item,
  });

  // var formatEUR = NumberFormat.simpleCurrency(locale: 'fr_FR', name: 'EUR');
  // print(formatEUR.format(price)); // Affiche: 1 234,56 €

  String handleAmountWithCurrency(double amount, String currency) {
    var farmatWithCurrency =
        NumberFormat.simpleCurrency(locale: 'fr_FR', name: currency);
    return farmatWithCurrency.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      color: const Color.fromARGB(217, 217, 217, 217),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.personFullName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  handleAmountWithCurrency(item.amount, item.currency),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Echéance ${dateFormat.format(item.deadlineDate)}",
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
