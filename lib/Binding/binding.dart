import 'package:tiketku/Module/Chat/ViewModel.dart';
import 'package:tiketku/Module/Home/viewModel.dart';
import 'package:tiketku/Module/IntroductionPage/viewModel.dart';
import 'package:tiketku/Module/Layout/viewModel.dart';
import 'package:tiketku/Module/Login/viewModel.dart';
import 'package:tiketku/Module/OTP/viewModel.dart';
import 'package:tiketku/Module/Profile/ViewModel.dart';
import 'package:tiketku/Module/Register/viewModel.dart';
import 'package:tiketku/Module/Select%20city/viewModel.dart';
import 'package:tiketku/Module/SplashScreen/viewModel.dart';
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


class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: false);
  }
}

class LayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
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

class IntroductionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroductionController(), fenix: false);
  }
}


class SelectCityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCityController(), fenix: false);
  }
}
