final  criarBanco = ['''
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
    )'''
    ]
  ;

