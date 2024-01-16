import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilha_inicial_app/services/state_managers/task_list_getx_controller.dart';

// ignore: must_be_immutable
class TaskGetXPage extends StatelessWidget {
  var descriptionController = TextEditingController();

  var taskListController = TaskListGetXController();

  TaskGetXPage({super.key});

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
                        taskListController.add(descriptionController.text);
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar"))
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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            const Text(
              "Tarefas GetX Store",
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
                  Obx(() {
                    return Switch(
                      value: taskListController.justNotCompleted,
                      onChanged: taskListController.setJustNotCompleted,
                    );
                  })
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: taskListController.task.length,
                  itemBuilder: (BuildContext builder, int index) {
                    var task = taskListController.task[index];
                    return Dismissible(
                      key: Key(task.id),
                      onDismissed: (DismissDirection direction) async {
                        taskListController.remove(task.id);
                      },
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                          onChanged: (bool value) async {
                            taskListController.edit(
                                task.id, task.description, value);
                          },
                          value: task.completed,
                        ),
                      ),
                    );
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
