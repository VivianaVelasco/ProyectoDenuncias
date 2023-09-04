import 'package:denunciasapp/domains/entities/parroquia.dart';

class ParroquiaModel {
  final int id;
  final String name;

  ParroquiaModel({required this.id, required this.name});

  factory ParroquiaModel.fromJson(Map<String, dynamic> json) => ParroquiaModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
  Parroquia toParroquiaEntity() => Parroquia(id: id, name: name);
}
