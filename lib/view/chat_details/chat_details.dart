import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  List<Map<String, dynamic>> messages = [];
  File? selectedImage;
  ScrollController scrollController = ScrollController();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  void sendMessage() {
    if (selectedImage != null || controller.text.isNotEmpty) {
      setState(() {
        if (selectedImage != null) {
          messages.add({"type": "image", "content": selectedImage!.path});
          selectedImage = null;
        }
        if (controller.text.isNotEmpty) {
          messages.add({"type": "text", "content": controller.text});
        }
        controller.clear();
      });

      scrollToBottom();
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent * 2,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Take a Photo"),
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Pick from Gallery"),
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void removeImage() {
    setState(() {
      selectedImage = null;
    });
  }

  void addAnotherImage() {
    showImageOptions();
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
          border:
              selectedImage != null
                  ? Border.all(width: 1, color: Colors.transparent)
                  : Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectedImage != null
                ? Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xffff1f1f1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: FileImage(selectedImage!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 3,
                                right: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    removeImage();
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showImageOptions();
                              },
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: controller,
                        decoration: InputDecoration(
                          fillColor: ColorPath.greyShade1,
                          suffixIcon: GestureDetector(
                            onTap: sendMessage,
                            child: Icon(Icons.send, color: Colors.blue),
                          ),
                          hintText: "Type a message",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                : Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showImageOptions();
                      },
                      child: Icon(Icons.add, size: 30, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: controller,
                        decoration: InputDecoration(
                          fillColor: ColorPath.greyShade1,
                          suffixIcon: GestureDetector(
                            onTap: controller.text.isEmpty ? null : sendMessage,
                            child: Icon(
                              controller.text.isEmpty ? Icons.lock : Icons.send,
                              color:
                                  controller.text.isEmpty
                                      ? Colors.grey
                                      : Colors.blue,
                            ),
                          ),
                          filled: true,
                          hintText:
                              selectedImage == null ? "Type a message" : "",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // toggleListening();
                      },
                      child: Icon(
                        Icons.keyboard_voice_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
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
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
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
                  SizedBox(width: 10),
                  Text(
                    widget.sender!,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController, // Add controller here
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        var msg = messages[index];
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 10,
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:
                                msg["type"] == "text"
                                    ? Text(
                                      msg["content"],
                                      style: TextStyle(fontSize: 16),
                                    )
                                    : Image.file(
                                      File(msg["content"]),
                                      width: 150,
                                    ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
