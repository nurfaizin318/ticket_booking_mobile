import 'package:billjek/Binding/binding.dart';
import 'package:billjek/Module/Chat/View.dart';
import 'package:billjek/Module/Home/view.dart';
import 'package:billjek/Module/IntroductionPage/view.dart';
import 'package:billjek/Module/Layout/View.dart';
import 'package:billjek/Module/Login/view.dart';
import 'package:billjek/Module/Profile/View.dart';
import 'package:billjek/Module/Register/view.dart';
import 'package:billjek/Module/SplashScreen/view.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(
        name: "/", page: () => SplashScreen(), binding: SplashScreenBinding()),
    GetPage(name: "/login", page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: "/register",
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(name: "/home", page: () => HomePage(), binding: RegisterBinding()),
    GetPage(
        name: "/layout", page: () => const Layout(), binding: LayoutBinding()),
    GetPage(
        name: "/profile",
        page: () => const ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: "/chat", page: () => const ChatPage(), binding: ChatBinding()),
    GetPage(
        name: "/introduction",
        page: () => const IntroductionPage(),
        binding: IntroductionBinding()),
  ];
}
