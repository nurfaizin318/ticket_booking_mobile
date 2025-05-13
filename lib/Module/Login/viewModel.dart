import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obsecureTestStatus = true.obs;

  void moveToRegister() {
    Get.toNamed('/layout');
  }

  void moveToHomePage() {
    Get.toNamed('/layout');
  }
}
