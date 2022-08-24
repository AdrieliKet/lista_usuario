import 'package:flutter/material.dart';
import '../dao/listar_dao.dart';
import '../view/adicionar_usuario.dart';

import '../main.dart';

class ListaUsuario extends StatefulWidget {
  const ListaUsuario({Key? key}) : super(key: key);

  @override
  State<ListaUsuario> createState() =>
      _ListausuarioState();
}

class _ListausuarioState extends State<ListaUsuario> {
  ListarDao listarDao = ListarDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista Usuários'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    Navigator.pushNamed(context, '/addUsuarios'))
          ],
        ),
        body: FutureBuilder(
            //future: consultar(),
            builder:
                (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              var lista = snapshot.data!;
              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, contador) {
                    var usuario = lista[contador];
                    return ListTile(
                      leading: Text(usuario["nome"].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.black38,
                              onPressed: () {
                                Navigator.pushNamed(context, '/editUsuario',
                                        arguments: usuario)
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                            ),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.black38,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text("Excluir?"),
                                          actions: [
                                            ElevatedButton(
                                              child: Text("Sim"),
                                              onPressed: () {
                                                AdicionarUsuario form =
                                                    new AdicionarUsuario();
                                                excluir(int.parse(
                                                    usuario['id']
                                                        .toString()));
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyApp(),
                                                    ));
                                              },
                                            ),
                                            ElevatedButton(
                                              child: Text("Não"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                })
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}