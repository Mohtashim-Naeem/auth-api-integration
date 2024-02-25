import 'package:auth_integration/controllers/login_controller.dart';
import 'package:auth_integration/views/auth/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: LoginController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xffF6F6F6),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset('assets/images/Login-rafiki 1.png'),
                      ),
                      Hero(
                        tag: 'main',
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: width * 0.1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Username:',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                        ],
                      ),
                      CustomTextField(
                          controller: controller.emailController,
                          labeltext: 'Enter your Username',
                          icon: const Icon(Icons.person),
                          size: 12),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      CustomTextField(
                          controller: controller.passwordController,
                          labeltext: '...................',
                          icon: const Icon(Icons.send),
                          size: 12),
                      SizedBox(height: height * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpView());
                            },
                            child: const Text(
                              ' Sign Up',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Flexible(
                            child: Divider(
                              height: 100,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('or'),
                          SizedBox(width: 10),
                          Flexible(
                            child: Divider(
                              height: 100,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Hero(
                        tag: 'auth',
                        child: ElevatedButton(
                            onPressed: () {
                              controller.loginWithEmail();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 30,
                                shadowColor: Colors.black.withOpacity(0.2),
                                backgroundColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                fixedSize: Size(width * 0.85, 70)),
                            child: controller.isLogingIn
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1,
                                    ),
                                  )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
