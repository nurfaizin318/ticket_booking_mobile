import 'package:billjek/Module/Chat/ViewModel.dart';
import 'package:billjek/Module/Home/viewModel.dart';
import 'package:billjek/Module/Layout/viewModel.dart';
import 'package:billjek/Module/Login/viewModel.dart';
import 'package:billjek/Module/OTP/viewModel.dart';
import 'package:billjek/Module/Profile/ViewModel.dart';
import 'package:billjek/Module/Register/viewModel.dart';
import 'package:billjek/Module/SplashScreen/viewModel.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(), fenix: true);
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: false);
  }
}

class LayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController(), fenix: false);
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: false);
  }
}

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController(), fenix: false);
  }
}
