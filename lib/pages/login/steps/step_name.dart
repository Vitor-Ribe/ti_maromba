import 'package:flutter/material.dart';
import 'steps_base.dart';

class StepName extends StepBase {
  const StepName({super.key, required super.ctrl, required super.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Seu nome', style: TextStyle(fontSize: 24)),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            autofocus: true,
            onChanged: (v) => ctrl.nome = v,
          ),
        ),
        ElevatedButton(onPressed: onNext, child: const Text('Próximo'))
      ]),
    );
  }
}
