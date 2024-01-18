import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String nickname;
  const ChatPage({super.key, required this.nickname});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: const [],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                          child: TextField(
                        decoration:
                            InputDecoration(focusedBorder: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
