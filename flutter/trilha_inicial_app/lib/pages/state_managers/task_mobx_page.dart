import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilha_inicial_app/main.dart';
import 'package:trilha_inicial_app/models/task_list_store.dart';
import 'package:trilha_inicial_app/shared/widgets/task_item.dart';

// ignore: must_be_immutable
class TaskMobXPage extends StatelessWidget {
  var descriptionController = TextEditingController(text: "");

  var taskListStore = getIt<TaskListStore>();

  TaskMobXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descriptionController.text = "";
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Adicionar tarefa"),
                content: TextField(
                  controller: descriptionController,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar")),
                  TextButton(
                      onPressed: () async {
                        taskListStore.add(descriptionController.text);
                        Navigator.pop(context);
                      },
                      child: const Text("Adicionar"))
                ],
              );
            },
          );
        },
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            const Text(
              "Tarefas MobX Store",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 24, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluídos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Observer(
                    builder: (_) {
                      return Switch(
                        value: taskListStore.justNotCompleted.value,
                        onChanged: taskListStore.setJustNotCompleted,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: taskListStore.getTasks().length,
                  itemBuilder: (BuildContext builder, int index) {
                    var task = taskListStore.getTasks()[index];
                    return TaskItem(task: task);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
