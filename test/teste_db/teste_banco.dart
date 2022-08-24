import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  Database? _database;
  String criarUsuario = '''
    CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    telefone TEXT NOT NULL,
    )''';

  Future<Database> getDatabase() async {
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

  tearDown(() {
    //executa o que foi definido após cada teste
  });

  tearDownAll(() {
    //executa o que foi definido após todos os testes
    _database?.close();
  });

  group('teste conexao', () {
    // definindo um grupo de testes
    test('conexão nula', () async {
      expect(_database?.isOpen, null);
    });
  });
}
