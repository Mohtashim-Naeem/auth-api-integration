import 'dart:math';

import 'package:auth_integration/views/auth/login_view.dart';
import 'package:auth_integration/views/splash/splash.dart';
import 'package:auth_integration/views/splash/splash_two.dart';
import 'package:get/get.dart';

class SplashTwoController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.to(() => Login());
      },
    );
  }
}
