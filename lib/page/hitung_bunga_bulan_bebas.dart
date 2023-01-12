import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_2b/bloc_bunga_bulan_bebas.dart';
import 'package:flutter_testapp/bloc/bloc_2b/bloc_bunga_bulan_bebas_event.dart';
import 'package:flutter_testapp/bloc/bloc_2b/bloc_bunga_bulan_bebas_state.dart';

class HitungBungaBulanBebas extends StatefulWidget {
  const HitungBungaBulanBebas({super.key});

  @override
  State<HitungBungaBulanBebas> createState() => _HitungBungaBulanBebasState();
}

class _HitungBungaBulanBebasState extends State<HitungBungaBulanBebas> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _bulanController = TextEditingController();

  @override
  void dispose() {
    _nominalController.dispose();
    _bulanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung bunga bulan dinamis'),
      ),
      body: BlocProvider(
        create: (_) => BlocBungaBulanBebas(),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            controller: _nominalController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Tidak boleh kosong';
                              }
                              if (!(int.parse(value) >= 100000)) {
                                return 'Isian harus lebih dari Rp100.000';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Masukan nominal'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: _bulanController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Tidak boleh kosong';
                              }
                              if (!(int.parse(value) > 1 && int.parse(value) <= 12)) {
                                return 'Isian harus antara bulan 1 sampai 12';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Masukan bulan'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<BlocBungaBulanBebas, BlocBungaBulanBebasState>(builder: (context, state) {
                if (state is BlocBungaBulanBebasOnLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                //
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // passing input
                      int valueNominal = int.parse(_nominalController.text);
                      int valueBulan = int.parse(_bulanController.text);
                      context.read<BlocBungaBulanBebas>().add(OnPressedHitungBungaBebas(valueNominal, valueBulan));
                    }
                  },
                  child: const Text('Simpan'),
                );
              }),
              const SizedBox(height: 50),
              BlocBuilder<BlocBungaBulanBebas, BlocBungaBulanBebasState>(builder: (context, state) {
                if (state is BlocBungaBulanBebasOnLoading) {
                  return const Center(
                    child: Text('Loading data....'),
                  );
                }
                //
                if (state is BlocBungaBulanBebasOnSucces) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.result.length,
                    itemBuilder: (context, index) {
                      num data = state.result[index];
                      return Text('Hasil bulan ke ${index + 1} : ${data.toString()}');
                    },
                  );
                }
                //
                return const Center(
                  child: Text('Hasil akan tampil disini'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
