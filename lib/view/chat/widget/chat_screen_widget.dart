import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/utils/color_path.dart';
import 'package:messaging_app/view/chat_details/chat_details.dart';

import '../../../viewModel/chat_controller/chat_controller.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key});

  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: chatController.messages.length,
      itemBuilder: (context, index) {
        final message = chatController.messages[index];
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
                                          fontFamily: 'Inter',
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
                              fontWeight: FontWeight.w500,fontFamily: 'Inter',
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
                                fontFamily: 'Inter',
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
                  style: TextStyle(fontSize: 12, color: Colors.grey,fontFamily: 'Inter'),
                ),
              ),
            ),
            if (index < chatController.messages.length - 1)
              Padding(
                padding: const EdgeInsets.only(left: 73, right: 15),
                child: Divider(),
              ),
          ],
        );
      },
    );
  }
}
