import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatDetailsController extends GetxController {
  var messages = <Map<String, dynamic>>[].obs;
  var selectedImages = <File>[].obs;
  TextEditingController controller = TextEditingController();

  static const int maxImages = 10;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null && selectedImages.length < maxImages) {
      selectedImages.add(File(pickedFile.path));
    } else if (selectedImages.length >= maxImages) {
      Get.snackbar(
        'Limit reached',
        'You can only select up to $maxImages images',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void sendMessage() {
    if (selectedImages.isNotEmpty || controller.text.isNotEmpty) {
      if (selectedImages.isNotEmpty) {
        for (var image in selectedImages) {
          messages.insert(0, {"type": "image", "content": image.path});
        }
        selectedImages.clear();
      }
      if (controller.text.trim().isNotEmpty) {
        messages.insert(0, {"type": "text", "content": controller.text});
      }
      controller.clear();
    }
  }

  void clearSelectedImages() {
    selectedImages.clear();
  }
}