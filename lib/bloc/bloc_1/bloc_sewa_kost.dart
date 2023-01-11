import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_1/sewa_kost_event.dart';
import 'package:flutter_testapp/bloc/bloc_1/sewa_kost_state.dart';
import 'package:flutter_testapp/repositories/sewa_kost_repository.dart';

// sewa kost
class BlocSewaKost extends Bloc<SewaKostEvent, SewaKoststate> {
  BlocSewaKost() : super(SewaKostInitial()) {
    on<OnPressedHitungSewa>((event, emit) async {
      final SewaKostRepository sewaKostRepository = SewaKostRepository();
      emit(SewaKostOnLoading());
      await Future.delayed(const Duration(seconds: 1));
      int? result = await sewaKostRepository.hitungSewaKost(event.hari);
      if (result == null) {
        emit(SewaKostOnError('Terjadi data null'));
      }
      if (result != null) {
        emit(SewaKostOnSucces(result));
      }
    });
  }
}
