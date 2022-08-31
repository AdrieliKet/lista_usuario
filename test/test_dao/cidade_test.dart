import 'package:flutter_test/flutter_test.dart';
import 'package:lista_usuario/dao/cidade_dao.dart';
import 'package:lista_usuario/entity/cidade.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late CidadeDAO cidadeDao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp (() {
    cidadeDao = CidadeDAO();
  });

  tearDown(() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path); // irá excluir o banco - não use na produção
  });

  test("Persistir no banco de dados uma cidade", () async {
    var cidade =
        Cidade( nome: "Paranavaí", estado: "Paraná");
     var resultado = await cidadeDao.salvar(cidade);
    expect(resultado, true);
  });

  test("Alterar um registro do banco", () async {
    var cidade = Cidade(
        id: 1, nome: "Curitiba", estado: "PR");
    var resultado = await cidadeDao.alterar(cidade);
    expect(resultado, true);
  });

  test("Listar todos", () async {
    var resultado = await cidadeDao.listarTodos();
    expect(resultado, isInstanceOf<List<Cidade>>());
  });

  test('teste excluir', () async {
    var resultado = await cidadeDao.excluir(1);
    expect(resultado, true);
  });
}