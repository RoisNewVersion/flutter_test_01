import 'package:flutter_testapp/models/calculator_model.dart';

abstract class HitungCalculatorEvent {
  HitungCalculatorEvent();
}

class OnCalculatorInitial extends HitungCalculatorEvent {
  final CalculatorModel calculatorModel;

  OnCalculatorInitial(this.calculatorModel);
}

class OnChangeTextField extends HitungCalculatorEvent {
  final int index;
  final int value;

  OnChangeTextField(this.index, this.value);
}

class OnChangeCheckbox extends HitungCalculatorEvent {
  final int index;
  final bool value;

  OnChangeCheckbox(this.index, this.value);
}

class OnPlusPressed extends HitungCalculatorEvent {}

class OnMinusPressed extends HitungCalculatorEvent {}

class OnMultiplyPressed extends HitungCalculatorEvent {}

class OnDevidePressed extends HitungCalculatorEvent {}
