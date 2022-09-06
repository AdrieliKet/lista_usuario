final criarBanco = [
  '''
    CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    telefone TEXT NOT NULL,
    cidade_id INTERGER NOT NULL,
    FOREIGN KEY(cidade_id) REFERENCES cidade(id)
    )''',
    '''INSERT INTO usuario(nome, email, senha, telefone, cidade_id) VALUES("Adrieli","adrieli@gmail.com","0000", "44999999999", 1)''',
    '''INSERT INTO usuario(nome, email, senha, telefone, cidade_id) VALUES("Adrieli K","adrieliK@gmail.com","0001", "44999999999", 1)''',
  '''
    CREATE TABLE cidade (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    estado TEXT NOT NULL
    )''',
    '''INSERT INTO cidade(nome, estado) VALUES("Paranavaí","Paraná")''',

];
