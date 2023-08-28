import 'package:denunciasapp/domains/entities/usuario.dart';

class UsuarioModel {
  final int? id;
  final String names;
  final String email;
  final String? phoneNumber;
  final String? cedula;
  final DateTime? birthDay;
  final DateTime? createdAt;

  UsuarioModel({
    required this.names,
    required this.email,
    this.phoneNumber,
    this.cedula,
    this.id,
    this.birthDay,
    this.createdAt,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        names: json["names"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "names": names,
        "email": email,
      };

  Usuario toUsuarioEntity() => Usuario(id: id, names: names, email: email);
}
