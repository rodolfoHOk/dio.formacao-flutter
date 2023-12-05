import 'package:trilha_inicial_app/models/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<List<dynamic>> list() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }

  void add(Task task) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.add(task);
  }

  void update(String id, bool completed) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.where((task) => task.getId() == id).first.setCompleted(completed);
  }
}
