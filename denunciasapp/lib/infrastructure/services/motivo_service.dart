import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/infrastructure/models/motivo_model.dart';
import 'package:dio/dio.dart';

class MotivoService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://localhost:8000/api", contentType: "application/json"));

  Future<List<Motivo>> getAllMotivos() async {
    final response = await dio.get("/motivos");
    final result = (response.data as List)
        .map((motivo) => MotivoModel.fromJson(motivo).toMotivoEntity())
        .toList();
    return result;
  }
}
