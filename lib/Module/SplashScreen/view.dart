import 'package:billjek/Module/Login/viewModel.dart';
import 'package:billjek/Module/SplashScreen/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashScreenController>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        
        color: Colors.lightBlue,
        width: width,
        height: height,
        child: Center(
          child: Text("Tiketku.com",style: TextStyle(fontSize: 40,color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
