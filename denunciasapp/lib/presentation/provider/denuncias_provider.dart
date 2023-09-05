import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/infrastructure/services/denuncia_service.dart';
import 'package:denunciasapp/infrastructure/services/motivo_service.dart';
import 'package:denunciasapp/infrastructure/services/parroquia_service.dart';
import 'package:flutter/material.dart';

class DenunciasProvider extends ChangeNotifier {
  final ParroquiaService parroquiasService = ParroquiaService();
  final MotivoService motivosService = MotivoService();
  final DenunciaService denunciasService = DenunciaService();
  List<Parroquia> parroquias = [];
  List<Motivo> motivos = [];
  List<Denuncia> denuncias = [];
  List<Denuncia> denunciasUsuario = [];

  final int usuarioId = 2;

  bool initialLoading = true;
  int statusCodeRequest = 0;

  Future<void> loadMotivos() async {
    initialLoading = true;
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

  Future<void> getRecentsDenuncias() async {
    initialLoading = true;
    final List<Denuncia> newDenuncias = await denunciasService.getRecents();
    initialLoading = false;
    denuncias = [...newDenuncias];
    notifyListeners();
  }

  Future<void> createDenuncia(Map<String, dynamic> data) async {
    initialLoading = true;
    final statusCode = await denunciasService.registerDenuncia(data);
    statusCodeRequest = statusCode;
    initialLoading = false;
    await getRecentsDenuncias();
    await getDenunciaByUsuario(usuarioId);
    notifyListeners();
  }

  Future<void> editDenuncia(Map<String, dynamic> data, int idDenuncia) async {
    initialLoading = true;
    final int statusCode =
        await denunciasService.editDenunciaById(data, idDenuncia);
    statusCodeRequest = statusCode;
    initialLoading = false;
    await getDenunciaByUsuario(usuarioId);
    await getRecentsDenuncias();
    notifyListeners();
  }

  Future<void> deleteDenuncia(int idDenuncia) async {
    initialLoading = true;
    final int statusCode =
        await denunciasService.deleteDenunciaById(idDenuncia);
    statusCodeRequest = statusCode;
    initialLoading = false;
    print(denunciasUsuario);
    await getDenunciaByUsuario(usuarioId);
    print(denunciasUsuario);
    await getRecentsDenuncias();
    notifyListeners();
  }

  Future<Denuncia> getDenunciaById(int idDenuncia) async {
    initialLoading = true;
    final Denuncia denunciaResult = await denunciasService.getById(idDenuncia);
    initialLoading = false;
    return denunciaResult;
  }

  Future<List<Denuncia>> getDenunciaByFilters(
      int idParroquia, int idDenuncia) async {
    initialLoading = true;
    final List<Denuncia> denunciasResult =
        await denunciasService.getByFilter(idParroquia, idDenuncia);
    initialLoading = false;
    notifyListeners();
    return denunciasResult;
  }

  Future<void> getDenunciaByUsuario(int idUsuario) async {
    initialLoading = true;
    final List<Denuncia> denunciasResult =
        await denunciasService.getByUsuario(idUsuario);
    denunciasUsuario = [...denunciasResult];
    initialLoading = false;
    notifyListeners();
  }
}
