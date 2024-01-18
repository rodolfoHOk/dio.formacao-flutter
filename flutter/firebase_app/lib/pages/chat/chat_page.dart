import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/message_model.dart';
import 'package:firebase_app/shared/widgets/chat_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String room;
  final String nickname;
  const ChatPage({super.key, required this.room, required this.nickname});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var textController = TextEditingController(text: "");
  var userId = "";

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    loadUserId();
    super.initState();
  }

  void loadUserId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("user_id")!;
    setState(() {});
  }

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
                  child: StreamBuilder<QuerySnapshot>(
                      stream: db.collection("chats-${widget.room}").snapshots(),
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? const CircularProgressIndicator()
                            : ListView(
                                children: snapshot.data!.docs.map((doc) {
                                  var messageMap =
                                      doc.data() as Map<String, dynamic>;
                                  var messageModel =
                                      MessageModel.fromJson(messageMap);
                                  return ChatMessageWidget(
                                      messageModel: messageModel,
                                      isMe: messageModel.userId == userId);
                                }).toList(),
                              );
                      }),
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
                      Expanded(
                          child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none),
                        style: const TextStyle(fontSize: 18),
                      )),
                      IconButton(
                        onPressed: () async {
                          if (textController.text.trim().isNotEmpty) {
                            var messageModel = MessageModel(
                                textController.text, userId, widget.nickname);
                            await db
                                .collection("chats-${widget.room}")
                                .add(messageModel.toJson());
                            textController.text = "";
                          }
                        },
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
