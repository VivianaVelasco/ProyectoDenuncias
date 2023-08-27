import 'package:flutter/material.dart';

class DenunciaScreen extends StatefulWidget {
  final int id;

  const DenunciaScreen({super.key, required this.id});

  @override
  State<DenunciaScreen> createState() => _DenunciaScreenState();
}

class _DenunciaScreenState extends State<DenunciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("Denuncias con id ${widget.id}");
  }
}
