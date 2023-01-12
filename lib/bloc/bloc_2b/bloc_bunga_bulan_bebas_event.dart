abstract class BlocBungaBulanBebasEvent {}

class OnPressedHitungBungaBebas extends BlocBungaBulanBebasEvent {
  final int nominal;
  final int bulan;

  OnPressedHitungBungaBebas(this.nominal, this.bulan);
}
