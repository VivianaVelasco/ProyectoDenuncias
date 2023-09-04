class Usuario {
  final int id;
  final String names;
  final String email;
  final String? phoneNumber;
  final String? cedula;
  final DateTime? birthDay;
  final DateTime? createdAt;

  Usuario({
    required this.names,
    required this.email,
    this.phoneNumber,
    this.cedula,
    required this.id,
    this.birthDay,
    this.createdAt,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        names: json["names"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "names": names,
        "email": email,
      };
}
