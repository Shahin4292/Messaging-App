import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/repository/chat_message.dart';
import '../../res/repository/inbox_list.dart';

class ChatController extends GetxController {
  final Map<String, String> selectedSubOptions = {};
  final Map<String, IconData> selectedSubOptionIcons = {};

  String selectedMainFilter = 'All';

  String getButtonLabel(String filter) {
    final selected = selectedSubOptions[filter];
    return selected ?? filter;
  }

  IconData? getButtonIcon(String filter) {
    final label = selectedSubOptions[filter];
    if (label == null || label == 'Closed' || label == 'Archived') return null;
    return selectedSubOptionIcons[filter];
  }

  final List<ChatMessage> messages = [
    ChatMessage(
      id: 1,
      sender: "41374568",
      message: "📩",
      timestamp: "about 1 month ago",
      // icon: Icons.email,
      additionalIcon: CupertinoIcons.chat_bubble_text,
      additionalText: "Alpha PBX (W)",
      isUnread: true,
      unreadCount: 2,
    ),
    ChatMessage(
      id: 2,
      sender: "Mithun",
      message: "Message was deleted",
      timestamp: "about 2 months ago",
      isDeleted: true,
      additionalIcon: Icons.warning,
      additionalText: "Alpha PBX (W)",
      imageUrl: "assets/icons/image.PNG",
      isUnread: true,
      unreadCount: 2,
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
    ChatMessage(
      id: 9,
      sender: "John Doe",
      message: "Picture message",
      timestamp: "7 months ago",
      // icon: Icons.image,
      additionalIcon: Icons.photo,
      additionalText: "Image Sent",
      // imageUrl: "assets/icons/image.PNG",
    ),
  ];
}
