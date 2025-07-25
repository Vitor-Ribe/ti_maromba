import 'package:sqflite/sqflite.dart';
import '../../modelos/user.dart';

class UserDao {
  final Database db; // variavel que representará a conexao ativa com o banco

  UserDao(this.db); // Recebe a instância do banco de dados

  // Método_ para inserir um usuário
  Future<int> insertUser(User user) async {
    return await db.insert(
        'user', // nome da tabela
        user.toMap(), // dados convertidos para Map
        conflictAlgorithm: ConflictAlgorithm
            .replace // substitui se id duplicado
    );
  }

  // Buscar o primeiro usuário cadastrado
  Future<User?> getFirstUser() async {
    final maps = await db.query('user', limit: 1);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  // Opcional: buscar todos os usuários
  Future<List<User>> getAllUsers() async {
    final maps = await db.query('user');
    return maps.map((map) => User.fromMap(map)).toList();
  }
}