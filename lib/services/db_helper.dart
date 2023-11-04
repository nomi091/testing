import 'package:sqflite/sqflite.dart' as sql;

class SportsSQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE selectedSports(
        id TEXT PRIMARY KEY,
        title TEXT,
        description TEXT,
        sports_name TEXT,
        sports_image TEXT,
        updated_at TEXT,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'selectedSports.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(
     { String? name, int? exp, int? age, String? spec}) async {
    final db = await SportsSQLHelper.db();

    final data = {
      'id': "1",
      'name': name,
      'exp': exp,
      "age": age,
      "spec": spec,
    };
    final id = await db.insert('selectedSports', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // // Read all items (journals)
  // static Future<List<Map<String, dynamic>>> getItems() async {
  //   final db = await SportsSQLHelper.db();
  //   return db.query('selectedSports', orderBy: "id");
  // }

  // // Read a single item by id
  // // The app doesn't use this method but I put here in case you want to see it
  // static Future<List<Map<String, dynamic>>> getItem(int id) async {
  //   final db = await SportsSQLHelper.db();
  //   return db.query('selectedSports', where: "id = ?", whereArgs: [id], limit: 1);
  // }

  // // Update an item by id
  // static Future<int> updateItem(int id, String title, String? descrption) async {
  //   final db = await SportsSQLHelper.db();

  //   final data = {
  //     'title': title,
  //     'description': descrption,
  //     'createdAt': DateTime.now().toString()
  //   };

  //   final result =
  //   await db.update('selectedSports', data, where: "id = ?", whereArgs: [id]);
  //   return result;
  // }

  // // Delete
  // static Future<void> deleteItem(int id) async {
  //   final db = await SportsSQLHelper.db();
  //   try {
  //     await db.delete("selectedSports");
  //     // await db.delete("selectedSports", where: "id = ?", whereArgs: [id]);
  //   } catch (err) {
  //     debugPrint("Something went wrong when deleting an item: $err");
  //   }
  // }
}
