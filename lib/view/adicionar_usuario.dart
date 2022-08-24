import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../dao/criar_dao.dart';

import '../main.dart';

class AdicionarUsuario extends StatefulWidget {
  const AdicionarUsuario({Key? key}) : super(key: key);

  @override
  State<AdicionarUsuario> createState() => _AdicionarUsuarioState();
}

class _AdicionarUsuarioState extends State<AdicionarUsuario> {
  dynamic id;
  CriarDAO criarDAO = new CriarDAO();
  String? nome;
  String? email;
  String? senha;
  String? telefone;

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
                criarDAO.salvar(context, id, nome, email, senha, telefone);
                setState(() {});
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => MyApp()));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Form(
            child: Column(children: [
              criarDAO.criarCampo('Nome:', 'Digite seu nome',
                  (valorDigitado) => nome = valorDigitado, nome),
              criarDAO.criarCampo('Telefone:', 'Apenas números e sem dígito',
                  (valorDigitado) => telefone = valorDigitado, telefone),
              criarDAO.criarCampo('Senha:', 'Letras e números',
                  (valorDigitado) => senha = valorDigitado, senha),
              criarDAO.criarCampo('E-mail:', 'Digite seu e-mail',
                  (valorDigitado) => email = valorDigitado, email),
            ]),
          ),
        ),
      ),
    );
  }
}
