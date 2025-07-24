import 'package:flutter/material.dart';
import '../../../res/colors.dart';
import 'steps_base.dart';

class StepBirthGender extends StepBase {
  const StepBirthGender({super.key, required super.ctrl, required super.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // Texto
        const Text(
          'Qual a sua data\nde nascimento?',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white70,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center
        ),

        const SizedBox(height: 25),

        // Escolher data
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey.shade700,
            foregroundColor: Colors.white,
            shadowColor: Colors.black38,
            elevation: 3,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            side: BorderSide(color: Colors.black), // borda
            minimumSize: Size(200, 50),
          ),
          onPressed: () async {
            final d = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (d != null) ctrl.nascimento = d;
          },
          child: const Text(
            'Escolher data',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center
          )
        ),


        const SizedBox(height: 80),


        // Texto
        const Text(
          'Qual o seu sexo?',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white70,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center
        ),

        const SizedBox(height: 25),

        // Opções
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 20),
          child: Column(
            children: [
              _radio('M', 'Masculino'),
              _radio('F', 'Feminino'),
              _radio('O', 'Outro'),
            ]
          ),
        ),


        const SizedBox(height: 80),

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
    );
  }

  Widget _radio(String value, String label) => Row(children: [
    Radio<String>(
      value: value,
      groupValue: ctrl.sexo,
      onChanged: (v) => ctrl.sexo = v ?? '',
    ),


    Text(
      label,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 18
      ),
    )
  ]);
}
