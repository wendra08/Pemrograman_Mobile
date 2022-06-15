import 'dart:async';
import 'package:get/get.dart';

import '../home.dart';


class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    start();
  }

  start() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Get.off(() => Home());
    });
  }
}
