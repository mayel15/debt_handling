enum DebtType {
  TO_PAY,
  TO_RECEIVE,
}

class Debt {
  String id;
  DebtType debtType;
  String personFullName;
  double amount;
  DateTime deadlineDate;
  DateTime createdAt;
  Debt(
      {required this.id,
      required this.debtType,
      required this.amount,
      required this.personFullName,
      required this.deadlineDate,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'debtType': debtType.index,
      'amount': amount,
      'personFullName': personFullName,
      'deadlineDate': deadlineDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String()
    };
  }

  factory Debt.fromMap(Map<String, dynamic> map) {
    return Debt(
        id: map['id'],
        debtType: DebtType.values[map['debtType']],
        amount: map['amount'],
        personFullName: map['personFullName'],
        deadlineDate: DateTime.parse(map['deadlineDate']),
        createdAt: DateTime.parse(map['createdAt']));
  }
}
