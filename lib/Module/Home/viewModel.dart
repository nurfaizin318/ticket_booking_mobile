import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool obsecureTestStatus = true.obs;

  void moveToRegister() {
    Get.toNamed('/register');
  }

  void moveToHomePage() {
    Get.toNamed('/layout');
  }

  void navigateToSelectCity() {
    Get.toNamed('/select-city');
  }
}
