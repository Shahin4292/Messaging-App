import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  List<File> selectedImages = [];
  ScrollController scrollController = ScrollController();

  static const int maxImages = 10;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null && selectedImages.length < maxImages) {
      setState(() {
        selectedImages.add(File(pickedFile.path));
      });
    } else if (selectedImages.length >= maxImages) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You can only select up to $maxImages images')),
      );
    }
  }
  void sendMessage() {
    if (selectedImages.isNotEmpty || controller.text.isNotEmpty) {
      setState(() {
        if (selectedImages.isNotEmpty) {
          for (var image in selectedImages) {
            messages.insert(0,{"type": "image", "content": image.path});
          }
          selectedImages.clear();
        }
        if (controller.text.trim().isNotEmpty) {
          messages.insert(0,{"type": "text", "content": controller.text});
        }
        controller.clear();
      });
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
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Pick from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
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
              selectedImages.isNotEmpty
                  ? Border.all(width: 1, color: Colors.transparent)
                  : Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectedImages.isNotEmpty
                ? Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ColorPath.paleGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 8,
                          children: [
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: List.generate(selectedImages.length, (
                                index,
                              ) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: FileImage(
                                            selectedImages[index],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 3,
                                      right: 3,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedImages.removeAt(
                                              index,
                                            ); // Remove the tapped image
                                          });
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                            GestureDetector(
                              onTap: showImageOptions,
                              child: Container(
                                height: 100,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: controller,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF0F0F0),
                          suffixIcon: GestureDetector(
                            onTap: sendMessage,
                            child: Icon(Icons.send, color: Colors.blue),
                          ),
                          hintText: "Type a message",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Inter',
                          ),
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
                  children: [
                    GestureDetector(
                      onTap: showImageOptions,
                      child: Icon(Icons.add, size: 30, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: controller,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF0F0F0),
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
                              selectedImages.isEmpty ? "Type a message" : "",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Inter',
                          ),
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
                                    fontFamily: "InterB",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ))
                            : null,
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.sender!,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
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
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  var msg = messages[index];
                  return Column(
                    children: [
                      Align(
                        alignment:Alignment.bottomRight,
                        child:
                            msg["type"] == "text"
                                ? Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 10,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    msg["content"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                )
                                : Container(
                                  width: 150,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    //   image: DecorationImage(
                                    //     image: FileImage(File(msg["content"])),fit: BoxFit.cover,
                                    //   ),
                                    color: Colors.blue[200],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 10,
                                  ),
                                  child: Image.file(
                                    fit: BoxFit.cover,
                                    File(msg["content"]),
                                    width: 150,
                                  ),
                                ),
                      ),
                    ],
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
