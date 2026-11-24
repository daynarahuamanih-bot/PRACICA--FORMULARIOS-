import 'package:flutter/material.dart';
import '../models/correo_model.dart';

class Ejercicio2Screen extends StatefulWidget {
  const Ejercicio2Screen({super.key});

  @override
  State<Ejercicio2Screen> createState() => _Ejercicio2ScreenState();
}

class _Ejercicio2ScreenState extends State<Ejercicio2Screen> {
  final _formKey = GlobalKey<FormState>();
  final _correoController = TextEditingController();

  @override
  void dispose() {
    _correoController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      final dato = CorreoModel(correo: _correoController.text.trim());
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Correo registrado correctamente (${dato.correo})')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 2: Formulario de correo')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
                validator: CorreoModel.validar,
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