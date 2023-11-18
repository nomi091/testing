import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class DoctorSQLHelper {
  static Future<void> createTables(Database database) async {
    await database.execute("""
      CREATE TABLE selectedSports(
        id TEXT PRIMARY KEY,
        name TEXT,
        exp TEXT,
        age TEXT,
        spec TEXT,
        updated_at  DEFAULT CURRENT_TIMESTAMP,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<Database> db() async {
    return openDatabase(
      'doctor.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> insetData(
      {String? docName, int? docExp, int? docAge, String? docSpec}) async {
    final db = await DoctorSQLHelper.db();
    final data = {
      'id': "1",
      'name': docName,
      'exp': docExp,
      "age": docAge,
      "spec": docSpec,
    };
    final id = await db.insert('selectedSports', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  // // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DoctorSQLHelper.db();
    return db.query('doctor');
  }

  // // Update an item by id
  static Future<int> updateDoctor(
      {String? docName, int? docExp, int? docAge, String? docSpec}) async {
    final db = await DoctorSQLHelper.db();
    final data = {
      'exp': docExp,
      // "age": docAge,
      // "spec": docSpec,
      // 'updated_at': DateTime.now().toString(),
      // 'createdAt': DateTime.now().toString()
    };
    final result = await db
        .update('doctor', data, where: "name = ?", whereArgs: ['$docName']);
    return result;
  }

  // // Delete
  static Future<void> deleteItem({String? docName}) async {
    final db = await DoctorSQLHelper.db();
    try {
      // await db.delete("doctor");
      await db.delete("doctor", where: "name = ?", whereArgs: [docName]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
