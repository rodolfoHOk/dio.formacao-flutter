import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/task.dart';
import 'package:trilha_inicial_app/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var taskRepository = TaskRepository();
  var descriptionController = TextEditingController(text: "");

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
                        onPressed: () {
                          var task = Task(descriptionController.text, false);
                          debugPrint(task.getId());
                          debugPrint(task.getDescription());
                          debugPrint(task.isCompleted().toString());
                          // taskRepository.add(task);
                          Navigator.pop(context);
                        },
                        child: const Text("Adicionar"))
                  ],
                );
              });
        },
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}
