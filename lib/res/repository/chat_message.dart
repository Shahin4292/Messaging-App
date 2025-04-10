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
  final bool isUnread;
  final int unreadCount;

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
    this.isUnread = false,
    this.unreadCount = 0,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      sender: json['sender'],
      message: json['message'],
      timestamp: json['timestamp'],
      isDeleted: json['isDeleted'] ?? false,
      isReply: json['isReply'] ?? false,
      icon: json['icon'] != null
          ? IconData(json['icon'], fontFamily: 'MaterialIcons')
          : null,
      additionalIcon: json['additionalIcon'] != null
          ? IconData(json['additionalIcon'], fontFamily: 'MaterialIcons')
          : null,
      additionalText: json['additionalText'],
      imageUrl: json['imageUrl'],
      isUnread: json['isUnread'] ?? false,
      unreadCount: json['unreadCount'] ?? 0,
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
      'isUnread': isUnread,
      'unreadCount': unreadCount,
    };
  }
}
