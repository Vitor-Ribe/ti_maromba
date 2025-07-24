import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ti_maromba/pages/login/steps/step_welcome.dart';
import 'package:ti_maromba/res/colors.dart';
import '../../app/database/DAOs/user_dao.dart';
import '../../app/modelos/user.dart';
import 'login_controller.dart';
import 'steps/step_name.dart';
import 'steps/step_birth_gender.dart';
import 'steps/step_height.dart';
import 'steps/step_weight.dart';

class LoginStepsPage extends StatefulWidget {
  const LoginStepsPage({super.key});

  @override
  State<LoginStepsPage> createState() => _LoginStepsPageState();
}

class _LoginStepsPageState extends State<LoginStepsPage> {
  final ctrl = LoginController();
  final pageCtrl = PageController();
  int page = 0;

  void next() {
    if (page < 4) {
      pageCtrl.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
      setState(() => page++);
    } else {
      _finish();
    }
  }

  Future<void> _finish() async {
    if (!ctrl.isComplete) return;

    final user = User(
      nome: ctrl.nome,
      telefone: null,
      email: null,
      peso: ctrl.peso,
      altura: ctrl.altura,
    );
    await UserDao(await openDatabase('app.db')).insertUser(user); // ajuste se já usa helper
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fundo da pagina
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundVariant1,
              AppColors.backgroundVariant2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: PageView(
          controller: pageCtrl,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            StepWelcome(ctrl: ctrl, onNext: next),
            StepName(ctrl: ctrl, onNext: next),
            StepBirthGender(ctrl: ctrl, onNext: next),
            StepHeight(ctrl: ctrl, onNext: next),
            StepWeight(ctrl: ctrl, onNext: next),
          ],
        ),
      ),
    );
  }
}
