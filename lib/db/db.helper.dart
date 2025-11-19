import 'package:pas_mobile_11pplg2_21/model/movie.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'movie.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE movies(
            id INTEGER PRIMARY KEY,
            url TEXT,
            name TEXT,
            language TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<void> insert(MovieModel product) async {
    final db = await database;
    await db.insert(
      'movies',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db.delete('movies', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<MovieModel>> getMovies() async {
    final db = await database;
    final result = await db.query('movies');
    return result.map((e) => MovieModel.fromJson(e)).toList();
  }
}
