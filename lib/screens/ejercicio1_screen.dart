import 'package:flutter/material.dart';
import '../models/nombre_model.dart';

class Ejercicio1Screen extends StatefulWidget {
  const Ejercicio1Screen({super.key});

  @override
  State<Ejercicio1Screen> createState() => _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      final dato = NombreModel(nombre: _nombreController.text.trim());
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Registro exitoso (${dato.nombre})')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 1: Formulario de nombres')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese su nombre',
                  border: OutlineInputBorder(),
                ),
                validator: NombreModel.validar,
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