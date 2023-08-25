class Denuncia {
  final int? id;
  final String title;
  final String description;
  final DateTime? createdAt;

  Denuncia(this.createdAt,
      {this.id, required this.title, required this.description});
}
