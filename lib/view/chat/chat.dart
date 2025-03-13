import 'package:flutter/material.dart';
import 'package:messaging_app/view/chat/widget/chat_screen_widget.dart';
import 'package:messaging_app/view/chat/widget/custom_button.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Conversation",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          CustomButton(),
          Divider(height: 1, color: Colors.grey.shade300),
          Expanded(child: ChatWidget()),
        ],
      ),
    );
  }
}
