class Cidade {
  final dynamic id;
  final String nome;
  final String estado;

  Cidade({this.id, required this.nome, required this.estado});

   int get getId {
    return id;
  }
}