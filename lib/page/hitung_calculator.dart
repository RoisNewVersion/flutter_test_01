import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testapp/bloc/bloc_3a/bloc_hitung_calculator.dart';
import 'package:flutter_testapp/bloc/bloc_3a/hitung_calculator_event.dart';
import 'package:flutter_testapp/bloc/bloc_3a/hitung_calculator_state.dart';
import 'package:flutter_testapp/models/calculator_model.dart';

class HitungCalculator extends StatefulWidget {
  const HitungCalculator({super.key});

  @override
  State<HitungCalculator> createState() => _HitungCalculatorState();
}

class _HitungCalculatorState extends State<HitungCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Calculator'),
      ),
      body: BlocProvider(
        create: (_) => BlocHitungCalculator()
          ..add(OnCalculatorInitial(CalculatorModel(null, false)))
          ..add(OnCalculatorInitial(CalculatorModel(null, false)))
          ..add(OnCalculatorInitial(CalculatorModel(null, false))),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              BlocConsumer<BlocHitungCalculator, HitungCalculatorState>(
                buildWhen: (previous, current) {
                  return current is OnInitialHitungCalculator;
                },
                builder: (context, state) {
                  if (state is OnInitialHitungCalculator) {
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
                                    context.read<BlocHitungCalculator>().add(OnChangeTextField(index, valueParsed));
                                  } else {
                                    context.read<BlocHitungCalculator>().add(OnChangeTextField(index, null));
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Checkbox(
                                value: rowData.checked,
                                onChanged: (val) {
                                  // debugPrint(val.toString());
                                  bool valueParsed = val!;
                                  context.read<BlocHitungCalculator>().add(OnChangeCheckbox(index, valueParsed));
                                },
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
                  if (state is OnErrorHitungCalculator) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.pesan),
                    ));
                  }
                },
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculator>().add(OnPlusPressed());
                        },
                        child: const Text('+'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculator>().add(OnMinusPressed());
                        },
                        child: const Text('-'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculator>().add(OnMultiplyPressed());
                        },
                        child: const Text('x'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<BlocHitungCalculator>().add(OnDevidePressed());
                        },
                        child: const Text('/'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<BlocHitungCalculator, HitungCalculatorState>(
                builder: (context, state) {
                  if (state is OnLoadingHitungCalculator) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is OnSuccessHitungCalculator) {
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
