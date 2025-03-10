import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage {
  final int id;
  final String sender;
  final String message;
  final String timestamp;
  final bool isDeleted;
  final bool isReply;
  final IconData? icon;
  final IconData? additionalIcon;
  final String? additionalText;
  final String? imageUrl;

  ChatMessage({
    required this.id,
    required this.sender,
    required this.message,
    required this.timestamp,
    this.isDeleted = false,
    this.isReply = false,
    this.icon,
    this.additionalIcon,
    this.additionalText,
    this.imageUrl,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      sender: json['sender'],
      message: json['message'],
      timestamp: json['timestamp'],
      isDeleted: json['isDeleted'] ?? false,
      isReply: json['isReply'] ?? false,
      icon:
          json['icon'] != null
              ? IconData(json['icon'], fontFamily: 'MaterialIcons')
              : null,
      additionalIcon:
          json['additionalIcon'] != null
              ? IconData(json['additionalIcon'], fontFamily: 'MaterialIcons')
              : null,
      additionalText: json['additionalText'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'message': message,
      'timestamp': timestamp,
      'isDeleted': isDeleted,
      'isReply': isReply,
      'icon': icon?.codePoint,
      'additionalIcon': additionalIcon?.codePoint,
      'additionalText': additionalText,
      'imageUrl': imageUrl,
    };
  }
}

class ChatWidget extends StatelessWidget {
  final List<ChatMessage> messages = [
    ChatMessage(
      id: 1,
      sender: "41374568",
      message: "📩",
      timestamp: "about 1 month ago",
      // icon: Icons.email,
      additionalIcon: CupertinoIcons.chat_bubble_text,
      additionalText: "Alpha PBX (W)",
    ),
    ChatMessage(
      id: 2,
      sender: "Mithun",
      message: "This message was deleted",
      timestamp: "about 2 months ago",
      isDeleted: true,
      additionalIcon: Icons.warning,
      additionalText: "Alpha PBX (W)",
      imageUrl: "assets/icons/image.PNG",
    ),
    ChatMessage(
      id: 3,
      sender: "Abu Talha",
      message: "Please rate the conversation",
      timestamp: "2 months ago",
      additionalIcon: Icons.star,
      additionalText: "Feedback Requested",
    ),
    ChatMessage(
      id: 4,
      sender: "John Doe",
      message: "Picture message",
      timestamp: "7 months ago",
      // icon: Icons.image,
      additionalIcon: Icons.photo,
      additionalText: "Image Sent",
      // imageUrl: "assets/icons/image.PNG",
    ),
    ChatMessage(
      id: 5,
      sender: "John Doe",
      message: "Picture message",
      timestamp: "7 months ago",
      icon: Icons.image_not_supported_outlined,
      additionalIcon: Icons.photo,
      additionalText: "Image Sent",
      // imageUrl: "assets/icons/image.PNG",
    ),
    ChatMessage(
      id: 6,
      sender: "John Doe",
      message: "Picture message",
      timestamp: "7 months ago",
      // icon: Icons.image,
      additionalIcon: Icons.photo,
      additionalText: "Image Sent",
      // imageUrl: "assets/icons/image.PNG",
    ),
    ChatMessage(
      id: 7,
      sender: "John Doe",
      message: "Picture message",
      timestamp: "7 months ago",
      icon: Icons.image,
      additionalIcon: Icons.photo,
      additionalText: "Image Sent",
      // imageUrl: "assets/icons/image.PNG",
    ),
    ChatMessage(
      id: 8,
      sender: "John Doe",
      message: "Picture message",
      timestamp: "7 months ago",
      // icon: Icons.image,
      additionalIcon: Icons.photo,
      additionalText: "Image Sent",
      // imageUrl: "assets/icons/image.PNG",
    ),
  ];

  ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xfffcbe5ff),
                      backgroundImage:
                          message.imageUrl != null
                              ? AssetImage(message.imageUrl!)
                              : null,
                      child:
                          message.imageUrl == null
                              ? (message.icon != null
                                  ? Icon(
                                    message.icon,
                                    color: Color(0xfff1976cc),
                                  )
                                  : Text(
                                    message.sender
                                        .split(" ")
                                        .map((e) => e[0])
                                        .take(2)
                                        .join()
                                        .toUpperCase(),
                                    style: TextStyle(
                                      color: Color(0xfff1976cc),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                              : null,
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (message.additionalIcon != null ||
                                  message.additionalText != null)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    children: [
                                      if (message.additionalIcon != null)
                                        Icon(
                                          message.additionalIcon,
                                          color: Color(0xfff607e99),
                                          size: 14,
                                        ),
                                      if (message.additionalText != null)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4.0,
                                          ),
                                          child: Text(
                                            message.additionalText!,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xfff4e708f),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              Text(
                                message.sender,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // if (message.isDeleted)
                        //   Icon(Icons.delete, color: Colors.red, size: 16),
                      ],
                    ),
                    subtitle:
                        message.isDeleted
                            ? Row(
                              spacing: 3,
                              children: [
                                Icon(
                                  Icons.lock_outline,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                Text(
                                  "This message was deleted",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            )
                            : Text(message.message),
                    trailing: Text(
                      message.timestamp,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  if (index < messages.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 73, right: 15),
                      child: Divider(),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
