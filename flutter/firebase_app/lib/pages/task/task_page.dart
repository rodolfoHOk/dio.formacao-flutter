import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var descriptionController = TextEditingController();
  var justNotCompleted = false;

  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        value: justNotCompleted,
                        onChanged: (value) {
                          justNotCompleted = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: justNotCompleted
                        ? db
                            .collection("tasks")
                            .where('completed', isEqualTo: false)
                            .snapshots()
                        : db.collection("tasks").snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView(
                              children: snapshot.data!.docs.map(
                                (doc) {
                                  var taskMap =
                                      doc.data() as Map<String, dynamic>;
                                  var task = TaskModel.fromJson(taskMap);
                                  return Dismissible(
                                    key: Key(doc.id),
                                    onDismissed:
                                        (DismissDirection direction) async {
                                      await db
                                          .collection("tasks")
                                          .doc(doc.id)
                                          .delete();
                                    },
                                    child: ListTile(
                                      title: Text(task.description),
                                      trailing: Switch(
                                        onChanged: (bool value) async {
                                          task.completed = value;
                                          await db
                                              .collection("tasks")
                                              .doc(doc.id)
                                              .update(task.toJson());
                                        },
                                        value: task.completed,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
                      var task = TaskModel(descriptionController.text, false);
                      await db.collection("tasks").add(task.toJson());
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
    );
  }
}
