import 'package:billjek/Module/Layout/viewModel.dart';
import 'package:billjek/Utils/Color/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LayoutController>();
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

    return Scaffold(
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            color: Colors.white,
            buttonBackgroundColor: Colors.blueAccent,
            backgroundColor: Colors.white,
            animationCurve: Curves.linear,
            animationDuration: Duration(milliseconds: 200),
            key: bottomNavigationKey,
            items: <Widget>[
              Icon(
                Icons.home_outlined,
                size: 30,
                color: controller.currentIndex.value == 0
                    ? Colors.white
                    : Colors.black,
              ),
              Icon(Icons.chat_outlined,
                  size: 30,
                  color: controller.currentIndex.value == 1
                      ? Colors.white
                      : Colors.black),
              Icon(Icons.account_box_outlined,
                  size: 30,
                  color: controller.currentIndex.value == 2
                      ? Colors.white
                      : Colors.black),
            ],
            onTap: (index) {
              controller.onTabTapped(index);
            },
          ),
        ),
        body: Obx(() => controller.children[controller.currentIndex.value]));
  }
}
