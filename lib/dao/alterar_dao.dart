import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';

class EditarDao extends StatelessWidget {
  EditarDao({Key? key}) : super(key: key);
  dynamic validarEmail =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
  dynamic validarTelefone = r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$";

  Future<int> salvar(BuildContext context, int? id, String? nome, String? email, String? senha, String? telefone) async {
    String path = join(await getDatabasesPath(), 'banco.db');
    //deleteDatabase(path);
    Database database = await openDatabase(path, version: 1);
    String sql;
    Future<int> linhasAfetadas;
    if (id == null &&
        RegExp(validarEmail).hasMatch(email!) &&
        RegExp(validarTelefone).hasMatch(telefone!)) {
      sql =
          'INSERT INTO usuario (nome, email, senha, telefone) VALUES (?,?,?,?)';
      linhasAfetadas = database.rawInsert(
          sql, [nome, email, senha, telefone]);
    } else {
      sql =
          'UPDATE usuario SET nome = ?, email=?, senha=?, telefone=? WHERE id = ?';
      linhasAfetadas = database.rawUpdate(
          sql, [nome, email, senha, telefone, id]);
    }

    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => MyApp()));

    return linhasAfetadas;
  }

  Widget criarCampo(String rotulo, String? dica,
      ValueChanged<String>? vincularValor, String? valorInicial) {
    return TextFormField(
      decoration: InputDecoration(label: Text(rotulo), hintText: dica),
      onChanged: vincularValor,
      initialValue: valorInicial ??= '',
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
