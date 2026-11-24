class NombreModel {
  final String nombre;

  NombreModel({required this.nombre});

  static String? validar(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingrese su nombre';
    }
    return null;
  }
}