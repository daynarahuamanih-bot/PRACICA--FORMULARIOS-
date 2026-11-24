class CorreoModel {
  final String correo;

  CorreoModel({required this.correo});

  static String? validar(String? value) {
    final texto = value?.trim() ?? '';
    if (texto.isEmpty || !texto.contains('@')) {
      return 'Ingrese un correo válido (debe contener @)';
    }
    return null;
  }
}