import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_2a/bloc_bunga_6bulan.dart';
import 'package:flutter_testapp/bloc/bloc_2a/bloc_bunga_6bulan_event.dart';
import 'package:flutter_testapp/bloc/bloc_2a/bloc_bunga_6bulan_state.dart';

class HitungBunga6Bulan extends StatefulWidget {
  const HitungBunga6Bulan({super.key});

  @override
  State<HitungBunga6Bulan> createState() => _HitungBunga6BulanState();
}

class _HitungBunga6BulanState extends State<HitungBunga6Bulan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nominalController = TextEditingController();

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung bunga 6 bulan'),
      ),
      body: BlocProvider(
        create: (_) => BlocBunga6Bulan(),
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
                    TextFormField(
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<BlocBunga6Bulan, BlocBunga6Bulanstate>(builder: (context, state) {
                if (state is BlocBunga6BulanOnLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                //
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // passing input
                      int valueInput = int.parse(_nominalController.text);
                      context.read<BlocBunga6Bulan>().add(OnPressedHitungBunga(valueInput));
                    }
                  },
                  child: const Text('Simpan'),
                );
              }),
              const SizedBox(height: 50),
              BlocBuilder<BlocBunga6Bulan, BlocBunga6Bulanstate>(builder: (context, state) {
                if (state is BlocBunga6BulanOnLoading) {
                  return const Center(
                    child: Text('Loading data....'),
                  );
                }
                //
                if (state is BlocBunga6BulanOnSucces) {
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
