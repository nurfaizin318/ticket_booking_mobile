import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool obsecureTextpassword = true.obs;
  RxBool obsecureTextRepeatPassword = true.obs;
  RxBool obsecureTestStatus = true.obs;

  void moveToLogin() {
    Get.back();
  }
}
