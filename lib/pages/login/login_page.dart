import 'package:flutter/material.dart';
import 'package:ti_maromba/res/colors.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Text('Tela de Login', style: TextStyle(color: Colors.white, fontSize: 40),),
        )
    );
  }
}