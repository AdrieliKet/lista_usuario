import 'package:flutter_test/flutter_test.dart';
import 'package:lista_usuario/dao/usuario_dao.dart';
import 'package:lista_usuario/entity/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late UsuarioDao usuarioDao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    usuarioDao = UsuarioDao();
  });

  test("Persistir no banco de dados um usuário", () async {
    var resultado = await usuarioDao.salvar(Usuario(nome: "adrieli", email: "adrieli@gmail.com" , senha: 'adrieli1010', telefone: '44999999999'));
    expect(resultado, true);
  });

  test("Alterar um registro de um usuário do banco", () async {
    var resultado = await usuarioDao.editar(Usuario(
        id: 1, nome: "Adrieli Kethin dos Santos", email: "adrielikethin@gmail.com", senha: "1010adrieli", telefone: "44888888888"));
    expect(resultado, true);
  });

  test("Listar todos os usuários", () async {
    var resultado = await usuarioDao.listarTodos();
    expect(resultado, isInstanceOf<List<Usuario>>());
  });

  test('teste excluir usuário', () async {
    var resultado = await usuarioDao.excluir(1);
    expect(resultado, true);
  });
}