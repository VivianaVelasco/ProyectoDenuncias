import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/domains/entities/usuario.dart';
import 'package:denunciasapp/presentation/provider/denuncias_provider.dart';
import 'package:flutter/material.dart';

class DenunciaScreen extends StatefulWidget {
  final int id;

  const DenunciaScreen({super.key, required this.id});

  @override
  State<DenunciaScreen> createState() => _DenunciaScreenState();
}

class _DenunciaScreenState extends State<DenunciaScreen> {
  final DenunciasProvider denunciasProvider = DenunciasProvider();
  Denuncia denuncia = Denuncia(
      id: -1,
      title: "",
      description: "",
      usuario: Usuario(id: 2, names: "", email: ""),
      parroquia: Parroquia(id: 3, name: ""),
      motivo: Motivo(id: 2, name: ""),
      createdAt: "",
      urlPhoto: "");

  @override
  void initState() {
    super.initState();
    denunciasProvider
        .getDenunciaById(widget.id)
        .then((Denuncia denunciaRes) => denuncia = denunciaRes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Denuncias con id ${denuncia.id}"));
  }
}
