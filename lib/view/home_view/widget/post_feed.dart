import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_path.dart';
import '../../../viewModel/chat_controller/chat_controller.dart';
import '../../../viewModel/home_controller/home_controller.dart';

class PostFeed extends StatelessWidget {
  PostFeed({super.key});

  final ChatController controller = Get.put(ChatController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.messages.length,
      itemBuilder: (context, index) {
        final message = controller.messages[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
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
                title: Text(message.sender),
                subtitle: Text(homeController.formattedTime),
                trailing: Icon(Icons.more_horiz),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("This is a sample post description."),
              ),
              Container(
                height: 200,
                color: Colors.grey.shade300,
                child: Center(
                  child: Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up_alt_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.comment_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}