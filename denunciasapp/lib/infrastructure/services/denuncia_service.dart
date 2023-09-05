import 'package:denunciasapp/config/utils/params_denuncias.dart';
import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:denunciasapp/infrastructure/models/denuncia_model.dart';
import 'package:dio/dio.dart';

class DenunciaService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://localhost:8000/api", contentType: "application/json"));

  Future<List<Denuncia>> getRecentsDenuncias() async {
    final response = await dio.get("/denuncias/recents");
    final denunciasResult = (response.data as List)
        .map((denuncia) => DenunciaModel.fromJson(denuncia).toDenunciaEntity())
        .toList();
    return denunciasResult;
  }

  Future<Denuncia> getById(int idDenuncia) async {
    final response = await dio.get("/denuncias/$idDenuncia");
    final denunciaResult =
        DenunciaModel.fromJson(response.data).toDenunciaEntity();
    return denunciaResult;
  }

  Future<List<Denuncia>> getByFilter(int idParroquia, int idMotivo) async {
    String params =
        ParamsDenuncias(idParroquia: idParroquia, idMotivo: idMotivo)
            .getParams();
    final response = await dio.get("/denuncias/filter?$params");
    final denunciasResult = (response.data as List)
        .map((denuncia) => DenunciaModel.fromJson(denuncia).toDenunciaEntity())
        .toList();
    return denunciasResult;
  }

  Future<List<Denuncia>> getByUsuario(int idUsuario) async {
    final response = await dio.get("/denuncias/usuario/$idUsuario");
    final denunciasResult = (response.data as List)
        .map((denuncia) => DenunciaModel.fromJson(denuncia).toDenunciaEntity())
        .toList();
    return denunciasResult;
  }

  Future<int> registerDenuncia(Map<String, dynamic> data) async {
    final response = await dio.post("/denuncias", data: data);
    return response.statusCode ?? 500;
  }

  Future<int> editDenunciaById(
      Map<String, dynamic> data, int idDenuncia) async {
    final response = await dio.put("/denuncias/$idDenuncia", data: data);
    return response.statusCode ?? 500;
  }

  Future<int> deleteDenunciaById(int idDenuncia) async {
    final response = await dio.delete("/denuncias/$idDenuncia");
    return response.statusCode ?? 500;
  }
}
