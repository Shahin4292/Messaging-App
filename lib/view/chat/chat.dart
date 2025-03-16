import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/view/chat/widget/chat_screen_widget.dart';
import 'package:messaging_app/view/chat/widget/custom_button.dart';

import '../../viewModel/chat_controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        actions: [
          SizedBox(width: 20),
          Text(
            "Conversation",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "InterB"),
          ),
          Expanded(
            child: ListView(
              children:
                  chatController.messages.isNotEmpty
                      ? [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "(${chatController.messages.last.id.toString()})",
                            style: TextStyle(fontSize: 15),
                          ), // Show only the last item
                        ),
                      ]
                      : [],
            ),
          ),
        ],
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
