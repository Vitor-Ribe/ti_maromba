import 'package:flutter/material.dart';
import 'steps_base.dart';

class StepWelcome extends StepBase {
  const StepWelcome({super.key, required super.ctrl, required super.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // mascote
          Image.asset(
            'assets/images/mascot/mascote1.png',
            width: 400,
            height: 400,
          ),

          // Boas-vindas
          const Text(
              'Bem-Vindo(a) ao TI Maromba',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              )
          ),
          ElevatedButton(onPressed: onNext, child: const Text('Próximo'))
      ]),
    );
  }
}
