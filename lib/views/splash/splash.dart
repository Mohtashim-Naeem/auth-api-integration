// import 'package:auth_integration/controllers/splash/splash_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SplashView extends StatelessWidget {
//   SplashView({Key? key}) : super(key: key);
//   final SplashViewController controller = Get.put(SplashViewController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 200,
//           ),
//           Hero(
//             tag: 'logo',
//             child: TweenAnimationBuilder(
//               tween:
//                   Tween(begin: const Offset(0, 0), end: const Offset(0, -0.2)),
//               duration: const Duration(seconds: 1),
//               builder: (context, offset, child) {
//                 return Transform.translate(
//                   offset: offset,
//                   child: Center(
//                     child: Image.asset('assets/images/Login-rafiki 1.png'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedSplashView extends StatefulWidget {
  @override
  _AnimatedSplashViewState createState() => _AnimatedSplashViewState();
}

class _AnimatedSplashViewState extends State<AnimatedSplashView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -0.2),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          Hero(
            tag: 'logo',
            child: SlideTransition(
              position: _animation,
              child: Center(
                child: Image.asset('assets/images/Login-rafiki 1.png'),
              ),
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              _controller.forward();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashTwoView(),
                  ),
                );
              });
            },
            child: Text("Go to Splash Two"),
          ),
        ],
      ),
    );
  }
}

class SplashTwoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Hero(
            tag: 'logo',
            child: Center(
              child: Image.asset('assets/images/Login-rafiki 1.png'),
            ),
          ),
          Spacer(),
          Text(
            "splash two, Welcome! How Are you",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
