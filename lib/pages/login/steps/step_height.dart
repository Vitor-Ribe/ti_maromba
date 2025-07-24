import 'package:flutter/material.dart';
import 'steps_base.dart';

class StepHeight extends StepBase {
  const StepHeight({super.key, required super.ctrl, required super.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Altura (m)', style: TextStyle(fontSize: 24)),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (v) => ctrl.altura = double.tryParse(v) ?? 0,
          ),
        ),
        ElevatedButton(onPressed: onNext, child: const Text('Próximo'))
      ]),
    );
  }
}
