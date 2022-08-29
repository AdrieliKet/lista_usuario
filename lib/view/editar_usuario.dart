import 'package:flutter/material.dart';
import 'package:lista_usuario/dao/usuario_dao.dart';
import 'package:lista_usuario/entity/Usuario.dart';

class EditarUsuario extends StatefulWidget {
  const EditarUsuario({Key? key}) : super(key: key);

  @override
  State<EditarUsuario> createState() =>
      _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  UsuarioDao usuarioDao = new UsuarioDao();
  dynamic id;
  String? nome;
  String? email;
  String? senha;
  String? telefone;
  late Usuario usuario;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> usuario = argumento as Map<String, Object?>;
      id = usuario['id'] as int;
      nome = usuario['nome'] as String;
      email = usuario['email'] as String;
      senha = usuario['senha'] as String;
      telefone = usuario['telefone'] as String;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Funcionário'),
        actions: [
          IconButton(
              icon: const Icon(Icons.check_box_outlined),
              onPressed: () {
                usuarioDao.editar(usuario);
                setState(() {});
                Navigator.pop(context);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Form(
            child: Column(children: [
              usuarioDao.criarCampo('Telefone:', 'Digite seu novo telefone',
                  (valorDigitado) => telefone = valorDigitado, telefone),
              usuarioDao.criarCampo('E-mail:', 'Digite seu novo e-mail',
                  (valorDigitado) => email = valorDigitado, email),
              usuarioDao.criarCampo('Senha:', 'Digite sua nova senha',
                  (valorDigitado) => senha = valorDigitado, senha),
            ]),
          ),
        ),
      ),
    );
  }
}
