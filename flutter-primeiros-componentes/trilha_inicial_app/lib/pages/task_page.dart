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
  var _tasks = <Task>[];
  var justNotCompleted = false;

  void fetchTasks() async {
    if (justNotCompleted) {
      _tasks = await taskRepository.listNotCompleted();
    } else {
      _tasks = await taskRepository.list();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTasks();
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
                          var task = Task(descriptionController.text, false);
                          await taskRepository.add(task);
                          Navigator.pop(context);
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
                          fetchTasks();
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
                      key: Key(task.getId()),
                      onDismissed: (DismissDirection direction) async {
                        await taskRepository.remove(task.getId());
                        fetchTasks();
                      },
                      child: ListTile(
                        title: Text(task.getDescription()),
                        trailing: Switch(
                            onChanged: (bool value) async {
                              await taskRepository.update(task.getId(), value);
                              fetchTasks();
                            },
                            value: task.isCompleted()),
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
