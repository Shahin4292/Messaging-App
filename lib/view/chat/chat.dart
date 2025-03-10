import 'package:flutter/material.dart';
import 'package:messaging_app/view/chat/widget/chat_screen_widget.dart';
import 'package:messaging_app/view/chat/widget/custom_button.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              Text(
                'Open Bottom Sheet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
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
