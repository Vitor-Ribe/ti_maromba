import 'package:flutter/material.dart';
import '../../../res/colors.dart';
import 'steps_base.dart';

class StepName extends StepBase {
  const StepName({super.key, required super.ctrl, required super.onNext});

  @override
  State<StepName> createState() => _StepNameState();
}

class _StepNameState extends State<StepName> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Qual seu nome?',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          TextField(
            style: const TextStyle(color: Colors.white70),
            decoration: const InputDecoration(
              hintText: 'Digite seu nome aqui',
              hintStyle: TextStyle(color: Colors.white38),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white24),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
            ),
            autofocus: true,
            onChanged: (v) => widget.ctrl.nome = v,
          ),

          const SizedBox(height: 60),

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
              side: const BorderSide(color: Colors.black),
              minimumSize: const Size(310, 50),
            ),
            onPressed: widget.onNext,
            child: const Text(
              'Próximo',
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
