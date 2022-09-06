import 'package:flutter_test/flutter_test.dart';
import 'package:lista_usuario/dao/usuario_dao.dart';
import 'package:lista_usuario/entity/cidade.dart';
import 'package:lista_usuario/entity/usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late UsuarioDao usuarioDao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    usuarioDao = UsuarioDao();
  });

  tearDown(() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path); // irá excluir o banco - não use na produção
  });

  test("Persistir no banco de dados um usuário", () async {
    var usuario =  Usuario(
        nome: "adrieli",
        email: "adrieli@gmail.com",
        senha: 'adrieli1010',
        telefone: '44999999999',
        cidade: Cidade(id: 1, nome: "Paranavaí", estado: "Paraná"));
    var resultado = await usuarioDao.salvar(usuario);
    expect(resultado, true);
  });

  test("Alterar um registro de um usuário do banco", () async {
    var usuario =Usuario(
        id: 1,
        nome: "Adrieli Kethin dos Santos",
        email: "adrielikethin@gmail.com",
        senha: "1010adrieli",
        telefone: "44888888888",
        cidade: Cidade( id: 1, nome: "São Paulo", estado: "SP"));
    var resultado = await usuarioDao.alterar(usuario);
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
