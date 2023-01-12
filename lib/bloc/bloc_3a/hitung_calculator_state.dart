import 'package:flutter_testapp/models/calculator_model.dart';

abstract class HitungCalculatorState {}

class OnInitialTextFieldCalculator extends HitungCalculatorState {
  final List<CalculatorModel> calculatorModel;

  OnInitialTextFieldCalculator(this.calculatorModel);
}

class OnInitialHitungCalculator extends HitungCalculatorState {
  final List<CalculatorModel> calculatorModel;

  OnInitialHitungCalculator(this.calculatorModel);
}

class OnLoadingHitungCalculator extends HitungCalculatorState {}

class OnErrorHitungCalculator extends HitungCalculatorState {
  final String pesan;

  OnErrorHitungCalculator(this.pesan);
}

class OnSuccessHitungCalculator extends HitungCalculatorState {
  final String pesan;

  OnSuccessHitungCalculator(this.pesan);
}
