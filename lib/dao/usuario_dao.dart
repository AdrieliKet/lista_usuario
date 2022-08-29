import 'package:flutter/material.dart';
import 'package:lista_usuario/bd/conection.dart';
import 'package:lista_usuario/entity/Usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';

class UsuarioDao extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  UsuarioDao({Key? key}) : super(key: key);
  //  dynamic validarEmail = r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
  //  dynamic validarTelefone = r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$";

  Future<int> salvar( Usuario usuario) async {
    Database database = await Conexao.abrirConexao();
    String sql;
    Future<int> linhasAfetadas;
    sql = 'INSERT INTO usuario (nome, email, senha, telefone) VALUES (?,?,?,?)';
    linhasAfetadas = database.rawInsert(sql, [usuario.nome, usuario.email, usuario.senha, usuario.telefone]);

    return linhasAfetadas;
  }

  Future<int> editar(Usuario usuario) async {
    Database database = await Conexao.abrirConexao();
    String sql;
    Future<int> linhasAfetadas;
      sql =
          'UPDATE usuario SET nome = ?, email=?, senha=?, telefone=? WHERE id = ?';
      linhasAfetadas = database.rawUpdate(
          sql, [usuario.nome, usuario.email, usuario.senha, usuario.telefone, usuario.id]);

    return linhasAfetadas;
  }

 @override
  Future<List<Usuario>> listarTodos() async {
    late Database database;
    try {
      const sql = 'SELECT * FROM cliente';
      database = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await database.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Usuario> usuarios = resultado.map((linha) {
        return Usuario(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            email: linha['email'].toString(),
            senha: linha['senha'].toString(),
            telefone: linha['telefone'].toString());
      }).toList();
      return usuarios;
    } catch (e) {
      throw Exception('Error ao listar usuários');
    } finally {
      database.close();
    }
  }

Future<int> excluir(int id) async {
  String caminho = join(await getDatabasesPath(), 'banco1.db');
  Database database = await Conexao.abrirConexao();
  String sql = "DELETE FROM usuario WHERE id = ?";
  Future<int> linhaAfetada;
  linhaAfetada = database.rawDelete(sql, [id]);
  return linhaAfetada;
}

  Widget criarCampo(String rotulo, String? dica,
      ValueChanged<String>? vincularValor, String? valorInicial) {
    return TextFormField(
      decoration: InputDecoration(label: Text(rotulo), hintText: dica),
      onChanged: vincularValor,
      initialValue: valorInicial ??= '',
    );
  }
}