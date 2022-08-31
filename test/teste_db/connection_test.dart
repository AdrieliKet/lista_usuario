import 'package:lista_usuario/bd/conection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  late Database db;

  setUp(() async {
    // String path = join(await getDatabasesPath(), 'banco.db');
    db = (await Conexao.abrirConexao());
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
