import 'package:flutter/material.dart';
import 'package:flutter_testapp/page/hitung_bunga_6bulan.dart';
import 'package:flutter_testapp/page/hitung_bunga_bulan_bebas.dart';
import 'package:flutter_testapp/page/hitung_calculator.dart';
import 'package:flutter_testapp/page/hitung_sewa_kost.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HitungSewaKost()),
                    );
                  },
                  child: const Text('Go to Soal 1')),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HitungBunga6Bulan()),
                  );
                },
                child: const Text('Go to Soal 2A'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HitungBungaBulanBebas()),
                    );
                  },
                  child: const Text('Go to Soal 2B')),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HitungCalculator()),
                  );
                },
                child: const Text('Go to Soal 3A'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
