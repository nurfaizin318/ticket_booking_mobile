



import 'package:billjek/Module/Home/viewModel.dart';
import 'package:billjek/Module/Login/viewModel.dart';
import 'package:billjek/Module/OTP/viewModel.dart';
import 'package:billjek/Module/Register/viewModel.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(),fenix: true);
  }

}

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(),fenix: true);
  }

}

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);
  }

}

