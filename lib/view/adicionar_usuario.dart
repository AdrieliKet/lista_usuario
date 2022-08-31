import 'package:flutter/material.dart';
import 'package:lista_usuario/dao/usuario_dao.dart';
import 'package:lista_usuario/entity/usuario.dart';

import '../main.dart';

class AdicionarUsuario extends StatefulWidget {
  const AdicionarUsuario({Key? key}) : super(key: key);

  @override
  State<AdicionarUsuario> createState() => _AdicionarUsuarioState();
}

class _AdicionarUsuarioState extends State<AdicionarUsuario> {
  dynamic id;
  UsuarioDao usuarioDao = UsuarioDao();
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
        title: const Text('Cadastro Usuário'),
        actions: [
          IconButton(
              icon: const Icon(Icons.check_box_outlined),
              onPressed: () {
                // usuarioDao.salvar(usuario);
                setState(() {});
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(children: [
              usuarioDao.criarCampo('Nome:', 'Digite seu nome',
                  (valorDigitado) => nome = valorDigitado, nome),
              usuarioDao.criarCampo('Telefone:', 'Apenas números e sem dígito',
                  (valorDigitado) => telefone = valorDigitado, telefone),
              usuarioDao.criarCampo('Senha:', 'Letras e números',
                  (valorDigitado) => senha = valorDigitado, senha),
              usuarioDao.criarCampo('E-mail:', 'Digite seu e-mail',
                  (valorDigitado) => email = valorDigitado, email),
            ]),
          ),
        ),
      ),
    );
  }
}
