import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _database;
  static String criarUsuario = '''
    CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    telefone TEXT NOT NULL,
    )''';

  static Future<Database> getDatabase() async {
    if (_database == null) {
      var path = join(await getDatabasesPath(), 'banco.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(criarUsuario);
        },
      );
    }
    return _database!;
  }
}
