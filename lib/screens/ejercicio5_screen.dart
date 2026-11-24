import 'package:flutter/material.dart';
import '../models/password_model.dart';

class Ejercicio5Screen extends StatefulWidget {
  const Ejercicio5Screen({super.key});

  @override
  State<Ejercicio5Screen> createState() => _Ejercicio5ScreenState();
}

class _Ejercicio5ScreenState extends State<Ejercicio5Screen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      PasswordModel(password: _passwordController.text);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Contraseña registrada correctamente')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 5: Registro de contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: PasswordModel.validar,
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