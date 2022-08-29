import 'package:lista_usuario/bd/conection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  late Database db;

  setUp(() async {
    String path = join(await getDatabasesPath(), 'banco1.db');
    db = (await Conexao.abrirConexao()) as Database;
  });

  tearDown(() {});

  tearDownAll(() {
    db.close();
  });

  group("Teste de Conexão", () {
    test("Teste de conexão aberta", () {
      expect(db.isOpen, true);
    });
  });
}
