import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/task_model.dart';
import 'package:trilha_inicial_app/repositories/task_hive_repository.dart';

class TaskHivePage extends StatefulWidget {
  const TaskHivePage({super.key});

  @override
  State<TaskHivePage> createState() => _TaskHivePageState();
}

class _TaskHivePageState extends State<TaskHivePage> {
  late TaskHiveRepository taskHiveRepository;
  var descriptionController = TextEditingController(text: "");
  var _tasks = <TaskModel>[];
  var justNotCompleted = false;

  void getTasks() async {
    taskHiveRepository = await TaskHiveRepository.load();
    _tasks = taskHiveRepository.getData(justNotCompleted);
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
                          var task = TaskModel.create(
                              descriptionController.text, false);
                          taskHiveRepository.save(task);
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
                      key: Key(task.id),
                      onDismissed: (DismissDirection direction) async {
                        taskHiveRepository.remove(task);
                        getTasks();
                      },
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                            onChanged: (bool value) async {
                              task.completed = value;
                              taskHiveRepository.update(task);
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
