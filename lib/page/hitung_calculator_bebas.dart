import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_3b/bloc_hitung_calculator_dinamis.dart';
import 'package:flutter_testapp/bloc/bloc_3b/hitung_calculator_dinamis_event.dart';
import 'package:flutter_testapp/bloc/bloc_3b/hitung_calculator_dinamis_state.dart';
import 'package:flutter_testapp/models/calculator_model.dart';

class HitungCalculatorBebas extends StatefulWidget {
  const HitungCalculatorBebas({super.key});

  @override
  State<HitungCalculatorBebas> createState() => _HitungCalculatorBebas();
}

class _HitungCalculatorBebas extends State<HitungCalculatorBebas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Calculator Dinamis'),
      ),
      body: BlocProvider(
        create: (_) => BlocHitungCalculatorBebas()
          ..add(OnCalculatorBebasInitial(CalculatorModel(null, false)))
          ..add(OnCalculatorBebasInitial(CalculatorModel(null, false))),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<BlocHitungCalculatorBebas, HitungCalculatorBebasState>(
                buildWhen: (previous, current) {
                  return current is OnInitialHitungCalculatorBebas;
                },
                builder: (context, state) {
                  if (state is OnInitialHitungCalculatorBebas) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.calculatorModel.length,
                      itemBuilder: (context, index) {
                        final rowData = state.calculatorModel[index];
                        return Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: TextFormField(
                                initialValue: rowData.value != null ? rowData.value.toString() : '',
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(labelText: 'Masukan angka'),
                                onChanged: (val) {
                                  if (val != '') {
                                    int valueParsed = int.parse(val);
                                    context.read<BlocHitungCalculatorBebas>().add(OnChangeTextFieldBebas(index, valueParsed));
                                  } else {
                                    context.read<BlocHitungCalculatorBebas>().add(OnChangeTextFieldBebas(index, null));
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Checkbox(
                                value: rowData.checked,
                                onChanged: (val) {
                                  // debugPrint(val.toString());
                                  bool valueParsed = val!;
                                  context.read<BlocHitungCalculatorBebas>().add(OnChangeCheckboxBebas(index, valueParsed));
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                onPressed: () {
                                  context.read<BlocHitungCalculatorBebas>().add(OnDeleteRowBebas(index));
                                },
                                child: const Text('Hapus'),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  }
                  return Container();
                },
                listener: (context, state) {
                  if (state is OnErrorHitungCalculatorBebas) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.pesan),
                    ));
                  }
                },
              ),
              const SizedBox(height: 20),
              Builder(
                builder: ((context) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<BlocHitungCalculatorBebas>().add(OnCalculatorBebasInitial(CalculatorModel(null, false)));
                    },
                    child: const Text('Tambah Field'),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculatorBebas>().add(OnPlusBebasPressed());
                        },
                        child: const Text('+'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculatorBebas>().add(OnMinusBebasPressed());
                        },
                        child: const Text('-'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculatorBebas>().add(OnMultiplyBebasPressed());
                        },
                        child: const Text('x'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculatorBebas>().add(OnDevideBebasPressed());
                        },
                        child: const Text('/'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<BlocHitungCalculatorBebas, HitungCalculatorBebasState>(
                builder: (context, state) {
                  if (state is OnLoadingHitungCalculatorBebas) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is OnSuccessHitungCalculatorBebas) {
                    return Text(state.pesan);
                  }
                  return const Text('Hasil 0');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
