import 'package:flutter_test/flutter_test.dart';
import 'package:lista_usuario/dao/cidade_dao.dart';
import 'package:lista_usuario/entity/cidade.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late CidadeDAO dao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp (() {
    dao = CidadeDAO();
  });

  test("Persistir no banco de dados uma cidade", () async {
    var resultado = await dao.salvar(
        Cidade( nome: "Paranavaí", estado: "Paraná"));
    expect(resultado, true);
  });

  test("Alterar um registro do banco", () async {
    var resultado = await dao.alterar(Cidade(
        id: 1, nome: "Curitiba", estado: "PR"));
    expect(resultado, true);
  });

  test("Listar todos", () async {
    var resultado = await dao.listarTodos();
    expect(resultado, isInstanceOf<List<Cidade>>());
  });

  test('teste excluir', () async {
    var resultado = await dao.excluir(1);
    expect(resultado, true);
  });
}