class Usuario {
  final int? id;
  final String names;
  final String email;
  final String phoneNumber;
  final String cedula;
  final DateTime? birthDay;
  final DateTime? createdAt;

  Usuario({
    required this.names,
    required this.email,
    required this.phoneNumber,
    required this.cedula,
    this.id,
    this.birthDay,
    this.createdAt,
  });
}
