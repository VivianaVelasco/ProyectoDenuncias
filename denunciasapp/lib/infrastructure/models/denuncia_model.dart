import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';

class DenunciaModel {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final Parroquia parroquia;
  final Motivo motivo;

  DenunciaModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.parroquia,
      required this.motivo});
}
