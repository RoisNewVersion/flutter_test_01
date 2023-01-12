abstract class BlocBunga6Bulanstate {}

class BlocBunga6BulanInitial extends BlocBunga6Bulanstate {
  final int defaultValue = 0;
}

class BlocBunga6BulanOnLoading extends BlocBunga6Bulanstate {}

class BlocBunga6BulanOnError extends BlocBunga6Bulanstate {
  final String pesan;

  BlocBunga6BulanOnError(this.pesan);
}

class BlocBunga6BulanOnSucces extends BlocBunga6Bulanstate {
  final List<num> result;

  BlocBunga6BulanOnSucces(this.result);
}
