import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_2b/bloc_bunga_bulan_bebas_event.dart';
import 'package:flutter_testapp/bloc/bloc_2b/bloc_bunga_bulan_bebas_state.dart';
import 'package:flutter_testapp/repositories/hitung_bunga_repository.dart';

class BlocBungaBulanBebas extends Bloc<BlocBungaBulanBebasEvent, BlocBungaBulanBebasState> {
  BlocBungaBulanBebas() : super(BlocBungaBulanBebasInitial()) {
    on<OnPressedHitungBungaBebas>((event, emit) async {
      //
      final HitungBungaRepository hitungBungaRepository = HitungBungaRepository(event.nominal, event.bulan);
      emit(BlocBungaBulanBebasOnLoading());
      await Future.delayed(const Duration(seconds: 1));
      List<num> result = hitungBungaRepository.getResultCalculate();
      emit(BlocBungaBulanBebasOnSucces(result));
    });
  }
}
