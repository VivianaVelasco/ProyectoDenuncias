import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/infrastructure/models/motivo_model.dart';
import 'package:denunciasapp/infrastructure/models/parroquia_model.dart';
import 'package:denunciasapp/infrastructure/services/motivo_service.dart';
import 'package:denunciasapp/infrastructure/services/parroquia_service.dart';
import 'package:flutter/material.dart';

class DenunciasProvider extends ChangeNotifier {
  final ParroquiaService parroquiasService = ParroquiaService();
  final MotivoService motivosService = MotivoService();
  List<Parroquia> parroquias = [];
  List<Motivo> motivos = [];

  bool initialLoading = true;

  Future<void> loadMotivos() async {
    final List<Motivo> newMotivos = await motivosService.getAllMotivos();
    motivos.addAll(newMotivos);
    initialLoading = false;
    notifyListeners();
  }

  Future<void> loadParroquias() async {
    final List<Parroquia> newParroquias =
        await parroquiasService.getAllParroquias();
    parroquias.addAll(newParroquias);
    initialLoading = false;
    notifyListeners();
  }
}
