import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilha_inicial_app/models/back4app_tasks_model.dart';

class Back4AppTaskRepository {
  Future<Back4AppTasksModel> list() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get("BACK4APP_API_ID");
    dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.get("BACK4APP_API_Key");
    var result = await dio.get("https://parseapi.back4app.com/classes/Task");
    return Back4AppTasksModel.fromJson(result.data);
  }
}
