abstract class SewaKoststate {
  SewaKoststate();
}

class SewaKostInitial extends SewaKoststate {
  final int defaultValue = 0;
}

class SewaKostOnLoading extends SewaKoststate {}

class SewaKostOnError extends SewaKoststate {
  final String pesan;

  SewaKostOnError(this.pesan);
}

class SewaKostOnSucces extends SewaKoststate {
  final int result;

  SewaKostOnSucces(this.result);
}
