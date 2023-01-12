import 'package:flutter_testapp/models/calculator_model.dart';

abstract class HitungCalculatorBebasState {}

class OnInitialTextFieldCalculatorBebas extends HitungCalculatorBebasState {
  final List<CalculatorModel> calculatorModel;

  OnInitialTextFieldCalculatorBebas(this.calculatorModel);
}

class OnInitialHitungCalculatorBebas extends HitungCalculatorBebasState {
  final List<CalculatorModel> calculatorModel;

  OnInitialHitungCalculatorBebas(this.calculatorModel);
}

class OnLoadingHitungCalculatorBebas extends HitungCalculatorBebasState {}

class OnErrorHitungCalculatorBebas extends HitungCalculatorBebasState {
  final String pesan;

  OnErrorHitungCalculatorBebas(this.pesan);
}

class OnSuccessHitungCalculatorBebas extends HitungCalculatorBebasState {
  final String pesan;

  OnSuccessHitungCalculatorBebas(this.pesan);
}
