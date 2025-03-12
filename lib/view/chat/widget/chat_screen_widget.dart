import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/utils/color_path.dart';
import 'package:messaging_app/view/chat_details/chat_details.dart';

import '../../../res/repository/chat_message.dart';

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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ChatDetails(
                                sender: message.sender,
                                imageUrl: message.imageUrl,
                                message: message.message,
                                isDeleted: message.isDeleted,
                                additionalIcon: message.additionalIcon,
                                additionalText: message.additionalText,
                                timestamp: message.timestamp,
                                icon: message.icon,
                              ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorPath.greyShade,
                        backgroundImage:
                            message.imageUrl != null
                                ? AssetImage(message.imageUrl!)
                                : null,
                        child:
                            message.imageUrl == null
                                ? (message.icon != null
                                    ? Icon(message.icon, color: ColorPath.grey)
                                    : Text(
                                      message.sender
                                          .split(" ")
                                          .map((e) => e[0])
                                          .take(2)
                                          .join()
                                          .toUpperCase(),
                                      style: TextStyle(
                                        color: ColorPath.grey,
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
                                            color: ColorPath.red,
                                            size: 14,
                                          ),
                                        if (message.additionalText != null)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 4.0,
                                            ),
                                            child: Text(
                                              message.additionalText!,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 11,
                                                overflow: TextOverflow.ellipsis,
                                                color: ColorPath.redShade,
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
                                    fontSize: 15,
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
                                    message.message,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ],
                              )
                              : Text(message.message),
                      trailing: Text(
                        message.timestamp,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
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
