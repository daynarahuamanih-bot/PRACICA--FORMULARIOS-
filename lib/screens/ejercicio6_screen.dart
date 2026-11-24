import 'package:flutter/material.dart';
import '../models/estudiante_model.dart';

class Ejercicio6Screen extends StatefulWidget {
  const Ejercicio6Screen({super.key});

  @override
  State<Ejercicio6Screen> createState() => _Ejercicio6ScreenState();
}

class _Ejercicio6ScreenState extends State<Ejercicio6Screen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _correoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _correoController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      EstudianteModel(
        nombre: _nombreController.text.trim(),
        apellido: _apellidoController.text.trim(),
        correo: _correoController.text.trim(),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Estudiante registrado exitosamente')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 6: Formulario de estudiante')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: EstudianteModel.validarNombre,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                ),
                validator: EstudianteModel.validarApellido,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
                validator: EstudianteModel.validarCorreo,
              ),
              const SizedBox(height: 24),
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