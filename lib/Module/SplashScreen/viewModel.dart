import 'package:get/get.dart';
import 'dart:async';

class SplashScreenCOntroller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    Future.delayed(const Duration(seconds: 2), () async {
      moveToHomePage();
    });

    super.onInit();
  }

  void moveToHomePage() {
    Get.toNamed('/login');
  }
}
