import 'package:trilha_inicial_app/models/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<List<Task>> list() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks;
  }

  Future<List<Task>> listNotCompleted() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((task) => !task.isCompleted()).toList();
  }

  Future<void> add(Task task) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(task);
  }

  Future<void> update(String id, bool completed) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((task) => task.getId() == id).first.setCompleted(completed);
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((task) => task.getId() == id).first);
  }
}
