import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Chat/View.dart';
import '../Home/view.dart';
import '../Profile/View.dart';

class LayoutController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<Widget> children = [
    HomePage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  void onTabTapped(int index) {
    currentIndex.value = index;
  }

  void goToChat() {
    Get.toNamed("/chat");
  }
}
