import 'package:flutter/material.dart';
import 'steps_base.dart';

class StepBirthGender extends StepBase {
  const StepBirthGender({super.key, required super.ctrl, required super.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Data de nascimento', style: TextStyle(fontSize: 24)),
      ElevatedButton(
          onPressed: () async {
            final d = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (d != null) ctrl.nascimento = d;
          },
          child: const Text('Escolher data')),
      const SizedBox(height: 24),
      const Text('Sexo', style: TextStyle(fontSize: 24)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _radio('M', 'Masculino'),
        _radio('F', 'Feminino'),
        _radio('O', 'Outro'),
      ]),
      ElevatedButton(onPressed: onNext, child: const Text('Próximo'))
    ]);
  }

  Widget _radio(String value, String label) => Row(children: [
    Radio<String>(
      value: value,
      groupValue: ctrl.sexo,
      onChanged: (v) => ctrl.sexo = v ?? '',
    ),
    Text(label)
  ]);
}
