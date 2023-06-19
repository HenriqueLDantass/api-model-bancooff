import 'package:estudosalura/api/model/api_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._();

  static Database? _database;

  DataBaseHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            title TEXT,
            body TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(User user) async {
    final db = await database;

    //verificar se ja existe o id
    final usuarioExistente = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [user.id],
    );
    if (usuarioExistente.isEmpty) {
      await db.insert('users', user.toMap());
    }
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (index) => User.fromMap(maps[index]));
  }
}
