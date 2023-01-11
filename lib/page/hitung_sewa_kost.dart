import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_1/bloc_sewa_kost.dart';
import 'package:flutter_testapp/bloc/bloc_1/sewa_kost_event.dart';
import 'package:flutter_testapp/bloc/bloc_1/sewa_kost_state.dart';
import 'package:flutter_testapp/helper/number_format_currency.dart';

class HitungSewaKost extends StatefulWidget {
  const HitungSewaKost({super.key});

  @override
  State<HitungSewaKost> createState() => _HitungSewaKostState();
}

class _HitungSewaKostState extends State<HitungSewaKost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hariController = TextEditingController();

  @override
  void dispose() {
    _hariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung sewa kost'),
      ),
      body: BlocProvider<BlocSewaKost>(
        create: (_) => BlocSewaKost(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _hariController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tidak boleh kosong';
                    }
                    if (!(int.parse(value) >= 1 && int.parse(value) <= 365)) {
                      return 'Isian antara 1 sampai 365';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Masukan jumlah hari'),
                ),
                const SizedBox(height: 10),
                BlocConsumer<BlocSewaKost, SewaKoststate>(
                  builder: (context, state) {
                    if (state is SewaKostOnLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // passing input
                            int valueInput = int.parse(_hariController.text);
                            context.read<BlocSewaKost>().add(OnPressedHitungSewa(valueInput));
                          }
                        },
                        child: const Text('Go'));
                  },
                  listener: (context, state) {
                    if (state is SewaKostOnError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.pesan),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 50),
                BlocBuilder<BlocSewaKost, SewaKoststate>(
                  builder: (context, state) {
                    if (state is SewaKostOnError) {
                      return const Text('Terjadi Error...');
                    }

                    if (state is SewaKostInitial) {
                      return Text('Hasilnya : ${CurrencyFormat.convertToIdr(state.defaultValue, 0)}');
                    }

                    if (state is SewaKostOnSucces) {
                      return Text('Hasilnya : ${CurrencyFormat.convertToIdr(state.result, 0)}');
                    }

                    return const Text('Menunggu...');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
