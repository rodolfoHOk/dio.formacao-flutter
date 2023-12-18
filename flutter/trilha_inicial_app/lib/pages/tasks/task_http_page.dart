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
  var descriptionController = TextEditingController(text: "");
  Back4AppTaskRepository back4appTaskRepository = Back4AppTaskRepository();
  Back4AppTasksModel _back4AppTasks = Back4AppTasksModel([]);
  var justNotCompleted = false;
  var isLoading = false;

  void getTasks() async {
    setState(() {
      isLoading = true;
    });
    _back4AppTasks = await back4appTaskRepository.list(justNotCompleted);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Future<void> createTask(BuildContext context) async {
    var task = Back4AppTaskModel.create(descriptionController.text, false);
    await back4appTaskRepository.create(task);
    if (context.mounted) Navigator.of(context).pop(context);
    getTasks();
    setState(() {});
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
                        onPressed: () => createTask(context),
                        child: const Text("Adicionar"))
                  ],
                );
              });
        },
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: isLoading
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
                            key: Key(task.objectId),
                            onDismissed: (DismissDirection direction) async {
                              await back4appTaskRepository
                                  .delete(task.objectId);
                              getTasks();
                            },
                            child: ListTile(
                              title: Text(task.description),
                              trailing: Switch(
                                  onChanged: (bool value) async {
                                    task.completed = value;
                                    await back4appTaskRepository.update(task);
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
