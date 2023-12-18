import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilha_inicial_app/repositories/back4app/back4app_dio_interceptor.dart';

class Back4AppCustomDio {
  final _dio = Dio();

  Back4AppCustomDio() {
    _dio.options.baseUrl = dotenv.get("BACK4APP_BASE_URL");
    _dio.interceptors.add(Back4AppDioInterceptor());
  }

  Dio get dio => _dio;
}
