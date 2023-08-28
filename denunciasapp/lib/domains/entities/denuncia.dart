import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/domains/entities/usuario.dart';

class Denuncia {
  final int? id;
  final String title;
  final String description;
  final DateTime? createdAt;
  final Parroquia parroquia;
  final Motivo motivo;
  final Usuario usuario;
  final String urlPhoto;

  Denuncia(
      {this.id,
      required this.title,
      required this.description,
      required this.usuario,
      this.createdAt,
      required this.parroquia,
      required this.motivo,
      required this.urlPhoto});

  factory Denuncia.fromJson(Map<String, dynamic> json) => Denuncia(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        urlPhoto: json["urlPhoto"],
        motivo: Motivo.fromJson(json["motivo"]),
        usuario: Usuario.fromJson(json["usuario"]),
        parroquia: Parroquia.fromJson(json["parroquia"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "urlPhoto": urlPhoto,
        "motivo": motivo.toJson(),
        "usuario": usuario.toJson(),
        "parroquia": parroquia.toJson(),
      };
}
