import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/task_sqlite_model.dart';
import 'package:trilha_inicial_app/repositories/sqlite/task_sqlite_repository.dart';

class TaskSQLitePage extends StatefulWidget {
  const TaskSQLitePage({super.key});

  @override
  State<TaskSQLitePage> createState() => _TaskSQLitePageState();
}

class _TaskSQLitePageState extends State<TaskSQLitePage> {
  TaskSQLiteRepository taskSQLiteRepository = TaskSQLiteRepository();
  var descriptionController = TextEditingController(text: "");
  var _tasks = <TaskSQLiteModel>[];
  var justNotCompleted = false;

  void getTasks() async {
    _tasks = await taskSQLiteRepository.getData(justNotCompleted);
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
                          var task = TaskSQLiteModel.create(
                              descriptionController.text, false);
                          taskSQLiteRepository.save(task);
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
      body: Container(
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
                  itemCount: _tasks.length,
                  itemBuilder: (BuildContext builder, int index) {
                    var task = _tasks[index];
                    return Dismissible(
                      key: Key(task.id.toString()),
                      onDismissed: (DismissDirection direction) async {
                        taskSQLiteRepository.delete(task.id);
                        getTasks();
                      },
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                            onChanged: (bool value) async {
                              task.completed = value;
                              taskSQLiteRepository.update(task);
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
