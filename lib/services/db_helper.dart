import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StudentSqlHelper {
  static Database? _database;

  // Initialize and get the database
  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  // Create and open the database
  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'student_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await createTables(db);
      },
    );
  }

  // Create tables
  static Future<void> createTables(Database database) async {
    await database.execute("""
      CREATE TABLE student(
        name TEXT,
        semester TEXT,
        ProName TEXT
      )""");
  }

  // Insert student
  static Future<void> insertStudent(
      String name, String semester, String proName) async {
    final db = await database;
    await db.insert(
      'student',
      {'name': name, 'semester': semester, 'ProName': proName},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all students
  static Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await database;
    return await db.query('student');
  }

  // Update student
  static Future<void> updateStudent(String newName, String newSemester,
      String newProName, String oldName) async {
    final db = await database;
    await db.update(
      'student',
      {'name': newName, 'semester': newSemester, 'ProName': newProName},
      where: 'name = ?',
      whereArgs: [oldName],
    );
  }

  // Delete student
  static Future<void> deleteStudent(String name) async {
    final db = await database;
    await db.delete(
      'student',
      where: 'name = ?',
      whereArgs: [name],
    );
  }
}
