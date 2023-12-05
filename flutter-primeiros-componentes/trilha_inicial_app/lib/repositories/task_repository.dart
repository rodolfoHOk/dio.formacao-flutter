import 'package:trilha_inicial_app/models/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<List<Task>> list() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }

  Future<void> add(Task task) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.add(task);
  }

  Future<void> update(String id, bool completed) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.where((task) => task.getId() == id).first.setCompleted(completed);
  }
}
