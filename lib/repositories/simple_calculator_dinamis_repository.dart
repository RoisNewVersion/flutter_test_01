import 'package:flutter_testapp/bloc/bloc_3b/hitung_calculator_dinamis_event.dart';
import 'package:flutter_testapp/models/calculator_model.dart';

class SimpleCalculatorDinamisRepository {
  List<CalculatorModel> calculatorList = [];
  String result = '';

  // add text field
  void addCalculatorList(CalculatorModel calculatorModel) {
    calculatorList.add(calculatorModel);
  }

  // remove at index row
  void removeAtIndex(int index) {
    if (calculatorList.isNotEmpty) {
      calculatorList.removeAt(index);
    }
  }

  // calculate
  num calculateOperation(HitungCalculatorBebasEvent event) {
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
    if (event is OnPlusBebasPressed) {
      result = 0;
      List<CalculatorModel> localPlusCalculatorList = calculatorList.where((element) => element.value != null).toList();
      result = localPlusCalculatorList.fold<int>(0, (previousValue, element) {
        int a = previousValue + int.parse(element.value.toString());
        // print('wewe : ${a.toString()}');
        return a;
      });
    }

    // pengurangan
    if (event is OnMinusBebasPressed) {
      result = 0;
      // print(result);
      List<CalculatorModel> localMinusCalculatorList = calculatorList.where((element) => element.value != null).toList();
      int? kurangi = localMinusCalculatorList.map((item) => item.value).reduce((value, element) => (value! - element!));
      result = kurangi!;
      // print(result);
    }

    // perkalian
    if (event is OnMultiplyBebasPressed) {
      result = 0;
      List<CalculatorModel> localMultiCalculatorList = calculatorList.where((element) => element.value != null).toList();
      int? kalikan = localMultiCalculatorList.map((item) => item.value).reduce((value, element) => (value! * element!));
      result = kalikan!;
    }

    // validasi pembagian tidak boleh nol
    if (event is OnDevideBebasPressed) {
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
