import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'ListTable.dart';

class DatabaseHepler {
  static const DB_NAME = "ListDemo.db";
  static const DB_VERSION = 1;
  static Database _database;

  DatabaseHepler._internal();

  Database get database => _database;

  static final DatabaseHepler instance = DatabaseHepler._internal();

  static const initScript = [ListTable.CREATE_TABLE];
  static const migrationtScript = [ListTable.CREATE_TABLE];

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScript.forEach((scrip) async => await db.execute(scrip));
      },
      onUpgrade: (db, oldVersion, newVersion) {
        migrationtScript.forEach((scrip) async => await db.execute(scrip));
      },
      version: DB_VERSION,
    );
  }
}
