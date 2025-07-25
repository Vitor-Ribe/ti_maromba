class User {
  int? id;
  String nome;
  String? telefone;
  DateTime nascimento;  // DateTime aqui
  String sexo;
  String? email;
  double? peso;
  double? altura;
  String? urlAvatar;

  User({
    this.id,
    required this.nome,
    this.telefone,
    required this.nascimento,
    required this.sexo,
    this.email,
    this.peso,
    this.altura,
    this.urlAvatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'nascimento': nascimento.toIso8601String(), // salva como string ISO
      'sexo': sexo,
      'email': email,
      'peso': peso,
      'altura': altura,
      'url_avatar': urlAvatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String?,
      nascimento: DateTime.parse(map['nascimento'] as String), // converte string para DateTime
      sexo: map['sexo'] as String,
      email: map['email'] as String?,
      peso: map['peso'] != null ? (map['peso'] as num).toDouble() : null,
      altura: map['altura'] != null ? (map['altura'] as num).toDouble() : null,
      urlAvatar: map['url_avatar'] as String?,
    );
  }
}
