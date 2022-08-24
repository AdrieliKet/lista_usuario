import 'package:flutter/material.dart';
import 'view/adicionar_usuario.dart';
import 'view/editar_usuario.dart';
import 'view/listar_usuario.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
      ),
      routes: {
        '/': (context) => const ListaUsuario(),
        '/addUsuario': (context) => const AdicionarUsuario(),
        '/editUsuario': (context) => const EditarUsuario(),
      },
    );
  }
}
