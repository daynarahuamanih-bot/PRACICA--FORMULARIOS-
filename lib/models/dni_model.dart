class DniModel {
  final String dni;

  DniModel({required this.dni});

  static String? validar(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length != 8) {
      return 'DNI incorrecto';
    }
    return null;
  }
}