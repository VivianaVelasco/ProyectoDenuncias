import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/infrastructure/models/parroquia_model.dart';
import 'package:dio/dio.dart';

class ParroquiaService {
  final Dio dio = Dio();
  final String baseUrl = "http://localhost:8000/api";

  Future<List<Parroquia>> getAllParroquias() async {
    final response = await dio.get("$baseUrl/parroquias");
    final List<Parroquia> result = response.data
        .map((parroquia) =>
            ParroquiaModel.fromJson(parroquia).toParroquiaEntity())
        .toList() as List<Parroquia>;
    print(result);
    return result;
  }
}
