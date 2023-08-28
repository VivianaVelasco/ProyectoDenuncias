import 'package:dio/dio.dart';

class DenunciaService {
  final Dio dio = Dio();
  final String baseUrl = "http://localhost:8000/api";

  Future<List<Map<String, dynamic>>> getRecentsDenuncias() async {
    final response = await dio.get("$baseUrl/denuncias/recents");
    return response.data;
  }
}
