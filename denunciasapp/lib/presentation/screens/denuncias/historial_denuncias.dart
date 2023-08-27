import 'package:flutter/material.dart';

class HistorialDenunciasScreen extends StatelessWidget {
  const HistorialDenunciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Historial de Denuncias")),
        body: Text("Listar Denuncias"));
  }
}
