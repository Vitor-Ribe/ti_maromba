// Classe que modela o usuário
class User {
  int? id;
  String nome;
  String? telefone;
  String? email;
  double? peso;
  double? altura;
  String? urlAvatar;

  // Construtor
  User({
    required this.nome,
    this.telefone,
    this.email,
    this.peso,
    this.altura,
    this.urlAvatar
  });

  // Mapeamento para o banco de dados (Coluna a ser inserida, valor a ser inserido)
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'peso': peso,
      'altura': altura,
      'url_avatar': urlAvatar,
    };
  }


}