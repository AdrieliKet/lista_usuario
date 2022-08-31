import 'package:lista_usuario/bd/conection.dart';
import 'package:lista_usuario/entity/cidade.dart';
import 'package:sqflite/sqflite.dart';

class CidadeDAO {
  Future<bool> salvar(Cidade cidade) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO cidade(nome, estado) VALUES (?, ?)';
    var linhasAfetadas = await db.rawInsert(sql, [cidade.nome, cidade.estado]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Cidade cidade) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'UPDATE cidade SET nome=?, estado=? WHERE id = ?';
    var linhasAfetadas =
        await db.rawUpdate(sql, [cidade.nome, cidade.estado, cidade.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM cidade WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('Erro ao excluir');
    } finally {
      db.close();
    }
  }

  Future<List<Cidade>> listarTodos() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM cidade';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Cidade> cidades = resultado.map((linha) {
        return Cidade(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            estado: linha['estado'].toString());
      }).toList();
      return cidades;
    } catch (e) {
      throw Exception('Erro ao listar as cidades');
    } finally {
      db.close();
    }
  }
}
