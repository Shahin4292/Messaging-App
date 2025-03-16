
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatDetailsController extends GetxController{
  TextEditingController controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  List<File> selectedImages = [];
  ScrollController scrollController = ScrollController();

  static const int maxImages = 10;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null && selectedImages.length < maxImages) {
        selectedImages.add(File(pickedFile.path));
    } else if (selectedImages.length >= maxImages) {
      Get.snackbar('Image Limitation', 'You can only select up to $maxImages images');
    }
  }

  void sendMessage() {
    if (selectedImages.isNotEmpty || controller.text.isNotEmpty) {
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

  void showImageOptions(BuildContext context) {
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
}