class EdadModel {
  final int edad;

  EdadModel({required this.edad});

  static String? validar(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'La edad es obligatoria';
    }
    final parsed = int.tryParse(value.trim());
    if (parsed == null) {
      return 'Solo debe aceptar números';
    }
    if (parsed < 18) {
      return 'La edad debe ser mayor o igual a 18';
    }
    return null;
  }
}