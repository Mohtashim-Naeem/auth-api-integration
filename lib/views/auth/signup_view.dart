import 'package:auth_integration/controllers/signup_controller.dart';
import 'package:auth_integration/views/auth/login_view.dart';
import 'package:auth_integration/views/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder(
        init: SignUpController(),
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
                      Text(
                        'Registration',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Your Name:',
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
                          controller: controller.nameController,
                          labeltext: 'Enter your Username',
                          icon: const Icon(Icons.person),
                          size: 12),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          Text(
                            'Your Email',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: controller.emailController,
                          labeltext: 'Enter your email',
                          icon: const Icon(Icons.send),
                          size: 12),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Your Password',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: controller.passwordController,
                          labeltext: '.................',
                          icon: const Icon(Icons.send),
                          size: 20),
                      SizedBox(height: height * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Registered?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const Login());
                            },
                            child: const Text(
                              ' Login',
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
                      Hero(
                        tag: 'main',
                        child: ElevatedButton(
                            onPressed: () {
                              controller.registerWithEmail();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 30,
                                shadowColor: Colors.grey.withOpacity(0.2),
                                backgroundColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                fixedSize: Size(width * 0.85, 70)),
                            child: controller.isSignUp
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
