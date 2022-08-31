final criarBanco = [
  '''
    CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    telefone TEXT NOT NULL
    )''',
  '''
    CREATE TABLE cidade (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    estado TEXT NOT NULL
    )''',
  '''INSERT INTO usuario(nome, email, senha, telefone) VALUES("Adrieli","adrieli@gmail.com","0000", "44999999999")''',
  '''INSERT INTO usuario(nome, email, senha, telefone) VALUES("Adrieli K","adrieliK@gmail.com","0001", "44999999999")''',
  '''INSERT INTO cidade(nome, estado) VALUES("Paranavaí","PR")''',
  '''INSERT INTO cidade(nome, estado) VALUES("Nova Esperança","Paraná")''',
];
