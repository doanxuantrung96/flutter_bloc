import 'package:bloc_pattern_flutter/HomeActivity/database/DatabaseHepler.dart';
import 'package:bloc_pattern_flutter/HomeActivity/model/DemoModel.dart';
import 'package:sqflite/sqflite.dart';

class ListTable {
  static const TABLE_NAME = "demo";
  static const CREATE_TABLE = '''
    CREATE TABLE $TABLE_NAME (
    id INTEGER PRIMARY KEY,
    title TEXT,
    )
  ''';
  static const DROP_TABLE = '''
    DROP TABLE IF EXISTS $TABLE_NAME,
  ''';

  Future<int> insertData(DemoModel demoModel) async {
    final Database db = await DatabaseHepler.instance.database;
    int res = await db.insert(TABLE_NAME, demoModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<int> deleteData(DemoModel demoModel) async {
    final Database db = await DatabaseHepler.instance.database;
    int res =
        await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [demoModel.id]);
    return res;
  }

  Future<List<DemoModel>> selectAll() async {
    final Database db = DatabaseHepler.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('demo');

    return List.generate(
      maps.length,
      (index) => DemoModel(
        maps[index]['id'],
        maps[index]['title'],
      ),
    );
  }
}
