import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/domains/entities/usuario.dart';
import 'package:denunciasapp/infrastructure/models/motivo_model.dart';
import 'package:denunciasapp/infrastructure/models/parroquia_model.dart';
import 'package:denunciasapp/infrastructure/models/usuario_model.dart';

class DenunciaModel {
  final int id;
  final String title;
  final String description;
  final String createdAt;
  final ParroquiaModel parroquia;
  final MotivoModel motivo;
  final UsuarioModel usuario;
  final String urlPhoto;

  DenunciaModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.usuario,
      required this.createdAt,
      required this.parroquia,
      required this.motivo,
      required this.urlPhoto});

  factory DenunciaModel.fromJson(Map<String, dynamic> json) {
    return DenunciaModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      createdAt: json["createdAt"],
      urlPhoto: json["urlPhoto"],
      motivo: MotivoModel.fromJson(json["motivo"]),
      usuario: UsuarioModel.fromJson(json["usuario"]),
      parroquia: ParroquiaModel.fromJson(json["parroquia"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt,
        "urlPhoto": urlPhoto,
        "motivo": motivo.toJson(),
        "usuario": usuario.toJson(),
        "parroquia": parroquia.toJson(),
      };

  Denuncia toDenunciaEntity() => Denuncia(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      usuario: Usuario(email: usuario.email, names: usuario.names, id: id),
      parroquia: Parroquia(name: parroquia.name, id: id),
      motivo: Motivo(name: motivo.name, id: id),
      urlPhoto: urlPhoto);
}
