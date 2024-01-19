import 'package:firebase_app/pages/chat/chat_page.dart';
import 'package:firebase_app/pages/example/example_page.dart';
import 'package:firebase_app/pages/task/task_page.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var roomController = TextEditingController(text: "");
    var nicknameController = TextEditingController(text: "");

    final remoteConfig = FirebaseRemoteConfig.instance;

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
                MaterialPageRoute(
                  builder: (_) => const TaskPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("Chat"),
            onTap: () {
              roomController.text = "";
              nicknameController.text = "";
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Wrap(
                      runSpacing: 24,
                      children: [
                        Wrap(
                          children: [
                            const Text("Informe nome da sala"),
                            TextField(
                              controller: roomController,
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Text(remoteConfig.getString("CHAT_TEXT")),
                            TextField(
                              controller: nicknameController,
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          if (roomController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Nome da sala não pode estar em branco",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                            return;
                          }
                          if (nicknameController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Nickname não pode estar em branco",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                            return;
                          }
                          if (context.mounted) {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatPage(
                                      room: roomController.text,
                                      nickname: nicknameController.text)),
                            );
                          }
                        },
                        child: const Text("Entrar no chat"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text("Crashlytics"),
            onTap: () {
              throw Exception();
            },
          ),
        ],
      ),
    );
  }
}
