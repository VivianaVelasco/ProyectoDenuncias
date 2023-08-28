class Motivo {
  final int? id;
  final String name;

  Motivo({this.id, required this.name});

  factory Motivo.fromJson(Map<String, dynamic> json) => Motivo(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
