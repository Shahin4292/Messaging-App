import 'package:flutter/material.dart';

import '../../utils/color_path.dart';

class ChatDetails extends StatefulWidget {
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
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  TextEditingController controller = TextEditingController();
  List<String> messages = [];

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      setState(() {
        messages.add(controller.text);
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(
          bottom: 25,
          left: 15,
          right: 15,
          top: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.add, size: 30, color: Colors.grey),
            ),
            Expanded(
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    // Update the state when text is entered or deleted
                  });
                },
                controller: controller,
                decoration: InputDecoration(
                  fillColor: ColorPath.greyShade1,
                  suffixIcon: GestureDetector(
                    onTap: controller.text.isEmpty ? null : sendMessage,
                    child: Icon(
                      controller.text.isEmpty ? Icons.lock : Icons.send,
                      color:
                          controller.text.isEmpty ? Colors.grey : Colors.blue,
                    ),
                  ),
                  filled: true,
                  hintText: "Type message",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.keyboard_voice_outlined,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: ColorPath.greyShade2,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.task_alt_outlined,
                      size: 22,
                      color: ColorPath.greyShade2,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: ColorPath.greyShade2,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),
            Center(
              child: Column(
                spacing: 15,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: ColorPath.greyShade,
                        backgroundImage:
                            widget.imageUrl != null
                                ? AssetImage(widget.imageUrl!)
                                : null,
                        child:
                            widget.imageUrl == null
                                ? (widget.icon != null
                                    ? Icon(widget.icon, color: ColorPath.grey)
                                    : Text(
                                      widget.sender!
                                          .split(" ")
                                          .map((e) => e[0])
                                          .take(2)
                                          .join()
                                          .toUpperCase(),
                                      style: TextStyle(
                                        color: ColorPath.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ))
                                : null,
                      ),
                      Positioned(
                        bottom: 3,
                        right: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.sender!,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 30,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.message!,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.only(right: 10,left: 15),
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            messages[index],
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
