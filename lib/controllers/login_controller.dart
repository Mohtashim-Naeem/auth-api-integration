import 'dart:convert';
import 'package:auth_integration/utils/api_endpoints.dart';
import 'package:auth_integration/views/home/hom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  bool isLogingIn = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences?> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    Map<String, String> headers = {'content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print('token');
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          emailController.clear();
          passwordController.clear();
          Get.to(() => HomeView(
                token: token,
              ));
        } else {
          throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
