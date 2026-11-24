import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/dni_model.dart';

class Ejercicio4Screen extends StatefulWidget {
  const Ejercicio4Screen({super.key});

  @override
  State<Ejercicio4Screen> createState() => _Ejercicio4ScreenState();
}

class _Ejercicio4ScreenState extends State<Ejercicio4Screen> {
  final _formKey = GlobalKey<FormState>();
  final _dniController = TextEditingController();

  @override
  void dispose() {
    _dniController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      final dato = DniModel(dni: _dniController.text.trim());
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('DNI registrado correctamente (${dato.dni})')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 4: Registro de DNI')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _dniController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 8,
                decoration: const InputDecoration(
                  labelText: 'Número de DNI',
                  border: OutlineInputBorder(),
                ),
                validator: DniModel.validar,
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