// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class ChatDetails extends StatefulWidget {
//   const ChatDetails({super.key});
//
//   @override
//   State<ChatDetails> createState() => _ChatDetailsState();
// }
//
// class _ChatDetailsState extends State<ChatDetails> {
//   TextEditingController controller = TextEditingController();
//   List<Map<String, dynamic>> messages = [];
//   List<File> selectedImages = [];  // Changed from a single image to a list of images.
//   ScrollController scrollController = ScrollController();
//
//   Future<void> pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         selectedImages.add(File(pickedFile.path));  // Add picked image to the list
//       });
//     }
//   }
//
//   void sendMessage() {
//     if (selectedImages.isNotEmpty || controller.text.isNotEmpty) {
//       setState(() {
//         if (selectedImages.isNotEmpty) {
//           // Add all selected images to the messages list
//           for (var image in selectedImages) {
//             messages.add({"type": "image", "content": image.path});
//           }
//           selectedImages.clear(); // Clear selected images after sending
//         }
//         if (controller.text.isNotEmpty) {
//           messages.add({"type": "text", "content": controller.text});
//         }
//         controller.clear();
//       });
//
//       scrollToBottom();
//     }
//   }
//
//   void scrollToBottom() {
//     if (scrollController.hasClients) {
//       scrollController.animateTo(
//         scrollController.position.maxScrollExtent * 2,
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     }
//   }
//
//   void showImageOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           height: 150,
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//               ListTile(
//                 leading: Icon(Icons.camera_alt),
//                 title: Text("Take a Photo"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pickImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.image),
//                 title: Text("Pick from Gallery"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pickImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: Container(
//         width: MediaQuery.sizeOf(context).width,
//         padding: const EdgeInsets.only(
//           bottom: 25,
//           left: 15,
//           right: 15,
//           top: 10,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: selectedImages.isNotEmpty
//               ? Border.all(width: 1, color: Colors.transparent)
//               : Border.all(width: 1, color: Colors.grey.shade300),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             selectedImages.isNotEmpty
//                 ? Container(
//               padding: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Color(0xffff1f1f1),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       // Display selected images in a row
//                       Wrap(
//                         spacing: 8.0,
//                         runSpacing: 8.0,
//                         children: List.generate(selectedImages.length, (index) {
//                           return Container(
//                             height: 100,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 image: FileImage(selectedImages[index]),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             child: Positioned(
//                               top: 3,
//                               right: 3,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     selectedImages.removeAt(index);  // Remove the tapped image
//                                   });
//                                 },
//                                 child: Icon(
//                                   Icons.cancel_outlined,
//                                   color: Colors.grey,
//                                   size: 20,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                       // Add another image button
//                       GestureDetector(
//                         onTap: showImageOptions,
//                         child: Icon(Icons.add, size: 30, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   Divider(color: Colors.grey),
//                   TextFormField(
//                     onChanged: (text) {
//                       setState(() {});
//                     },
//                     controller: controller,
//                     decoration: InputDecoration(
//                       fillColor: Color(0xFFF0F0F0),
//                       suffixIcon: GestureDetector(
//                         onTap: sendMessage,
//                         child: Icon(Icons.send, color: Colors.blue),
//                       ),
//                       hintText: "Type a message",
//                       hintStyle: TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//                 : Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: showImageOptions,
//                   child: Icon(Icons.add, size: 30, color: Colors.grey),
//                 ),
//                 Expanded(
//                   child: TextFormField(
//                     onChanged: (text) {
//                       setState(() {});
//                     },
//                     controller: controller,
//                     decoration: InputDecoration(
//                       fillColor: Color(0xFFF0F0F0),
//                       suffixIcon: GestureDetector(
//                         onTap: controller.text.isEmpty ? null : sendMessage,
//                         child: Icon(
//                           controller.text.isEmpty ? Icons.lock : Icons.send,
//                           color: controller.text.isEmpty ? Colors.grey : Colors.blue,
//                         ),
//                       ),
//                       filled: true,
//                       hintText: selectedImages.isEmpty ? "Type a message" : "",
//                       hintStyle: TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // toggleListening();
//                   },
//                   child: Icon(
//                     Icons.keyboard_voice_outlined,
//                     size: 30,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       controller: scrollController,
//                       itemCount: messages.length,
//                       itemBuilder: (context, index) {
//                         var msg = messages[index];
//                         return Align(
//                           alignment: Alignment.centerRight,
//                           child: Container(
//                             margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Colors.blue[200],
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: msg["type"] == "text"
//                                 ? Text(
//                               msg["content"],
//                               style: TextStyle(fontSize: 16),
//                             )
//                                 : Image.file(
//                               File(msg["content"]),
//                               width: 150,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

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
            messages.add({"type": "image", "content": image.path});
          }
          selectedImages.clear();
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
          border: selectedImages.isNotEmpty
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
                color: Color(0xffff1f1f1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Display selected images in a row
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: List.generate(selectedImages.length, (index) {
                            return Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(selectedImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Positioned(
                                top: 3,
                                right: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedImages.removeAt(index);  // Remove the tapped image
                                    });
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        // Add another image button
                        GestureDetector(
                          onTap: showImageOptions,
                          child: Icon(Icons.add, size: 30, color: Colors.white),
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
                          color: controller.text.isEmpty ? Colors.grey : Colors.blue,
                        ),
                      ),
                      filled: true,
                      hintText: selectedImages.isEmpty ? "Type a message" : "",
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
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        var msg = messages[index];
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: msg["type"] == "text"
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

