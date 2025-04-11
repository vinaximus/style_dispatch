import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  final dbName = 'db.db';
  Database? _db;
  static final DatabaseService instance = DatabaseService._init();

  DatabaseService._init();

  Future<Database> get getDatabase async {
    _db ??= await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    // Initialize sqflite_ffi for desktop or testing
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    // Get the path to the database directory
    final path = await getDatabasesPath();
    final dbPath = join(path, dbName);

    // Open or create the database
    final dbinstance = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE STYLES (
          styleCode INTEGER PRIMARY KEY AUTOINCREMENT,
          styleNo TEXT NOT NULL,
          designer TEXT,
          category TEXT,
          description TEXT
        )
        ''');
      },
    );
    return dbinstance;
  }

  // Function to insert a new style into the database
  Future<void> insertStyle(Map<String, dynamic> style) async {
    final db = await getDatabase;
    await db.insert(
      'STYLES',
      style,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Function to fetch all styles from the database
  Future<List<Map<String, dynamic>>> fetchStyles() async {
    final db = await getDatabase;
    final List<Map<String, dynamic>> styles = await db.query('STYLES');
    return styles;
  }
}
