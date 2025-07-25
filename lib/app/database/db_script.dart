import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final createTableUser = '''
  CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    sexo TEXT NOT NULL,
    nascimento TEXT NOT NULL,
    telefone TEXT,
    email TEXT,
    peso REAL,
    altura REAL,
    url_avatar TEXT
  )
''';

Future<Database> openAppDatabase() async {
  final path = join(await getDatabasesPath(), 'app.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(createTableUser);
    },
  );
}