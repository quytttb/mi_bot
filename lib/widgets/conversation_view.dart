import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import 'message_bubble.dart';

class ConversationView extends StatelessWidget {
  final List<ChatMessage> messages;

  const ConversationView({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(
          isUser: message.isUser,
          text: message.text,
          animate: !message.isUser && index == messages.length - 1,
        );
      },
    );
  }
}