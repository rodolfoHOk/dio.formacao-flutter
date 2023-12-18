import 'package:trilha_inicial_app/models/back4app_tasks_model.dart';
import 'package:trilha_inicial_app/repositories/back4app/back4app_custom_dio.dart';

class Back4AppTaskRepository {
  final Back4AppCustomDio _customDio = Back4AppCustomDio();

  Back4AppTaskRepository();

  Future<Back4AppTasksModel> list(bool justNotCompleted) async {
    var url = "/Task";
    if (justNotCompleted) {
      url = "$url?where={\"completed\": false}";
    }
    var result = await _customDio.dio.get(url);
    return Back4AppTasksModel.fromJson(result.data);
  }

  Future<void> create(Back4AppTaskModel back4appTaskModel) async {
    try {
      await _customDio.dio
          .post("/Task", data: back4appTaskModel.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(Back4AppTaskModel back4appTaskModel) async {
    try {
      await _customDio.dio.put("/Task/${back4appTaskModel.objectId}",
          data: back4appTaskModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String objectId) async {
    try {
      await _customDio.dio.delete("/Task/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
