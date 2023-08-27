import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';

class Denuncia {
  final int? id;
  final String title;
  final String description;
  final DateTime? createdAt;
  final Parroquia parroquia;
  final Motivo motivo;

  Denuncia(this.createdAt, this.parroquia, this.motivo,
      {this.id, required this.title, required this.description});
}
