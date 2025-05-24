import 'package:tiketku/Binding/binding.dart';
import 'package:tiketku/Module/Chat/View.dart';
import 'package:tiketku/Module/IntroductionPage/view.dart';
import 'package:tiketku/Module/Layout/View.dart';
import 'package:tiketku/Module/Login/view.dart';
import 'package:tiketku/Module/Profile/View.dart';
import 'package:tiketku/Module/Register/view.dart';
import 'package:tiketku/Module/Select%20city/view.dart';
import 'package:tiketku/Module/SplashScreen/view.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(
        name: "/", page: () => SplashScreen(), binding: SplashScreenBinding()),
    GetPage(name: "/login", page: () => Login(), binding: LoginBinding()),
    GetPage(
        name: "/register",
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
      name: "/layout",
      page: () => const Layout(),
      binding: LayoutBinding(),
    ),
    GetPage(
        name: "/profile", page: () => Profile(), binding: ProfileBinding()),
    GetPage(
        name: "/chat", page: () => const ChatPage(), binding: ChatBinding()),
    GetPage(
        name: "/introduction",
        page: () => const IntroductionPage(),
        binding: IntroductionBinding()),
    GetPage(
        name: "/select-city",
        page: () => const SelectCity(),
        binding: SelectCityBinding()),

  ];
}
