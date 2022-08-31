import 'package:flutter/material.dart';
import 'package:lista_usuario/bd/conection.dart';
import 'package:lista_usuario/entity/usuario.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  const UsuarioDao({Key? key}) : super(key: key);

  Future<bool> salvar(Usuario usuario) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO usuario (nome, email, senha, telefone) VALUES (?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(
        sql, [usuario.nome, usuario.email, usuario.senha, usuario.telefone]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Usuario usuario) async {
    const sql =
        'UPDATE usuario SET nome = ?, email=?, senha=?, telefone=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      usuario.nome,
      usuario.email,
      usuario.senha,
      usuario.telefone,
      usuario.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<List<Usuario>> listarTodos() async {
    late Database database;
    try {
      const sql = 'SELECT * FROM cidade';
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

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM usuario WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('Erro ao excluir');
    } finally {
      db.close();
    }
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
