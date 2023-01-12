import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_3a/hitung_calculator_event.dart';
import 'package:flutter_testapp/bloc/bloc_3a/hitung_calculator_state.dart';
import 'package:flutter_testapp/repositories/simple_calculator_repository.dart';

class BlocHitungCalculator extends Bloc<HitungCalculatorEvent, HitungCalculatorState> {
  final SimpleCalculatorRepository _simpleCalculatorRepository = SimpleCalculatorRepository();

  BlocHitungCalculator() : super(OnInitialTextFieldCalculator([])) {
    //
    on<OnCalculatorInitial>((event, emit) {
      _simpleCalculatorRepository.addCalculatorList(event.calculatorModel);
      emit(OnInitialHitungCalculator(_simpleCalculatorRepository.calculatorList));
    });
    on<OnChangeTextField>((event, emit) {
      int index = event.index;
      _simpleCalculatorRepository.calculatorList[index].value = event.value;
      emit(OnInitialHitungCalculator(_simpleCalculatorRepository.calculatorList));
    });
    on<OnChangeCheckbox>((event, emit) {
      int index = event.index;
      _simpleCalculatorRepository.calculatorList[index].checked = event.value;
      emit(OnInitialHitungCalculator(_simpleCalculatorRepository.calculatorList));
    });
    // operasi penambahan
    on<OnPlusPressed>((event, emit) async {
      emit(OnLoadingHitungCalculator());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculator('Hasil kalkulasi + = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculator(e.toString()));
      }
    });

    // operasi pengurangan
    on<OnMinusPressed>((event, emit) async {
      emit(OnLoadingHitungCalculator());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculator('Hasil kalkulasi - = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculator(e.toString()));
      }
    });

    // operasi perkalian
    on<OnMultiplyPressed>((event, emit) async {
      emit(OnLoadingHitungCalculator());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculator('Hasil kalkulasi * = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculator(e.toString()));
      }
    });

    // operasi pembagian
    on<OnDevidePressed>((event, emit) async {
      emit(OnLoadingHitungCalculator());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculator('Hasil kalkulasi - = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculator(e.toString()));
      }
    });
  }
}
