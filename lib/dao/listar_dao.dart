import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListarDao extends StatelessWidget {
  const ListarDao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<List<Map<String, Object?>>> listar() async {
  String caminho = join(await getDatabasesPath(), 'banco.db');
  Database database = await openDatabase(
    caminho,
    onCreate: (db, version) {
      db.execute('');
    },
  );

  List<Map<String, Object?>> dados =
      await database.rawQuery('SELECT * FROM usuario');
  return dados;
}

Future<List<Map<String, Object?>>> criar() async {
  await Future.delayed(const Duration(seconds: 1));
  String path = join(await getDatabasesPath(), 'banco.db');
  //deleteDatabase(path);
  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, v) {
      db.execute(
          'CREATE TABLE usuario(id INTEGER PRIMARY KEY, nome TEXT, email TEXT, senha TEXT, telefone TEXT)');
    },
  );
  List<Map<String, Object?>> list =
      await database.rawQuery('SELECT * FROM usuario');
  return list;
}

Future<int> excluir(int id) async {
  String caminho = join(await getDatabasesPath(), 'banco.db');
  Database database = await openDatabase(caminho, version: 1);
  String sql = "DELETE FROM usuario WHERE id = ?";
  Future<int> linhaAfetada;
  linhaAfetada = database.rawDelete(sql, [id]);
  return linhaAfetada;
}
