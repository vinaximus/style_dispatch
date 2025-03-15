import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  final dbName = 'db.db';
  Database? _db;
  static final DatabaseService instance = DatabaseService._init();

  DatabaseService._init();

  Future<Database> get getDatabase async {
    if (_db == null) {
      _db = await initDatabase(); // Await this properly
    }
    return _db!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, dbName);
    final _dbinstance = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE STYLES (
          styleCode TEXT PRIMARY KEY,
          styleNo TEXT NOT NULL,
          designer TEXT,
          category TEXT,
          color TEXT NOT NULL
        ) 
        ''');
      },
    );
    return _dbinstance;
  }
}
