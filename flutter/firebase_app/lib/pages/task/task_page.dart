import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    var descriptionController = TextEditingController();

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
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () async {
                      var db = FirebaseFirestore.instance;
                      var task = TaskModel(descriptionController.text, false);
                      var doc = await db.collection("tasks").add(task.toJson());
                      debugPrint(doc.id);

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Salvar"),
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Tarefas"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
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
                      Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 0,
                    itemBuilder: (BuildContext builder, int index) {
                      TaskModel task = TaskModel("teste", false);
                      return Dismissible(
                        key: Key("${task.description}-$index"),
                        onDismissed: (DismissDirection direction) async {},
                        child: ListTile(
                          title: Text(task.description),
                          trailing: Switch(
                            onChanged: (bool value) async {},
                            value: task.completed,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
