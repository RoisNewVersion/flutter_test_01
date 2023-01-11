abstract class SewaKostEvent {}

class OnPressedHitungSewa extends SewaKostEvent {
  final int hari;

  OnPressedHitungSewa(this.hari);
}
