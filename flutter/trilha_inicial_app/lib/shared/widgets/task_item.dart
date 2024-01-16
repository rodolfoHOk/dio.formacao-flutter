import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilha_inicial_app/main.dart';
import 'package:trilha_inicial_app/models/task_list_store.dart';
import 'package:trilha_inicial_app/models/task_store.dart';

class TaskItem extends StatelessWidget {
  final TaskStore task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var taskListStore = getIt<TaskListStore>();
    return Observer(builder: (context) {
      return Dismissible(
        key: Key(task.id),
        onDismissed: (DismissDirection direction) async {
          taskListStore.remove(task.id);
        },
        child: ListTile(
          title: Text(task.description),
          trailing: Switch(
            onChanged: (bool value) async {
              task.completed = value;
              taskListStore.update(task.id, task.description, task.completed);
            },
            value: task.completed,
          ),
        ),
      );
    });
  }
}
