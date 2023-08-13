import 'package:get/get.dart';

class ProfileController extends GetxController {
  void moveToRegister() {
    Get.toNamed('/register');
  }

  void moveToHomePage() {
    Get.toNamed('/layout');
  }
}
