import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilha_inicial_app/models/back4app_tasks_model.dart';

class Back4AppTaskRepository {
  Dio _dio = Dio();

  Back4AppTaskRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get("BACK4APP_API_ID");
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.get("BACK4APP_API_Key");
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<Back4AppTasksModel> list(bool justNotCompleted) async {
    var url = "/Task";
    if (justNotCompleted) {
      url = "$url?where={\"completed\": false}";
    }
    var result = await _dio.get(url);
    return Back4AppTasksModel.fromJson(result.data);
  }

  Future<void> create(Back4AppTaskModel back4appTaskModel) async {
    try {
      await _dio.post("/Task", data: back4appTaskModel.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(Back4AppTaskModel back4appTaskModel) async {
    try {
      await _dio.put("/Task/${back4appTaskModel.objectId}",
          data: back4appTaskModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String objectId) async {
    try {
      await _dio.delete("/Task/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
