import 'package:firebase_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final MessageModel messageModel;
  final bool isMe;

  const ChatMessageWidget(
      {super.key, required this.messageModel, required this.isMe});

  @override
  Widget build(BuildContext context) {
    var message = messageModel;

    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isMe
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onTertiary),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(message.nickname),
            Text(message.text),
          ],
        ),
      ),
    );
  }
}
