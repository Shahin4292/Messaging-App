import 'package:get/get.dart';

class ChatController extends GetxController {

  var selectedCategory = "Item".obs;
  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}
