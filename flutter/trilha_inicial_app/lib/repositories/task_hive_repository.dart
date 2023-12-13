import 'package:hive/hive.dart';
import 'package:trilha_inicial_app/models/task_model.dart';

class TaskHiveRepository {
  static late Box _box;

  TaskHiveRepository._create();

  static Future<TaskHiveRepository> load() async {
    if (Hive.isBoxOpen('taskModel')) {
      _box = Hive.box('taskModel');
    } else {
      _box = await Hive.openBox('taskModel');
    }
    return TaskHiveRepository._create();
  }

  void save(TaskModel taskModel) {
    _box.add(taskModel);
  }

  void update(TaskModel taskModel) {
    taskModel.save();
  }

  void remove(TaskModel taskModel) {
    taskModel.delete();
  }

  List<TaskModel> getData(bool notCompleted) {
    if (notCompleted) {
      return _box.values
          .cast<TaskModel>()
          .where((task) => task.completed == false)
          .toList();
    } else {
      return _box.values.cast<TaskModel>().toList();
    }
  }
}
