import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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
          selectedImage = null; // Clear image preview after sending
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
        scrollController.position.maxScrollExtent ,
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
      // bottomNavigationBar: Container(
      //   width: MediaQuery.sizeOf(context).width,
      //   padding: const EdgeInsets.only(
      //     bottom: 25,
      //     left: 15,
      //     right: 15,
      //     top: 10,
      //   ),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     border: Border.all(width: 1, color: Colors.grey.shade300),
      //   ),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     spacing: 8,
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           // pickFile();
      //         },
      //         child: Icon(Icons.add, size: 30, color: Colors.grey),
      //       ),
      //       Expanded(
      //         child: TextFormField(
      //           onChanged: (text) {
      //             setState(() {
      //               // Update the state when text is entered or deleted
      //             });
      //           },
      //           controller: controller,
      //           decoration: InputDecoration(
      //             fillColor: ColorPath.greyShade1,
      //             suffixIcon: GestureDetector(
      //               onTap: controller.text.isEmpty ? null : sendMessage,
      //               child: Icon(
      //                 controller.text.isEmpty ? Icons.lock : Icons.send,
      //                 color:
      //                     controller.text.isEmpty ? Colors.grey : Colors.blue,
      //               ),
      //             ),
      //             filled: true,
      //             hintText: "Type message",
      //             hintStyle: TextStyle(color: Colors.grey),
      //             border: OutlineInputBorder(
      //               borderSide: BorderSide.none,
      //               borderRadius: BorderRadius.circular(20),
      //             ),
      //           ),
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           toggleListening();
      //         },
      //         child: Icon(
      //           Icons.keyboard_voice_outlined,
      //           size: 30,
      //           color: Colors.grey,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.image, color: Colors.black),
              onPressed: showImageOptions, // Show image options
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    if (selectedImage != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Image.file(
                          selectedImage!,
                          width: 70,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: selectedImage == null ? "Type a message" : "",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.blue),
              onPressed: sendMessage,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
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
                        ? Icon(
                      widget.icon,
                      color: ColorPath.grey,
                    )
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
                  SizedBox(width: 10,),
                  Text(
                    widget.sender!,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
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
            // Center(
            //   child: Column(
            //     spacing: 15,
            //     children: [
            //       Stack(
            //         children: [
            //           CircleAvatar(
            //             radius: 40,
            //             backgroundColor: ColorPath.greyShade,
            //             backgroundImage:
            //             widget.imageUrl != null
            //                 ? AssetImage(widget.imageUrl!)
            //                 : null,
            //             child:
            //             widget.imageUrl == null
            //                 ? (widget.icon != null
            //                 ? Icon(
            //               widget.icon,
            //               color: ColorPath.grey,
            //             )
            //                 : Text(
            //               widget.sender!
            //                   .split(" ")
            //                   .map((e) => e[0])
            //                   .take(2)
            //                   .join()
            //                   .toUpperCase(),
            //               style: TextStyle(
            //                 color: ColorPath.grey,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 24,
            //               ),
            //             ))
            //                 : null,
            //           ),
            //           Positioned(
            //             bottom: 3,
            //             right: 0,
            //             child: CircleAvatar(
            //               radius: 8,
            //               backgroundColor: Colors.green,
            //             ),
            //           ),
            //         ],
            //       ),
            //       Text(
            //         widget.sender!,
            //         style: TextStyle(
            //           fontSize: 17,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController, // Add controller here
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        var msg = messages[index];
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: msg["type"] == "text"
                                    ? Text(msg["content"], style: TextStyle(fontSize: 16))
                                    : Image.file(File(msg["content"]), width: 150),
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
          ],
        ),
      ),
      // body: SafeArea(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     spacing: 15,
      //     children: [
      //       Container(
      //         padding: EdgeInsets.symmetric(horizontal: 15),
      //         width: MediaQuery.sizeOf(context).width,
      //         decoration: BoxDecoration(color: Colors.white),
      //         child: Row(
      //           children: [
      //             GestureDetector(
      //               onTap: () {
      //                 Navigator.pop(context);
      //               },
      //               child: Icon(
      //                 Icons.arrow_back_ios,
      //                 size: 20,
      //                 color: ColorPath.greyShade2,
      //               ),
      //             ),
      //             Spacer(),
      //             GestureDetector(
      //               onTap: () {
      //                 // Navigator.pop(context);
      //               },
      //               child: Icon(
      //                 Icons.task_alt_outlined,
      //                 size: 22,
      //                 color: ColorPath.greyShade2,
      //               ),
      //             ),
      //             SizedBox(width: 10),
      //             GestureDetector(
      //               onTap: () {
      //                 // Navigator.pop(context);
      //               },
      //               child: Icon(
      //                 Icons.more_horiz,
      //                 size: 20,
      //                 color: ColorPath.greyShade2,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Divider(height: 1, color: Colors.grey.shade300),
      //       Expanded(
      //         child: Column(
      //           children: [
      //             Center(
      //               child: Column(
      //                 spacing: 15,
      //                 children: [
      //                   Stack(
      //                     children: [
      //                       CircleAvatar(
      //                         radius: 40,
      //                         backgroundColor: ColorPath.greyShade,
      //                         backgroundImage:
      //                             widget.imageUrl != null
      //                                 ? AssetImage(widget.imageUrl!)
      //                                 : null,
      //                         child:
      //                             widget.imageUrl == null
      //                                 ? (widget.icon != null
      //                                     ? Icon(
      //                                       widget.icon,
      //                                       color: ColorPath.grey,
      //                                     )
      //                                     : Text(
      //                                       widget.sender!
      //                                           .split(" ")
      //                                           .map((e) => e[0])
      //                                           .take(2)
      //                                           .join()
      //                                           .toUpperCase(),
      //                                       style: TextStyle(
      //                                         color: ColorPath.grey,
      //                                         fontWeight: FontWeight.bold,
      //                                         fontSize: 24,
      //                                       ),
      //                                     ))
      //                                 : null,
      //                       ),
      //                       Positioned(
      //                         bottom: 3,
      //                         right: 0,
      //                         child: CircleAvatar(
      //                           radius: 8,
      //                           backgroundColor: Colors.green,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Text(
      //                     widget.sender!,
      //                     style: TextStyle(
      //                       fontSize: 17,
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 15),
      //               child: Align(
      //                 alignment: Alignment.centerLeft,
      //                 child: Container(
      //                   padding: EdgeInsets.only(left: 10),
      //                   height: 30,
      //                   width: 220,
      //                   decoration: BoxDecoration(
      //                     color: Colors.blue,
      //                     borderRadius: BorderRadius.only(
      //                       topLeft: Radius.circular(20),
      //                       topRight: Radius.circular(20),
      //                       bottomRight: Radius.circular(20),
      //                     ),
      //                   ),
      //                   child: Align(
      //                     alignment: Alignment.centerLeft,
      //                     child: Text(
      //                       widget.message!,
      //                       style: TextStyle(fontSize: 15, color: Colors.white),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               child: ListView.builder(
      //                 itemCount: messages.length,
      //                 itemBuilder: (context, index) {
      //                   return Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Align(
      //                       alignment: Alignment.centerRight,
      //                       child: Container(
      //                         padding: EdgeInsets.only(right: 10, left: 15),
      //                         height: 50,
      //                         width: 150,
      //                         decoration: BoxDecoration(
      //                           color: Colors.grey,
      //                           borderRadius: BorderRadius.only(
      //                             topLeft: Radius.circular(20),
      //                             topRight: Radius.circular(20),
      //                             bottomLeft: Radius.circular(20),
      //                           ),
      //                         ),
      //                         child: Align(
      //                           alignment: Alignment.centerRight,
      //                           child: Text(
      //                             maxLines: 4,
      //                             overflow: TextOverflow.ellipsis,
      //                             messages[index],
      //                             style: TextStyle(
      //                               fontSize: 15,
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
