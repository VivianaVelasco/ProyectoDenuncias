import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/infrastructure/models/parroquia_model.dart';
import 'package:dio/dio.dart';

class ParroquiaService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://localhost:8000/api", contentType: "application/json"));

  Future<List<Parroquia>> getAllParroquias() async {
    final response = await dio.get("/parroquias");
    final List<Parroquia> result = (response.data as List)
        .map((parroquia) =>
            ParroquiaModel.fromJson(parroquia).toParroquiaEntity())
        .toList();
    print(result);
    return result;
  }
}
