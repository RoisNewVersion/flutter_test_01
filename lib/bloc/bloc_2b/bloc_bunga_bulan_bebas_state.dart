abstract class BlocBungaBulanBebasState {}

class BlocBungaBulanBebasInitial extends BlocBungaBulanBebasState {
  final int defaultValue = 0;
}

class BlocBungaBulanBebasOnLoading extends BlocBungaBulanBebasState {}

class BlocBungaBulanBebasOnError extends BlocBungaBulanBebasState {
  final String pesan;

  BlocBungaBulanBebasOnError(this.pesan);
}

class BlocBungaBulanBebasOnSucces extends BlocBungaBulanBebasState {
  final List<num> result;

  BlocBungaBulanBebasOnSucces(this.result);
}
