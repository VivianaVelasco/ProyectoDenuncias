import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/domains/entities/usuario.dart';

class Denuncia {
  final int id;
  final String title;
  final String description;
  final String createdAt;
  final Parroquia parroquia;
  final Motivo motivo;
  final Usuario usuario;
  final String urlPhoto;

  Denuncia(
      {required this.id,
      required this.title,
      required this.description,
      required this.usuario,
      required this.createdAt,
      required this.parroquia,
      required this.motivo,
      required this.urlPhoto});
}
