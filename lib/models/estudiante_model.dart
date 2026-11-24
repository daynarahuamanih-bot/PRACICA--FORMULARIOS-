class EstudianteModel {
  final String nombre;
  final String apellido;
  final String correo;

  EstudianteModel({
    required this.nombre,
    required this.apellido,
    required this.correo,
  });

  static String? validarNombre(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingrese su nombre';
    }
    return null;
  }

  static String? validarApellido(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingrese su apellido';
    }
    return null;
  }

  static String? validarCorreo(String? value) {
    if (value == null || value.trim().isEmpty || !value.contains('@')) {
      return 'Ingrese un correo válido';
    }
    return null;
  }
}