class LoginController {
  String nome = '';
  DateTime? nascimento;
  String sexo = '';
  double altura = 0;
  double peso = 0;

  bool get isComplete =>
      nome.isNotEmpty && nascimento != null && sexo.isNotEmpty && altura > 0 && peso > 0;
}
