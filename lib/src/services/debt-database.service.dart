import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:debt_handling/src/models/debt.model.dart';

class DebtDatabaseService extends ChangeNotifier {
  static final DebtDatabaseService _instance = DebtDatabaseService._internal();
  static Database? _database;

  factory DebtDatabaseService() {
    return _instance;
  }

  DebtDatabaseService._internal();

  // Initialiser ou obtenir la base de données
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // Chemin vers la base de données et création de la table
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'debt_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // table creation
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE debts (
        id TEXT PRIMARY KEY,
        debtType INTEGER,
        personFullName TEXT,
        amount REAL,
        currency TEXT,
        deadlineDate TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
  }

  // create a debt
  Future<void> insertDebt(DebtModel debt) async {
    final db = await database;
    await db.insert(
      'debts',
      debt.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // get all debts
  Future<List<DebtModel>> getDebts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('debts');

    return List.generate(maps.length, (i) {
      return DebtModel.fromMap(maps[i]);
    });
  }

  // get a debt by id
  Future<DebtModel> getDebtById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'debts',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return DebtModel.fromMap(maps.first);
    } else {
      throw Exception('Debt not found');
    }
  }

  // update a debt
  Future<void> updateDebt(DebtModel debt) async {
    final db = await database;
    await db.update(
      'debts',
      debt.toMap(),
      where: 'id = ?',
      whereArgs: [debt.id],
    );
  }

  // delete a debt
  Future<void> deleteDebt(String id) async {
    final db = await database;
    await db.delete(
      'debts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
