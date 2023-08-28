class Parroquia {
  final int? id;
  final String name;

  Parroquia({this.id, required this.name});

  factory Parroquia.fromJson(Map<String, dynamic> json) => Parroquia(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
