import 'package:flutter_testapp/models/calculator_model.dart';

abstract class HitungCalculatorBebasEvent {
  HitungCalculatorBebasEvent();
}

class OnCalculatorBebasInitial extends HitungCalculatorBebasEvent {
  final CalculatorModel calculatorModel;

  OnCalculatorBebasInitial(this.calculatorModel);
}

class OnChangeTextFieldBebas extends HitungCalculatorBebasEvent {
  final int index;
  final int? value;

  OnChangeTextFieldBebas(this.index, this.value);
}

class OnChangeCheckboxBebas extends HitungCalculatorBebasEvent {
  final int index;
  final bool value;

  OnChangeCheckboxBebas(this.index, this.value);
}

class OnDeleteRowBebas extends HitungCalculatorBebasEvent {
  final int index;

  OnDeleteRowBebas(this.index);
}

class OnPlusBebasPressed extends HitungCalculatorBebasEvent {}

class OnMinusBebasPressed extends HitungCalculatorBebasEvent {}

class OnMultiplyBebasPressed extends HitungCalculatorBebasEvent {}

class OnDevideBebasPressed extends HitungCalculatorBebasEvent {}
