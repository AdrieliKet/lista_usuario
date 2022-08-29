import 'package:lista_usuario/bd/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _db;
  static Future<Database> abrirConexao() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco2.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(criarBanco);
        },
      );
    }
    return _db!;
  }
}


