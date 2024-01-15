import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/task.dart';

class TaskProviderRepository extends ChangeNotifier {
  final List<Task> _tasks = [];
  var _justNotCompleted = false;

  set justNotCompleted(bool value) {
    _justNotCompleted = value;
    notifyListeners();
  }

  bool get justNotCompleted => _justNotCompleted;

  List<Task> get tasks => _justNotCompleted
      ? _tasks.where((task) => !task.completed).toList()
      : _tasks;

  List<Task> listNotCompleted() {
    return tasks.where((task) => !task.completed).toList();
  }

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void update(String id, bool completed) {
    _tasks.where((task) => task.id == id).first.completed = completed;
    notifyListeners();
  }

  void remove(String id) {
    _tasks.remove(_tasks.where((task) => task.id == id).first);
    notifyListeners();
  }
}
