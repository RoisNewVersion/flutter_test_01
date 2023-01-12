import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jkController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();
  final TextEditingController _pendidikanController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _jkController.dispose();
    _umurController.dispose();
    _noTelpController.dispose();
    _pendidikanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validasi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaController,
                    validator: ValidationBuilder().required().minLength(5).build(),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'nama'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    validator: ValidationBuilder().required().email().build(),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'email'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _jkController,
                    validator: (value) {
                      if (value == 'pria' || value == 'wanita') {
                        return null;
                      }
                      return 'Hanya boleh diisi pria atau wanita saja';
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'jenis kelamin'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _umurController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tidak boleh kosong';
                      }
                      int parsedValue = int.parse(value);

                      if (parsedValue >= 10 && parsedValue <= 100) {
                        return null;
                      }
                      return 'Hanya boleh diisi antara 10 sampai 100 saja';
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'umur'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _noTelpController,
                    validator: ValidationBuilder().required().phone().minLength(9).maxLength(14).build(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'no Telepon'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _pendidikanController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }

                      if (value.length < 5) {
                        return 'Harus lebih dari 5 karakter';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'pendidikan'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 30,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
