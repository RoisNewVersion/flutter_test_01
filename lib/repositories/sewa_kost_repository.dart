import 'package:flutter/foundation.dart';

class SewaKostRepository {
  int hargaFinal = 0;

  int monthly = 30;
  int weekly = 7;
  int daily = 1;

  int monthlyFee = 180000;
  int weeklyFee = 50000;
  int dailyFee = 10000;

  Future<void> _hitungHari(int paramInput) async {
    // variable sisa bagi
    int sisaKurang = paramInput;
    // cek paling tinggi dahulu
    if (sisaKurang >= monthly) {
      // lebih dari sama dengan 30 (bulan)
      hargaFinal += monthlyFee;
      sisaKurang = sisaKurang - monthly;
      if (kDebugMode) {
        print('sisa hari kurang bulan : ${sisaKurang.toString()}');
      }
    } else if (sisaKurang >= weekly && sisaKurang < monthly) {
      // cek mingguan
      hargaFinal += weeklyFee;
      sisaKurang = sisaKurang - weekly;
      if (kDebugMode) {
        print('sisa hari mingguan : ${sisaKurang.toString()}');
      }
    } else if (sisaKurang >= daily && sisaKurang < weekly) {
      // cek harian
      hargaFinal += (dailyFee * sisaKurang);
      if (kDebugMode) {
        print('sisa hari harian : ${sisaKurang.toString()}');
      }
      sisaKurang = 0;
    } else {
      sisaKurang = 0;
    }

    if (sisaKurang == 0) {
      return;
    }

    // recursive
    _hitungHari(sisaKurang);
  }

  Future<int?> hitungSewaKost(int hari) async {
    // cek validasi input >=1 && <= 365
    if (!(hari >= 1 && hari <= 365)) {
      return Future.value(null);
    }

    // lakukan perhitungan recursive
    await _hitungHari(hari);

    return Future.value(hargaFinal);
  }
}
