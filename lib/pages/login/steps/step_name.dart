import 'package:flutter/material.dart';
import '../../../res/colors.dart';
import 'steps_base.dart';

class StepName extends StepBase {
  const StepName({super.key, required super.ctrl, required super.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Qual seu nome?',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white70,
              fontWeight: FontWeight.bold
            )
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: TextField(
              style: TextStyle(
                color: Colors.white70
              ),
              decoration: InputDecoration(
                hintText: 'Digite seu nome aqui'
              ),
              autofocus: true,
              onChanged: (v) => ctrl.nome = v,
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
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              side: BorderSide(color: Colors.black), // borda
              minimumSize: Size(310, 50),
            ),
            onPressed: onNext,
            child: const Text(
              'Próximo',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70
              ),
            )
          )
        ]
      ),
    );
  }
}
