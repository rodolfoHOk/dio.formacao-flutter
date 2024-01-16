import 'package:get/get.dart';
import 'package:trilha_inicial_app/models/task.dart';

class TaskListGetXController extends GetxController {
  // ignore: prefer_final_fields
  RxList<Task> _tasks = <Task>[].obs;
  // ignore: prefer_final_fields
  RxBool _justNotCompleted = false.obs;

  List<Task> get task => _justNotCompleted.value
      ? _tasks.where((element) => !element.completed).toList().obs
      : _tasks.toList().obs;

  bool get justNotCompleted => _justNotCompleted.value;
  void setJustNotCompleted(bool value) {
    _justNotCompleted.value = value;
  }

  void add(String description) {
    _tasks.add(Task(description, false));
  }

  void edit(String id, String description, bool completed) {
    var task = _tasks.firstWhere((element) => element.id == id);
    task.description = description;
    task.completed = completed;
    _tasks.refresh();
  }

  void remove(String id) {
    _tasks.removeWhere((element) => element.id == id);
  }
}
