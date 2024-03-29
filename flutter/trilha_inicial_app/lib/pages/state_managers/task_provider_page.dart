import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilha_inicial_app/models/task.dart';
import 'package:trilha_inicial_app/repositories/state_managers/task_provider_repository.dart';

// ignore: must_be_immutable
class TaskProviderPage extends StatelessWidget {
  var descriptionController = TextEditingController(text: "");

  TaskProviderPage({super.key});

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
                        Provider.of<TaskProviderRepository>(context,
                                listen: false)
                            .add(Task(descriptionController.text, false));
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
              "Tarefas Provider",
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
                  Consumer<TaskProviderRepository>(
                      builder: (_, taskRepository, widget) {
                    return Switch(
                      value: taskRepository.justNotCompleted,
                      onChanged: (bool value) {
                        Provider.of<TaskProviderRepository>(context,
                                listen: false)
                            .justNotCompleted = value;
                      },
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: Consumer<TaskProviderRepository>(
                  builder: (_, taskRepository, widget) {
                return ListView.builder(
                  itemCount: taskRepository.tasks.length,
                  itemBuilder: (BuildContext builder, int index) {
                    var task = taskRepository.tasks[index];
                    return Dismissible(
                      key: Key(task.id),
                      onDismissed: (DismissDirection direction) async {
                        Provider.of<TaskProviderRepository>(context,
                                listen: false)
                            .remove(task.id);
                      },
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                          onChanged: (bool value) async {
                            task.completed = value;
                            Provider.of<TaskProviderRepository>(context,
                                    listen: false)
                                .update(task.id, task.completed);
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
