import 'package:billjek/Binding/binding.dart';
import 'package:billjek/Module/Home/view.dart';
import 'package:billjek/Module/Login/view.dart';
import 'package:billjek/Module/Register/view.dart';
import 'package:billjek/Module/SplashScreen/view.dart';
import 'package:get/get.dart';




class Routes {

  static final pages = [
        GetPage(name: "/", page: () =>  SplashScreen(),binding: SplashScreenBinding()),
        GetPage(name: "/login", page: () =>  LoginPage(),binding: LoginBinding()),
        GetPage(name: "/register", page: () =>  RegisterPage(),binding: RegisterBinding()),
        GetPage(name: "/home", page: () =>  HomePage(),binding: RegisterBinding()),

      ];
}
