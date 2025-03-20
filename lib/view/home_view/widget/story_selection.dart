import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_path.dart';
import '../../../viewModel/chat_controller/chat_controller.dart';
import '../../slider_view/slider_view.dart';

class StorySection extends StatelessWidget {
  StorySection({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          final message = controller.messages[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SlideView(
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
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
                        fontSize: 20,
                        color: ColorPath.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                        : null,
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: CircleAvatar(radius: 7, backgroundColor: Colors.green),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}