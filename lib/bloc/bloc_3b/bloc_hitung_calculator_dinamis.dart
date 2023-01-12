import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_3b/hitung_calculator_dinamis_event.dart';
import 'package:flutter_testapp/bloc/bloc_3b/hitung_calculator_dinamis_state.dart';
import 'package:flutter_testapp/repositories/simple_calculator_dinamis_repository.dart';

class BlocHitungCalculatorBebas extends Bloc<HitungCalculatorBebasEvent, HitungCalculatorBebasState> {
  final SimpleCalculatorDinamisRepository _simpleCalculatorRepository = SimpleCalculatorDinamisRepository();

  BlocHitungCalculatorBebas() : super(OnInitialTextFieldCalculatorBebas([])) {
    //
    on<OnCalculatorBebasInitial>((event, emit) {
      _simpleCalculatorRepository.addCalculatorList(event.calculatorModel);
      emit(OnInitialHitungCalculatorBebas(_simpleCalculatorRepository.calculatorList));
    });
    on<OnChangeTextFieldBebas>((event, emit) {
      int index = event.index;
      _simpleCalculatorRepository.calculatorList[index].value = event.value;
      emit(OnInitialHitungCalculatorBebas(_simpleCalculatorRepository.calculatorList));
    });
    on<OnChangeCheckboxBebas>((event, emit) {
      int index = event.index;
      _simpleCalculatorRepository.calculatorList[index].checked = event.value;
      emit(OnInitialHitungCalculatorBebas(_simpleCalculatorRepository.calculatorList));
    });
    on<OnDeleteRowBebas>((event, emit) {
      int index = event.index;
      _simpleCalculatorRepository.removeAtIndex(index);
      emit(OnInitialHitungCalculatorBebas(_simpleCalculatorRepository.calculatorList));
    });

    // operasi penambahan
    on<OnPlusBebasPressed>((event, emit) async {
      emit(OnLoadingHitungCalculatorBebas());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculatorBebas('Hasil kalkulasi + = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculatorBebas(e.toString()));
      }
    });

    // operasi pengurangan
    on<OnMinusBebasPressed>((event, emit) async {
      emit(OnLoadingHitungCalculatorBebas());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculatorBebas('Hasil kalkulasi - = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculatorBebas(e.toString()));
      }
    });

    // operasi perkalian
    on<OnMultiplyBebasPressed>((event, emit) async {
      emit(OnLoadingHitungCalculatorBebas());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculatorBebas('Hasil kalkulasi * = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculatorBebas(e.toString()));
      }
    });

    // operasi pembagian
    on<OnDevideBebasPressed>((event, emit) async {
      emit(OnLoadingHitungCalculatorBebas());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        num result = _simpleCalculatorRepository.calculateOperation(event);
        emit(OnSuccessHitungCalculatorBebas('Hasil kalkulasi - = ${result.toString()}'));
      } on Exception catch (e) {
        // print(e.toString());
        emit(OnErrorHitungCalculatorBebas(e.toString()));
      }
    });
  }
}
