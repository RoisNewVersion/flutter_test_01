class HitungBungaRepository {
  int input;
  int defaultLoop;
  HitungBungaRepository(this.input, this.defaultLoop);
  /* int _input = 100000; //default value input
  int get input => _input;
  set setInput(int value) {
    _input = value;
  }

  int _defaultLoop = 6; // default loop
  int get defaultLoop => _defaultLoop;
  set setDefaultLoop(int value) {
    _defaultLoop = value;
  } */

  // list untuk menampung hasil
  List<num> tampungHasil = [];

  // define constan
  final int _potongan2persen = 1500;
  final int _potongan3persen = 2000;
  final int _potongan4persen = 2500;
  final int _potongan5persen = 3000;

  // get data terakhir
  num _getLastValue() {
    if (tampungHasil.isEmpty) {
      return input;
    } else {
      return tampungHasil.last;
    }
  }

  // menghitung berdasarkan persen
  num calculatePersen() {
    num lastValue = _getLastValue();
    num tempVar = 0;

    // bunga 2%
    if (lastValue >= 100000 && lastValue <= 500000) {
      // nilai + bunga - potongan
      tempVar += lastValue + ((lastValue * 2 / 100) - _potongan2persen);
      tampungHasil.add(tempVar);
    }

    // bunga 3%
    if (lastValue > 500000 && lastValue <= 10000000) {
      // nilai + bunga - potongan
      tempVar += lastValue + ((lastValue * 3 / 100) - _potongan3persen);
      tampungHasil.add(tempVar);
    }

    // bunga 4%
    if (lastValue > 10000000 && lastValue <= 50000000) {
      // nilai + bunga - potongan
      tempVar += lastValue + ((lastValue * 4 / 100) - _potongan4persen);
      tampungHasil.add(tempVar);
    }

    // bunga 5%
    if (lastValue > 50000000) {
      // nilai + bunga - potongan
      tempVar += lastValue + ((lastValue * 5 / 100) - _potongan5persen);
      tampungHasil.add(tempVar);
    }

    return tempVar;
  }

  // get final result
  List<num> getResultCalculate() {
    for (int i = 1; i <= defaultLoop; i++) {
      // print(calculatePersen());
      calculatePersen();
    }

    return tampungHasil;
  }
}
