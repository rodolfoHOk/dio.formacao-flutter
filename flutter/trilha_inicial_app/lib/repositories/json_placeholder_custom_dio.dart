import 'package:dio/dio.dart';

class JsonPlaceholderCustomDio {
  final Dio _dio = Dio();

  JsonPlaceholderCustomDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }

  Dio get dio => _dio;
}
