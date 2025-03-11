import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;
  static DatabaseService instance = DatabaseService._init();
  DatabaseService._init();

  Future<Database> get currentdb async {
    if (_db == null) {
      _db = await getDatabase();
    }
    return _db!;
  }

  Future<Database> getDatabase() async {
    final dbDefaultPath = await getDatabasesPath();
    final dbs = join(dbDefaultPath, 'main_db.db');
    final database = await openDatabase(
      dbs,
      version: 1,
      onCreate: ((db, version) async {
        await db.execute('''
      CREATE TABLE styles (
      style_id INTEGER PRIMARY KEY AUTOINCREMENT 
      style_name TEXT NOT NULL 
      style_type TEXT 
      style_description TEXT
      )    
        ''');
      }),
    );
    return database;
  }
}
