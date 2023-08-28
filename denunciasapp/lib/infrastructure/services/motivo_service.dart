import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/infrastructure/models/motivo_model.dart';
import 'package:dio/dio.dart';

class MotivoService {
  final Dio dio = Dio();
  final String baseUrl = "http://localhost:8000/api";

  Future<List<Motivo>> getAllMotivos() async {
    final response = await dio.get("$baseUrl/motivos");
    print(response.data
        .map((motivo) => MotivoModel.fromJson(motivo).toMotivoEntity())
        .toList());
    final result = response.data
        .map((motivo) => MotivoModel.fromJson(motivo).toMotivoEntity())
        .toList() as List<Motivo>;
    print(result);
    return result;
  }
}
