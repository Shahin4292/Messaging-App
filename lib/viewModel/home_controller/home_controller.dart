import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  String formattedTime = '';

  @override
  void onInit() {
    updateTime();
    super.onInit();
  }

  void updateTime() {
    DateTime now = DateTime.now();
    formattedTime = DateFormat('hh:mm a').format(now);
  }
}
