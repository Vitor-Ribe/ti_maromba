import 'package:flutter/material.dart';
import '../login_controller.dart';

typedef OnNext = void Function();

abstract class StepBase extends StatelessWidget {
  final LoginController ctrl;
  final OnNext onNext;
  const StepBase({required this.ctrl, required this.onNext, super.key});
}
