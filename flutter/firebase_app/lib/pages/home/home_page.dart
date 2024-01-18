import 'package:firebase_app/pages/chat/chat_page.dart';
import 'package:firebase_app/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var nicknameController = TextEditingController(text: "");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Firebase App"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: const CustomDrawer(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Informe seu apelido"),
              const SizedBox(height: 8),
              TextField(
                controller: nicknameController,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
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
                  } else {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ChatPage(nickname: nicknameController.text)),
                      );
                    }
                  }
                },
                child: const Text("Entrar no chat"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
