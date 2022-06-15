import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreenController ssc = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            ),
        ),
      ),
    );
  }
}