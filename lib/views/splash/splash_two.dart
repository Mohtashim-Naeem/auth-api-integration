import 'package:auth_integration/controllers/splash/splash_two_controller%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashTwoView extends StatelessWidget {
  SplashTwoView({Key? key}) : super(key: key);

  final SplashTwoController controller = Get.put(SplashTwoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Hero(
            tag: 'logo',
            child: TweenAnimationBuilder(
              tween:
                  Tween(begin: const Offset(0, 0.2), end: const Offset(0, 0)),
              duration: const Duration(seconds: 1),
              builder: (context, offset, child) {
                return Transform.translate(
                  offset: offset,
                  child: Center(
                    child: Image.asset('assets/images/Login-rafiki 1.png'),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          const Text(
            "splash two, Welcome! How Are you",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
