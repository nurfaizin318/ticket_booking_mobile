import 'package:billjek/Module/Chat/View.dart';
import 'package:billjek/Module/Home/view.dart';
import 'package:billjek/Module/Layout/viewModel.dart';
import 'package:billjek/Module/Profile/View.dart';
import 'package:billjek/Module/Register/view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LayoutController>();

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                controller.goToChat();
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          title: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 30,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    hintText: "Cari",
                    isDense: true,
                    counterText: "",
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none)),
                textAlign: TextAlign.start,
                maxLines: 1,
                maxLength: 20,
                // controller: _locationNameTextController,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green[100],
          onTap: controller.onTabTapped,
          items: const [
            BottomNavigationBarItem(
              //I want to navigate to a new page Library();
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              //I want to navigate to a new page Store();
              icon: Icon(Icons.read_more),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              //I want to navigate to a new page Profile();
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
        body: Obx(() => controller.children[controller.currentIndex.value]));
  }
}
