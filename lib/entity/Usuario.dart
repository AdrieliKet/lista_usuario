// ignore_for_file: file_names

import 'package:lista_usuario/entity/cidade.dart';

class Usuario {
  final dynamic id;
  final String nome;
  final String email;
  final String senha;
  final String telefone;
  final Cidade cidade;



  Usuario(
      {this.id,
      required this.nome,
      required this.email,
      required this.senha,
      required this.telefone,
      required this.cidade});

}
