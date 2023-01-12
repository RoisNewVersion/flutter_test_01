import 'package:flutter_testapp/bloc/bloc_3a/hitung_calculator_event.dart';
import 'package:flutter_testapp/models/calculator_model.dart';

class SimpleCalculatorRepository {
  List<CalculatorModel> calculatorList = [];
  String result = '';

  // add text field
  void addCalculatorList(CalculatorModel calculatorModel) {
    calculatorList.add(calculatorModel);
  }

  // calculate
  num calculateOperation(HitungCalculatorEvent event) {
    num result = 0;
    // validasi value not empty less then 2
    List<CalculatorModel> minNotNullValue = calculatorList.where((element) => element.value != null && element.checked).toList();
    if (minNotNullValue.length < 2) {
      throw Exception('Isian dan centang harus lebih dari satu');
    }

    // validasi jika value not epmty then check chekbox
    List<CalculatorModel> thereIsNotNull = calculatorList.where((element) => element.value != null && !element.checked).toList();
    if (thereIsNotNull.isNotEmpty) {
      // print('Tidak null ${thereIsNotNull.length.toString()}');
      throw Exception('Jangan lupa klik checkbox');
    }

    // penambahan
    if (event is OnPlusPressed) {
      result = 0;
      List<CalculatorModel> localPlusCalculatorList = calculatorList.where((element) => element.value != null).toList();
      result = localPlusCalculatorList.fold<int>(0, (previousValue, element) {
        int a = previousValue + int.parse(element.value.toString());
        // print('wewe : ${a.toString()}');
        return a;
      });
    }

    // pengurangan
    if (event is OnMinusPressed) {
      result = 0;
      // print(result);
      List<CalculatorModel> localMinusCalculatorList = calculatorList.where((element) => element.value != null).toList();
      int? kurangi = localMinusCalculatorList.map((item) => item.value).reduce((value, element) => (value! - element!));
      result = kurangi!;
      // print(result);
    }

    // perkalian
    if (event is OnMultiplyPressed) {
      result = 0;
      List<CalculatorModel> localMultiCalculatorList = calculatorList.where((element) => element.value != null).toList();
      int? kalikan = localMultiCalculatorList.map((item) => item.value).reduce((value, element) => (value! * element!));
      result = kalikan!;
    }

    // validasi pembagian tidak boleh nol
    if (event is OnDevidePressed) {
      int moreThanOneChecked = calculatorList.where((element) => element.value == 0).toList().length;
      if (moreThanOneChecked > 0) {
        throw Exception('Tidak boleh dibagi dengan angka 0');
      } else {
        result = 0;
        List<CalculatorModel> localDevideCalculatorList = calculatorList.where((element) => element.value != null).toList();
        double? bagikan = localDevideCalculatorList.map((item) => double.parse(item.value.toString())).reduce((value, element) => (value / element));
        result = bagikan;
      }
    }

    return result;
  }
}
