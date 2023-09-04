import 'package:dio/dio.dart';

class DenunciaService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://localhost:8000/api", contentType: "application/json"));

  Future<List<Map<String, dynamic>>> getRecentsDenuncias() async {
    final response = await dio.get("/denuncias/recents");
    return response.data;
  }
}
