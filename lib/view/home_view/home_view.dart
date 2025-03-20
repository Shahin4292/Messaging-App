import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/color_path.dart';
import '../../viewModel/chat_controller/chat_controller.dart';
import '../slider_view/slider_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SizedBox(width: 10),
          Text(
            "Message",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => CustomBottomNavScreen()),
              // );
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/message.png"),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StorySection(),
            PostComposer(),
            PostFeed(),
          ],
        ),
      ),
    );
  }
}

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

class PostComposer extends StatelessWidget {
  const PostComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            child: Center(child: Image.asset("assets/icons/user.png",height: 25,width: 25)),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text("What's on your mind?"),
            ),
          ),
        ],
      ),
    );
  }
}


class PostFeed extends StatelessWidget {
  const PostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(backgroundColor: Colors.grey.shade300),
                title: Text("User Name"),
                subtitle: Text("5 hrs ago"),
                trailing: Icon(Icons.more_horiz),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("This is a sample post description."),
              ),
              Container(
                height: 200,
                color: Colors.grey.shade300,
                child: Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(icon: Icon(Icons.thumb_up_alt_outlined), onPressed: () {}),
                    IconButton(icon: Icon(Icons.comment_outlined), onPressed: () {}),
                    IconButton(icon: Icon(Icons.share_outlined), onPressed: () {}),
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
