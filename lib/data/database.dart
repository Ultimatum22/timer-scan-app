import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static Database? _database;
  static final DatabaseProvider databaseProvider = DatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final Directory documentDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentDirectory.path, 'timer-scan-app.db');

    return await openDatabase(path,
        version: 1, onOpen: (final Database database) {});
  }
}
