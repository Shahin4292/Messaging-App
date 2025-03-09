import 'package:flutter/material.dart';

class ChatInboxScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(sender: "Alpha PBX (W)", text: "447710173736", time: "1 month ago", unreadCount: 4),
    Message(sender: "Alpha PBX (W)", text: "447710173736 😕", time: "1 month ago", unreadCount: 4),
    Message(sender: "Mithun", text: "This message was deleted", time: "2 months ago", isDeleted: true, avatar: "https://via.placeholder.com/150"),
    Message(sender: "Abu Talha", text: "Please rate the conversation", time: "2 months ago"),
    Message(sender: "John Doe", text: "hm, msg asche, reply o kora jacche...", time: "7 months ago"),
    Message(sender: "John Doe", text: "📷 Picture message", time: "7 months ago"),
  ];

  ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return _buildMessageTile(messages[index]);
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 10,
            child: Text("1", style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
          SizedBox(width: 8),
          Text("Mine", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ],
      ),
      actions: [
        _buildFilterButton("All"),
        _buildFilterButton("All inboxes"),
        _buildFilterButton("Sort: Latest", icon: Icons.sort),
      ],
    );
  }

  Widget _buildFilterButton(String text, {IconData? icon}) {
    return TextButton.icon(
      onPressed: () {},
      icon: icon != null ? Icon(icon, size: 18, color: Colors.black) : SizedBox.shrink(),
      label: Text(text, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildMessageTile(Message msg) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: msg.sender.contains("Alpha") ? Colors.blue : Colors.grey,
          child: msg.avatar != null
              ? ClipOval(child: Image.network(msg.avatar!, fit: BoxFit.cover))
              : Text(msg.sender[0], style: TextStyle(color: Colors.white)),
        ),
        title: Text(msg.sender, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(
          msg.isDeleted ? "🚫 Message deleted" : msg.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: msg.isDeleted ? Colors.red : Colors.black),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg.time, style: TextStyle(fontSize: 12, color: Colors.grey)),
            if (msg.unreadCount > 0)
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: Text("${msg.unreadCount}", style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
          ],
        ),
        onTap: () {
          // Navigate to chat details
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
  final String? avatar;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    this.isDeleted = false,
    this.unreadCount = 0,
    this.avatar,
  });
}
