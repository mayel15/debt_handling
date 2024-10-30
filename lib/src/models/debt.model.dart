import 'dart:ffi';

enum DebtType {
  TO_PAY,
  TO_RECEIVE,
}

class DebtModel {
  String id;
  DebtType debtType;
  String personFullName;
  double amount;
  String currency;
  DateTime deadlineDate;
  DateTime createdAt;
  DateTime updatedAt;

  DebtModel(
      {required this.id,
      required this.debtType,
      required this.amount,
      required this.currency,
      required this.personFullName,
      required this.deadlineDate,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'debtType': debtType.index,
      'amount': amount,
      'currency': currency,
      'personFullName': personFullName,
      'deadlineDate': deadlineDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String()
    };
  }

  factory DebtModel.fromMap(Map<String, dynamic> map) {
    return DebtModel(
        id: map['id'],
        debtType: DebtType.values[map['debtType']],
        amount: map['amount'],
        currency: map['currency'],
        personFullName: map['personFullName'],
        deadlineDate: DateTime.parse(map['deadlineDate']),
        createdAt: DateTime.parse(map['createdAt']),
        updatedAt: DateTime.parse(map['updatedAt']));
  }
}
