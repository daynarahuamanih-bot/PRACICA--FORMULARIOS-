class PasswordModel {
  final String password;

  PasswordModel({required this.password});

  static String? validar(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }
}