

final createTableUser = '''
  CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    email TEXT,
    peso REAL,
    altura REAL,
    url_avatar TEXT
  )
''';