import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_2a/bloc_bunga_6bulan_event.dart';
import 'package:flutter_testapp/bloc/bloc_2a/bloc_bunga_6bulan_state.dart';
import 'package:flutter_testapp/repositories/hitung_bunga_repository.dart';

class BlocBunga6Bulan extends Bloc<BlocBunga6BulanEvent, BlocBunga6Bulanstate> {
  BlocBunga6Bulan() : super(BlocBunga6BulanInitial()) {
    on<OnPressedHitungBunga>((event, emit) async {
      final HitungBungaRepository hitungBungaRepository = HitungBungaRepository(event.nominal, 6);
      emit(BlocBunga6BulanOnLoading());
      await Future.delayed(const Duration(seconds: 1));
      List<num> result = hitungBungaRepository.getResultCalculate();
      emit(BlocBunga6BulanOnSucces(result));
    });
  }
}
