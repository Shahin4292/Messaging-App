import 'package:flutter/material.dart';

class ChatInboxScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(sender: "Alpha PBX (W)", text: "447710173736", time: "1 month ago", unreadCount: 4),
    Message(sender: "Alpha PBX (W)", text: "447710173736 😕", time: "1 month ago", unreadCount: 4),
    Message(sender: "Mithun", text: "This message was deleted", time: "2 months ago", isDeleted: true),
    Message(sender: "Abu Talha", text: "Please rate the conversation", time: "2 months ago"),
    Message(sender: "John Doe", text: "hm, msg asche, reply o kora jacche...", time: "7 months ago"),
    Message(sender: "John Doe", text: "📷 Picture message", time: "7 months ago"),
  ];

  ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          return ListTile(
            leading: CircleAvatar(
              child: msg.sender.startsWith("Alpha")
                  ? Icon(Icons.business, color: Colors.white)
                  : Text(msg.sender[0]),
              backgroundColor: Colors.blue,
            ),
            title: Text(
              msg.sender,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              msg.isDeleted ? "🚫 Message deleted" : msg.text,
              style: TextStyle(color: msg.isDeleted ? Colors.red : Colors.black),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(msg.time, style: TextStyle(fontSize: 12, color: Colors.grey)),
                if (msg.unreadCount > 0)
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blue,
                    child: Text("${msg.unreadCount}", style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
              ],
            ),
            onTap: () {
              // Navigate to chat screen
            },
          );
        },
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final String time;
  final bool isDeleted;
  final int unreadCount;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    this.isDeleted = false,
    this.unreadCount = 0,
  });
}
