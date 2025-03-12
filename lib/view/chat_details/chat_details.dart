import 'package:flutter/material.dart';

import '../../utils/color_path.dart';

class ChatDetails extends StatelessWidget {
  final String? sender;
  final String? message;
  final String? timestamp;
  final bool? isDeleted;
  final IconData? additionalIcon;
  final String? additionalText;
  final String? imageUrl;
  final IconData? icon;

  const ChatDetails({
    super.key,
    this.sender,
    this.message,
    this.timestamp,
    this.isDeleted,
    this.additionalIcon,
    this.additionalText,
    this.imageUrl,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Center(
            child: Column(
              spacing: 15,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: ColorPath.greyShade,
                  backgroundImage:
                      imageUrl != null ? AssetImage(imageUrl!) : null,
                  child:
                      imageUrl == null
                          ? (icon != null
                              ? Icon(icon, color: ColorPath.grey)
                              : Text(
                                sender!
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
                Text(
                  sender!,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 30,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                  child: Text(message!, style: TextStyle(fontSize: 15,color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
