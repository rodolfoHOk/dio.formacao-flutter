import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/back4app_tasks_model.dart';
import 'package:trilha_inicial_app/repositories/back4app/back4app_task_repository.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class TaskHTTPPage extends StatefulWidget {
  const TaskHTTPPage({super.key});

  @override
  State<TaskHTTPPage> createState() => _TaskHTTPPageState();
}

class _TaskHTTPPageState extends State<TaskHTTPPage> {
  Back4AppTaskRepository back4appTaskRepository = Back4AppTaskRepository();
  var descriptionController = TextEditingController(text: "");
  Back4AppTasksModel _back4AppTasks = Back4AppTasksModel([]);
  var justNotCompleted = false;

  void getTasks() async {
    _back4AppTasks = await back4appTaskRepository.list();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Tarefas HTTP"),
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
                          // var task = TaskSQLiteModel.create(
                          //     descriptionController.text, false);
                          // taskSQLiteRepository.save(task);
                          Navigator.pop(context);
                          getTasks();
                          setState(() {});
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
      body: _back4AppTasks.tasks.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
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
                              onChanged: (bool value) {
                                justNotCompleted = value;
                                getTasks();
                                setState(() {});
                              })
                        ],
                      )),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _back4AppTasks.tasks.length,
                        itemBuilder: (BuildContext builder, int index) {
                          var task = _back4AppTasks.tasks[index];
                          return Dismissible(
                            key: Key(task.objectId.toString()),
                            onDismissed: (DismissDirection direction) async {
                              // taskSQLiteRepository.delete(task.id);
                              getTasks();
                            },
                            child: ListTile(
                              title: Text(task.description),
                              trailing: Switch(
                                  onChanged: (bool value) async {
                                    task.completed = value;
                                    // taskSQLiteRepository.update(task);
                                    getTasks();
                                  },
                                  value: task.completed),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
