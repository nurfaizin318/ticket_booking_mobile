import 'package:billjek/Binding/binding.dart';
import 'package:billjek/Module/Login/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alice/alice.dart';
import 'Routes/routes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
      darkTheme: false,
      maxCallsCount: 1000,
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      initialBinding: LoginBinding(),
      getPages: Routes.pages,
      home: LoginPage(),
    );
  }
}
