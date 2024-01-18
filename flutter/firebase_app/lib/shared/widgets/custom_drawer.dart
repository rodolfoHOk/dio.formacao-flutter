import 'package:firebase_app/pages/example/example_page.dart';
import 'package:firebase_app/pages/task/task_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.verified),
            title: const Text("Exemplo"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ExamplePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Tarefas"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TaskPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
