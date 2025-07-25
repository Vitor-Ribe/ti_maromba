import 'package:flutter/material.dart';
import '../../../res/colors.dart';
import 'steps_base.dart';

class StepWelcome extends StepBase {
  const StepWelcome({super.key, required super.ctrl, required super.onNext});

  @override
  State<StepWelcome> createState() => _StepWelcomeState();
}

class _StepWelcomeState extends State<StepWelcome> {
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
              fontSize: 35,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          // Botão de próximo
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.backgroundVariant1,
              foregroundColor: Colors.white,
              shadowColor: Colors.black38,
              elevation: 3,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              side: const BorderSide(color: Colors.black), // borda
              minimumSize: const Size(360, 50),
            ),
            onPressed: widget.onNext,
            child: const Text(
              'Próximo',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
