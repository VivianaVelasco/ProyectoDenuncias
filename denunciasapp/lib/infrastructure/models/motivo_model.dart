import 'package:denunciasapp/domains/entities/motivo.dart';

class MotivoModel {
  final int id;
  final String name;

  MotivoModel({required this.id, required this.name});
  factory MotivoModel.fromJson(Map<String, dynamic> json) => MotivoModel(
        id: json["id"] ?? -1,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Motivo toMotivoEntity() => Motivo(id: id, name: name);
}
