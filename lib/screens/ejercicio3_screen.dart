import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/edad_model.dart';

class Ejercicio3Screen extends StatefulWidget {
  const Ejercicio3Screen({super.key});

  @override
  State<Ejercicio3Screen> createState() => _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {
  final _formKey = GlobalKey<FormState>();
  final _edadController = TextEditingController();

  @override
  void dispose() {
    _edadController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      final dato = EdadModel(edad: int.parse(_edadController.text.trim()));
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Edad registrada correctamente (${dato.edad} años)')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 3: Registro de edad')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _edadController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(),
                ),
                validator: EdadModel.validar,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registrar,
                child: const Text('REGISTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}