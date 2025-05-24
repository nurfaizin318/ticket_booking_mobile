import 'package:tiketku/Binding/binding.dart';
import 'package:tiketku/Module/Login/view.dart';
import 'package:tiketku/Module/SplashScreen/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alice/alice.dart';
import 'package:tiketku/Theme/appTheme.dart';
import 'Routes/routes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
 late Alice _alice; 


  @override
  void initState() {
    // TODO: implement initState

      _alice = Alice(
      showNotification: true,
      showInspectorOnShake: true,
      maxCallsCount: 1000,
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: SplashScreenBinding(),
      getPages: Routes.pages,
      theme: AppTheme.themeData,
    );
  }
}
